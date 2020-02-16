#! /bin/ksh -a


	USER=""
	PASS=""
	DATABASE=""
	USR_PWD=$USER/$PASS@$DATABASE
	TABLE_NAME=`head TABLE_NAME.txt`
	
export ORACLE_SID=DATABASE
export ORACLE_HOME=/opt/app/oracle/product/11.2.0/db_1
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/mysql/lib:/usr/openwin/lib:/usr/dt/lib:/usr/lib:/usr/ucblib:/opt/csw/lib
export PATH=/usr/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/ucb:/usr/local/Utility/bin:/usr/local/bin:/usr/local/sbin:/usr/local/soe/bin:/usr/openwin/bin:/usr/ccs/bin:/usr/dt/appconfig/netscape:/usr/sbin/nsr:/usr/bin/nsr:/etc/opt/SUNWmd/sbin:/usr/local/apache2/bin:/usr/local/mysql/bin:/opt/SUNWldm/bin:/opt/VRTS/bin:/opt/app/oracle/product/11.2.0/db_1/bin
export TNS_ADMIN=/opt/app/oracle/product/11.2.0/db_1/network/admin
	
sqlplus -s $USR_PWD<<THEEND >>OUTPUT.txt
SET newpage 0
SET space 0
SET trimspool on
SET pagesize 0
SET termout off
SET verify off
SET echo off
SET linesize 1600
SET feedback off
SET numwidth 15
SET recsep off
SET HEADING OFF

select #values from table name
from $TABLE_NAME
where attr_name in ('Minimum Spend');

EXIT;
THEEND
exit | sqlplus -S $USR_PWD

	
EXIT;
THEEND;