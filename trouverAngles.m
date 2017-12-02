function [thetaMin, thetaMax,  phiMin, phiMax] = trouverAngles(poso, cylindre)
vecteurMilieuUnit = (cylindre.position - poso)/norm(cylindre.position - poso);

pointMinXY = (cylindre.rayon + 1)* -[ -vecteurMilieuUnit(2) vecteurMilieuUnit(1) 0] + cylindre.position;
pointMaxXY = (cylindre.rayon + 1)* [ -vecteurMilieuUnit(2) vecteurMilieuUnit(1) 0] + cylindre.position;
pointMaxZ = cylindre.position + [0 0 (cylindre.hauteur/2 + 8)];
pointMinZ = cylindre.position - [0 0 (cylindre.hauteur/2 + 3)];

vecteurMaxXY = pointMaxXY - poso;
vecteurMinXY = pointMinXY - poso;
vecteurMaxZ = pointMaxZ- poso;
vecteurMinZ = pointMinZ- poso;

thetaMin = acos(dot([1 0 0], vecteurMinXY)/(norm([1 0 0])*norm(vecteurMinXY)));
thetaMax = acos(dot([1 0 0], vecteurMaxXY)/(norm([1 0 0])*norm(vecteurMaxXY)));
phiMin = acos(dot([1 0 0], vecteurMinZ)/(norm([1 0 0])*norm(vecteurMinZ)));
phiMax = acos(dot([1 0 0], vecteurMaxZ)/(norm([1 0 0])*norm(vecteurMaxZ)));

%plot3([vecteurMaxXY(1)+poso(1) vecteurMaxXY(1)*10+poso(1)],[vecteurMaxXY(2)+poso(2) vecteurMaxXY(2)*10+poso(2)],[vecteurMaxXY(3)+poso(3) vecteurMaxXY(3)*10+poso(3)]);
%plot3([vecteurMinXY(1)+poso(1) vecteurMinXY(1)*10+poso(1)],[vecteurMinXY(2)+poso(2) vecteurMinXY(2)*10+poso(2)],[vecteurMinXY(3)+poso(3) vecteurMinXY(3)*10+poso(3)]);
%plot3([vecteurMaxZ(1)+poso(1) vecteurMaxZ(1)*10+poso(1)],[vecteurMaxZ(2)+poso(2) vecteurMaxZ(2)*10+poso(2)],[vecteurMaxZ(3)+poso(3) vecteurMaxZ(3)*10+poso(3)]);
%plot3([vecteurMinZ(1)+poso(1) vecteurMinZ(1)*10+poso(1)],[vecteurMinZ(2)+poso(2) vecteurMinZ(2)*10+poso(2)],[vecteurMinZ(3)+poso(3) vecteurMinZ(3)*10+poso(3)]);

