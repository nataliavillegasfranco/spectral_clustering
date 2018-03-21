function [D]=eudist(A,B)
[Na,ka]=size(A);
[Nb,kb]=size(B);

if(ka~=kb)
    error('The dimensinality of each dataset must be equal')
end

% Preallocating Memory for Speed up
D=zeros(Na,Nb);
for n=1:Na
    D(n,:)= sqrt(sum((repmat(A(n,:),Nb,1)-B).^2,2));
end


