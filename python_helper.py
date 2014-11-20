#coding: utf-8
import datetime
import xmlrpclib
import csv

def get_internal_id(sock,dbname,uid,pwd,external_id):
    '''
    从外部id获取内部id
    '''
    data_ids = sock.execute(dbname, uid, pwd, 'ir.model.data', 'search', [('name','ilike',external_id)])
    return_ids = data_ids and sock.execute(dbname, uid, pwd, 'ir.model.data', 'read', [data_ids[-1]],['res_id'])
    res_id  = return_ids and return_ids[0]['res_id'] 
    return res_id

def do_import(sock,dbname,uid,pwd,osv_name,import_file):
    '''
    导入csv文件
    '''
    imp_fields = []
    f = open(import_file, 'rb')
    reader = csv.reader(f, delimiter=',', quoting=csv.QUOTE_NONE)
    imp_fields =  reader.next()
    f.close()

    handler = open(import_file, 'rb')
    binary_data = xmlrpclib.Binary(handler.read())
    handler.close()

    imp_options = {
        'headers'   : True,
        'encoding'  : 'utf-8',
        'quoting'   : "'",
        'separator'  : ","
        }
    imp_data = {
        'res_model' : osv_name,
        'file'      : binary_data,
        'file_name' : import_file,
        'file_type' : 'csv'
    }
    print "importing: %s" % import_file
    print imp_fields
    import_id = sock.execute(dbname, uid, pwd, 'base_import.import', 'create', imp_data)

    ret = sock.execute(dbname, uid, pwd, 'base_import.import', 'do', import_id,imp_fields,imp_options)
