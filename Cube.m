classdef Cube < handle
    properties
        faces
        rayon
    end
    methods
        function obj = Cube(f, r)
            obj.faces = f;
            obj.rayon =r;
        end
    end
end