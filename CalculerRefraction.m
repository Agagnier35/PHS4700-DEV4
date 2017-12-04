function rti = CalculerRefraction(iAvant, iApres, rayon, cylindre)

vecMilieuUnit  = (cylindre.position - rayon.posActuelle)/norm(cylindre.position - rayon.posActuelle);
vecPerpendiculaire = [-vecMilieuUnit(2) vecMilieuUnit(1)];

phiCercle = (pi/2)-acos(dot([rayon.vecteurActuel(1), rayon.vecteurActuel(2)], vecPerpendiculaire)/(norm([rayon.vecteurActuel(1), rayon.vecteurActuel(2)])*norm(vecPerpendiculaire)));


angleCritique = asin(iApres/iAvant);
if(phiCercle > angleCritique|| rayon.theta > angleCritique)
    rti = true;
    nPhi = (pi/2)--phiCercle;
    nTheta = (pi/2)--rayon.theta;
    rayon.theta = nTheta;
    rayon.vecteurActuel = transformerAnglesEnVecteur(nTheta, nPhi);
    rayon.compteurReflexion = rayon.compteurReflexion + 1;
else
    rti = false;
    nPhi = asin((iAvant/iApres)*sin(phiCercle));
    nTheta = asin((iAvant/iApres)*sin((pi/2)-rayon.theta));
    rayon.theta=nTheta;
    rayon.vecteurActuel = transformerAnglesEnVecteur(nTheta, nPhi);
end
