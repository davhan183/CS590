set ITEMS;
param total_weight;
param total_volume;
param price{j in ITEMS};
param weight{j in ITEMS};
param volume{j in ITEMS};
param availability{j in ITEMS};
var quantity{j in ITEMS}, >=0, integer;

maximize total_value: sum{j in ITEMS} price[j]*quantity[j];
s.t. weight_constraint: sum{j in ITEMS} weight[j]*quantity[j] <=
total_weight;
s.t. volume_constraint: sum{j in ITEMS} volume[j]*quantity[j] <=
total_volume;
s.t. availability_constraint{j in ITEMS}: quantity[j] <= availability[j];

data;

set ITEMS := A B C;
param total_weight:=30;
param total_volume:=20;
param price:= A 11 B 4 C 9;
param availability:= A 3 B 4 C 1;
param weight:= A 16 B 4 C 6;
param volume:= A 3 B 4 C 3;

end;