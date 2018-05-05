%Inutile ?

function [ new_position ] = move( position , Q)
threshold = zeros(1,length(Q(position,:)));
total = 0;
for i=1 : length(Q(position,:))
    total = total + Q(position,i);
    threshold(i) = total;
end
new_position = find(threshold(:) >= rand,1);

end

