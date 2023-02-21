% Facts
parent(carnivora,felidae).
parent(carnivora,mustelidae).
parent(carnivora,canidae).
parent(felidae,panthera).
parent(mustelidae,taxidea).
parent(mustelidae,lutra).
parent(canidae,canis).
parent(panthera,panthera_pardus).
parent(taxidea,taxidea_taxus).
parent(lutra,lutra_lutra).
parent(canis,canis_latrans).
parent(canis,canis_lupus).

% Rules
%% Direct descendant (turunan langsung)
direct_descendant(X,Y) :-
  parent(Y,X).

%% Direct ascendant (leluhur langsung)
direct_ascendant(X,Y) :-
  parent(X,Y).

%% Taxonomy sibling
taxonomy_sibling(X,Y) :-
  parent(Z,X),
  parent(Z,Y),
  dif(X,Y).

%% Descendant (semua turunan)
descendant(X,Y) :-
  direct_descendant(X,Y).
descendant(X,Y) :-
  parent(Y,Z),
  descendant(X,Z).

%% Ascendant (semua leluhur)
ascendant(X,Y) :-
  direct_ascendant(X,Y).
ascendant(X,Y) :-
  parent(X,Z),
  ascendant(Z,Y).

%% Same level (entri dengan level yang sama)
same_level(carnivora,carnivora).
same_level(X,Y) :-
  parent(W,X),
  parent(Z,Y),
  same_level(W,Z),
  dif(X,Y).
same_level(X,Y) :-
  taxonomy_sibling(X,Y).
