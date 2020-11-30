% This script sends an email with presentation order to all Secret Santa players.
clear

% Settings (only has to run once per machine)
% init_Settings

% Set participants
participants = {'Senne.VanLoon','Matthew.Houtput'};
N = length(participants);

% Make random lists for making and giving presentations
makes = randperm(N);
gives = randperm(N);
while any(makes==gives)
    gives = randperm(N);
end

% Send email to each player
for i = 1:N
    player = participants{i};

    % Select surname
    iDot=find(player=='.');
    surname=player(1:iDot-1);

    % Send email
    sendmail([player,'@UAntwerpen.be'],'TOP SECRET', ...
        [surname,' maakt presentatie ',num2str(makes(i)),',' 10 ...
        ,surname,' geeft presentatie ',num2str(gives(i)),'.']);

end
