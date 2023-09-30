#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#





library(shiny)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(here)
library(plotly)
library(shinyWidgets)
library(RColorBrewer)
library(shinythemes)


df <- read_csv("data/phd_by_field.csv")
df_gender <- read_csv("data/US_by_gender.csv")

df_gender_stats <-
  df_gender %>% mutate(
    Total = Male + Female,
    Prop_Female = Female /Total,
    Prop_Male = Male /Total,
    Gender_ratio = Female / Male
  )



ui <- fluidPage(theme = shinytheme("flatly"),
  setBackgroundImage(
    src = "https://assets-global.website-files.com/620e4101b2ce12a1a6bff0e8/644136b7e2c2f8addd948134_Header_Top%2011%20Benefits%20Of%20Getting%20A%20PhD_feb23.webp"),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
  ),





  titlePanel(div("A visual story depicting the Diversity of PhD graduates in \n The United States of America 🇺🇸🎓")),

  navbarPage("Analysis of diversity:",
             tabPanel("About 🕵️‍♂️🔩⚙️ ",

                      fluidRow(
                        column(10,
                               div(class = "about",
                                   uiOutput('about'))
                        )
                      )),

  tabPanel("Educational diversity 📚📊",

  h3("1. How many PhD students graduate each year between 2008-2017?"),
  fluidRow(
    sidebarLayout(
      sidebarPanel(
        sliderInput("year",
                    "Time period:",
                    min = 2008,
                    max = 2017,
                    value = 2013,
                    step = 1,sep = "")
      ),

      mainPanel(
        plotlyOutput("distPlot")
      )
    )
  ),

  h3("2. How many PhD graduates for each broad field ?"),
  fluidRow(
    sidebarLayout(
      sidebarPanel(
        radioButtons("broad_field",
                     "Broad field of study:",
                     choices = c("Life sciences",
                                 "Mathematics and computer sciences",
                                 "Psychology and social sciences",
                                 "Engineering",
                                 "Education",
                                 "Humanities and arts","Other"))
      ),

      mainPanel(
        plotOutput("plot")
      )
    )
  ),

  h3("3. Can we break down the distribution further ?"),
  fluidRow(
    sidebarLayout(
      sidebarPanel(
        selectInput("major_field", "Choose a major field of study:",
                    list(`Life sciences` = list("Agricultural sciences and natural resources", "Biological and biomedical sciences","Chemistry",
                                                "Geosciences, atmospheric sciences, and ocean sciences","Health sciences","Health sciences","Physics and astronomy"),
                         `Mathematics and computer sciences` = list("Computer and information sciences", "Mathematics and statistics"),
                         `Psychology and social sciences` = list("Anthropology", "Economics", "Other social sciences","Psychology"),
                         `Engineering` =  list("Other engineering"),
                         `Education` =  list("Education administration","Education research","Other education","Teacher education","Teaching fields"),
                         `Humanities and arts` = list("Foreign languages and literature","History","Letters","Other humanities and arts"))
        ),


      ),

      mainPanel(
        plotlyOutput("pieplot")
      )
    )
  )),


  tabPanel("Gender diversity 👩‍🎓🧑‍🎓",



  h3("4. Is there an indication of gender inequality and how is the gender diversity today among PhD graduates ?"),
  fluidRow(
    sidebarLayout(
      sidebarPanel(
        selectizeInput(inputId = "gender",
                    label = " Gender selection:",
                    choices = c("Male","Female"),
                    selected = "Male",
                    multiple = TRUE),
        checkboxGroupInput(inputId = "history",
                     label = "Choose period of study:",
                     choices = c("Pre 2000","Post 2000"),
                     selected = "Pre 2000"

                     )
      ),

      mainPanel(
        plotlyOutput("barPlot1")
      )
    )
  ),

  h3("5. Let us dive deeper into the gender statistics amongst the PhD graduates !"),
  fluidRow(
    sidebarLayout(
      sidebarPanel(
        radioButtons(inputId = "statistic",
                       label = " Choose a type of statistic:",
                       choices = c(
                                   "Proportion of Female graduates" = "Prop_Female",
                                   "Proportion of Male graduates" = "Prop_Male",
                                   "Gender ratio of graduates (Female:Male)" = "Gender_ratio"
                                   ),
                       selected = "Prop_Female"),
        checkboxGroupInput(inputId = "history_gender",
                       label = "Choose period of study:",
                       choices = c("Pre 2000","Post 2000"),
                       selected = "Pre 2000"

        )
      ),

      mainPanel(
        plotlyOutput("genderPlot")
      )
    )
  )),

  ),
  includeCSS("styles.css")
)




