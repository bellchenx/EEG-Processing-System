clc
if length == -1
    fprintf('Training set errors. Please create a new set.\n');
    Trainingset
end
target = classification(end,:);
m = size(classification);
for i = 1:m(2)
    classnum = target(1,i);
    target(classnum,i) = 1;
    if classnum ~= 1
        target(1,i) = 0;
    end
end
classificationNN = classification(1:end-1,:);
clear classnum i m
Trainingset

    

