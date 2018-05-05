%Alphabet correct
seq2;
perm = 'jlb.":[i,avfhq- ycsudo]?tp);newrzxm!g(''k';
deranged = 'aybdeq!hij''lwro]cnstumfx.z(-k",g?:;v)[p ';


alphabet = 'abcdefghijklmnopqrstuvwxyz,.''"-!?:;()[] ';


trad(2,:) = alphabet;
%Remet le code dans le bon ordre
for i = 1 : 40
    trad(1,i) = perm(find(deranged == trad(2,i),1));
end
translation = transmute (seq, trad(1,:), trad(2,:))
vraisemb_next = vraisemblance(seq(1:80),trad(1,:),pinit,Q);

%NE PAS EFFACER vraisemblance avant : -237.6087