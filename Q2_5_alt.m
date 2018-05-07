seq2;

tic;

p = 1/factorial(40);
vraisemb = -Inf;

%code aléatoire
permutation = alphabet(randperm(40));

%Tire un code aléatoirement jusqu'à avoir un code 'correct' si on change la
%longueur de seq il faut changer la valeur dans le gardien
% while(vraisemb < -10000)
%     
%     permutation_next = alphabet(randperm(40));
%     %translation_next = transmute (seq, permutation_next, alphabet);
%     vraisemb_next = vraisemblance_alt(seq,permutation_next,pinit,Q);
%     
%     if(randi(1) < (2^(vraisemb_next - vraisemb)))
%     permutation = permutation_next;
%     vraisemb = vraisemb_next;
%     translation = transmute (seq, permutation_next, alphabet);
%     end
%     
% end
%Nombre d'itérations

it = 100000;
%Données pour le graph
Tab_vraisemblance_alt = [vraisemb];

%Fait des permutations aléatoires dans le code et si meilleure vraisemblance on garde
while(it > 0)
   permutation_next = exchange (permutation, randi(40), randi(40)) ;
   %translation_next = transmute (seq, permutation_next, alphabet);
   vraisemb_next = vraisemblance_alt(seq,permutation_next,pinit,Q);
    
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
toc;









% pos = find (alphabet == seq(1),1);
% occurences(pos) = occurences(pos) + 1;
% for i=2 : length(seq)
%   current_pos = find (alphabet == seq(i),1);
%   occurences(current_pos) = occurences(current_pos) + 1;
%   previous_pos = find (alphabet == seq(i-1),1);
%   Q_alt(previous_pos,current_pos) = Q_alt(previous_pos,current_pos) +1;
% end
% %Occurences en pourcentage
% pi0 = occurences/sum(occurences)
% for i=1 :4
%     Q_alt(i,:) = Q_alt(i,:)/ sum(Q_alt(i,:));
% end