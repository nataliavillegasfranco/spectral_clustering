clear all
close all
clc



for q=1:4
    %Calculo de iVAT para el CPI
    A=xlsread('Matrix0.xls',q);
    N=length(A);
    [R]=eudist(A,A);
    figure
    imagesc(R)
    colormap(gray)
    
    % Step 1
    I=zeros(1,N);
    J=1:N;
    P=zeros(1,N);
    
    % Step 2
    [i,j]= argmax2(R,J,J);
    P(1)=i;
    
    % I=[I i]; % I <- {i}
    I(1)=i; % I <- {i}
    
    index = J==i; % It finds {i} index position in A
    J(index)=[]; %J-{i}
    for r=2:N
        [i,j]= argmin2(R,I(1:r-1),J);
        P(r)=j;
        %     I=[I j];   % I <- I U {j}
        I(r)=j;   % I <- I U {j}
        index = J==j; % It finds {i} index position in A
        J(index)=[]; % J <- J - {j}
    end
    Rp=zeros(N,N);
    for i=1:N
        for j=1:N
            Rp(i,j)=R(P(i),P(j));
        end
    end
    figure
    imagesc(Rp)
    colormap(gray)
    
    [iD]=iVAT(Rp);
    
    figure
    imagesc(iD)
    colormap(gray)
end






VGD=[];
% Proceso para calcular CHOU SU y los 5 indicadores de Dunn.
for k=1:4
X=xlsread('Matrix0.xls',k);
zz=size(X,1);
%zz=134;

total=floor((zz-10)/5)+1;
clusters = xlsread('clusters.xls',k);
clusters=clusters';

lab=[];
%cont=((k-1)*total*4+1);
%for i=cont:(cont+total-1)
for i=1:total 
    lab(:,i,1) = clusters(:,i); 
    lab(:,i,2) = clusters(:, (total+i)); 
    lab(:,i,3) = clusters(:, (2*total+i));
    lab(:,i,4) = clusters(:, (3*total+i));
end

A=[];

for i= 1:size(lab,3)
    for j=1:total
        [A(i,j)]=G_DunnIndex(X,lab(:,j,i),3);
    end
end
VGD = [VGD A];
end

xlswrite('VGD.xls',VGD)



exit;
