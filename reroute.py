""" Reroute Project Tracker
A front-end for a databse that works with the ReRoute database
"""

from flask import Flask,request
from model import Bus, Rating, User, Bus_filter, Filter, db, connect_to_db
from bs4 import BeautifulSoup
import requests


app = Flask(__name__)



def get_bus_list():
	"""Gets list of buses from database"""

	buses = db.session.query(Bus.bus_name).all()

   
	return buses 

def get_bus_details():
	"""Shows ratings for bus"""

	bus_detail = db.session.query(Bus.bus_name == (Bus.bus_name)).one()

   
	return bus_detail


def get_stop_info(stops):
	"""Shows info per bus stop"""
	api_url = 'http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=sf-muni&stopId='
	"""Stop_dict = {bus_name:'38',
					minutes: 7,
					stop_location: 'Geary & Leavenworth'}"""
	for stop in stops:
		url = api_url + str(stop)
	return url


def send_api(url):
	response = requests.get(url)
	unparsed_xml = response.text
	xml = BeautifulSoup(unparsed_xml, 'xml')

	
	return xml


def get_info(xml):

	xml_infos = xml.find_all('predictions')

	for xml_info in xml_infos:
		info = xml_info['routeTag']
		info1 = xml_info['minutes']
		info2 = xml_info['title']
		print 'route'
		print info
		print 'mintues'
		print info1
		print 'title'
		print info2



   # return bus_name, minutes, stop_location







if __name__ == "__main__":
	
	connect_to_db(app)

	# closing our database connection

	db.session.close()