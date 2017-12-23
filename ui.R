library(shiny)
library(ggplot2)
library(plotly)
library(ggthemes)
library(GGally)

ssData <- read.csv('data/allDataV2.csv')

shinyUI(
	fluidPage(
	sidebarLayout(
		sidebarPanel(
			selectInput('x', "Select X Variable", 
				choices = colnames(ssData[4:length(colnames(ssData))]),
				selected = names(ssData)[[3]], width = '35%'),
			selectInput('y', "Select Y Variable",
				choices = colnames(ssData[4:length(colnames(ssData))]),
				selected = names(ssData)[[4]], width = '35%'),
			h3("For Correlation Plot"),
			actionButton('corPlot', "Correlate"),
			selectInput('varConstruct', "Select construct to plot correlation matrix",
					choices = unique(as.character(allData$Construct)), width = "35%")
			),
			
		mainPanel(
			plotlyOutput('plotVarExplore'),
			plotOutput('plotVarMatrix')
			)

		)
	)
	
)


