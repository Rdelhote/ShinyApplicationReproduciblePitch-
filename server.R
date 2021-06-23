library(shiny)

shinyServer(function(input, output) {
    
    output$carsPlot <- renderPlot({
        
        x <- mtcars[, as.numeric(input$x)]
        y <- mtcars[, as.numeric(input$y)]
        xlab = colnames(mtcars)[as.numeric(input$x)]
        ylab = colnames(mtcars)[as.numeric(input$y)]
        plot(x, y, xlab = xlab, ylab = ylab, main = "Motor Trend Car Road Tests")
        
    })
})