#!/bin/bash
#批量执行从mssal导出命令
work_dir=$(dirname $0)
mssql_db=eVideoBill_SH
mssql_user=sa
mssql_pw=vonger
mssql_host=192.168.8.252

sqsh=/usr/bin/sqsh

$sqsh -D $mssql_db -S $mssql_host -U $mssql_user -P $mssql_pw -mbcp -i /home/openerp/ktv_db_sync/test_import2db.sqsh
