from flask import Flask, request, redirect, render_template_string
import psycopg2
import os

app = Flask(__name__)

conn = psycopg2.connect(
    host=os.environ.get("DB_HOST"),
    database=os.environ.get("DB_NAME"),
    user=os.environ.get("DB_USER"),
    password=os.environ.get("DB_PASS")
)

cur = conn.cursor()
cur.execute("CREATE TABLE IF NOT EXISTS tasks (id SERIAL PRIMARY KEY, content TEXT);")
conn.commit()

HTML_TEMPLATE = """
<!doctype html>
<title>Todo App</title>
<h1>Simple Cloud ToDo App</h1>
<form method=post>
  <input name=content>
  <input type=submit value=Add>
</form>
<ul>
  {% for task in tasks %}
    <li>{{ task[1] }} <a href="/delete/{{ task[0] }}">❌</a></li>
  {% endfor %}
</ul>
"""

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        content = request.form["content"]
        cur.execute("INSERT INTO tasks (content) VALUES (%s)", (content,))
        conn.commit()
        return redirect("/")
    
    cur.execute("SELECT * FROM tasks")
    tasks = cur.fetchall()
    return render_template_string(HTML_TEMPLATE, tasks=tasks)

@app.route("/delete/<int:task_id>")
def delete(task_id):
    cur.execute("DELETE FROM tasks WHERE id = %s", (task_id,))
    conn.commit()
    return redirect("/")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
