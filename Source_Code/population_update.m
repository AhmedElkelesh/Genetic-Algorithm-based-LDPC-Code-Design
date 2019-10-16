%%
% For more details:
% A. Elkelesh, M. Ebada, S. Cammerer, L. Schmalen and S. ten Brink, "Decoder-in-the-Loop: Genetic Optimization-Based LDPC Code Design," in IEEE Access, 2019.
% DOI: 10.1109/ACCESS.2019.2942999
% IEEE URL: https://ieeexplore.ieee.org/document/8846017
% arXiv URL: https://arxiv.org/abs/1903.03128
% elkelesh@inue.uni-stuttgart.de
%%
function all_Hs_new = population_update(all_Hs,FERs,R)

[~,idx]=sort(FERs);

all_Hs_new = nan(60,size(all_Hs,2),size(all_Hs,3));
all_Hs_new(1:5,:,:) = all_Hs(idx(1:5),:,:);

for i=1:5
    [mut1,mut2,mut3] = mutation(squeeze(all_Hs_new(i,:,:)),R);
    all_Hs_new(5+i,:,:)=mut1;
    all_Hs_new(10+i,:,:)=mut2;
    all_Hs_new(15+i,:,:)=mut3;
end

count = 21;
[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(1,:,:)),squeeze(all_Hs_new(2,:,:)),R); 
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(1,:,:)),squeeze(all_Hs_new(3,:,:)),R);
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(1,:,:)),squeeze(all_Hs_new(4,:,:)),R);
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(1,:,:)),squeeze(all_Hs_new(5,:,:)),R);
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(2,:,:)),squeeze(all_Hs_new(3,:,:)),R);
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(2,:,:)),squeeze(all_Hs_new(4,:,:)),R);
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(2,:,:)),squeeze(all_Hs_new(5,:,:)),R);
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(3,:,:)),squeeze(all_Hs_new(4,:,:)),R);
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(3,:,:)),squeeze(all_Hs_new(5,:,:)),R);
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

[t1, t2, t3, t4] = crossover(squeeze(all_Hs_new(4,:,:)),squeeze(all_Hs_new(5,:,:)),R);
all_Hs_new(count,:,:)=t1; 
all_Hs_new(count+1,:,:)=t2; 
all_Hs_new(count+2,:,:)=t3; 
all_Hs_new(count+3,:,:)=t4;
count = count+4;

end