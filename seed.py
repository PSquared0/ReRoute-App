"""Utility file to seed buses database from MovieLens data in seed_data/"""

from sqlalchemy import func
from model import Bus
# from model import Bus

from model import connect_to_db, db
from server import app


def load_routes():
    """Loading bus routes into database"""

    print "Buses"

    # Read the routes.text file to 

    Bus.query.delete()
    for row in open("seed_data/routes.txt"):
        row = row.rstrip()
        bus_code, city, bus_name, bus_lname = row.split(",")[:4]

        bus = Bus(bus_code=bus_code, city=city, bus_name=bus_name, bus_lname=bus_lname)
        print bus



        db.session.add(bus)

    db.session.commit()







def set_val_user_id():
    """Set value for the next user_id after seeding database"""

    # Get the Max user_id in the database
    result = db.session.query(func.max(User.user_id)).one()
    max_id = int(result[0])

    # Set the value for the next user_id to be max_id + 1
    query = "SELECT setval('users_user_id_seq', :new_id)"
    db.session.execute(query, {'new_id': max_id + 1})
    db.session.commit()

if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_routes()
