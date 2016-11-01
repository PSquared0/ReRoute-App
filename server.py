"""Bus Ratings."""

from jinja2 import StrictUndefined

from flask import Flask, jsonify,render_template, redirect, request, flash, session
from flask_debugtoolbar import DebugToolbarExtension

from model import Bus, Rating, User, Bus_filter, Filter, connect_to_db, db


app = Flask(__name__)

app.secret_key = "ABC"

app.jinja_env.undefined = StrictUndefined







if __name__ == "__main__":
 
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)


    
    app.run(port=5000)

