seed(123)
m = array(0,2);
m[1] = 1;
m[2] = 2;
v = matrix(0.0,2,2);
v [1,1] = 1.0;
v [1,2] = 0.7;
v [2,1] = 0.7;
v [2,2] = 2.0;
y = array(0,2);
ynew = y;
ycount = 0
xcount = 0
niter=100000
all_accepted_pairs=matrix(0,nrow=niter,ncol=2)
all_rejected_pairs=matrix(0,nrow=niter,ncol=2)
vi=solve(v)

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
plot(c(lower_1,upper_1),c(lower_2,upper_2),type="n",xlab="Trait 1",ylab="Trait 2")
title("Bivariate Samples - MH Sampling")
ytmp=xtmp=array(0,4)
naccept=0
nreject=0
z = matrix(y-m,2,1);
denOld = exp(-0.5*t(z)%*%vi%*%z); 

for (iter in 1:100000){
    ynew[1] = y[1] + runif(1, min1, max1);
    ynew[2] = y[2] + runif(1, min2, max2);
   denNew = exp(-0.5*(ynew-m)%*%vi%*%(ynew-m));
   alpha = denNew/denOld;
   
    xtmp[1]=y[1]+min1
    ytmp[1]=y[2]+min2
    
    xtmp[2]=y[1]+max1
    ytmp[2]=y[2]+min2    
 
    xtmp[3]=y[1]+min1
    ytmp[3]=y[2]+max2    

    xtmp[4]=y[1]+max1
    ytmp[4]=y[2]+max2
    points (xtmp[1:2],ytmp[1:2],type="l",col="blue")
    points (xtmp[3:4],ytmp[3:4],type="l",col="blue")
    points (xtmp[c(1,3)],ytmp[c(1,3)],type="l",col="blue")
    points (xtmp[c(2,4)],ytmp[c(2,4)],type="l",col="blue")
    
   	points (y[1],y[2],col="black", pch=21,bg="black")   		
        
   
   u = runif(1, 0.0, 1.0);
   
    points (ynew[1],ynew[2],pch=21,col="red",bg="red")
	scan(file="")	

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
