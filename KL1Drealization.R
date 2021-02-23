# Julio Change Detection
# KL1Drealization
# 02222021
# Xiaoyang Chen


KLSPrealization<-function(parameters){
  
  library(ggplot2)
  
  # Generate realization of 1D stochastic process
  lambda <-parameters$KL$lambda 
  M <-parameters$KL$M 
  l <-parameters$KL$l 
  x <-parameters$KL$coord 
  
  
  # Realization of stochastic process with
  # truncated KL expansion
  cte<-as.matrix(sqrt(3) * 2 * (runif(l) - 1/2)) 
  output = 1 + M %*%(cte*lambda)
  
  parameters$KL$realization <-output 
  parameters$ML$input <-output 
  
  
  # Plot Figures
    if (parameters$KL$plotrealization == TRUE ){
      # figure(1) 
      # png(filename = "tkt_plot1.png", width = 400, height = 300, units = "px")
      ggplot(data.frame(x,output), aes(x=x, y=output))+geom_line()+theme_light()+ggtitle('KL Realization') 
    }

  return(parameters)
  
}