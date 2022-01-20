set HOTELS;
set STANDS;

var stands_location{j in STANDS};
var in_range{i in HOTELS, j in STANDS}, binary;
var goes_to{i in HOTELS, j in STANDS}, binary;

param customers{i in HOTELS};
param location{i in HOTELS};
param walking_distance{i in HOTELS};


maximize revenue: sum{i in HOTELS, j in STANDS} goes_to[i, j] * customers[i];
s.t. actually_in_range{i in HOTELS, j in STANDS}: goes_to[i, j] <= in_range[i, j];
s.t. satisfied{i in HOTELS}: sum{i in HOTELS} goes_to[i, j] <= 1;
s.t. can_walk_l{i in HOTELS, j in STANDS}:
  (stands_location[j] - location[i]) <= walking_distance[i] + (1 - in_range[i, j]) * M;
s.t. can_walk_l{i in HOTELS, j in STANDS}:
  (location[i] - stands_location[j]) <= walking_distance[i] + (1 - in_range[i, j]) * M;