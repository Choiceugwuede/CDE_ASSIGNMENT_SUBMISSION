#! /bin/bash

echo "Files downloading..."

POSEY_DIR="Posey_Data"

#remove if exists
rm -r "$POSEY_DIR" 

#create new parent directory
mkdir -p "$POSEY_DIR"

#Download csv from github using the raw link for download
curl -L -o "$POSEY_DIR/accounts.csv"     "https://github.com/jdbarillas/parchposey/raw/master/data-raw/accounts.csv"
curl -L -o "$POSEY_DIR/orders.csv"       "https://github.com/jdbarillas/parchposey/raw/master/data-raw/orders.csv"
curl -L -o "$POSEY_DIR/region.csv"       "https://github.com/jdbarillas/parchposey/raw/master/data-raw/region.csv"
curl -L -o "$POSEY_DIR/sales_reps.csv"   "https://github.com/jdbarillas/parchposey/raw/master/data-raw/sales_reps.csv"
curl -L -o "$POSEY_DIR/web_events.csv"   "https://github.com/jdbarillas/parchposey/raw/master/data-raw/web_events.csv"

echo "Download Complete"

#===========COPY INTO POSEY DATABASE===============
#Database credential
DB="posey"
USER="airflow"
CONTAINER="parch-posey-etl-postgres-1"

echo "Setting Posey Database and loading tables..."

#Loop to iterate over each csv in folder
for file in "$POSEY_DIR"/*.csv; do
	table=$(basename "$file" .csv)
	
	
	#Truncate existing table
	docker exec -i $CONTAINER psql -U $USER -d $DB -c "Truncate table $table;"
    
	#Load fresh into table
	echo "Copying $file into table $table"

	docker exec -i $CONTAINER psql -U "$USER" -d "$DB" -c "\copy $table FROM STDIN  DELIMITER ',' CSV HEADER;" < "$file"
    
	echo "Table $table refreshed succesfully"
done










