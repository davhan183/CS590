set PHONES;
set CONTINENTS;
param cover{i in PHONES, j in CONTINENTS};
var buy{i in PHONES}, binary;

minimize hassle: sum{i in PHONES} buy[i];
s.t. coverage_constraints {j in CONTINENTS}: sum{i in PHONES} cover[i,j]*buy[i] >= 1;


data;

set PHONES := pa pb pc pd pe pf;
set CONTINENTS := NA SA Eu Af As Au;
param cover:   NA SA Eu Af As Au :=
 pa            1  1  0   1  0  0
 pb            0  0  1   1  1  0
 pc            1  0  1   0  0  1
 pd            0  1  1   0  1  0
 pe            0  0  0   1  1  1
 pf            1  0  1   0  0  0;
end;
