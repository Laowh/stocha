%1.1.4 Effectue un voyage de T transitions entre les �tats avec les probas de la
%matrice Q et dessine le graph de pourcentage d'occurrence de chaque �tat

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

