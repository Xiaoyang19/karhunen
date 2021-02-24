# Julio Change Detection
# Code\source\basis  testtransform
# 02222021
# Xiaoyang Chen

testtransform <-function(parameters,methods) {
  `%notin%` <- Negate(`%in%`)
  setwd("H:/2021Sep/Julio/ChangeDetection/ChangeDetectionR")
  source('KL1Drealization.R')
  source("hbtrans.R")
  source("invhbtrans.R")
  source("hbvectortocoeffs.R")
    
  
  multileveltree <- parameters$ML$multilevetree 
  ind <- parameters$ML$ind 
  datacell <- parameters$ML$datacell 
  datalevel <- parameters$ML$datalevel 
  
  # Input eigenspace
  polymodel<-list()
  polymodel$M <- parameters$KL$M 
  
  # Number of columns in the design matrix
  params<-list()
  params$indexsetsize <- ncol(parameters$KL$M)
  coord <- as.matrix(parameters$KL$coord)
  #degree <- []  #Dummy variable, not used$
  
  
  ## Run transform with random data
  # Create realization
  # parameters <- methods$KLRealization(parameters) 
  parameters <- KL1Drealization(parameters) 
  
  Q <- parameters$KL$realization 
  numofpoints <- nrow(coord) 
  
  
  ### Metrics
  numvecs  <- ncol(Q)
  maxerror=Inf
  maxwaverror=Inf
  
  #initialize indicator
  n=1
  polyerror<-list()
  wavecoeffnorm<-list()
  
  start_time<- Sys.time()
  for (n in 1:numvecs){
    
    hbt<-hbtrans(Q[,n], multileveltree, ind, datacell, datalevel)
    
    Qv<-invhbtrans(hbt$dcoeffs, hbt$ccoeffs, multileveltree, ind, datacell, datalevel, numofpoints)
    
    polyerror[n]<- norm(Q[,n]-Qv, type='2') / norm(matrix(Q[,n]))
    
    wavecoeffnorm[n]<- norm(matrix(hbt$outputcoeff[1:(length(hbt$outputcoeff)-params$indexsetsize)]),type='i')/ norm(matrix(Q[,n]))
    #coeff == hbt$outputcoeff
  }
  end_time<- Sys.time()
  message('Total timing=   ',end_time-start_time)
  message('Results: Num of tests =   ', numvecs)
  message('Max Relative Error =   ', max(unlist(polyerror)))
  message('Relative HBcoefficientsnorm =   ',max(unlist(wavecoeffnorm)))
  
  #test one hbtrans running
  start_time<- Sys.time()
  hbttime<- hbtrans(Q[,n], multileveltree, ind, datacell, datalevel)
  end_time<- Sys.time()
  message('One Hierarchical Basis transform time=   ',end_time-start_time)
  
  
  #Test format change from vector of coefficients to struct
  totalerror=0
  hbcoef <- hbvectortocoeffs(hbt$outputcoeff,multileveltree,ind,datacell,datalevel,numofpoints)
  a<-hbcoef$dcoeffs
  b<-hbcoef$ccoeffs
  for (i in 1:length(hbcoef$dcoeffs)){
    totalerror <- totalerror + max(svd( matrix(a[[i]]-hbcoef$dcoeffs[[i]]) )$d)
  }
  totalerror <- totalerror + max(svd( matrix(b-hbcoef$ccoeffs) )$d)
  message('Total error = ', totalerror)
  
  # From parameters <- KL1Drealization(parameters) 
  return(parameters)
}