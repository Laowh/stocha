%Calcule la vraisemblance avec les données
function [ result ] = vraisemblance( text,alphabet,pinit,Q )

result = log2(pinit(find(alphabet == text(1),1)));

previous = find(alphabet == text(1),1);
for i = 2 : length(text)
    next = find(alphabet == text(i),1);
    result = result + log2(Q(previous, next));
    previous = next;
end




end

