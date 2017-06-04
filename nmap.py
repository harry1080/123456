#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Tren
import re
import os
import urllib2
import threading
import nmap
import re

def nmapscan():
    f = open('nmap.txt','w')
    ip = open('test.txt','r')
    nm = nmap.PortScanner()
    for nma in ip:
        nm.scan(nma,arguments='=--open')
        for host in nm.all_hosts():
            for proto in nm[host].all_protocols():
                lport = nm[host][proto].keys()
                lport.sort()
                for port in lport:
                    s = ('%s%s%s%s' % (host,':',port,nm[host][proto][port]['state']))
                    f.write(s.replace('open','\n').replace('filtered','\n'))
                    print s.replace('open','').replace('filtered','')


def main():
    threads = []
    t = threading.Thread(target=nmapscan)
    threads.append(t)
    for tt in threads:
        tt.start()
    tt.join()

if __name__ == '__main__':
    main()