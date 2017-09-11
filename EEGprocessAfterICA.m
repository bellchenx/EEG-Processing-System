%% Variables Defination
choice = 'null'
%% Main Process
clc
fprintf('\n-- EEG Processing System By Bell Chen --\n')
fprintf('1. Plot the signal after ICA.\n')
fprintf('2. Save the signal after ICA.\n')
fprintf('3. Add to current traing set.\n')
fprintf('4. Back to Main Menu.\n')
fprintf('Enter any non-numeric character to quit.\n')
choice = input('Please enter your choice >> ','s');
if choice == '1'
    PloteegAfterICA
    EEGprocessAfterICA
end
if choice == '2'
    fprintf('The exist name will override previous data.\n')
    filename = input('Please enter the name of recording.(enter R to return) >> ','s');
    if filename == 'R'
        clear filename
        EEGprocessAfterICA
    else
        filename = sprintf("./data/eeg_ica_%s.mat",filename);
        save(filename, 'eegafterica');
        fprintf('Success.\n');
        pause(1);
        EEGprocessAfterICA
    end
end
if choice == '3'
    class = -1;
    Addtoset
end
if choice == '4'
    clear saved filename
    Main
end
clear choice saved filename       
    
