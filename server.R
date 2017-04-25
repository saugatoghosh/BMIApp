

library(shiny)

BMI_factor <- function(Weight, Height) {Weight*0.45/(Height*.025)^2}

group_f <- function(Weight, Height){
  BMI_value <- Weight*0.45/(Height*.025)^2
  ifelse(BMI_value <18.5,"underweight",ifelse(BMI_value <25,"normal weight",ifelse(BMI_value <30,"overweight","obese")))
}


shinyServer(function(input, output) {
  output$inputweightvalue <- renderPrint({input$Weight*0.45})
  output$inputheightvalue <- renderPrint({input$Height*.025})
  output$BMI <- renderPrint({BMI_factor(input$Weight, input$Height)})
  output$group <- renderPrint({group_f(input$Weight, input$Height)})
  
  
})
