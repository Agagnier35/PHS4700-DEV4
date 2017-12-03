classdef Cylindre
    properties
        position
        indice
        rayon
        hauteur
    end
    
    methods
        function obj = Cylindre(pM, i, r, h)
            obj.position = pM;
            obj.indice = i;
            obj.rayon = r;
            obj.hauteur = h;
        end
    end
end