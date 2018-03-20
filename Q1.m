alphabet = ['a' 'b' 'c' 'd']
occurences = zeros(1,4);
probability = zeros(1,4);
Q = zeros(4,4);
seq = 'adcacdadadadadcacdadcadbabadcadcadadcadcadcacadcdbadcadadadcdcdcadabadadbadadabadcdadadadbadcadcdbadcadbadadcadcadadcdcadadcdcadbabadcacadcadadadcadbadabadcadcadacadbabacadcadadadcdcadcdcdadcacadcdcda';
pos = find (alphabet == seq(1),1);
occurences(pos) = occurences(pos) + 1;

for i=2 : length(seq)
  current_pos = find (alphabet == seq(i),1);
  occurences(current_pos) = occurences(current_pos) + 1;
  previous_pos = find (alphabet == seq(i-1),1);
  Q(previous_pos,current_pos) = Q(previous_pos,current_pos) +1;
end
alphabet;
pi0 = occurences/sum(occurences)
for i=1 :4
    Q(i,:) = Q(i,:)/ sum(Q(i,:));
end

Q
Qt = eye(4);
n = 30;

%Les 4 premi�res colonnes avec d�part al�atoire, les 4 suivantes
%d�part en c
results = zeros(n,8);
for i=1:n
    Qt = Qt * Q;
    results (i,1:4) = Qt(randi([1 4]),:);
    results (i,5:8) = Qt(3,:);
end
distr_statio = Qt(1,:);
for i=1:8
hold
plot(1:n,results(:,i));
hold
end