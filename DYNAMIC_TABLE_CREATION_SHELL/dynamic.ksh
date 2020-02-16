#!/usr/bin/ksh

#username
USR=""
#password
KID=""
#database name
SID=""

#define your paths here
seq_path=
ARC_DIR=


FILE=Create_table_
FILEDATE=`date -u '+%Y%m%d%H%M%S'`
FILE1=$FILE$FILEDATE.SQL
USR_PWD=$USR/$KID@$SID

cd $ARC_DIR
sed '1d' input.txt > input_1.txt

#header path used to create dynamic script of creation and loading
DATAFILE=

#Sequence Number logic 8digit sequence for new table names everytime.
if [[ -s $seq_path/SEQ_NUM.txt ]]
then
cd $seq_path
OLD_SEQ_NUM=$(cat SEQ_NUM.txt)
echo $OLD_SEQ_NUM
NEW_SEQ_NUM=$(expr $OLD_SEQ_NUM + 1)
printf %08d $NEW_SEQ_NUM > $seq_path/SEQ_NUM.txt
SEQ_NUM=$(cat SEQ_NUM.txt)
echo $SEQ_NUM
else
NEW_SEQ_NUM=1
printf %08d $NEW_SEQ_NUM > $seq_path/SEQ_NUM.txt
SEQ_NUM=$(cat $seq_path/SEQ_NUM.txt)
echo $SEQ_NUM
fi


echo dc_temp_${SEQ_NUM} > $ARC_DIR/TABLE_NAME.txt

cd $ARC_DIR
head -1 input.txt > header.txt
sed -i 's/|/ varchar(2000),/g' header.txt
echo 'create table' dc_temp_${SEQ_NUM} '(' > create.txt
echo ' varchar(2000));' > trailer.txt
cat create.txt header.txt trailer.txt > merge.txt
cat merge.txt | tr '\n' '#' > new_merge.txt
sed -i 's/#//g' new_merge.txt
sed -i 's/,/\n,/g' new_merge.txt
sed -i 's/DATE varchar(2000)/DATE DATE/g' new_merge.txt
sed -i 's/dt varchar(2000)/dt DATE/g' new_merge.txt
sed -i 's/date varchar(2000)/date DATE/g' new_merge.txt
sed -i 's/DT varchar(2000)/DT DATE/g' new_merge.txt
cat new_merge.txt > create_table.sql


table_name="dc_temp_${SEQ_NUM}"

echo "table $table_name is created"


head -1 input.txt > $ARC_DIR/load.txt
cd $ARC_DIR	
sed -i 's/|/,/g' load.txt
sed -i 's/DT/DT DATE/g' load.txt
sed -i 's/date/date DATE/g' load.txt	
input_file_fields=`cat $ARC_DIR/load.txt`
echo $input_file_fields
 time_stamp=`date '+%Y%m%d_%H%M%S'`
        logfile=`echo $0|cut -f1 -d.`"_"$time_stamp".log"
        echo `date '+%d-%h-%Y  %H:%M:%S'` "-> Initiating data load"
        echo `date '+%d-%h-%Y  %H:%M:%S'` "-> Initiating data load" >>$logfile
echo `date '+%d-%h-%Y  %H:%M:%S'` "-> Loading Data from "$DATAFILE" to "$SID >>$logfile
dos2unix -ascii $DATAFILE $DATAFILE 2> /dev/null
ROW_COUNT=$(sed '/^\s*#/d;/^\s*$/d' $DATAFILE|wc -l)
ROW_COUNT=$((ROW_COUNT-1))
echo `date '+%d-%h-%Y  %H:%M:%S'` "->" $DATAFILE" Has "$ROW_COUNT" Lines of data" >>$logfile
sed '/^\s*#/d;/^\s*$/d' $DATAFILE >temp.dat
tail -$ROW_COUNT temp.dat >$DATAFILE.dat
echo "load data" >dc_data_load.ctl
echo " infile '"$DATAFILE"'" >>dc_data_load.ctl
echo " append into table "$table_name >>dc_data_load.ctl
echo " fields terminated by '"'|'"'" >>dc_data_load.ctl
echo " trailing nullcols" >>dc_data_load.ctl
echo "("$input_file_fields")" >> dc_data_load.ctl
echo `date '+%d-%h-%Y  %H:%M:%S'` "-> Start Loading." >>$logfile
rm 	$DATAFILE.dat temp.dat
# --------------------------------------------------------------------------------------------------
