function rti = CalculerRefraction(iAvant, iApres, rayon, cylindre)

vecMilieuUnit  = (cylindre.position - rayon.posActuelle)/norm(cylindre.position - rayon.posActuelle);
vecPerpendiculaire = [-vecMilieuUnit(2) vecMilieuUnit(1)];

thetaCercle = acos(dot([rayon.vecteurActuel(1), rayon.vecteurActuel(2)], vecPerpendiculaire)/(norm([rayon.vecteurActuel(1), rayon.vecteurActuel(2)])*norm(vecPerpendiculaire)));


angleCritique = asin(iApres/iAvant);
if(thetaCercle > angleCritique|| rayon.phi > angleCritique)
    rti = true;
    rayon.compteurReflexion = rayon.compteurReflexion + 1;
else
    rti = false;
    nTheta = asin((iAvant/iApres)*sin(thetaCercle));
    nPhi = asin((iAvant/iApres))*sin(rayon.phi);
    rayon.phi=nPhi;
    rayon.vecteurActuel = transformerAnglesEnVecteur(nTheta, nPhi);
end
