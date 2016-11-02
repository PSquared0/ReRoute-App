"""Bus Ratings."""

from jinja2 import StrictUndefined

from flask import Flask, jsonify,render_template, redirect, request, flash, session
from flask_debugtoolbar import DebugToolbarExtension

from model import Bus, Rating, User, Bus_filter, Filter, connect_to_db, db
import reroute


app = Flask(__name__)

app.secret_key = "ABC"

app.jinja_env.undefined = StrictUndefined


@app.route('/')
def index():
    """Homepage"""

    buses = reroute.get_bus_list()
    html = render_template("homepage.html",
                        buses=buses)
    return html

@app.route('/homepage.html?Bus=<buses>')
def bus_detail():
    """Bus rating page. Allows users to submit rating if logged in"""

    buses = db.session.query(Bus).get(bus_code)

    print buses

    return render_template("bus_detail.html",
                        buses=buses)





# @app.route('/register', methods=['POST'])
# def register_process():
#     """Sign in Page."""

#     email = request.form["email"]
#     password = request.form["password"]
#     fname = (request.form["firstname"])
#     lname = request.form["lastname"]

#     new_user = User(email=email, password=password, fname=fname, lname=lname)

#     db.session.add(new_user)
#     db.session.commit()

#     flash("User %s added." % email)
#     # return redirect("/users/%s" % new_user.user_id)






if __name__ == "__main__":
 
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)


    
    app.run(port=5000, host="0.0.0.0")

