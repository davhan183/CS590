set HOTELS;
set STANDS;
param total_stretch;
param willing_to_walk{i in HOTELS};
param demand{i in HOTELS};
param location{i in HOTELS};
var served{i in HOTELS}, binary;
var served_by{i in HOTELS, j in STANDS}, binary;
var placement{j in STANDS};

maximize demand_served: sum{i in HOTELS} served[i]*demand[i];
s.t. service {i in HOTELS}: sum{j in STANDS} served_by[i,j] - served[i] >= 0;
s.t. reach_to_left {i in HOTELS, j in STANDS}:  location[i] - placement[j] - willing_to_walk[i] - total_stretch + total_stretch*served_by[i,j] <= 0;
s.t. reach_to_right {i in HOTELS, j in STANDS}:  placement[j] - location[i] -  willing_to_walk[i] - total_stretch + total_stretch*served_by[i,j] <= 0;

data;

set HOTELS := c1 c2 c3 c4 c5;
set STANDS := s1 s2;
param total_stretch := 50;
param willing_to_walk := c1 4 c2 2 c3 3 c4 3 c5 2;
param demand := c1 2 c2 1 c3 3 c4 4 c5 3;
param location := c1 1 c2 4 c3 7 c4 9 c5 15;
end;
