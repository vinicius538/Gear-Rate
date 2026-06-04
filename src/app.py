from flask import Flask
from views.routes import route_bp

app = Flask(__name__)

app.secret_key = "1234567890qwertyuiopasdfghjklçzxcvbnm"

app.register_blueprint(route_bp)

if __name__ =="__main__":
    app.run(debug=True)