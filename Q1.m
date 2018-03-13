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
alphabet
pi0 = occurences/sum(occurences)
for i=1 :4
    Q(i,:) = Q(i,:)/ sum(Q(i,:));
end

Q