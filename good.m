perm = 'jlb.":[i,avfhq- ycsudo]?tp);newrzxm!g(''k';
deranged = 'aybdeq!hij''lwro]cnstumfx.z(-k",g?:;v)[p ';


alphabet = 'abcdefghijklmnopqrstuvwxyz,.''"-!?:;()[] ';


trad(2,:) = alphabet;

for i = 1 : 40
    trad(1,i) = perm(find(deranged == trad(2,i),1));
end

vraisemb_next = vraisemblance(seq(1:80),trad(1,:),pinit,Q);

%-237.6087