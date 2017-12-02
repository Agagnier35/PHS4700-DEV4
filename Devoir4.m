function [xi, yi, zi, face] = Devoir4(nout, nin, poso)
clf;
axis ([-11 11 -11 11 0 22])
[cylindre, cube] = InitialisationScene(nin);
hold on;
%DessinerSurface(cube);

[x,y,z] = cylinder(cylindre.rayon);
z(2,:)=cylindre.hauteur;
cylindreDessine = surf(x+4,y+4,z+2,'FaceColor',[0 0 1]);

[x,y,z] = sphere;
surf(0.2*x+poso(1), 0.2*y+poso(2), + 0.2*z+poso(3), 'FaceColor', [0 0 0]);

alpha(cylindreDessine, 0.05);

[thetaMin, thetaMax,  phiMin, phiMax] = trouverAngles(poso, cylindre);

N=10;
M=10;
rayons = [];
rayonsAcceptes = [];
i=1;
j=1;
while i<=N
    while j<=M
        thetaN = thetaMin + (thetaMax -thetaMin)*(2*i-1)/(2*N);
        phiM = phiMin + (phiMax-phiMin)*(2*j-1)/(2*M);
        vecUnit = transformerAnglesEnVecteur(thetaN, phiM);
        plot3([vecUnit(1)+poso(1) vecUnit(1)*10+poso(1)],[vecUnit(2)+poso(2) vecUnit(2)*10+poso(2)],[vecUnit(3)+poso(3) vecUnit(3)*10+poso(3)]);
        
        nRayon = Rayon(poso, vecUnit, phiM);
        rayons = [rayons; nRayon];
        j = j+1;
    end
    i = i+1;
    j=1;
end

s = 0.005;
for r=1:size(rayons,1)
    cas = -1;
    while (cas == -1)
        rayon = rayons(r);

        nPos = rayon.posActuelle + s*rayon.vecteurActuel;
        if(size(rayon.points, 1) == 0)
            oldPos = rayon.posInitiale;
        else
            oldPos = rayon.points(size(rayon.points, 1),:);
        end
        

        
        rayon.posActuelle = nPos;
        rayon.points = [rayon.points; rayon.posActuelle];

        if((rayon.posActuelle(1) > 7 || rayon.posActuelle(2) > 7 || rayon.posActuelle(3) > 22) && rayon.aToucheCylindre == false)
            cas = 1;
            break;%out of bounds sans cylindre-> rejet
        end

        if(rayon.estInterieur == false)
            if(sqrt((rayon.posActuelle(1) - cylindre.position(1))^2 + (rayon.posActuelle(2) - cylindre.position(2))^2) < cylindre.rayon)
                if(rayon.posActuelle(3) > (cylindre.position(3)-cylindre.hauteur/2) && rayon.posActuelle(3) < (cylindre.position(3)+cylindre.hauteur/2))
                    rayon.aToucheCylindre = true;
                    rti = CalculerRefraction(nout,nin, rayon, cylindre);
                    if(rti == true)
                        cas = 2;
                        break;%reflextion totale interne avant cylndre -> rejet
                    else
                        rayon.estInterieur = true;    
                    end
                end
            end
        else
            if(sqrt((rayon.posActuelle(1) - cylindre.position(1))^2 + (rayon.posActuelle(2) - cylindre.position(2))^2) > cylindre.rayon || (rayon.posActuelle(3) < (cylindre.position(3)-cylindre.hauteur/2) && rayon.posActuelle(3) > (cylindre.position(3)+cylindre.hauteur/2)))
                rti = CalculerRefraction(nout,nin, rayon,cylindre);
                if(rti == false)
                    rayon.estInterieur = false;
                    cas = 3;
                    break;%il sort sans touche le cube ->rejet
                else
                    if(rayon.compteurReflexion >=100)
                        cas=5;
                        break;%trop de reflexion -> rejet
                    end
                end
            else
                %tjrs a linterieur
                posFinale = verifierCollisonCube(rayon, cube);
                if(posFinale ~= [0 0 0])%il y a eu collision
                    rayon.posVirtuelle = posFinale;
                    rayonsAcceptes = [rayonsAcceptes; rayon];
                    cas =4;
                    break;
                end 
            end
        end
    end
end

xi =[];
yi=[];
zi=[];
face = [];
con = ConteneurImageVirtuelle();
for rA = 1:size(rayonsAcceptes,1)
    rayonAccepte = rayonsAcceptes(rA);
    xi = [xi; rayonAccepte.posActuelle(1)];
    yi = [yi; rayonAccepte.posActuelle(2)];
    zi = [zi; rayonAccepte.posActuelle(3)];
    
    
    face = [face; transformColorToNumber(con, rayonAccepte)];
end
con.DrawAll;



