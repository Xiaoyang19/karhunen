# Julio Change Detection
# tests/testKL1D
# 02162021
# Xiaoyang Chen


# Initialize parameters
# initialization = initKL1D
# KLeigenspace = KL1D
# KLmultilevel = multilevelHB
# MLtest = testtransform
# KLRealization = KL1Drealization
# MLtransform = mltransform
# KLMLplot = plotKL1D
# KLMLtest = testKLML1D

`%notin%` <- Negate(`%in%`)
setwd("H:/2021Sep/Julio/ChangeDetection/ChangeDetectionR")
parameters<-list()
source('initKL1D.R')
source('KL1D.R')
source('multilevelHB.R')

# parameters = methods.initialization();
parameters<-initKL1D(parameters)


# Create Eigenvectors of Weiner process on a sphere
# spherical harmonics
# parameters = methods.KLeigenspace(parameters);
parameters<-KL1D(parameters)

# Create Multilevel Basis
# parameters = methods.KLmultilevel(parameters,methods);
parameters<-multilevelHB(parameters,methods)
