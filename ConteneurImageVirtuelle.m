classdef ConteneurImageVirtuelle < handle
    properties
        redX
        redY
        redZ
        
        cyanX
        cyanY
        cyanZ
        
        vertX
        vertY
        vertZ
        
        jauneX
        jauneY
        jauneZ
        
        bleuX
        bleuY
        bleuZ
        
        magentaX
        magentaY
        magentaZ
    end
    methods
        function obj = ConteneurImageVirtuelle()
            obj.redX = [];
            obj.redY = [];
            obj.redZ = [];

            obj.cyanX = [];
            obj.cyanY = [];
            obj.cyanZ = [];

            obj.vertX = [];
            obj.vertY = [];
            obj.vertZ = [];

            obj.jauneX = [];
            obj.jauneY = [];
            obj.jauneZ = [];

            obj.bleuX = [];
            obj.bleuY = [];
            obj.bleuZ = [];

            obj.magentaX = [];
            obj.magentaY = [];
            obj.magentaZ = [];
        end
        
        function DrawAll(con)
            scatter3(con.redX, con.redY, con.redZ, 10, 'filled', 'MarkerEdgeColor', [1 0 0], 'MarkerFaceColor', [1 0 0]);
            scatter3(con.cyanX, con.cyanY, con.cyanZ, 10, 'filled', 'MarkerEdgeColor', [0 1 1], 'MarkerFaceColor', [0 1 1]);
            scatter3(con.vertX, con.vertY, con.vertZ, 10, 'filled', 'MarkerEdgeColor', [0 1 0], 'MarkerFaceColor', [0 1 0]);
            scatter3(con.jauneX, con.jauneY, con.jauneZ, 10, 'filled', 'MarkerEdgeColor', [1 1 0], 'MarkerFaceColor', [1 1 0]);
            scatter3(con.bleuX, con.bleuY, con.bleuZ, 10, 'filled', 'MarkerEdgeColor', [0 0 1], 'MarkerFaceColor', [0 0 1]);
            scatter3(con.magentaX, con.magentaY, con.magentaZ, 10, 'filled', 'MarkerEdgeColor', [1 0 1], 'MarkerFaceColor', [1 0 1]);
            
            %patch(con.redX, con.redY, con.redZ, 'FaceColor', [1 0 0] , 'EdgeColor', 'none');
            %patch(con.cyanX, con.cyanY, con.cyanZ, 'FaceColor', [1 0 0] , 'EdgeColor', 'none');
            %patch(con.vertX, con.vertY, con.vertZ, 'FaceColor', [1 0 0] , 'EdgeColor', 'none');
            %patch(con.jauneX, con.jauneY, con.jauneZ, 'FaceColor', [1 0 0] , 'EdgeColor', 'none');
            %patch(con.bleuX, con.bleuY, con.bleuZ, 'FaceColor', [1 0 0] , 'EdgeColor', 'none');
            %patch(con.magentaX, con.magentaY, con.magentaZ, 'FaceColor', [1 0 0] , 'EdgeColor', 'none');
        end
    end
end