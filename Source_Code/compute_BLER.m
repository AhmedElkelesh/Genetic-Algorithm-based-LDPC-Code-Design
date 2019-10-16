%%
% For more details:
% A. Elkelesh, M. Ebada, S. Cammerer, L. Schmalen and S. ten Brink, "Decoder-in-the-Loop: Genetic Optimization-Based LDPC Code Design," in IEEE Access, 2019.
% DOI: 10.1109/ACCESS.2019.2942999
% IEEE URL: https://ieeexplore.ieee.org/document/8846017
% arXiv URL: https://arxiv.org/abs/1903.03128
% elkelesh@inue.uni-stuttgart.de
%%
function BLER = compute_BLER(H,R)

N = size(H,2);

EbNO=3; % Design SNR
EsNO  = EbNO+10*log10(R);
sigma_ch=sqrt(0.5*((10^(EsNO/10))^-1));

num_CWs=1e5;

maxIter=200; % maximum number of BP iterations
decoder = comm.LDPCDecoder('ParityCheckMatrix',sparse(H),'OutputValue','Whole codeword','DecisionMethod','Soft decision','MaximumIterationCount',maxIter,'NumIterationsOutputPort',1,'IterationTerminationCondition', 'Parity check satisfied');

ErrFrame = nan(1,num_CWs);
parfor i=1:num_CWs
    x_bits = zeros(1,N);
    x = 2*x_bits -1 ;
    y=x+sigma_ch*randn(1,N);
    Lc=-2*y/(sigma_ch^2);
    [LLRxhat, ~] = step(decoder, Lc.');
    c=(-sign(LLRxhat))/2+0.5;
    
    if ~isequal(c', x_bits)
        ErrFrame(i)=1;
    else
        ErrFrame(i)=0;
    end
    
end
BLER = sum(ErrFrame) / num_CWs;

end