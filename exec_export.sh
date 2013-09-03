#!/bin/bash
#批量执行导出命令
work_dir=$(dirname $0)
postgres_user=chengdh
postgres_pwd=''
postgres_server=localhost
postgres_port=15432
postgres_db=ktv_demo

for file in ` ls ${work_dir}`
do
  if [ -f ${file} ] && [ ${file:0:6} = "export" ]
  then
    echo "导出文件:"${file}
    psql -h ${postgres_server} -d ${postgres_db} -p ${postgres_port} -U ${postgres_user} -W ${postgres_pwd} -f  ${file}
  fi
done
