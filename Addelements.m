%% Variables Defination
choice = 'null';
%% Main Process
clc
if length == -1
    classification = [];
    length = input('Please input the length of set. >> ');
    clc
end
if class == -1
    class = input('Please input the class number. >> ');
    clc
end
fprintf('Current class number is %d\n', class);
fprintf('1. Add new signals to current set.\n');
fprintf('2. Add exist signals to current set.\n');
fprintf('3. Change class number.\n');
fprintf('4. Back to training set management.\n');
fprintf('Enter any non-numeric character to quit.\n')
choice = input('Please enter your choice >> ','s');

if choice == '1'
    toaddtoset = 1;
    returntowhere = 2;
    RecordEEG
end
if choice == '2'
    filename = input('Please enter the name of recording. (enter R to return) >> ','s');
    if filename == 'R'
        clear filename
        Addelements
    else
        filename = sprintf("./data/eeg_ica_%s.mat",filename);
        load(filename, 'eegafterica');
        fprintf('Success.\n');
        pause(1);
        clear filename
        returntowhere = 2;
        Addtoset
    end
end
if choice == '3'
    class = input('Please input the class number. >> ');
    Addelements
end
if choice == '4'
    Trainingset
end



    
    