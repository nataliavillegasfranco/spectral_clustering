function [i,j]= argmax2(X,I,J)

Xsub=X(I,J);
S=size(Xsub); % [# Filas, # Columnas]

ind=zeros(S(1),2);
for k=1: S(1)
    [ind(k,1) ind(k,2)]= max(Xsub(k,:));    
end
[y,i]=max(ind(:,1));
j=J(ind(i,2));
i=I(i);

% retorna el argumento(Indices) del max de la matriz X
end