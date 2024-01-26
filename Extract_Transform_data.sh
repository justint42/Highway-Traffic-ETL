#!/bin/bash


# EXTRACT PHASE
# use wget to dowload data from given url 

echo "Extracting toll data."
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Final%20Assignment/tolldata.tgz

# uncompress into the destination directory using tar -xzvf

tar -xzvf tolldata.tgz

# this command creates the headers 'Rowid, 'Timestamp", 'Anonymized Vehicle Number',
# and 'Vehicle Type' and extracts their relevant data to csv_toll_data.csv
# The 'cut' command is used to extract fields from a file.
# -d ',' sets the delimiter to a comma, which is standard for CSV files.
# -f 1-4 selects the range of fields from 1 to 4 (inclusive).

{ 
  echo 'Rowid,Timestamp,Anonymized Vehicle Number,Vehicle Type'; 
  cut -d ',' -f 1-4 vehicle-data.csv; 
} > csv_toll_data.csv

# this command creates the headers 'Number of axles, 'Tollplaza id', 'Tollplaza code'
# and extracts their relevant data to tsv_toll_data.csv
# BEGIN {FS="\t"; OFS=","} sets the input field separator as the tab character and the output field separator as a comma.
# {print $5, $6, $7} prints the fifth, sixth, and seventh fields of each record.

{ 
  echo 'Number of axles,Tollplaza id,Tollplaza code'; 
  awk 'BEGIN {FS="\t"; OFS=","} {print $5, $6, $7}' tollplaza-data.tsv; 
} > tsv_toll_data.csv


# this command creates the headers 'Type of Payment code`, and `Vehicle Code` from the fixed width file `payment-data.txt`
# and extracts their relevant data to txt_toll_data.csv
# NF stands for the number of fields in the current record, so $NF is the last field, and $(NF-1) is the second-to-last field.
# print $(NF-1) "," $NF prints the second-to-last and last fields, separated by a comma.
# The echo command adds the header to the top of the file.


{ 
  echo 'Type of Payment code,Vehicle Code'; 
  awk '{ print $(NF-1) "," $NF }' payment-data.txt; 
} > txt_toll_data.csv


echo "CSVs created. Consolidating data..."

# Combine the files side by side with paste
paste -d, csv_toll_data.csv txt_toll_data.csv tsv_toll_data.csv > extracted_toll_data.csv

echo "Succesful paste."


echo "Beginning Tranformation."


# Sets the field separator to a comma
# BEGIN {OFS=","} Sets the output field separator to a comma
# $4=toupper($4); Converts the fourth field to uppercase

awk -F, 'BEGIN {OFS=","} { $4=toupper($4); print }' extracted_toll_data.csv > transformed_toll_data.csv


echo "Transformation Complete."
