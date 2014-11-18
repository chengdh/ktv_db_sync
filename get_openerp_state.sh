#!/bin/sh
#!/bin/bash
#批量执行导出命令
work_dir=$(dirname $0)
postgres_user=openerp
postgres_pwd=openerp
postgres_server=localhost
postgres_port=5432
postgres_db=test_sync

PGPASSWORD=$postgres_pwd psql -h${postgres_server} -d${postgres_db} -p${postgres_port} -U${postgres_user} -f export_OPENERP_STATE 
