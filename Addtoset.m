%% Variables Defination
choice = 'null';
%% Main Process
if length == -1
    classification = [];
    length = input('Please input the length of set. >> ');
else
    m = size(eegafterica);
    if m(2) ~= 14 
        fprintf('Signals error. Returning to Main menu.\n')
        pause(1.5);
        clear returntowhere length temp
        Main
    end
end
m = size(eegafterica);
if class == -1
    class = input('Please input the class number. >> ');
    returntowhere = 1;
end
if m(1) < length
    fprintf('The length of current signals is not enough. Returning to last menu.\n')
    pause(2);
    if returntowhere == 1
        clear returntowhere length temp
        EEGprocessAfterICA
    end
    if returntowhere == 0
        clear returntowhere length temp
        Trainingset
    end
    clear returntowhere length temp
    Main
end

m=size(classification);
for i = 1:14    
    classification(((i-1)*length+1):(i*length),m(2)+1) = eegafterica(1:length,i);
end
classification(length*14+1,end) = class;

if returntowhere == 2
    clear temp i m
    returntowhere = 0;
    fprintf('Success.\n');
    pause(2);
    Addelements
end

class = -1;
if returntowhere == 1
    clear temp i m
    returntowhere = 0;
    fprintf('Success.\n');
    pause(2);
    EEGprocessAfterICA
end
if returntowhere == 0
    clear temp i m
    returntowhere = 0;
    fprintf('Success.\n');
    pause(2);
    Trainingset
end



