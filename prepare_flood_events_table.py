# # Prepare Flood Events data for DB

import os
import sys
module_path = os.path.abspath(os.path.join('..'))
if module_path not in sys.path:
    sys.path.append(module_path)
import pandas as pd
import sqlite3


# ### Read in the data

cds = pd.read_csv('input_data/STORM_data_flooded_streets_2010-2016.csv')


# ### Index by location name and subset to just columns we want

cds = cds[['location', 'event', 'eventType', 'dt']]

event_dates = cds.event.str.extract(r'(\d*/\d*/\d*)', expand=False)

event_names = cds.event.str.replace(r'(\(\d*/\d*/\d*)\)', '')

cds['event_name'] = event_names

cds['event_date'] = pd.to_datetime(event_dates)

event_date_str = cds['event_date'].dt.strftime('%Y-%m-%d').str.replace('/', '-')

cds['dt'] = pd.to_datetime(cds['dt'])

cds['dates'] = cds['dt'].dt.strftime('%Y-%m-%d')

cds['event_name'] = event_names.str.strip()+ '-' + event_date_str

del cds['event']

cds.to_csv('input_data/flood_events.csv')




