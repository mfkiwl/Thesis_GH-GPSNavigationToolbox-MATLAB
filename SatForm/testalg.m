%% Test Algorithm
% 16/5/17

% alpha frame (km)
SatA = [6000,0,-18000];
SatB = [-7000,-2000,-17000];
SatC = [-23000,-6000,-2000];
SatD = [24000,0,-5000];
SatE = [-8000,-8000,-17000];
allSats = [SatA;SatB;SatC;SatD;SatE];


alpha = [0,0,0];
beta = [.1,-0.1,.1];
gamma = [0.5,1,-0.5];
allRec = [alpha;beta;gamma];

numSat = 5;
numRec = 3;


%% need to create a fn that calculates range and simulates error
% all_range = matrix m receivers by n satellites
all_range = []; % columns = each satellite: rows = between each receiver
for isat=1:numSat
    all_range = [all_range,calcrange(allRec,allSats(isat,:))];
end




%% Optimise
[Loc_lin,Loc_svd,Omega,avg_norm] = distopt(all_range,allSats, allRec);
Loc_lin
Loc_svd