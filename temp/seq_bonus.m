function [seq, seq_b] = seq_bonus()
seq2;
%Imite comme si l'on avait s�par� le texte en deux s�quences chacune
%reprenant un caract�re sur deux dans la s�quence cod�e comme expliqu� dans
%le rapport (introduction d'un caract�re al�atoire entre chaque caract�re
%de la s�quance initiale)
seq_b = [];
for i = 1 : (length(seq))
    seq_b = [seq_b alphabet(randi(40))];
end


