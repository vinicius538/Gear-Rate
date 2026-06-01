from flask import Flask
from flask import render_template,Blueprint

route_bp = Blueprint("route",__name__)

@route_bp.route("/")
def home():
    return render_template("index.html")

@route_bp.route("/perifericos")
def perifericos():
    return render_template("periphals.html")

@route_bp.route("/sign_in")
def signin():
    return render_template("create_account.html")

@route_bp.route("/ranking")
def ranking():
    return render_template("ranking.html")

@route_bp.route("/periferico")
def periferico():
    return render_template("peripheral.html")

@route_bp.route("/comparacao")
def comparacao():
    return render_template("comparison.html")