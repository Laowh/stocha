function [ history ] = travel( T, Q )
N = length(Q(1,:));
occurences = zeros(1, N);
position = randi ([1 N]);
occurences (position) = occurences (position) +1;
history = zeros(T, N);
history(1,:) = occurences;

for i = 2:T

    position = move(position, Q);
    occurences (position) = occurences (position) +1;
    history(i,:) = occurences./i;

end

plot(history);
