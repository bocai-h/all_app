# -*- coding : utf-8 -*-
import MySQLdb

class DEMODB(object):
    dbconn = None
    dbcur = None

    def __init__(self, db_name, host_ip):
        # type: () -> object
        self.dbconn = MySQLdb.connect(
            host=host_ip, user='root', passwd='root', port=3306, charset = 'utf8')

        self.dbcur = self.dbconn.cursor()
        self.dbconn.select_db(db_name)

    def __del__(self):
        if self.dbcur and self.dbconn:
            self.dbcur.close()
            self.dbconn.close()

    def query_table(self):
        self.dbcur.execute("SELECT id, type, name, status FROM media;")
        logs = self.dbcur.fetchall()
        return logs

    def change_status(self,tmpid, tmpstatus):
        execute_sql = "UPDATE media SET status='%s' WHERE id=%s;" % (tmpstatus, tmpid)
        print execute_sql
        self.dbcur.execute(execute_sql)
        self.dbconn.commit()

    # def update_path(self, tmpid, status_val, des_path):
    #     self.dbcur.execute(
    #         "UPDATE media SET status='%s', des_path='%s' WHERE id=%s;" % (status_val, des_path, tmpid))
    #     self.dbconn.commit()