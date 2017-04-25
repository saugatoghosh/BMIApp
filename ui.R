

library(shiny)


shinyUI(fluidPage(
  
  
  titlePanel("Body Mass Index(BMI) Calculator"),
  
  tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: blue}")),
  tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: red}")),
  
  
  
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("Weight", "What is Your Weight in Pounds?", 60, 300, value = 120, step = 1),
      sliderInput("Height", "What is your Height in Inches?", 30,90, value = 60, step = 1),
      submitButton("Submit")
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("BMI",
                           p('Your weight in kilograms is:'), 
                           verbatimTextOutput("inputweightvalue"),
                           p('Your height in metres is:'),
                           verbatimTextOutput("inputheightvalue"),
                           p("Your calculated BMI is:"),
                           verbatimTextOutput("BMI"),
                           h4("Which means that you are:"),
                           strong(verbatimTextOutput("group"))
                  ),
                  tabPanel("About",
                           p('Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.'),
                           p('BMI is calculated as : Weight in kgs/ (Height in metres)^2'),
                           p('BMI Categories:'),
                           tags$div(
                             tags$ul(
                               tags$li('BMI <18.5       : Underweight'),
                               tags$li('BMI [18.5-24.9] : Normal weight'),
                               tags$li('BMI [25-29.9]   : Overweight'),
                               tags$li('BMI >=30        : Obesity')
                             )
                           ))
      )
    )
  )
))
