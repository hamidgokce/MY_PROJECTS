from flask import Flask, render_template, request

app = Flask(__name__)
@app.route("/")
def index():
    return render_template("index.html")

@app.route("/toplam", methods = ['GET', 'POST']) # bir sayfada get ve post request olacaksa bunu mutlaka belirtmek gerekmektedir.
def toplam(): # requestimizin get mi post mu oldugunu anlamaya calisacagiz
    if request.method == 'POST':  
        number1 = request.form.get('number1') # bize gelecek olan degiskendeki degerleri request.form ile alabiliriz.
        number2 = request.form.get('number2')
        return render_template("number.html", total = int(number1) + int(number2))
    else:
        return render_template('number.html')


if __name__ == '__main__':
    app.run(debug=True)