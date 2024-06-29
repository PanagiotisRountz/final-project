from flask import Flask, jsonify, request
import pypyodbc as odbc
import json
from flask_cors import CORS


app = Flask(__name__)

CORS(app)

DRIVER_NAME = 'SQL SERVER'
SERVER_NAME = 'DESKTOP-LA7AFQH\SQLEXPRESS'
DATABASE_NAME = 'FINALPROJECT'

connection_string = f"""
 DRIVER={{{DRIVER_NAME}}};
 SERVER={SERVER_NAME};
 DATABASE={DATABASE_NAME};
Trust_Connection=yes;
uid=test;
pwd=test123;
"""

def get_db_connection():
    conn = odbc.connect(connection_string)
    return conn

@app.route('/getPokemonData', methods=['GET'])
def get_pokemon_data():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    query = "SELECT * FROM Starters"
    cursor.execute(query)
    rows = cursor.fetchall()
    
    columns = [column[0] for column in cursor.description]
    results = []
    for row in rows:
        results.append(dict(zip(columns, row)))
    
    cursor.close()
    conn.close()

    results_json = json.dumps(results, indent=4)
    print(results_json)

    return jsonify(results)

@app.route('/getEvolutions', methods=['GET'])
def get_evolutions():
    pokemon_id = request.args.get('identifier')
    if not pokemon_id:
        return jsonify({"error": "Identifier is required"}), 400
    
    conn = get_db_connection()
    cursor = conn.cursor()
    
    query = """
    SELECT * FROM Evolutions
    WHERE pokemon_id = ?
    ORDER BY Stage ASC
    """

    cursor.execute(query, (pokemon_id,))
    rows = cursor.fetchall()
    
    columns = [column[0] for column in cursor.description]
    results = []
    for row in rows:
        results.append(dict(zip(columns, row)))
    
    cursor.close()
    conn.close()
    
    return jsonify(results)


@app.route('/login', methods=['POST'])
def login():
    data = request.json
    username = data.get('username')
    password = data.get('password')
    
    if not username or not password:
        return jsonify({"error": "Username and password are required"}), 400
    
    conn = get_db_connection()
    cursor = conn.cursor()
    
    query = "SELECT * FROM dbo.Login WHERE username = ? AND password = ?"
    cursor.execute(query, (username, password))
    row = cursor.fetchone()
    
    cursor.close()
    conn.close()
    
    if row:
        return jsonify({"message": "Login successful", "username": username}), 200
    else:
        return jsonify({"error": "Invalid username or password"}), 401


if __name__ == '__main__':
    app.run(debug=True)


