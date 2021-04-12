#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Run all scripts ---------------------------------------------------------
source(file = "complement.R")
source(file = "random_dna.R")
source(file = "mk_codons.R")
source(file = "dna_codons_to_aa.R")

# Define UI for application that generates a random DNA sequence
ui <- fluidPage(

    # Application title
    titlePanel("Random DNA generator"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput("l", "Number of bases", value=99,
                         min=3, max=9999, step=3),
            
            actionButton("generate",
                        "Generate random DNA sequence")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           textOutput("result")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$result <- renderText(random_dna(input$l))

}

# Run the application 
shinyApp(ui = ui, server = server)
