%métrique : nombre de caractères correctement deviné

mut = 'i watch as gale pulls out his knife and slices the bread. he could be my brother. straight black hair, olive skin, we even have the same gray eyes. but we''re not related, at least not closely. most of the families who work the mines resemble one another this way. that''s why my mother and prim, with their light hair and blue eyes, always look out of place. they are. my mother''s parents were part of the small merchant class that caters to officials, peacekeepers, and the occasional seam customer. they ran an apothecary shop in the nicer part of district 12. since almost no one can afford doctors, apothecaries are our healers. my father got to know my mother because on his hunts he would sometimes collect medicinal herbs and sell them to her shop to be brewed into remedies. she must have really loved him to leave her home for the seam. i try to remember that when all i can see is the woman who sat by, blank and unreachable, while her children turned to skin and bones. i try to forgive her for my father''s sake. but to be honest, i''m not the forgiving type. gale spreads the bread slices with the soft goat cheese, carefully placing a basil leaf on each while i strip the bushes of their berries. we settle back in a nook in the rocks. from this  10 place, we are invisible but have a clear view of the valley, which is teeming with summer life, greens to gather, roots to dig, fish iridescent in the sunlight. the day is glorious, with a blue sky and soft breeze. the food''s wonderful, with the cheese seeping into the warm bread and the berries bursting in our mouths. everything would be perfect if this really was a holiday, if all the day off meant was roaming the mountains with gale, hunting for tonight''s supper. but instead we have to be standing in the square at two o''clock waiting for the names to be called out.';
true_permutation = 'jlb.":[i,avfhq- ycsudo]?tp);newrzxm!g(''k';
N = length(alphabet);
load('pinit.mat');
load('Q.mat');

seq = transmute(mut, alphabet, true_permutation);
alphabet = 'abcdefghijklmnopqrstuvwxyz,.''"-!?:;()[] ';

Nombre 
sim = [0];
tic;

p = 1/factorial(40);
vraisemb = -Inf;

%nombre d'itérations
it = 0;
prev_it = 0;
%Données pour le graph
Tab_vraisemblance_alt = [vraisemb];
permutation = alphabet(randperm(40));
nb_unique = length(unique(seq));

%Fait des permutations aléatoires dans le code et si meilleure vraisemblance on garde
while(sim(end) < 0.8* nb_unique)
   permutation_next = exchange (permutation, randi(40), randi(40)) ;
   %translation_next = transmute (seq, permutation_next, alphabet);
   vraisemb_next = vraisemblance_alt(seq,permutation_next,pinit,Q);

   if(randi(1) < (2^(vraisemb_next - vraisemb)))
     %On garde le nouveau code
     permutation = permutation_next;
     vraisemb = vraisemb_next;
     translation = transmute (seq, permutation_next, alphabet);
     
     %données graphiques
     Tab_vraisemblance_alt = [Tab_vraisemblance_alt vraisemb];
     sim = [sim common(true_permutation, permutation)];
     prev_it = it;
   end 
   it = it+1;
   %empeche de tourner indéfiniment
   if (it > prev_it + 100000)
       disp("no improvement after 100 000 iterations. Program stops");
       break;
   end
end
figure(1);
plot(Tab_vraisemblance_alt);
title('Vraisemblance à chaque permutation effectuée')
ylabel('Vraisemblance');
xlabel('Nombre de permutations');
figure(2);
plot(sim);
title('Substitutions correctes à chaque permutation effectuée')
ylabel('Nombre de substitutions correctes');
xlabel('Nombre de permutations');
permutation
translation
vraisemb
toc;