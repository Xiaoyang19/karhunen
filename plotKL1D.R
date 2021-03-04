# Julio Change Detection
# plotKL1D
# 03022021
# Xiaoyang Chen

plotKL1D<-function(parameters){
  
library(ggplot2)
library(gridExtra)
  
# Plot KL ML 1D tests
Qkl <- parameters$KL$realization 
bump <- parameters$KL$deviation 
x <- parameters$KL$coord 
Q <- parameters$ML$input 
levelcoeff <- parameters$ML$Output$levelcoefficients 
coeff <- parameters$ML$Output$coefficients 
coord <- parameters$KL$coord 


#figure(3)
plot3<-matrix(list(),1,3)

plot3[[1]]<-ggplot(data.frame( x,Qkl), aes(x= x, y=Qkl))+geom_line()+theme_light()+
  ggtitle('KL Realization without Gaussian bump')            
# print(plot3[[1]])
plot3[[2]]<-ggplot(data.frame( x,bump), aes(x= x, y=bump))+geom_line()+theme_light()+
  ggtitle('Gaussian bump')   
plot3[[3]]<-ggplot(data.frame( x,Q), aes(x= x, y=Q))+geom_line()+theme_light()+
  ggtitle('KL Realization with Gaussian bump')  

# png(filename = "tkt_plot3.png", width = 480, height = 800, units = "px")
grid.arrange(plot3[[1]],plot3[[2]],plot3[[3]],ncol=1)
# dev.off()





#figure(4)
maxlevel = max( levelcoeff)
numlevel = 5
counter = 1
n=1
plot4<-matrix(list(),1,numlevel)
plot4[[1]]<-ggplot(data.frame( x,Q,Qkl,bump), aes(x= x))+theme_light()+
  geom_line(aes(y=Q),color='blue')+
  geom_line(aes(y=Qkl),linetype='dashed')+
  geom_line(aes(y=bump),color='orange')


outputcell<-matrix(list(),numlevel+2,2)
outputcell[1]<-list(t( x))
outputcell[2]<-list(bump)

for (n in maxlevel:(maxlevel-numlevel)){
  counter<-counter + 1
  
  plot4data<-data.frame(px=1:length( levelcoeff[ levelcoeff == n]),py= coeff[ levelcoeff == n])
  plot4[[counter]]<-ggplot(plot4data, aes(x=px, y=py))+
    geom_segment( aes(x=px, xend=px, y=0, yend=py), color="grey")+
    geom_point(color="blue", size=2)+
    theme_light()+
    ggtitle(paste("Level Coefficients = ",n))
  # print(plot4[[counter]])
  
  outputcell[counter+1]<-list( levelcoeff[ levelcoeff == n])
  
  n=n-1
}

# png(filename = "tkt_plot4.png", width = 800, height = 1600, units = "px")
grid.arrange(plot4[[1]],plot4[[2]],plot4[[3]],plot4[[4]],plot4[[5]],plot4[[6]],plot4[[7]],ncol=1)
# dev.off()

# object 'maxbump' not found
}