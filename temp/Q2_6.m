% Retrouve le texte original dans la plupart des cas (ou proche).
% Avec ce nombre d'itérations l'execution peut prendre
% 150 - 250 secondes

seq2;
vraisemb = -Inf;

%code aléatoire
permutation = alphabet(randperm(40));
sim = [0];
%nombre d'itérations
it = 0;
prev_it = 0;
%Données pour le graph
Tab_vraisemblance_alt = [vraisemb];
permutation = alphabet(randperm(40));
nb_unique = length(unique(seq));

%Fait des permutations aléatoires dans le code et si meilleure vraisemblance on garde
while(sim(end) < 0.8* nb_unique)
   permutation_next = exchange (permutation, randi(40), randi(40)) ;
   %translation_next = transmute (seq, permutation_next, alphabet);
   vraisemb_next = vraisemblance_alt(seq,permutation_next,pinit,Q);

   if(randi(1) < (2^(vraisemb_next - vraisemb)))
     permutation = permutation_next;
     vraisemb = vraisemb_next;
     translation = transmute (seq, permutation_next, alphabet);
     Tab_vraisemblance_alt = [Tab_vraisemblance_alt vraisemb];
     sim = [sim common(true_permutation, permutation)];
     prev_it = it;
   end 
   it = it+1;
   if (it > prev_it + 50000)
       disp("no improvement after 50 000 iterations. Program stops");
       break;
   end
end
figure(1);
plot(Tab_vraisemblance_alt);
title('Vraisemblance à chaque permutation effectuée')
ylabel('Vraisemblance');
xlabel('Nombre de permutations');
figure(2);
plot(sim);
title('Substitutions correctes à chaque permutation effectuée')
ylabel('Nombre de substitutions correctes');
xlabel('Nombre de permutations');

permutation
translation
vraisemb
