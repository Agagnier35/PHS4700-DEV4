function posFinale = verifierCollisonCube(rayon, cube)
posFinale = [0 0 0];
distancePlusPetitCounter = 0;
distanceMin = 10000000000;
idxMin=0;
for sur=1:size(cube.faces,2)
    surface = cube.faces(sur);
    
    coin = surface.coins(1, :);
    distance = dot(surface.normale, rayon.posActuelle - coin);
    if(distance <= 0)
        distancePlusPetitCounter = distancePlusPetitCounter+1;
        if(abs(distance) < distanceMin)
            distanceMin = abs(distance);
            idxMin = sur;
        end
    end
end
if(distancePlusPetitCounter == size(cube.faces,2))%collision -> dessiner image
    rayon.couleur = cube.faces(idxMin).couleur;
    u = (rayon.posActuelle - rayon.posInitiale)/norm(rayon.posActuelle - rayon.posInitiale);
    d = rayon.calculerDistanceParcourue;
    
    posFinale = rayon.posInitiale + d*u;
    
    %scatter3(posFinale(1), posFinale(2), posFinale(3), 10, 'filled', 'MarkerEdgeColor', rayon.couleur, 'MarkerFaceColor', rayon.couleur);
end
    