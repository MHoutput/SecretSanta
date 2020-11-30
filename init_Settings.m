% The outgoing email-server is set up here. Settings can be changed in this file.
% Run this file before the main 'SecretSanta.m' program

clear 

% Set outgoing mail server
setpref('Internet','SMTP_Server','mail.uantwerpen.be'); 

% Set outgoing mail port
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.port','587');

% Set sender email
setpref('Internet','E_mail','SecretSanta@UAntwerpen.be');