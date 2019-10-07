library(shiny)

javascript = HTML("
function resize(){
   if(window.innerWidth >= 768)
      valor = Math.min(window.innerHeight-65, Math.floor(2*window.innerWidth/3));
   else
      valor = window.innerWidth-30;
   $('#plot').width(valor*0.8+'px').height(valor+'px');
}
window.onresize = function(){resize()}
window.onload = function(){resize()}
")

shinyUI(fluidPage(
   tags$head(tags$script(javascript)),
   titlePanel("Estatística Descritiva"),
   includeCSS("estilo.css"),
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
