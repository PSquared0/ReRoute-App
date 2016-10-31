
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


##############################################################################
# Model definitions

class Bus(db.Model):
    """Muni bus lines"""
    __tablename__ = "buses"

    bus_code = db.Column(db.String(5) primary_key=True)
    city = db.Column(db.String(5) primary_key=True)
    bus_name = db.column(db.String(40), nullable=False)
    bus_lname = db.column(db.String(40), nullable=False)

    def __repr__(self):
        """info dispalyed when printed"""
        return '\n<Bus Code: =%s Bus Line: =%s Bus Route: =%s>' % (self.bus_code, self.bus_name, self.bus_lname)

class Rating(db.Model):
    """Bus ratings"""
    __tablename__ = "ratings"

    rating_id = db.Column(db.Integer, autoincrement-True, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    bus_code = db.Column(db.Integer, db.ForeignKey('bus.bus_code'))
    rating = db.Column(db.Integer)
    comments = db.Column(db.String(140), nullable=True)


    def __repr__(self):
            """info dispalyed when printed"""
            return '\n<Rating ID: =%s User ID: =%s Bus Code: =%s Rating: =%s Comments: =%s>' % (self.rating_id, self.user_id, self.bus_code, self.rating, self.comments)


class User(db.Model):
    """User table"""
    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement-True, primary_key=True)
    email = db.Column(db.String(64), nullable=True)
    password = db.Column(db.String(64), nullable=True)
    fname = db.Column(db.String(64), nullable=True)
    lname = db.Column(db.String(64), nullable=True)

    def __repr__(self):
            """info dispalyed when printed"""
            return '\n<User ID: =%s Email: =%s Password: =%s First Name: =%s Last Name: =%s>' % (self.user_id, self.email, self.password, self.fname, self.lname)


class Bus_filter(db.Model):
    """Associative table for Bus and Filter"""
    __tablename__ = "bus_filters"

    bus_filer_id = db.Column(db.Integer primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    bus_code = db.Column(db.Integer, db.ForeignKey('bus.bus_code'))
    filter_code = db.Column(db.String(5), db.ForeignKey('users.user_id'))

    def __repr__(self):
        """info dispalyed when printed"""
        return '\n<Bus Filter ID: =%s User Id: =%s Bus Code: =%s Filter Code: =%s>' % (self.bus_filer_id, self.user_id, self.bus_code, self.filter_code)


class Filter(db.Model):
    """Associative table for Bus and Filter"""
    __tablename__ = "filters"

    filter_code = db.Column(db.String(5)primary_key=True)
    filter_name = db.Column(db.String(40))

    def __repr__(self):
        """info dispalyed when printed"""
        return '\n<Filter Code: =%s Filter Name: =%s>' % (self.filter_code, self.filter_name)



##############################################################################
# Helper functions

def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our PstgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///ratings'
    app.config['SQLALCHEMY_ECHO'] = True
    db.app = app
    db.init_app(app)

    db.create_all()


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
