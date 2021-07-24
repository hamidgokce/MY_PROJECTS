# Flask ve Jango da ortak kullanilan templates yapisini gorecegiz. 
# Templates icerisinde html/css ve python yapilarimizi kullanabiliyoruz 
# py dosyasi ile ayni dizinde flask dosyasinin bizden istedigi sekilde teplates klasoru olusturmamiz gerekmektedir.
# Dosya isminin templates olmasi onemli cunku flask otomatik olarak html dosyalarini templates klasoru icerisinde ariyor

from flask import Flask, render_template # ==> html (jinja 2) templatelerimizi aliyor ve response olarak donmemize imkan sagliyor


app = Flask (__name__)
@app.route('/')
def index():
    return render_template('index.html', number = 10, number2 = 20 ) # bir onceki derste response olarak sadece string donduk, fakat response olarak
# html sayfasi da donebiliriz.
# Sonradan girdigimiz number = 10 html sayfamiza gidecek ve bunu kullanmak icin de html dosyasinda python kodunu calistirabilecek
# sekilde deger girmemiz gerekmektedir 

if __name__ == '__main__':
    app.run(debug = True)
