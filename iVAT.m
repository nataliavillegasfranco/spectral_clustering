function [iD]=iVAT(D)
N =size(D,1);
iD=zeros(N,N);

for r=2:N
   [~,j]= argmin2(D,r,1:r-1); 
   for c=1:(r-1)
       if j==c
         iD(r,c)=D(r,c);
         iD(c,r)=iD(r,c);
       else
         iD(r,c)=max(D(r,j),iD(j,c));
         iD(c,r)=iD(r,c);
       end
   end
end
end



