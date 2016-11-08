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


@app.route('/bus_detail', methods=['GET'])
def bus_list():
    """Bus detail page. Allows users to submit rating if logged in"""

    

    info = request.args.get('bus')
    bus_info = Bus.query.get(info)

    user_id = session.get("user_id")

    bus_dict = {'code': bus_info.bus_code, 
                'name': bus_info.bus_name,
                'lname': bus_info.bus_lname,
                'city': bus_info.city}

    rated_bus = bus_dict.get('name')

    session['bus_dict'] = bus_dict

    rating = Rating.query.filter_by(
            bus_code=rated_bus, user_id=user_id).first()



   



    return render_template("bus_detail.html", info=bus_info, rating=rating)



@app.route('/register', methods=['GET'])
def register_form():
    """Show form for user signup."""

    return render_template("sign_in_form.html") 



@app.route('/register', methods=['POST'])
def sign_up():
    """Sign up page."""

    email = request.form["email"]
    password = request.form["password"]
    fname = request.form["first_name"]
    lname = request.form["last_name"]

    new_user = User(email=email, password=password, 
                fname=fname, lname=lname)

    db.session.add(new_user)
    db.session.commit()

    flash("User %s added." % fname)

    return redirect("/")
    return render_template("homepage.html")


@app.route('/login', methods=['GET'])
def login():
    """Show login form."""



    return render_template("log_in_form.html")


@app.route('/login', methods=['POST'])
def login_process():
    """Process login."""

    
    email = request.form["email"]
    password = request.form["password"]

    user = User.query.filter_by(email=email).first()

    if not user:
        flash("No such user")
        return redirect("/register")

    if user.password != password:
        flash("Incorrect password")
        return redirect("/login")

    session["user_id"] = user.user_id

    flash("Logged in")
    return redirect("/")
    return render_template("homepage.html")



@app.route('/logout')
def logout_process():
    """Log out"""

    del session["user_id"]
    flash("Logged Out.")
    return redirect("/")



@app.route('/ratings', methods=['GET'])
def rate():
    """Show rating page"""

    bus_dict = session.get('bus_dict')
    rated_bus = bus_dict.get('name')
    user_id = session.get("user_id")


    if user_id:
        user_rating = Rating.query.filter_by(
            bus_code=rated_bus, user_id=user_id).first()

    else:
        user_rating = None

    return render_template("ratings.html",
                           rated_bus=rated_bus,
                           user_rating=user_rating)




@app.route('/ratings', methods=['POST'])
def rate_process():
    """Submit Ratings."""

    user_id = session.get("user_id")
    bus_dict = session.get('bus_dict')
    print "who is the user" 
    print user_id

    rated_bus = bus_dict.get('name')


    if user_id:
        user_rating = Rating.query.filter_by(
            bus_code=rated_bus, user_id=user_id).first()

    else:
        user_rating = None

    filters = request.form.getlist("filters")

    
    comments = request.form["comments"]
    score = request.form["rating"]

    comment_info = Rating(comments=comments, rating=score, user_id=user_id, bus_code=rated_bus)


    for item in filters:
        bus_filter = Bus_filter(filter_code=item, user_id=user_id, bus_code=rated_bus)
        db.session.add(bus_filter)
    

    db.session.add(comment_info)
    db.session.commit()

    return redirect("/bus_detail" + "?bus=" + rated_bus)






if __name__ == "__main__":
 
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)


    
    app.run(port=5000, host="0.0.0.0")

