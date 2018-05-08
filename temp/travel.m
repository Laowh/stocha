%1.1.4 Effectue un voyage de T transitions entre les �tats avec les probas de la
%matrice Q et dessine le graph de pourcentage d'occurrence de chaque �tat

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

%Incr�mente l'occurence
occurences (position) = occurences (position) +1;
history = zeros(T, N);
history(1,:) = occurences;

for i = 2:T
    %Change d'�tat suivant la matrice de transition
    position = move(position, Q);
    occurences (position) = occurences (position) +1;
    history(i,:) = occurences./i;

end

