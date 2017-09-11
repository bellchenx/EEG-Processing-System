%% Variables Defination
choice = 'null'
%% Main Process
clc
fprintf('\n-- EEG Processing System By Bell Chen --\n')
fprintf('1. Run ICA Algorithm.\n')
fprintf('2. Plot the signal.\n')
fprintf('3. Save the signal.\n')
fprintf('4. Return to Main Menu.\n')
fprintf('Enter any non-numeric character to quit.\n')
choice = input('Please enter your choice >> ','s');
if choice == '1'
    [weights ,sphere] = runica(neweeg');
    eegafterica = zscore(neweeg*weights);
    clear saved filename 
    clc
    EEGprocessAfterICA
end
if choice == '2'
    Ploteeg
    EEGprocess
end
if choice == '3'
    fprintf('The exist name will override previous data.\n')
    filename = input('Please enter the name of recording.(enter R to return) >> ','s');
    if filename == 'R'
        clear filename
        EEGprocess
    else
        filename = sprintf("./data/eeg_%s.mat",filename);
        save(filename, 'neweeg');
        fprintf('Success.\n');
        pause(1);
        EEGprocess
    end
end
if choice == '4'
    clear saved filename
    Main
end
clear choice saved filename        
    
