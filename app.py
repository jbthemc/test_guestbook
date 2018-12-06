import os

from flask import Flask
from Guestbook import home_api, submit_api, visitors_api
from extensions import mysql


app = Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = os.getenv('MYSQL_DATABASE_USER')
app.config['MYSQL_DATABASE_PASSWORD'] = os.getenv('MYSQL_DATABASE_PASSWORD')
app.config['MYSQL_DATABASE_DB'] = os.getenv('MYSQL_DATABASE_DB')
app.config['MYSQL_DATABASE_HOST'] = os.getenv('MYSQL_DATABASE_HOST')

mysql.init_app(app)

app.register_blueprint(home_api)
app.register_blueprint(submit_api)
app.register_blueprint(visitors_api)


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)

