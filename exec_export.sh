#!/bin/bash
#批量执行导出命令
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
