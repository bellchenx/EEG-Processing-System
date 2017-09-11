function [ EEGSignal , EEGQuality] = getEEG( recordtime )
argument = sprintf('python example_export.py %.2f',recordtime);
fprintf('Ready to record: 3\n')
pause(0.3)
fprintf('Ready to record: 2\n')
pause(0.3)
fprintf('Ready to record: 1\n')
pause(0.3)
fprintf('-- Start recording\n')
[status, output] = system(argument);
fprintf('-- Stop recording\n')
input = importfile('emotiv_values.csv');
if size(input) ~= [0;0]
    EEGSignal = input(:,2:2:28);
    EEGQuality = input(:,3:2:29);
    EEGSignal = zscore(EEGSignal);
else
    EEGSignal = -1;
    EEGQuality = -1;
end

