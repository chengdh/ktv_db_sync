#!/bin/bash
export work_dir=$(dirname $0)
export postgres_user=openerp
export postgres_pwd=openerp
export postgres_server=localhost
export postgres_port=5432
export postgres_db=test_sync


#判断是否需要执行导入操作
./get_openerp_state.sh
export openerp_state=`cat export/openerp_state.csv`
echo "openerp_state:"$openerp_state
#先执行从mssql中导出数据,然后再导入到openerp
if [ $openerp_state = 1 ]
  then
    echo "开始同步..."
    ./exec_export.sh
    ./imp2mssql.sh
    #./reset_openerp_sync_flag
    echo "同步结束"
fi
