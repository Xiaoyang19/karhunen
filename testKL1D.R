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

setwd("H:/2021Sep/Julio/ChangeDetection/ChangeDetectionR")
# source('testKL1D.R')
source('initKL1D.R')
source('KL1D.R')
source('multilevelHB.R')
source('mltransform.R')
source('testKLML1D.R')
source('plotKL1D.R')

`%notin%` <- Negate(`%in%`)

parameters<-list()
# parameters = methods.initialization();
parameters<-initKL1D(parameters)

# Create Eigenvectors of Weiner process on a sphere
# spherical harmonics
# parameters = methods.KLeigenspace(parameters);
parameters<-KL1D(parameters)

# Create Multilevel Basis
# parameters = methods.KLmultilevel(parameters,methods);
parameters<-multilevelHB(parameters,methods)

# Transfrom input to ML
# parameters = methods.MLtransform(parameters);
parameters<-mltransform(parameters)

# Create test input
# parameters = methods.KLMLtest(parameters)
# add bump to input data
parameters<-testKLML1D(parameters)

# Transfrom input with change to ML
# parameters = methods.MLtransform(parameters);
parameters<-mltransform(parameters)

# Plot transform
# parameters = methods.KLMLplot(parameters);
parameters<-plotKL1D(parameters)


