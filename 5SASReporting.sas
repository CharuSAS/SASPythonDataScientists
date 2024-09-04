data dst4_modified;
  set bees.dst4;
  where 'plant species'n ne ' ';
  PlantSpecies_Year=catx('-','plant species'n,year);
  Month=month(date);
run;
 
title;
ods layout gridded columns=2 column_gutter=1cm;
ods region;
proc sgplot data=dst4_modified;
  where plot='native';
  heatmap x=Month y=PlantSpecies_Year 
          / discretex x2axis colormodel=(peachpuff orange firebrick);
  x2axis values=('5' '6' '7' '8' '9' '10') label='Native plants with respective flowering periods';
  yaxis discreteorder=formatted reverse label='Plant Species and Year';
run;
 
ods region;
proc sgplot data=dst4_modified;
  where plot='non-native';
  heatmap x=Month y=PlantSpecies_Year 
          / discretex x2axis colormodel=(peachpuff orange firebrick);
  x2axis values=('5' '6' '7' '8' '9' '10') label='Non-Native plants with respective flowering periods';
  yaxis discreteorder=formatted reverse label='Plant Species and Year';
run;
ods layout end;