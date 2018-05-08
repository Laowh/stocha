% Version de la Q2.6 avec nombre fixe d'it�rations. Pour version avec
% crit�re de convergence voir Q2_6_conv.
% Retrouve le texte original dans la plupart des cas (ou proche).
% Avec ce nombre d'it�rations l'execution peut prendre une dizaine de
% secondes.

seq2;
vraisemb = -Inf;

%code al�atoire
permutation = alphabet(randperm(40));

%Nombre d'it�rations

it = 10000;
%Donn�es pour le graph
Tab_vraisemblance_alt = [vraisemb];

%Fait des permutations al�atoires dans le code et si meilleure vraisemblance on garde
while(it > 0)
   permutation_next = exchange (permutation, randi(40), randi(40)) ;
   %translation_next = transmute (seq, permutation_next, alphabet);
   vraisemb_next = vraisemblance_alt(seq,permutation_next,pinit,Q);
    
   %Si meilleur code
   if(randi(1) < (2^(vraisemb_next - vraisemb)))
     permutation = permutation_next;
     vraisemb = vraisemb_next;
     translation = transmute (seq, permutation_next, alphabet);
     Tab_vraisemblance_alt = [Tab_vraisemblance_alt vraisemb];
   end 
   it = it-1;
end
plot(Tab_vraisemblance_alt);

permutation
translation
vraisemb

