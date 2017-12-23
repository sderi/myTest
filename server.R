# Just trying to learn how to use git with git hub
library(shiny)
library(ggplot2)
library(plotly)
library(ggthemes)
library(GGally)

ssData <- read.csv('data/allDataV2.csv')

function(input, output,session) {

	output$plotVarExplore <- renderPlotly({

		p <- ggplot(ssData, aes_string(input$x, input$y, color='Construct')) + 
		geom_point() + 
		theme_hc() + scale_colour_hc()

		ggplotly(p)

		})

	observeEvent(input$corPlot, {
		output$plotVarMatrix <- renderPlot({

		construct <- filter(ssData, Construct == input$varConstruct)
		construct$pH <- factor(construct$pH)

		#pairs(construct[,4:length(colnames(allData))], col = allData$Construct)
		ggpairs(construct[,3:length(colnames(allData))], aes_string(colour= "pH"),
			lower = list(combo = wrap("facethist", binwidth = 0.5))) 
		})
		})

}

