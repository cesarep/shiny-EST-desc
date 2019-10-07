library(shiny)

momento <- function(x, n){sum((x-mean(x))^n)/length(x)}

shinyServer(function(input, output) {
  output$plot <- renderPlot({
    desvio = input$desvio
    i = input$desvio/5
    var1 = rnorm(100*i, 0, desvio)
    var2 = rnorm(150*i, input$desloc*desvio, desvio)
    var3 = rnorm(150*i/2.5, -2.5*input$desloc*desvio, desvio)
    
    var = c(var1, var2, var3)
    
    lim = c(min(var,-15), max(var,15))
    
    par(fig=c(0, 1, 0.3, 1), mar=c(0, 4.1, 0, 2.1), new=T)
    hist(var, xlim = lim, axes=F, main='', xlab='', ylab='', breaks = (floor(min(var))):(ceiling(max(var))) )
    
    par(fig=c(0, 1, 0, 0.3), mar=c(0, 4.1, 0, 2.1), new=T)
    boxplot(var, horizontal = T, ylim=lim, axes=F)
    abline(v = 0, lty=2, col='grey')
    
    output$est <- renderUI( HTML(
      sprintf('Média = %.3f<br>', mean(var)),
      sprintf('Mediana = %.3f<br>', fivenum(var)[3]),
      sprintf('<hr>'),
      sprintf('1º Quartil = %.3f<br>', fivenum(var)[2]),
      sprintf('3º Quartil = %.3f<br>', fivenum(var)[4]),
      sprintf('Assimetria = %.3f<br>', momento(var, 3)/var(var)),
      sprintf('Curtose = %.3f', momento(var, 4)/var(var)^2)
    ))
  }, height = 200, width = "auto")
})
