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

SPOOL input.txt
	
/*header here with pipe delimiters*/
select 'NAME|GAME|SHAME' FROM DUAL;

select distinct name||'|'||
game||'|'||
shame
from /*table name*/ ;

exit;