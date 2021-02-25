# Julio Change Detection
# Code\source\karhunen\1D  KL1D
# 02162021
# Xiaoyang Chen

KL1D<-function(parameters){
  # Initialize Eigenspace
  l = parameters$KL$l
  coord = parameters$KL$coord
  x = coord
  M = rep(1,(length(x)))
  
  L = parameters$KL$L
  Lp = parameters$KL$Lp
  
  eigenlambda<-vector()
  eigenlambda[1] = sqrt(sqrt(pi) * L / 2)
  
  
  for (i in 2 : l){
    if (floor(i/2) == i/2 ) 
      phi=(1 / i) * sin ( floor(i/2) * pi * x / Lp ) else
        phi=(1 / i) * cos ( floor(i/2) * pi * x / Lp )
      
      #eigenlambda[1,i]=sqrt(sqrt(pi) * L) * exp( - ( (floor(i/2) * pi * L)^2 ) / 8 )
      eigenlambda<-append(eigenlambda, sqrt(sqrt(pi) * L) * exp( - ( (floor(i/2) * pi * L)^2 ) / 8 ))
      M <-cbind(M, phi)
  }
  
  #eigenlambda = t(eigenlambda) 
  
  parameters$KL$lambda = eigenlambda
  parameters$KL$M = M
  
  return(parameters)
}
