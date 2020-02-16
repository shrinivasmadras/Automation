#this script is mainly created for running complex and long running sql queries , which take time to create table and to load data.
****Requirement*********Script details************************
#To extract a large volume of Unstructured data with sql.
#spool.sql is the main script which runs the sql query along with the header seperated by PIPE delimiter.
#the sql script is provide in the block to run the query and fetch the data, output file is input.txt saved in the path of the spool script
#please provide the proper header ( in-case of date column provide column name followed by _date or _dt )
#the spool ksh calls the spool.sql.
#call dynamic.ksh for creating the create table and load script.
#the create_table.ksh and load.ksh calls the create_table.sql and load.ctl which is dynamically created.


*****dynamic ksh script********
#this is where all the dynamic creation , loadding and sequence number generation happens
********************************


*******WARNING!!!!!**** this script works only for database enabled shell servers***************
****if its a dedicated unix server and does not connect database then this script will not work*********



******CALL SCRIPT METHOD********
#once all the variables are defined by you the scripts , you can call the sctipt in the belo manner.
*./spool.ksh && ./dynamic.ksh && ./create_table.ksh && ./load.ksh && final_processed_data.ksh
