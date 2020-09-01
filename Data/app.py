#!/usr/bin/env python
# coding: utf-8

# In[1]:


import datetime as dt
import numpy as np
import pandas as pdimport
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func, inspect, MetaData, Table, Column
from flask import Flask, jsonify


# In[7]:


# !pip install psycopg2
# db Setup
engine = create_engine("postgres://nczozxhlrcyoqp:e50ab3fc6da28bf87e8e09a08841defd50a1ed73eb74febe6fcf02a24c9688e0@ec2-50-17-178-87.compute-1.amazonaws.com:5432/daq2j0ovj687mc")
base = automap_base()
base.prepare(engine, reflect=True)
session = Session(engine)


fire_table = base.classes.fires_2013_2017


# In[8]:


# flask setup
app = Flask(__name__)


# In[ ]:


#############################################
# /api/v1.0/interactive_pie
#############################################
def interactive_pie(fire_cause,st,year):
    session = Session(engine)

           
@app.route("/")
def welcome():
    return("Available Routes:<br/> /api/v1.0/interactive_pie/<fire_cause>/<st>/<year>")

@app.route("/api/v1.0/interactive_pie/<st>/<year>")
def interactive_pie(st, year):
    session = Session(engine)  
    pie_results = session.query(fire_table.cause1, fire_table.cause2, fire_table.st, fire_table.year)\
    .filter(fire_table.st == st)\
    .filter(fire_table.year == year).all()
        #.filter(fire_table.cause1 == cause1)\
    #.filter(fire_table.cause2 == cause2)\
    
    session.close()
    
    pie_string = []
    for cause1, cause2, st, year in pie_results:
        pie_data_dict = {}
        pie_data_dict["cause1"] = cause1
        pie_data_dict["cause2"] = cause2
        pie_data_dict["st"] = st
        pie_data_dict["year"] = year
        pie_string.append(pie_data_dict)
    return jsonify(pie_string)

if __name__ == '__main__':
    app.run(debug=False)


# In[ ]:


#############################################
# /api/v1.0/tobs
#############################################

# @app.route("/api/v1.0/tobs")
# def tobs():
#     session = Session(engine)
    
#     #Define One year ago
#     one_yr_ago = dt.date(2017,8,23) - dt.timedelta(days = 365)
    
#     #Define most active station
#     most_active_st = session.query(measurement.station, func.count(measurement.station)).group_by(measurement.station)\
#                                                     .order_by(func.count(measurement.station).desc()).limit(1).all()

#     #Generate results
#     tobs_results = session.query(measurement.date, measurement.tobs).filter(measurement.station == most_active_st[0][0]).filter(measurement.date >= one_yr_ago).all()
    
#     most_active_tobs_oneYear = []
#     for date, tobs in tobs_results:
#         tobs_data_dict = {}
#         tobs_data_dict["date"] = date
#         tobs_data_dict["tobs"] = tobs
#         most_active_tobs_oneYear.append(tobs_data_dict)
#     return jsonify(most_active_tobs_oneYear)


# In[ ]:


#############################################
# /api/v1.0/<start>/<end>
#############################################

# @app.route("/api/v1.0/<start>/<end>")
# def start_and_end(start,end):
#     session = Session(engine)
    
#     date_tobs = session.query(func.min(measurement.tobs),func.avg(measurement.tobs),func.max(measurement.tobs)).filter(measurement.date >= start).filter(measurement.date <= end).all()  
                                              
    
#     return jsonify(date_tobs)
# if __name__ == '__main__':
#     app.run(debug=False)

