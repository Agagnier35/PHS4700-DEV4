function [cylindre, cube] = InitialisationScene(nin)

cylindre = Cylindre([4 4 11], nin, 2, 18);

surfaceRouge = Plan([1 0 0], [-1 0 0], [3 5 12;3 3 12;3 3 17;3 5 17]);
surfaceCyan = Plan([0 1 1], [1 0 0] , [4 3 12;4 5 12;4 5 17;4 3 17]);

surfaceVert = Plan([0 1 0], [0 -1 0] , [3 3 12;4 3 12;4 3 17;3 3 17]);
surfaceJaune = Plan([1 1 0], [0 1 0] , [4 5 12;3 5 12;3 5 17;4 5 17]);

surfaceBleu = Plan([0 0 1], [0 0 -1], [3 5 12;4 5 12;4 3 12;3 3 12]);
surfaceMagenta = Plan([1 0 1], [0 0 1], [3 3 17; 4 3 17; 4 5 17; 3 5 17]);

cube = [surfaceRouge surfaceCyan surfaceVert surfaceJaune surfaceBleu surfaceMagenta];

