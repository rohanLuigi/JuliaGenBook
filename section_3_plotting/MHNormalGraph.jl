using Distributions

m=[0.0 0.0]
v=[1.0 0.6
   0.6 1.0]
		
nrow=100
ncol=2
ypair=Array(Float64,nrow,ncol);

y = zeros(1,2)
ynew = Array(Float64,1,2)
ycount = 0
xcount = 0
niter= 1000
all_accepted_pairs=Array(Float64,nrow,2);
all_rejected_pairs=Array(Float64,nrow,2);
vi=inv(v)


m1 = 0;
m2 = 0;
xx = 0;
y1 = 0;
delta = 1.0;
min1 = -delta*sqrt(v[1,1]);
max1 = +delta*sqrt(v[1,1]);
min2 = -delta*sqrt(v[2,2]);
max2 = +delta*sqrt(v[2,2]);


lower_1 = m[1]-3*sqrt(v[1,1])
upper_1 = m[1]+3*sqrt(v[1,1])
lower_2 = m[2]-3*sqrt(v[2,2])
upper_2 = m[2]+3*sqrt(v[2,2])


ytmp=Array(Float64,1,4)
xtmp=Array(Float64,1,4)

naccept=0
nreject=0
z = y-m
z = z'
denOld = exp(-0.5*z'*vi*z); 




##start plot
using Winston
p = FramedPlot(
         title="Bivariate Samples - MH Sampling",
         xlabel="Trait 1",
         ylabel="Trait 2",
         xrange=(lower_1,upper_1),
         yrange=(lower_2,upper_2))




for (iter in 1:100000){
    ynew[1] = y[1] + rand(Uniform(min1, max1))
    ynew[2] = y[2] + rand(Uniform(min2, max2))
    denNew  = exp(-0.5*(ynew-m)*vi*(ynew-m)');
    alpha   = denNew/denOld;
   
    xtmp[1]=y[1]+min1
    ytmp[1]=y[2]+min2
    
    xtmp[2]=y[1]+max1
    ytmp[2]=y[2]+min2    
 
    xtmp[3]=y[1]+min1
    ytmp[3]=y[2]+max2    

    xtmp[4]=y[1]+max1
    ytmp[4]=y[2]+max2
    point1 =Points(xtmp[1:2],ytmp[1:2],type="l",color="blue")
    point2 =Points(xtmp[3:4],ytmp[3:4],type="l",color="blue")
    point3 =Points(xtmp[c(1,3)],ytmp[c(1,3)],type="l",color="blue")
    point4 =Points(xtmp[c(2,4)],ytmp[c(2,4)],type="l",color="blue")
    
   	Points (y[1],y[2],col="black", pch=21,bg="black")   		
        
   
    u = runif(1, 0.0, 1.0);
   
    Points (ynew[1],ynew[2],pch=21,col="red",bg="red")
	readline(STDIN)

   if (u < alpha) {   # Accept the new pair
   		y = ynew;
   		denOld = exp(-0.5*(y-m)%*%vi%*%(y-m)); 
   	    naccept = naccept +1
        all_accepted_pairs[naccept,]=y  	    
   	    points (y[1],y[2],col="black", bg="black")   		
   	} else {          # Reject the new pair
   		nreject = nreject +1
        all_rejected_pairs[nreject,]=ynew  	    
   	}
   	
plot(c(lower_1,upper_1),c(lower_2,upper_2),type="n",xlab="Trait 1",ylab="Trait 2")
title("Bivariate Samples - MH Sampling")
   	    points (all_accepted_pairs[1:naccept,1],all_accepted_pairs[1:naccept,2],col="black", bg="black")   		
   	    points (all_rejected_pairs[1:nreject,1],all_rejected_pairs[1:nreject,2],col="red")   		
   	
   	
    points (xtmp[1:2],ytmp[1:2],type="l",col="white")
    points (xtmp[3:4],ytmp[3:4],type="l",col="white")
    points (xtmp[c(1,3)],ytmp[c(1,3)],type="l",col="white")
    points (xtmp[c(2,4)],ytmp[c(2,4)],type="l",col="white")
   	
    	

}





point1=Points(ypair[1,1],ypair[1,2],color="green")
point2=Points(ypair[1,1],ypair[1,2])
add(p,point1)

for iter=2:nrow
	readline(STDIN)
	point1=Points(ypair[iter-1,1],ypair[iter,2],color="green")
	add(p,point1,point2)
	display(p)	
	point1=Points(ypair[iter-1,1],ypair[iter,2]) #change to black
	
	readline(STDIN)
	point2=Points(ypair[iter,1],ypair[iter,2],color="green")
	add(p, point1,point2)
	display(p)	
	point2=Points(ypair[iter,1],ypair[iter,2]) #change to black
end






