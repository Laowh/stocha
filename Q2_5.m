seq2;
seq = seq(1:20);

p = 1/factorial(40);
vraisemb = -Inf;
permutation = alphabet(randperm(40));
while(vraisemb < -110)
    
    permutation_next = alphabet(randperm(40));
    translation_next = transmute (seq, permutation_next, alphabet);
    vraisemb_next = vraisemblance(translation_next,alphabet,pinit,Q);
    
    if(randi(1) < 2^vraisemb_next/2^vraisemb)
    permutation = permutation_next;
    vraisemb = vraisemb_next;
    translation = translation_next;
    end
    
end

permutation;
translation
vraisemb