% This script sends an email with presentation order to all Secret Santa players.

% Settings (only has to run once per machine)
% init_Settings

% Set participants
participants = {'Matthew.Houtput','Senne.VanLoon','Wouter.VanWerveke','Wouter.Verstraelen','Lennart.Fernandes','Dietrich.Elst','Robbe.Ceulemans','Quinten.VanDenBremen','Timour.Ichmoukhamedov','Dolf.Huybrechts'};
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

    % Select first name
    iDot=find(player=='.');
    firstname=player(1:iDot-1);

    % Send email
    subject = 'TOP SECRET';
    organizer = 'matthew.houtput@uantwerpen.be';
    date = '18/12/2020';
    time = '10:30';
    message = ['Dag ',firstname,',',newline,newline,'Jij maakt presentatie ',num2str(makes(i)),', en geeft presentatie ',num2str(gives(i)),'.',newline,newline, ...
        'De lezingen gaan door op ',date,' om ',time,'.',newline, ...
        'Als je presentatie klaar is, sla hem dan op als PDF met als naam ',num2str(makes(i)),'.pdf',newline, ...
        'en stuur hem door naar ',organizer,' via WeTransfer.',newline, ...
        'Vul daar bij je eigen e-mail adres ook ',organizer,' in om de anonimiteit te garanderen :)',newline,newline, ...
        'Veel plezier,',newline,'De geheime Kerstman'];
    sendmail([player,'@UAntwerpen.be'],subject,message);

end

clear %Clear all information, so the user cannot obtain the presentation order
