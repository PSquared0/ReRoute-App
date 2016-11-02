""" Reroute Project Tracker
A front-end for a databse that works with the ReRoute database
"""

from flask import Flask
from model import Bus, Rating, User, Bus_filter, Filter, db, connect_to_db

app = Flask(__name__)



def get_bus_list():
    """Gets list of buses from database"""

    buses = db.session.query(Bus.bus_name).all()
    print buses
   
    return buses 

def get_bus_details():
    """Shows ratings for bus"""

    bus_detail = db.session.query(Bus).get('5')
    print bus_detail
   
    return bus_detail







if __name__ == "__main__":
    
    connect_to_db(app)

    # closing our database connection

    db.session.close()