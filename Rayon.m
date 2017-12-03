classdef Rayon < handle
    properties
        posInitiale
        vecteurInitial
        posActuelle
        vecteurActuel
        posVirtuelle
        points
        couleur
        compteurReflexion
        phi
        
        estInterieur
        aToucheCylindre
    end
        
    methods
        
        function d = calculerDistanceParcourue(r)
            d=norm(r.points(1, :) - r.posInitiale);
            for i = 2:size(r.points , 1)
                point = r.points(i, :);
                d = d + norm((point - r.points(i - 1, :)));
            end
        end
        
        function obj = Rayon(pI, vI,p)
            obj.posInitiale = pI;
            obj.vecteurInitial = vI;
            obj.phi = p;
            obj.posVirtuelle = [0 0 0];
            
            obj.posActuelle = pI;
            obj.vecteurActuel = vI;
            obj.points = [];
            obj.couleur = [0 0 0];
            obj.compteurReflexion = 0;
            
            obj.estInterieur = false;
            obj.aToucheCylindre = false;
        end
    end
end