choice = 'null';
for i = 1:1000
numa = floor(188*rand()) + 1;
numb = floor(188*rand()) + 1;
temp = classification(:,numa);
classification(:,numa) = classification(:,numb);
classification(:,numb) = temp;
end