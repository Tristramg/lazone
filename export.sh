set -x


PROJ="+proj=lcc +lat_1=49.50000000000001 +lat_0=49.50000000000001 +lon_0=0 +k_0=0.999877341 +x_0=600000 +y_0=200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs"


for enceinte in romaine Charles-V carolingienne "Ferm. généraux" "fossés jaunes" Philippe-Auguste
do
  echo ${enceinte}
  ogr2ogr -s_srs "${PROJ}" -t_srs EPSG:4326 -f geojson "${enceinte}.geojson" PG:"dbname=lazone" -sql "select * from enceintes where libelle = '${enceinte}'"
done


