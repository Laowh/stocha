function [seq, seq_b] = seq_bonus()
seq2;
%Imite comme si l'on avait séparé le texte en deux séquences chacune
%reprenant un caractère sur deux dans la séquence codée comme expliqué dans
%le rapport (introduction d'un caractère aléatoire entre chaque caractère
%de la séquance initiale)
seq_b = [];
for i = 1 : (length(seq))
    seq_b = [seq_b alphabet(randi(40))];
end


