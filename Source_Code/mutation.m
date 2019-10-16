%%
% For more details:
% A. Elkelesh, M. Ebada, S. Cammerer, L. Schmalen and S. ten Brink, "Decoder-in-the-Loop: Genetic Optimization-Based LDPC Code Design," in IEEE Access, 2019.
% DOI: 10.1109/ACCESS.2019.2942999
% IEEE URL: https://ieeexplore.ieee.org/document/8846017
% arXiv URL: https://arxiv.org/abs/1903.03128
% elkelesh@inue.uni-stuttgart.de
%%
function [H_mut,H_mut_2,H_mut_3] = mutation(H,R)
% See Fig. 3 in the paper

N=size(H,2);
m=size(H,1);
H_orig=H;
H_orig_2=H;
H_orig_3=H;

A = logical(reshape(H_orig,1,[]));

valid = false;
while ~valid
    A_mut = swapping(A);
    H_mut = reshape(double(A_mut),size(H_orig));
    [ valid ] = is_Valid_H(H_mut,N,m,R);
end

A = logical(reshape(H_orig_2,1,[]));

valid = false;
while ~valid
    A_mut = addEdge(A);
    H_mut_2 = reshape(double(A_mut),size(H_orig_2));
    [ valid ] = is_Valid_H(H_mut_2,N,m,R);
end

A = logical(reshape(H_orig_3,1,[]));

valid = false;
while ~valid
    A_mut = removeEdge(A);
    H_mut_3 = reshape(double(A_mut),size(H_orig_3));
    [ valid ] = is_Valid_H(H_mut_3,N,m,R);
end

end
%%
function A2 = swapping(A1)

    onePos = find(A1==1);
    zeroPos = find(A1==0);
    A1(datasample(onePos,1))=0;
    A1(datasample(zeroPos,1))=1;
    A2=A1;

end
%%
function A2 = addEdge(A1)

    zeroPos = find(A1==0);
    A1(datasample(zeroPos,1))=1;
    A2=A1;
    
end
%%
function A2 = removeEdge(A1)
    
    onePos = find(A1==1);
    A1(datasample(onePos,1))=0;
    A2=A1;
    
end