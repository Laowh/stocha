seq2;
seq = seq(1:80);
tic;

p = 1/factorial(40);
vraisemb = -Inf;
permutation = alphabet(randperm(40));

while(vraisemb < -500)
    
    permutation_next = alphabet(randperm(40));
    %translation_next = transmute (seq, permutation_next, alphabet);
    vraisemb_next = vraisemblance(seq,permutation_next,pinit,Q);
    
    if(randi(1) < (2^(vraisemb_next - vraisemb)))
    permutation = permutation_next;
    vraisemb = vraisemb_next;
    translation = transmute (seq, permutation_next, alphabet);
    end
    
end
it = 2000000;
Tab_vraisemblance = [vraisemb];
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