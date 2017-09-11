%% Variables Defination
choice = 'null';
class = -1;
length = -1;
toaddtoset = 0;
returntowhere = 0;
%% Main Process
clc
fprintf('\n-- EEG Processing System By Bell Chen --\n')
fprintf('1. Create a new EEG record.\n')
fprintf('2. Open an old EEG record.\n')
fprintf('3. Open an old EEG record after ICA.\n')
fprintf('4. Manage the training set.\n')
fprintf('Enter any non-numeric character to quit.\n')
choice = input('Please enter your choice >> ','s');
if choice == '1'
    clear filename
    RecordEEG
end
if choice == '2'
    filename = input('Please enter the name of recording. (enter R to return) >> ','s');
    if filename == 'R'
        clear filename
        Main
    else
        filename = sprintf("./data/eeg_%s.mat",filename);
        load(filename, 'neweeg');
        fprintf('Success.\n');
        pause(1);
        EEGprocess
    end
end
if choice == '3'
    filename = input('Please enter the name of recording. (enter R to return) >> ','s');
    if filename == 'R'
        clear filename
        Main
    else
        filename = sprintf("./data/eeg_ica_%s.mat",filename);
        load(filename, 'eegafterica');
        fprintf('Success.\n');
        pause(1);
        clear filename
        EEGprocessAfterICA
    end
end
if choice == '4'
     clear filename
     Trainingset
end
clear choice filename