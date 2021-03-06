seq2;
%120 premi�res lettres
seq = seq(1:120);
tic;

p = 1/factorial(40);
vraisemb = -Inf;

%code al�atoire
permutation = alphabet(randperm(40));

%Tire un code al�atoirement jusqu'� avoir un code 'correct' si on change la
%longueur de seq il faut changer la valeur dans le gardien
while(vraisemb < -1000)
    
    permutation_next = alphabet(randperm(40));
    %translation_next = transmute (seq, permutation_next, alphabet);
    vraisemb_next = vraisemblance(seq,permutation_next,pinit,Q);
    
    if(randi(1) < (2^(vraisemb_next - vraisemb)))
    permutation = permutation_next;
    vraisemb = vraisemb_next;
    translation = transmute (seq, permutation_next, alphabet);
    end
    
end
%Nombre d'it�rations
it = 5000000;

%Donn�es pour le graph
Tab_vraisemblance = [vraisemb];

%Fait des permutations al�atoires dans le code et si meilleure vraisemblance on garde
while(it > 0)
   permutation_next = exchange (permutation, randi(40), randi(40)) ;
   %translation_next = transmute (seq, permutation_next, alphabet);
   vraisemb_next = vraisemblance(seq,permutation_next,pinit,Q);
    
   if(randi(1) < (2^(vraisemb_next - vraisemb)))
     permutation = permutation_next;
     vraisemb = vraisemb_next;
     translation = transmute (seq, permutation_next, alphabet);
     Tab_vraisemblance = [Tab_vraisemblance vraisemb];
   end 
   it = it-1;
end
plot(Tab_vraisemblance);

permutation
translation
vraisemb
toc;