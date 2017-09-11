%% Variables Defination
choice = 'null'
%% Main Process
clc
fprintf('\n-- EEG Processing System By Bell Chen --\n')
fprintf('1. Create a new set.\n')
fprintf('2. Open an exist training set.\n')
fprintf('3. Save current training set.\n')
fprintf('4. Add elements to this set.\n')
fprintf('5. Convert current set to NN pattern.\n');
fprintf('6. Back to Main menu.\n')
choice = input('Please enter your choice >> ','s');
if choice == '1'
    classification = [];
    length = input('Please input the length of set. >> ');
    Trainingset
end
if choice == '2'
    filename = input('Please enter the name of this training set. (enter R to return) >> ','s');
    if filename == 'R'
        clear filename choice
        Trainingset
    else
        filename = sprintf("./data/eeg_classification_%s.mat",filename);
        load(filename, 'classification');
        m = size(classification);
        length = (m(1)-1)/14;
        fprintf('Success.\n');
        pause(1);
        Trainingset
    end
end
if choice == '3'
    filename = input('Please enter the name of recording. (enter R to return) >> ','s');
    if filename == 'R'
        clear filename
        Trainingset
    else
        filename = sprintf("./data/eeg_classification_%s.mat",filename);
        save(filename, 'classification');
        fprintf('Success.\n');
        pause(1);
        clear filename
        Trainingset
    end
end
if choice == '4'
    Addelements
end
if choice == '5'
    clear filename
    ConverttoNN
end
if choice == '6'
    clear filename
    Main
end
clear choice filename