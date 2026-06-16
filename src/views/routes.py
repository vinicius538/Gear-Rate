from flask import render_template,Blueprint,request,redirect,url_for,session
from database import conectar
import pymysql

route_bp = Blueprint("route",__name__)

@route_bp.route("/")
def home():
    nome = session.get("nome")

    return render_template("index.html",nome=nome)

@route_bp.route("/perifericos")
def perifericos():
    conn = conectar()
    cursor = conn.cursor(pymysql.cursors.DictCursor)

    cursor.execute("""
    select p.per_nome,p.per_marca,p.per_imagem,r.rev_rate
    from peripherals p
    left join reviews r
    on p.per_id = r.per_id
    """)
    
    produtos=cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("periphals.html",produtos=produtos)

@route_bp.route("/sign_in", methods=["POST"])
def signin():

    nome = request.form["nome"]
    sobrenome = request.form["sobrenome"]
    email = request.form["email"]
    senha = request.form["senha"]

    conn = conectar()
    cursor = conn.cursor()

    sql = """
        INSERT INTO users (user_nome, user_sobrenome, user_email, user_senha)
        VALUES (%s, %s, %s,%s)
    """

    cursor.execute(sql, (nome, sobrenome, email, senha))
    conn.commit()

    cursor.close()
    conn.close()

    return redirect(url_for("route.home"))

@route_bp.route("/sign_in")
def signin_page():
    return render_template("create_account.html")

@route_bp.route("/login", methods=["POST"])
def login():

    email = request.form["email"]
    senha = request.form["senha"]

    conn = conectar()
    cursor = conn.cursor()

    sql = """
        SELECT *
        FROM users
        WHERE user_email = %s
        AND user_senha = %s
    """

    cursor.execute(sql, (email, senha))

    usuario = cursor.fetchone()

    cursor.close()
    conn.close()

    if usuario:

        session["user_id"] = usuario[0]
        session["nome"] = usuario[1]
        session["sobrenome"] = usuario[2]
        session["email"] = usuario[3]
        session["senha"] = usuario[4]

        return redirect(url_for("route.home"))

    return "Email ou senha incorretos"

@route_bp.route("/login", methods=["GET"])
def login_page():
    return render_template("login.html")

@route_bp.route("/ranking")
def ranking():
    conn = conectar()
    cursor = conn.cursor(pymysql.cursors.DictCursor)

    cursor.execute("""
    select p.per_nome,p.per_marca,p.per_imagem,r.rev_rate
    from peripherals p
    left join reviews r
    on p.per_id = r.per_id
    """)
    
    produtos=cursor.fetchall()

    cursor.close()
    conn.close()
    
    return render_template("ranking.html",produtos=produtos)

@route_bp.route("/periferico")
def periferico():
    return render_template("peripheral.html")

@route_bp.route("/comparacao")
def comparacao():
    return render_template("comparison.html")

@route_bp.route("/config")
def config():
    nome = session.get("nome")
    sobrenome = session.get("sobrenome")
    email = session.get("email")
    senha = session.get("senha")

    return render_template("config.html",nome=nome,sobrenome=sobrenome,email=email,senha=senha)

@route_bp.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("route.home"))

@route_bp.route("/deletar_conta")
def deletar_conta():

    user_id = session.get("user_id")

    if not user_id:
        return redirect(url_for("route.login_page"))

    conn = conectar()
    cursor = conn.cursor()

    cursor.execute(
        "DELETE FROM users WHERE user_id = %s",
        (user_id,)
    )

    conn.commit()

    cursor.close()
    conn.close()

    session.clear()

    return redirect(url_for("route.home"))

@route_bp.route("/update", methods=["POST"])
def update():

    user_id = session.get("user_id")

    if not user_id:
        return redirect(url_for("route.login_page"))

    up_nome = request.form.get("up_nome")
    up_sobrenome = request.form.get("up_sobrenome")
    up_email = request.form.get("up_email")
    up_senha = request.form.get("up_senha")

    conn = conectar()
    cursor = conn.cursor()

    if up_nome:
        cursor.execute(
            "UPDATE users SET user_nome = %s WHERE user_id = %s",
            (up_nome, user_id)
        )
        session["nome"] = up_nome

    if up_sobrenome:
        cursor.execute(
            "UPDATE users SET user_sobrenome = %s WHERE user_id = %s",
            (up_sobrenome, user_id)
        )
        session["sobrenome"] = up_sobrenome

    if up_email:
        cursor.execute(
            "UPDATE users SET user_email = %s WHERE user_id = %s",
            (up_email, user_id)
        )
        session["email"] = up_email

    if up_senha:
        cursor.execute(
            "UPDATE users SET user_senha = %s WHERE user_id = %s",
            (up_senha, user_id)
        )

    conn.commit()

    cursor.close()
    conn.close()

    return redirect(url_for("route.config"))

@route_bp.route("/update")
def update_page():
    return render_template("update.html")