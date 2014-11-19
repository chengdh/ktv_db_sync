#!/bin/bash
#批量执行从mssal导出命令

source ./mssql_export_product_category.sh
source ./mssql_export_product_uom.sh
source ./mssql_export_product_product.sh
source ./mssql_export_stock_inventory.sh
source ./mssql_export_stock_inventory_line.sh
