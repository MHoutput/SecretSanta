% This script generates text files that can be distributed among the Secret
% Santa players.

participants = {'Wouter','Wout','Dietrich','Senne','Lennart','Matthew','Nick'};
N = length(participants);

makes = randperm(N);
gives = randperm(N);
while any(makes==gives)
    gives = randperm(N);
end

for i = 1:N
    player = participants{i};
    fileID = fopen([player,'.txt'],'w');
    fprintf(fileID,[player,' maakt presentatie %u\n',player,' geeft presentatie %u'],makes(i),gives(i));
    fclose(fileID);
end

clear all