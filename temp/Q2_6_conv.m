% Version de la Q2.6 avec le crit�re de convergence (et donc le code trouv� avec l'autre version)
% voir Q2_6_it pour une version avec nombre fixe d'it�rations 

% Retrouve le texte original dans la plupart des cas (ou proche).
% Avec ce nombre d'it�rations l'execution peut prendre une dizaine de
% secondes
% Parfois le programme se trompe assez fortement et reste bloqu� avec un
% mauvais code donc dans ce cas il est pr�f�rable de le relancer (le
% programme s'arrete seul assez rapidement)

%!!! Affichage de la convergence � la ligne 48, peut �tre enlev� !!! 

seq2;
vraisemb = -Inf;

%code al�atoire
permutation = alphabet(randperm(40));
sim = [0];
%nombre d'it�rations
it = 0;

true_permutation = 'jby."]ri,anfoc-'':qsud!h?lpwtve;[zxm)g( k';
prev_it = 0;
%Donn�es pour le graphe
Tab_vraisemblance_alt = [vraisemb];
permutation = alphabet(randperm(40));
nb_unique = length(unique(seq));

%Fait des permutations al�atoires dans le code et si meilleure vraisemblance on garde
%While convergence not reached
while(sim(end) < 0.9* nb_unique)
   permutation_next = exchange (permutation, randi(40), randi(40)) ;
   %translation_next = transmute (seq, permutation_next, alphabet);
   vraisemb_next = vraisemblance_alt(seq,permutation_next,pinit,Q);

   %Si meilleur code
   if(randi(1) < (2^(vraisemb_next - vraisemb)))
     %On garde le nouveau code
     permutation = permutation_next;
     vraisemb = vraisemb_next;
     translation = transmute (seq, permutation_next, alphabet);
     
     %donn�es graphiques
     Tab_vraisemblance_alt = [Tab_vraisemblance_alt vraisemb];
     sim = [sim common(true_permutation, permutation)];
     prev_it = it;
     
     %Permet d'observer la convergence dans la console, peut �tre retir�
     convergence = [sim(end) nb_unique] 
   end 
   it = it+1;
   %empeche de tourner ind�finiment
   if (it > prev_it + 10000)
       disp("10 000 iterations sans am�liorations. Relancez le programme pour un meilleur d�part");
       break;
   end
end
figure(1);
plot(Tab_vraisemblance_alt);
title('Vraisemblance � chaque permutation effectu�e')
ylabel('Vraisemblance');
xlabel('Nombre de permutations');
figure(2);
plot(sim);
title('Substitutions correctes � chaque permutation effectu�e')
ylabel('Nombre de substitutions correctes');
xlabel('Nombre de permutations');
permutation
translation
vraisemb
