#!/bin/bash
#批量执行导出命令
work_dir=$(dirname $0)
postgres_user=openerp
postgres_pwd=openerp
postgres_server=localhost
postgres_port=5432
postgres_db=test_sync

#postgres_user=chengdh
#postgres_pwd=''
#postgres_server=localhost
#postgres_port=15432
#postgres_db=ktv_dev



#for file in ` ls ${work_dir}`
#do
#  if [ -f ${file} ] && [ ${file:0:6} = "export" ]
#  then
#    echo "导出文件:"${file}
#    PGPASSWORD=$postgres_pwd psql -h${postgres_server} -d${postgres_db} -p${postgres_port} -U${postgres_user} -f${file}
#  fi
#done
echo "导出文件: BL_TBL_Material_Storage"
PGPASSWORD=$postgres_pwd psql -h${postgres_server} -d${postgres_db} -p${postgres_port} -U${postgres_user} -f export_BL_TBL_Material_Storage
