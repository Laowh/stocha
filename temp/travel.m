%1.1.4 Effectue un voyage de T transitions entre les états avec les probas de la
%matrice Q et dessine le graph de pourcentage d'occurrence de chaque état

function [ history ] = travel( T, Q )
N = length(Q(1,:));
occurences = zeros(1, N);

%Trouve la position initiale parmis la distribution
init = Q^30;
init = init(1,:);
threshold = zeros(1,length(init));
total = 0;
for i=1 : length(init)
    total = total + init(i);
    threshold(i) = total;
end
position = find(threshold(:) >= rand,1);

%Incrémente l'occurence
occurences (position) = occurences (position) +1;
history = zeros(T, N);
history(1,:) = occurences;

for i = 2:T
    %Change d'état suivant la matrice de transition
    position = move(position, Q);
    occurences (position) = occurences (position) +1;
    history(i,:) = occurences./i;

end

