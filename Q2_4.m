seq2;
%Selectionne seulement les premières lettres
seq = seq(1:20);

p = 1/factorial(40);
vraisemb = -Inf;
permutation = alphabet(randperm(40));

%permutation est une manière de coder le texte
while(vraisemb < -90)
    %Tire une permutation au hasard
    permutation_next = alphabet(randperm(40));
    %Traduit le texte
    translation_next = transmute (seq, permutation_next, alphabet);
    %teste le vraisemblance
    vraisemb_next = vraisemblance(translation_next,alphabet,pinit,Q);
    
    %Si meilleur on garde
    if(randi(1) < 2^vraisemb_next/2^vraisemb)
    permutation = permutation_next;
    vraisemb = vraisemb_next;
    translation = translation_next;
    end
    
end

permutation;
translation
vraisemb