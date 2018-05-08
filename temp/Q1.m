alphabet = ['a' 'b' 'c' 'd']
occurences = zeros(1,4);
probability = zeros(1,4);

%Matrice de transition
Q = zeros(4,4);
seq = 'adcacdadadadadcacdadcadbabadcadcadadcadcadcacadcdbadcadadadcdcdcadabadadbadadabadcdadadadbadcadcdbadcadbadadcadcadadcdcadadcdcadbabadcacadcadadadcadbadabadcadcadacadbabacadcadadadcdcadcdcdadcacadcdcda';

%Première lettre
pos = find (alphabet == seq(1),1);
occurences(pos) = occurences(pos) + 1;

%Compte les occurences des lettres et construit la matrice de transition
for i=2 : length(seq)
  current_pos = find (alphabet == seq(i),1);
  occurences(current_pos) = occurences(current_pos) + 1;
  previous_pos = find (alphabet == seq(i-1),1);
  Q(previous_pos,current_pos) = Q(previous_pos,current_pos) +1;
end
%Occurences en pourcentage
pi0 = occurences/sum(occurences)
for i=1 :4
    Q(i,:) = Q(i,:)/ sum(Q(i,:));
end

%Q1.1.2
Qt = eye(4);

%nombre de transitions
n = 30;

%Retiens les valeurs des puissances de la matrice de transition
%Les 4 premières colonnes avec départ aléatoire, les 4 suivantes
%départ en c
results = zeros(n,8);
for i=1:n
    Qt = Qt * Q;
    results (i,1:4) = Qt(randi([1 4]),:);
    results (i,5:8) = Qt(3,:);
end

%Q1.1.3

distr_statio = Qt(1,:);

%Affiche les résultats
figure(1);
subplot(2,1,1);
plot(results(:,1:4));
title('Probabilité d''apparition d''une lettre en position t avec départ aléatoire'); 
ylabel('Probabilité');
xlabel('Position t');
legend('A', 'B', 'C', 'D');
subplot(2,1,2);
plot(results(:,5:8));
title('Probabilité d''apparition d''une lettre en position t avec départ en C')
ylabel('Probabilité');
xlabel('Position t');
legend('A', 'B', 'C', 'D');


%Q1.1.4
history = travel(200,Q);

figure(2);
plot(history);
legend('A', 'B', 'C', 'D');
title('Pourcentage d''apparition des différentes lettres sur une chaine de longueur T')
ylabel('Pourcentage d''apparition');
xlabel('Longueur de chaine T');