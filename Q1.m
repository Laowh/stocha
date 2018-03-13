alphabet = ['a' 'b' 'c' 'd']
occurences = zeros(1,4);
Q = zeros(4,4);
seq = 'adcacdadadadadcacdadcadbabadcadcadadcadcadcacadcdbadcadadadcdcdcadabadadbadadabadcdadadadbadcadcdbadcadbadadcadcadadcdcadadcdcadbabadcacadcadadadcadbadabadcadcadacadbabacadcadadadcdcadcdcdadcacadcdcda';

%alphabet(1) = seq(1);
%occurences(1) = occurences(1) + 1;

for i=2 : length(seq)
  current_pos = find (alphabet == seq(i),1);
  occurences(current_pos) = occurences(current_pos) + 1;
  previous_pos = find (alphabet == seq(i-1),1);
  Q(current_pos, previous_pos) = Q(current_pos, previous_pos);
end
alphabet
occurences
Q