#coding: utf-8
import xmlrpclib
import csv

username = "admin"
pwd = "1"
dbname = "ktv_development"

sock_common = xmlrpclib.ServerProxy("http://localhost:8069/xmlrpc/common")

uid = sock_common.login(dbname, username, pwd)

sock = xmlrpclib.ServerProxy("http://localhost:8069/xmlrpc/object")
imp_fields = []
f = open('export/product_uom.csv', 'rb')
reader = csv.reader(f, delimiter=',', quoting=csv.QUOTE_NONE)
imp_fields =  reader.next()
f.close()

handler = open('export/product_uom.csv', 'rb')
binary_data = xmlrpclib.Binary(handler.read())
handler.close()

#imp_fields =  reader.next()
imp_options = {
    'headers'   : True,
    'encoding'  : 'utf-8',
    'quoting'   : "'",
    'separator'  : ","
    }
imp_data = {
    'res_model' : 'product.uom',
    'file'      : binary_data,
    'file_name' : 'product_uom.csv',
    'file_type' : 'csv'

    }
print imp_fields
import_id = sock.execute(dbname, uid, pwd, 'base_import.import', 'create', imp_data)
#导入数据

ret = sock.execute(dbname, uid, pwd, 'base_import.import', 'do', import_id,imp_fields,imp_options)
print ret

