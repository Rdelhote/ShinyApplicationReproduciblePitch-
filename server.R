# Define server logic required to draw a histogram
library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
    output$table <- renderDataTable({
        disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
        hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
        data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                          GasolineExpenditure = input$dis/mpg*input$cost,
                          Cylinders = cyl, Displacement = disp, Horsepower = hp, 
                          Transmission = am)
        data <- filter(data, GasolineExpenditure <= input$gas, Cylinders %in% input$cyl, 
                       Displacement %in% disp_seq, Horsepower %in% hp_seq, Transmission %in% input$am)
        data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
        data <- arrange(data, GasolineExpenditure)
        data
    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})
    
    output$help <- renderText({
        "This simple application shows the development of Austrian inhabitants over a period of 30 years.
        The app is quite simple to use.
        The drop-down list on the top includes all provincial states in Austria.
        You can choose for which provincial state you want to see de inhabitant’s development.
        With the slider below, it is possible to define the period, which you want to look at.
        The result of your choice is visualised within the barplot in the main window."
    })})