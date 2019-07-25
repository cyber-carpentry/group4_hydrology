import urllib2

filedata = urllib2.urlopen('https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite')
datatowrite = filedata.read()
 
with open('/home/carlos88/output_hydrology/data.sqlite', 'wb') as f:
    f.write(datatowrite)

