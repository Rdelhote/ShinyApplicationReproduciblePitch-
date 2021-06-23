library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("My Shiny App"),
    
    # Sidebar with radio inputs for x and y axes
    sidebarLayout(
        sidebarPanel(
            h4("Choose a column for the X axis:"),
            radioButtons(inputId = "x", label = "X axis",
                         choices = c("miles per gallon" = "1",
                                     "cylinders" = "2",
                                     "displacement" = "3",
                                     "gross horsepower" = "4",
                                     "rear axle ratio" = "5",
                                     "weight" = "6",
                                     "quarter mile time" = "7",
                                     "engine" = "8",
                                     "transmission" = "9",
                                     "forward gears" = "10",
                                     "carburetors" = "11")),
            h4("Choose a column for the Y axis:"),
            radioButtons(inputId = "y", label = "Y axis",
                         choices = c("miles per gallon" = "1",
                                     "cylinders" = "2",
                                     "displacement" = "3",
                                     "gross horsepower" = "4",
                                     "rear axle ratio" = "5",
                                     "weight" = "6",
                                     "quarter mile time" = "7",
                                     "engine" = "8",
                                     "transmission" = "9",
                                     "forward gears" = "10",
                                     "carburetors" = "11"))
        ),
        
        # Show a plot of the selected columns
        mainPanel(
            plotOutput("carsPlot")
        )
    )
))