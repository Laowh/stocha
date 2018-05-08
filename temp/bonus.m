
[seq_a,seq_b] = seq_bonus;

%SEQUENCE 1
%code aléatoire
permutation = alphabet(randperm(40));

%Nombre d'itérations

it = 10000;

%Fait des permutations aléatoires dans le code et si meilleure vraisemblance on garde
while(it > 0)
   permutation_next = exchange (permutation, randi(40), randi(40)) ;
   %translation_next = transmute (seq, permutation_next, alphabet);
   vraisemb_next = vraisemblance_alt(seq_a,permutation_next,pinit,Q);
    
   %Si meilleur code
   if(randi(1) < (2^(vraisemb_next - vraisemb)))
     permutation = permutation_next;
     vraisemb = vraisemb_next;
     translation = transmute (seq_a, permutation_next, alphabet);
   end 
   it = it-1;
end

permut1 = permutation;
transl1 = translation;
vraisemb1 = vraisemb;
%%
%SEQUENCE 2
%code aléatoire
permutation = alphabet(randperm(40));

%Nombre d'itérations

it = 10000;

%Fait des permutations aléatoires dans le code et si meilleure vraisemblance on garde
while(it > 0)
   permutation_next = exchange (permutation, randi(40), randi(40)) ;
   %translation_next = transmute (seq, permutation_next, alphabet);
   vraisemb_next = vraisemblance_alt(seq_b,permutation_next,pinit,Q);
    
   %Si meilleur code
   if(randi(1) < (2^(vraisemb_next - vraisemb)))
     permutation = permutation_next;
     vraisemb = vraisemb_next;
     translation = transmute (seq_b, permutation_next, alphabet);
   end 
   it = it-1;
end
%%
%Affiche la séquence qui a la meilleure vraisemblance
if(vraisemb > vraisemb1)
    disp("sequence 2");
    permutation
    translation
    vraisemb
else
    disp("sequence 1");
    permut1
    transl1
    vraisemb1
end
    