function [VGD]=G_DunnIndex(X,lab,sel)

K=max(lab);
% Este algoritmo se basa en:
% Some new indexes of clustering validity (Bezdek, 1998) y se adopta la
% notación usada en este artículo.

V=[3 1;
   4 1;
   5 1;
   3 3;
   5 3];
% V31
i=V(sel+1,1);
j=V(sel+1,2);

% calculo del diamentro máximo
diameter=zeros(K,1);
for p=1:K
    diameter(p)=dS(j,X(p==lab,:));    
end
Maxdia=max(diameter); % diametro máximo

Vgd=zeros(K,1);
for s=1:K
    Xs=X(s==lab,:);
    deltai=zeros(K-1,1);
    c=1;
    for t=1:K
        if t~=s
            Xt=X(t==lab,:);            
            deltai(c)=delta(i,Xs,Xt);
            c=c+1;
        end       
    end
    Vgd(s)=min(deltai/Maxdia);    
end
VGD=min(Vgd);

    
    
    
    
    
%--------------------------------------------------------------------------
function [d] = delta(i,Xs,Xt) % i=3,4,5
    % Distancia entre Conjuntos 
    Nxt=size(Xt,1);
    Nxs=size(Xs,1);
    switch i
        case 3
            dtmp=zeros(Nxs,Nxt);
            for n=1:Nxs
                dtmp(n,:)= sqrt(sum((ones(Nxt,1)*Xs(n,:)-Xt).^2,2));
            end
            d=sum(sum(dtmp))/(Nxs*Nxt); % davg
        case 4
            vs=sum(Xs)/Nxs; vt=sum(Xt)/Nxt;
            d=sqrt(sum((vs-vt).^2));            
        case 5
            vs=sum(Xs)/Nxs; vt=sum(Xt)/Nxt;
            dt=sqrt(sum(((ones(Nxt,1)*vt) - Xt).^2,2));
            ds=sqrt(sum(((ones(Nxs,1)*vs) - Xs).^2,2));
            d=(sum(dt)+sum(ds))/(Nxs+Nxt);        
        otherwise
            error('Esta opción no está definida')            
    end
%--------------------------------------------------------------------------
end

function [diameter]=dS(j,Xk)
    % Diametro de Xk
    Nxk=size(Xk,1);
    switch j
        case 1
            dtmp=zeros(Nxk,Nxk);
            for nk=1:Nxk
                dtmp(nk,:)= sqrt(sum((ones(Nxk,1)*Xk(nk,:)-Xk).^2,2));
            end
            [argi,argj]=argmax(dtmp);
            diameter=dtmp(argi,argj);
        case 3
            v=sum(Xk)/Nxk;
            dtmp=sqrt(sum(((ones(Nxk,1)*v)-Xk).^2,2));
            diameter=2*sum(dtmp)/Nxk;            
        otherwise
            error('Esta opción no está definida')
    end
end
    
%--------------------------------------------------------------------------
function [i,j]= argmax(X)

S=size(X); % [# Filas, # Columnas]
I=1:S(1);
J=1:S(1);

ind=zeros(S(1),2);
for h=1: S(1)
    [ind(h,1) ind(h,2)]= max(X(h,:));    
end
[y,i]=max(ind(:,1));
j=J(ind(i,2));
i=I(i);
% retorna el argumento(Indices) del max de la matriz X

end


end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    








