%%
% For more details:
% A. Elkelesh, M. Ebada, S. Cammerer, L. Schmalen and S. ten Brink, "Decoder-in-the-Loop: Genetic Optimization-Based LDPC Code Design," in IEEE Access, 2019.
% DOI: 10.1109/ACCESS.2019.2942999
% IEEE URL: https://ieeexplore.ieee.org/document/8846017
% arXiv URL: https://arxiv.org/abs/1903.03128
% elkelesh@inue.uni-stuttgart.de
%%
function [H_1,H_2,H_3,H_4] = crossover(Hp1,Hp2,R)
% See Fig. 4 in the paper

N=size(Hp1,2);
m=size(Hp1,1);

temp = [Hp1(:,1:N/2) Hp2(:,1+(N/2):N)];
[ valid ] = is_Valid_H(temp,N,m,R);
if valid
    H_1=temp;
else
    H_1=Hp1;
end

temp = [Hp2(:,1:N/2) Hp1(:,1+(N/2):N)];
[ valid ] = is_Valid_H(temp,N,m,R);
if valid
    H_2=temp;
else
    H_2=Hp1;
end

temp = [Hp1(1:m/2,:); Hp2(1+(m/2):m,:)];
[ valid ] = is_Valid_H(temp,N,m,R);
if valid
    H_3=temp;
else
    H_3=Hp2;
end

temp = [Hp2(1:m/2,:); Hp1(1+(m/2):m,:)];
[ valid ] = is_Valid_H(temp,N,m,R);
if valid
    H_4=temp;
else
    H_4=Hp2;
end

end