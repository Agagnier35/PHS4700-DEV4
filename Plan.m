classdef Plan < handle
    properties
        couleur
        normale
        coins
    end
    
    methods
        function obj = Plan(col, n, coi)
            obj.couleur = col;
            obj.normale = n;
            obj.coins = coi;
        end
    end
end