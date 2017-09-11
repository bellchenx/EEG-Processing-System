if length == -1
    fprintf('Training set errors. Please create a new set.\n');
    Trainingset
end
target = classification(end,:);
m = size(classificationNN);
for i = 1:m(2)
    classnum = target(1,i);
    target(classnum,i) = 1;
    if classnum ~= 1
        target(1,i) = 0;
    end
end
classificationNN_sim = classificationNN(:,1:19);
target_sim = target(:,1:19);
classificationNN = classificationNN(:,20:end);
target = target(:,20:end);
clear classnum i m


    

