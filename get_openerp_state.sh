#!/bin/bash
PGPASSWORD=$postgres_pwd psql -h${postgres_server} -d${postgres_db} -p${postgres_port} -U${postgres_user} -f export_OPENERP_STATE 
