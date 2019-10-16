%%
% For more details:
% A. Elkelesh, M. Ebada, S. Cammerer, L. Schmalen and S. ten Brink, "Decoder-in-the-Loop: Genetic Optimization-Based LDPC Code Design," in IEEE Access, 2019.
% DOI: 10.1109/ACCESS.2019.2942999
% IEEE URL: https://ieeexplore.ieee.org/document/8846017
% arXiv URL: https://arxiv.org/abs/1903.03128
% elkelesh@inue.uni-stuttgart.de
%%

% See Fig. 2 in the paper

clear all;
close all;
clc;

rng('shuffle');

parpool(24);

tic;
N = 128; % number of VNs
m = 64; % number of CNs
R = 0.5; % code rate

name = 'population1.mat';
load(name); % To get started, our initial population (i.e., population 1) contains a set of randomly constructed regular (3,6) LDPC codes
pop_index=1;

while true
    %%%%% Population N_pop
    tic;
    pop_index = pop_index + 1;
    name = ['population' num2str(pop_index) '.mat'];
    all_Hs = population_update(all_Hs,BLERs,R);
    S=size(all_Hs,1);
    save('H_matrices.mat');
    BLERs = nan(1,S);
    for H_count = 1:S
        BLERs(H_count) = compute_BLER( squeeze(all_Hs(H_count,:,:)) , R );
        save('status_BLER_Done.mat','H_count');
    end
    timeNeeded = toc;
    save(name);
end