from flask import Flask, jsonify, request, abort
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# MySQL connection config
db_config = {
    'host': 'localhost',
    'user': 'bob',
    'password': 'Th1s!stw1lv!',
    'database': 'The_Joy_Of_Painting'
}


def get_db_connection():
    try:
        connection = mysql.connector.connect(**db_config)
        return connection
    except Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None


@app.route('/episodes/<episode_code>', methods=['GET'])
def get_episode(episode_code):
    connection = get_db_connection()
    if connection is None:
        abort(500, description="Database connection error")

    cursor = connection.cursor(dictionary=True)
    query = "SELECT * FROM episodes WHERE episode_code = %s"
    cursor.execute(query, (episode_code,))
    episode = cursor.fetchone()

    cursor.close()
    connection.close()

    if episode is None:
        return jsonify({"message": "Episode not found"}), 404

    return jsonify(episode)


@app.route('/episodes', methods=['GET'])
def get_all_episodes():
    connection = get_db_connection()
    if connection is None:
        abort(500, description="Database connection error")

    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM episodes")
    episodes = cursor.fetchall()

    cursor.close()
    connection.close()

    return jsonify(episodes)


if __name__ == '__main__':
    app.run(debug=True, port=5000)
