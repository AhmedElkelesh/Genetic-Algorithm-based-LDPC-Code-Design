%%
% For more details:
% A. Elkelesh, M. Ebada, S. Cammerer, L. Schmalen and S. ten Brink, "Decoder-in-the-Loop: Genetic Optimization-Based LDPC Code Design," in IEEE Access, 2019.
% DOI: 10.1109/ACCESS.2019.2942999
% IEEE URL: https://ieeexplore.ieee.org/document/8846017
% arXiv URL: https://arxiv.org/abs/1903.03128
% elkelesh@inue.uni-stuttgart.de
%%
function [ valid ] = is_Valid_H(H,N,m,R)

numVNs = isequal(N,size(H,2));
numCNs = isequal(m,size(H,1));
isRateCorrect = isequal ( 1 - ( rank(H)/N ) , R );
isBinary = isequal(unique(H),[0;1]);
noRedundVN = all(sum(H,1)~=0);
noRedundCN = all(sum(H,2)~=0);
valid = numVNs & numCNs & isRateCorrect & isBinary & noRedundVN & noRedundCN;

end