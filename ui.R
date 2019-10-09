library(shiny)

shinyUI(fluidPage(
   titlePanel("Estatística Descritiva"),
   includeCSS("www/estilo.css"),
   sidebarLayout(
      sidebarPanel(
         sliderInput("desvio", "Desvio Padrão", min = 0.1, max = 5, value = 2.5),
         sliderInput("desloc", "Deslocamento", min = -5, max = 5, value = 0, step = 0.5),
         hr(),
         uiOutput('est')
      ),
      mainPanel(
         plotOutput("plot")
      )
   ),
   hr(),
   flowLayout(id = "cabecario",
              p(strong("Apoio:"), br(), img(src="NEPESTEEM.png")),
              p(strong("Agradecimento:"), br(), img(src="FAPESC.png")),
              p(strong("Desenvolvido por:"), br(), "César Eduardo Petersen")
   )
))
