#! /usr/bin/python
import wget

print('Beginning file download with wget module')

url = 'https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite'
wget.download(url, '/home/carlos88/output_hydrology/')
