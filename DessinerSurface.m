function DessinerSurface(cube)
for su=1:size(cube.faces,2)
    plan = cube.faces(su);
    surX=[];
    surY=[];
    surZ=[];
    for idx=1:size(plan.coins)
        coin = plan.coins(idx,:);
        surX =  horzcat(surX, coin(1));
        surY =  horzcat(surY, coin(2));
        surZ = horzcat(surZ, coin(3));
    end
    patch(surX, surY, surZ, plan.couleur);
end
