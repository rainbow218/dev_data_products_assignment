library(shiny)

# Define server logic 
shinyServer(function(input, output) {
    # predict mpg based on input$weight from ui.R
    mtcars$am <- factor(mtcars$am)
    model <- lm(formula = mpg ~ wt + qsec + am, data = mtcars)
    #predict miles per gallon with user input weight
    
    
    result <- reactive({
        new.data <- data.frame(
            wt = input$weight, qsec = 17, am = 0
        )
        
        new.data$am <- factor(new.data$am)
        predict(model, newdata = new.data)})
    
    output$distPlot <- renderPlot({
        
        #plot prediction result
        output <- data.frame (
            wt = input$weight , mpg = result(), category = "Prediction"
        )
        
        model_input <- data.frame (
            wt = mtcars$wt, mpg = mtcars$mpg, category = "data used to build model"
        )
        plot_input <- rbind (model_input, output)
        library(ggplot2)
        
        ggplot(plot_input, aes(wt, mpg, color=category, shape=category)) + geom_point(size=3) + theme_classic()
        
        })
    output$pred1 <- renderText({
        result()
    })

})
