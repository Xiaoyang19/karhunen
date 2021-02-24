# Julio Change Detection
# Code\source\basis  multilevelHB
# 02172021
# Xiaoyang Chen

multilevelHB<-function(parameters,methods){
  
  `%notin%` <- Negate(`%in%`)
  setwd("H:/2021Sep/Julio/ChangeDetection/ChangeDetectionR")
  source("make_tree.R") 
  source("multilevelbasis_nested.R")
  source("testtransform.R")
  
  polymodel<-list()
  params<-list()
  degree<-vector()
  
  # Input eigenspace
  polymodel$M <- parameters$KL$M
  
  # Number of columns in the design matrix
  params$indexsetsize <- ncol(parameters$KL$M)
  coord <- as.matrix(parameters$KL$coord)

  # Create Multilevel Binary tree
  #[datatree, sortdata] <- make_tree(coord,@split_KD,params);
  mt<-make_tree(coord,split_KD,params)
  
  # Create multilevel basis
  #[multileveltree, ind, datacell, datalevel]  <- multilevelbasis(datatree, sortdata, degree, polymodel);
  datatree<-mt$tree
  coords<-mt$DATA
  mb<-multilevelbasis_nested(datatree,coords,degree,polymodel,mt)
  
  parameters$ML$multilevetree <- mb$multileveltree
  parameters$ML$ind <- mb$ind
  parameters$ML$datacell <- mb$datacell
  parameters$ML$datalevel <- mb$datalevel
  
  
  # Test transform
  # parameters <- methods$MLtest(parameters,methods);
  parameters <- testtransform(parameters,methods)
  
  return(parameters)
}
