library(shiny)

# Define UI for application that draws a scatter plot
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict miles per gallon from weight"),

    # Sidebar with a slider input for weight
    sidebarLayout(
        sidebarPanel(
            h3("Weight selection"),
            em("Slide to adjust input weight"),
            sliderInput("weight",
                        "Weight:",
                        min = 1,
                        max = 5.5,
                        value = 3)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            h3("Predicted miles per gallon from linear model:"),
            textOutput("pred1"),
            
            
        )
    )
))


