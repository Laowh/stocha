for i=2 : length(seq)
  current_pos = find (alphabet(1,:) == seq(i),1);
  previous_pos = find (alphabet(1,:) == seq(i-1),1);
  
end