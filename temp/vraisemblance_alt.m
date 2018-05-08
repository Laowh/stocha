%Calcule la vraisemblance avec les donn�es contenues dans pinit et Q
function [ result ] = vraisemblance_alt( text,alphabet,pinit,Q )

result = log2(pinit(find(alphabet == text(1),1)));

previous = find(alphabet == text(1),1);
for i = 2 : length(text)
    next = find(alphabet == text(i),1);
    temp = log2(Q(previous, next));
    %P�nalise un -inf plutot que de le garder tel quel
    if(temp == -Inf)
        temp = -500;
    end
    result = result + temp;
    previous = next;
end




end