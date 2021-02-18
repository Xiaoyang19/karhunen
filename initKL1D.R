# Julio Change Detection
# Code\source\karhunen\1D  initKL1D
# 02162021
# Xiaoyang Chen

# Initialize 1D KL problem
initKL1D<-function(parameters) {
  # Define 1D domain
  numofpoints = 500
  d = 1
  coord = seq(0,d,len=numofpoints)
  
  # Number of eigenfunctions
  l = 10
  
  # Parameters of covariance function
  Lc = 0.01
  Lp = max(d,2*Lc)
  L  = Lc / Lp
  
  # Output parameters
  # parameters.KL.Lc = Lc;
  # parameters.KL.Lp = Lp;
  # parameters.KL.L = Lc / Lp;
  # parameters.KL.n = size(coord,1);
  # parameters.KL.coord = coord;
  n=length(coord)
  
  # Plotting parameters
  numlevel = 2 #Choose maximal level
  # parameters.KL.plotrealization = false; # Plot a relization
  # parameters.ML.plot.level = numlevel;
  
  KL<-list('Lc'=Lc, 'Lp'=Lp, 'L'=L, 'l'=l, 'n'=n, 'coord'=coord,'plotrealization'='False' )
  parameters$KL<-KL
  parameters$ML$plot$level=numlevel
  
  return(parameters)
}