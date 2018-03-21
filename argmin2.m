function [i,j]=argmin2(X,I,J)

Xsub=X(I,J);
S=size(X(I,J)); % [# Filas, # Columnas]

ind=zeros(S(1),2);
for k=1: S(1)
    [ind(k,1) ind(k,2)]= min(Xsub(k,:));    
end
[y,i]=min(ind(:,1)); 
j=ind(i,2);
j=J(j);
i=I(i);
% retorna el argumento(Indices) del min de la matriz X

end