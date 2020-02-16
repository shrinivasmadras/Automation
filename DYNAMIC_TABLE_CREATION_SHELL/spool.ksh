*********************************README********************************************
*********#export the oracle path here , a sample path is given.*********************

#please provide the creds here.
DATABASE_NAME = ''
USERNAME = ''
PASSWORD = ''

export ORACLE_SID=DATABASE_NAME
export ORACLE_HOME=/opt/app/oracle/product/11.2.0/db_1
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/mysql/lib:/usr/openwin/lib:/usr/dt/lib:/usr/lib:/usr/ucblib:/opt/csw/lib
export PATH=/usr/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/ucb:/usr/local/Utility/bin:/usr/local/bin:/usr/local/sbin:/usr/local/soe/bin:/usr/openwin/bin:/usr/ccs/bin:/usr/dt/appconfig/netscape:/usr/sbin/nsr:/usr/bin/nsr:/etc/opt/SUNWmd/sbin:/usr/local/apache2/bin:/usr/local/mysql/bin:/opt/SUNWldm/bin:/opt/VRTS/bin:/opt/app/oracle/product/11.2.0/db_1/bin
export TNS_ADMIN=/opt/app/oracle/product/11.2.0/db_1/network/admin

sqlplus -s USERNAME/PASSWORD@DATABASE_NAME @spool.sql

exit sqlplus
