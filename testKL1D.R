# Julio Change Detection
# tests/testKL1D
# 02162021
# Xiaoyang Chen


`%notin%` <- Negate(`%in%`)
setwd("H:/2021Sep/Julio/ChangeDetection/ChangeDetectionR")
# Initialize parameters
# initialization = initKL1D
# KLeigenspace = KL1D
# KLmultilevel = multilevelHB
# MLtest = testtransform
# KLRealization = KL1Drealization
# MLtransform = mltransform
# KLMLplot = plotKL1D
# KLMLtest = testKLML1D

parameters<-list()

# parameters = methods.initialization();
source('initKL1D.R')
initKL1Dout<-initKL1D()
parameters$KL<-initKL1Dout$KL


# Create Eigenvectors of Weiner process on a sphere
# spherical harmonics
# parameters = methods.KLeigenspace(parameters);
source('KL1D.R')
parameters<-KL1D(parameters)