server <- function(input, output) {

  output$distPlot <- renderPlotly({


    df_year <- df %>% group_by(year) %>% summarise(Total_graduates = sum(n_phds,na.rm = TRUE))

    years <- c(2008:2017)
    pl1 <- ggplot(data = df_year %>% na.omit() %>% filter(year <=input$year), aes(x = year,y =  Total_graduates)) +
      geom_line() + geom_point(color = "red") +
      labs(x = "Graduation year",y = "Number of graduates") +
      theme_classic() + scale_x_continuous(labels =years,breaks = years) +
      ggtitle("Total number of PhD graduates between 2008-2017 \n in The United States") + theme(plot.title = element_text(hjust = 0.5,face = 'bold',size=8),
                                                                                                         axis.text = element_text(face = 'bold'),legend.position = 'none')
    ggplotly(pl1)

  })

  output$plot <- renderPlot({
    df_broad <- df %>% filter(broad_field == input$broad_field) %>% group_by(major_field) %>% summarise(Total_graduates = sum(n_phds,na.rm=TRUE))
    ggplot(data = df_broad , aes(x = major_field, y = Total_graduates,fill = major_field)) + ggtitle(paste0("Broad field of study:",input$broad_field)) +
      geom_col(color = "black") + geom_label(aes(label = Total_graduates)) +
      theme_classic(base_size = 14) +
      labs(x = "Major field of study", y = "Number of graduates") + theme(legend.position = "none",axis.text.x = element_text(face = 'bold'),plot.title = element_text(hjust = 0.5)) +
      coord_flip() + scale_fill_brewer(palette = "Dark2")
  })


  output$pieplot <-renderPlotly({

    df_field <- df %>% na.omit() %>% filter(major_field == input$major_field) %>% group_by(field) %>% summarise(Total_graduates = sum(n_phds,na.rm = TRUE))

    pl2 <- ggplot(data = df_field, aes(x = "",y = Total_graduates,fill = field)) +
      geom_col(color = "black") + theme_classic() +  ggtitle(paste0("Graduates in the major field of : \n",input$major_field)) + theme(legend.position = "none") + coord_flip() +
      labs(x = "Specific field of study",y ="Number of graduates")
    ggplotly(pl2)


  })


  output$distPlot1 <-renderPlotly({

    pl3 <- plot_ly(data = df_year %>% na.omit() %>% filter(year <=input$year1), type = 'scatter', mode = 'lines')%>%
     add_trace(x = ~year, y = ~Total_graduates,name = "Graduates per year")%>%
      layout(showlegend = F)
    options(warn = -1)

    pl3 <- pl3 %>%
     layout(
        xaxis = list(zerolinecolor = '#ffff',
                     zerolinewidth = 2,
                     gridcolor = 'ffff'),
        yaxis = list(zerolinecolor = '#ffff',
                    zerolinewidth = 2,
                     gridcolor = 'ffff'),
        plot_bgcolor='#e5ecf6', width = 900)

    pl3

  })



  output$barPlot1 <-renderPlotly({


    df_gender_long <-
      df_gender %>% pivot_longer(
        cols = c("Male", "Female"),
        values_to = "Total_graduates",
        names_to = "gender"
      ) %>% filter(gender %in% input$gender,History %in% input$history)

    pl3 <- ggplot(data = df_gender_long,aes(x = Year,
                                            y = Total_graduates,
                                            fill = gender)) + geom_col(position = "dodge") + coord_flip() + labs(x = "Academic Year",
                                                                                                                               y = "Total graduates (in 1000s)",
                                                                                                                               fill = "Gender") + theme_classic() +
      theme(axis.text.y = element_text(size = 5,face = 'bold'))

  })


  output$genderPlot <-renderPlotly({


    df_gender_stats_new <- df_gender_stats %>% filter(History %in% input$history_gender)

    pl4 <- ggplot(df_gender_stats_new, aes(x = Year,y = .data[[input$statistic]])) +
      labs(x = "Year", y = input$statistic) +
      geom_point(color = 'darkblue') +
      theme_classic() +
      labs(x = "Academic Year",y = input$statistic) + theme(axis.text.x = element_text(size = 5,face = 'bold',angle= 60))
    ggplotly(pl4)


  })


  output$about <- renderUI({
    knitr::knit("about.md", quiet = TRUE) %>%
      markdown::markdownToHTML(fragment.only = TRUE) %>%
      HTML()
  })
}

shinyApp(ui = ui, server = server)















