seq2;
seq = seq(1:20);
% permutation = alphabet(randperm(40));
% translation = transmute (seq, permutation, alphabet)
% vraisemb = vraisemblance(translation,alphabet,pinit,Q)

% occurences = zeros(1,N);
% probability = zeros(1,N);
% Q_aux = zeros(N,N);
% pos = find (alphabet == seq(1),1);
% occurences(pos) = occurences(pos) + 1;
% 
% for i=2 : length(seq)
%   current_pos = find (alphabet == seq(i),1);
%   occurences(current_pos) = occurences(current_pos) + 1;
%   previous_pos = find (alphabet == seq(i-1),1);
%   Q_aux(previous_pos,current_pos) = Q_aux(previous_pos,current_pos) +1;
% end
% pi0 = occurences/sum(occurences);
% for i=1 :4
%     Q_aux(i,:) = Q(i,:)/ sum(Q_aux(i,:));
% end
% 
% poise = Q^50;
% poise = poise(1,:);
% [pi0, alpha_text] = sort(pi0,'descend');
% alpha_text = alphabet(alpha_text);
% [poise, alpha_english] = sort(poise,'descend');
% alpha_english = alphabet(alpha_english)
% translation = transmute (seq, alpha_english, alpha_text)
% vraisemb = vraisemblance(translation,alphabet,pinit,Q)
     


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