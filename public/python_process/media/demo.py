#-*- coding : utf-8 -*-
import sys
import os
import time
import multiprocessing

from db import DEMODB

nprocess = 0

def t2s(t):
    h, m, s = t.strip().split(":")
    return int(h) * 3600 + int(m) * 60 + int(s)


def division(sfilename, tmpname, tstart, tend):
    popen_str = "ffmpeg -ss %s -i %s -c copy -t %s %s" % (
        tstart, sfilename, tend, tmpname)

def db_connect():
    return DEMODB('demo', '127.0.0.1')

def video_worker(param):
    global nprocess
    nprocess += 1
    db = db_connect()
    db.change_status(param[0], 'running')

    popen_str = "ffmpeg -i ./videos/%s ./des_videos/%s" %(param[2], param[2].replace('mp4', 'wmv'))
    (si, so, se) = os.popen3(popen_str)
    db.change_status(param[0], 'complete')


def image_worker(param):
    global nprocess
    nprocess += 1
    db = db_connect()
    db.change_status(param[0], 'running')

    popen_str = "ffmpeg -i ./images/%s ./des_images/%s" % (param[2], param[2].replace('jpg', 'png'))
    (si, so, se) = os.popen3(popen_str)
    db.change_status(param[0], 'complete')


def main():
    db = db_connect()
    ncpu = multiprocessing.cpu_count()
    ncpu = ncpu - 1 if ncpu > 2 else ncpu
    global nprocess
    nprocess = ncpu

    while 1:
        div_queue = []
        rows = db.query_table()
        if rows:
            for item in rows:
                if item[-1] == 'no':
                    div_queue.append(item)
        if nprocess:
            for item in div_queue:
                nprocess -= 1
                if item[1] == 'video':
                    tmp = multiprocessing.Process(target=video_worker, args=(item,))
                    tmp.start()
                else:
                    tmp = multiprocessing.Process(target=image_worker, args=(item,))
                    tmp.start()

        time.sleep(1)
        break


if '__main__' == __name__:
    main()
    print os.getcwd()



    #mfilename = sys.argv[1]
    # eval_str = "ffmpeg -i %s 2>&1 | grep 'Duration' | cut -d ' ' -f 4 | sed s/,//" %(mfilename)os.popen3(cmd)
    # eval_str = "ffmpeg -i /Users/frank/Informations/PyProjects/video_processing/m.mp4 2>&1 | grep 'Duration' | cut -d ' ' -f 4 | sed s/,//"
    # (si,so,se) = os.popen3(eval_str)
    # res = so.readlines()[0]
    # print res
    # res = res.split('.')[0]
    # duration_sec = t2s(res)
    # rem = duration_sec % ncpu
    # rem = rem if rem else 0
    # sig_sec = (duration_sec - rem) / ncpu
    # dur_dict = {}
    # for hms in xrange(ncpu):
    #     start_t = str(datetime.timedelta(seconds=hms * sig_sec))
    #     end_t = str(datetime.timedelta(seconds=(hms + 1) * sig_sec) )
    #     dur_dict[start_t] = end_t
    # print dur_dict
