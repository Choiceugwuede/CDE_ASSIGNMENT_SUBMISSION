#!/usr/bin/bash

WORK_DIR="/mnt/c/Users/Bluechip/CDE/ASSIGNMENT/CDE_BASH_SUBMISSION/Scripts/Bash-Scripts/Bash-ETL"

# ===== EXTRACT=====
echo "Extraction started..."

# Directory for raw file dump
RAW_DIR="$WORK_DIR/RAW"
mkdir -p "$RAW_DIR"

# raw file path
raw_file="${RAW_DIR}/annual-enterprise-survey-2023-financial-year-provisional.csv"

# Csv source url
echo "Loading enviormantal variables for csv..."
source "$WORK_DIR/.env"


#Extract content of csv into raw file 
echo "Downloading CSV and saving to RAW..."
curl -o "$raw_file" "$CSV" 

# Confirm File exists in folder
if [[ -f "$raw_file" ]]; then 
    echo "Saved: $raw_file"
else 
    echo "File not found after download."
fi 

# ====== TRANSFORM ======
echo "Transformation started..."

# Directory for transformed file dump
Transformed_DIR="$WORK_DIR/Transformed"
mkdir -p "$Transformed_DIR"

# Transformed file path
Trans_file="${Transformed_DIR}/2023_year_finance.csv"

# Transform data - change column name and select specific columns 

awk -F',' '
BEGIN {OFS=","}
NR==1 {
for(i=1;i<=NF;i++)
{
    if ($i=="Variable_code") {$i="variable_code"; vc=i}
    if ($i=="Year") y=i
    if ($i=="Value") v=i
    if ($i=="Units") u=i
    }
    print "Year","Value","Units","variable_code"
    next 
    }

{
    print $y, $v, $u, $vc
}
' "$raw_file" > "$Trans_file"

echo "Transformation complete"

#====== LOAD ========
echo "Loading started...."

# Directory to load files
Gold_DIR="$WORK_DIR/Gold"
mkdir -p "$Gold_DIR"

# Gold file path
Gold_file="${Gold_DIR}/2023_year_finance.csv"

#saved transformed file into Gold path
cat "$Trans_file" > "$Gold_file"

# Confirm file exists in Transform folder
if [[ -s $Gold_file ]]; then 
    echo "Saved: $Gold_file"
else 
    echo "Transformation failed or file empty"
fi













