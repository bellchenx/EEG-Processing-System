%% Variables Defination
neweeg = -1;
newquality = -1;
times = 0;
choice = 'null';
%% Main Process
clc
fprintf('\n-- EEG Record System by Bell Chen --\n');
recordtime = input('Please enter the length of new recording in second >> ');
while true
    [neweeg, newquality] = getEEG( recordtime);
    times = times + 1;
    if (neweeg == -1) & (newquality == -1)
        clc
        fprintf('\n-- EEG Record System by Bell Chen --\n');
        fprintf('Record failed.\n')
        if times >= 3 & mod(times,5) == 0
            choice = input('Do you want to record again? (Y or N) >> ', 's');
            if choice ~= 'Y'
                break
            end
        end
        pause(1);
        fprintf('\n')
    else
        Ploteeg
        accornot = input('Do you accept this recording? (Y or N) >> ','s');
        if accornot == 'Y'
            break
        else
            clc
            fprintf('\n-- EEG Record System by Bell Chen --\n');
            fprintf('Restarting sensor. Press Ctrl+C to interrupt.\n')
            
            if times >= 3
                choice = input('Do you want to record again? (Y or N) >> ', 's');
                if choice ~= 'Y'
                    break
                end
            end
            pause(1);
        end
        fprintf('\n')
    end
end
if toaddtoset == 1
    clear accornot choice recordtime times
    toaddtoset = 0;
    [weights ,sphere] = runica(neweeg');
    eegafterica = zscore(neweeg*weights);
    clc
    Addtoset
end
if (neweeg == -1) & (newquality == -1)
    fprintf('Record failed.\nReturn to menu.\n');
    clear accornot choice recordtime times
    Main
else
    fprintf('Record successed.\n\n');
    clear accornot choice recordtime times
    EEGprocess
end
    
        