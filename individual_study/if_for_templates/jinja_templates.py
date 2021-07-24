from flask import Flask, render_template 

app = Flask (__name__)
@app.route('/')
def index():
    numbers = [1,2,3,4,5,6,7,8,9,0]
    return render_template('for.html', numbers = numbers)
if __name__ == '__main__':
    app.run(debug = True)
