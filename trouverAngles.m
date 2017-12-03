function [thetaMin, thetaMax,  phiMin, phiMax] = trouverAngles(poso, cylindre)
vecteurMilieuUnit = (cylindre.position - poso)/norm(cylindre.position - poso);

pointMinXY = (cylindre.rayon + 1)* -[ -vecteurMilieuUnit(2) vecteurMilieuUnit(1) 0] + [cylindre.position(1) cylindre.position(2) 0] + [0 0 poso(3)];
pointMaxXY = (cylindre.rayon + 1)* [ -vecteurMilieuUnit(2) vecteurMilieuUnit(1) 0] + [cylindre.position(1) cylindre.position(2) 0] + [0 0 poso(3)];
pointMaxZ = cylindre.position + [0 0 (cylindre.hauteur/2 + 8)];
pointMinZ = cylindre.position - [0 0 (cylindre.hauteur/2 + 1)];

vecteurMaxXY = pointMaxXY - poso;
plot3([poso(1) vecteurMaxXY(1)*5+poso(1)], [poso(2) vecteurMaxXY(2)*5+poso(2)], [poso(3) vecteurMaxXY(3)*5+poso(3)]);
vecteurMinXY = pointMinXY - poso;
plot3([poso(1) vecteurMinXY(1)*5+poso(1)], [poso(2) vecteurMinXY(2)*5+poso(2)], [poso(3) vecteurMinXY(3)*5+poso(3)]);
vecteurMaxZ = pointMaxZ- poso;
plot3([poso(1) vecteurMaxZ(1)*2+poso(1)], [poso(2) vecteurMaxZ(2)*2+poso(2)], [poso(3) vecteurMaxZ(3)*2+poso(3)]);
vecteurMinZ = pointMinZ- poso;
plot3([poso(1) vecteurMinZ(1)*2+poso(1)], [poso(2) vecteurMinZ(2)*2+poso(2)], [poso(3) vecteurMinZ(3)*2+poso(3)]);

thetaMax = atan(vecteurMaxXY(2) / vecteurMaxXY(1));
thetaMin = atan(vecteurMinXY(2) / vecteurMinXY(1));
phiMax = atan(sqrt(vecteurMaxZ(1)^2 + vecteurMaxZ(2)^2) / vecteurMaxZ(3));
phiMin = atan(sqrt(vecteurMaxZ(1)^2 + vecteurMaxZ(2)^2) / vecteurMinZ(3)); %pi à ajouter
