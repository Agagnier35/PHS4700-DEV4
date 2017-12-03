function num = transformColorToNumber(con, rayon)

if(rayon.couleur == [1 0 0])
    num = 1;
    con.redX = [con.redX rayon.posVirtuelle(1)];
    con.redY = [con.redY rayon.posVirtuelle(2)];
    con.redZ = [con.redZ rayon.posVirtuelle(3)];
elseif(rayon.couleur == [0 1 1])
    num = 2;
    con.cyanX = [con.cyanX rayon.posVirtuelle(1)];
    con.cyanY = [con.cyanY rayon.posVirtuelle(2)];
    con.cyanZ = [con.cyanZ rayon.posVirtuelle(3)];
elseif(rayon.couleur == [0 1 0])
    num = 3;
    con.vertX = [con.vertX rayon.posVirtuelle(1)];
    con.vertY = [con.vertY rayon.posVirtuelle(2)];
    con.vertZ = [con.vertZ rayon.posVirtuelle(3)];
elseif(rayon.couleur ==  [1 1 0])
    num = 4;
    con.jauneX = [con.jauneX rayon.posVirtuelle(1)];
    con.jauneY = [con.jauneY rayon.posVirtuelle(2)];
    con.jauneZ = [con.jauneZ rayon.posVirtuelle(3)];
elseif(rayon.couleur ==  [0 0 1])
    num = 5;
    con.bleuX = [con.bleuX rayon.posVirtuelle(1)];
    con.bleuY = [con.bleuY rayon.posVirtuelle(2)];
    con.bleuZ = [con.bleuZ rayon.posVirtuelle(3)];
elseif(rayon.couleur ==  [1 0 1])
    num = 6;
    con.magentaX = [con.magentaX rayon.posVirtuelle(1)];
    con.magentaY = [con.magentaY rayon.posVirtuelle(2)];
    con.magentaZ = [con.magentaZ rayon.posVirtuelle(3)];
else
    num = -1;
end