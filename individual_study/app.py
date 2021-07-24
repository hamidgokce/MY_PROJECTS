from flask import Flask # flask framework icerisindeki flask sinifini dahil etme

app = Flask (__name__) # flask sinifindan bir tane nesne olusturuyoruz / name ile pythondaki ozel bir degiskeni gonderiyoruz
# Bir tane uygulama olusturduk ve asagidaki satirda da onu calistiracagiz

# url yi belirtmemiz gerekmektedir. Yani x url dondugunde y response donmesi gerekmektediri belirtecegiz.
@app.route('/') # pythonda decorator yapilari mevcut fonksiyondan once gelmektedir. app.route seklinde bir decorator
# yazacagiz. Kok dizine yani / a erisirse bir tane fonksiyon calistirmasini soyleyecegiz
def index(): # fonksiyon ismi her sey olabilir
    return 'Anasayfa' # / seklinde bir request gelirse index fonksiyonunu calistiracagiz. Index fonksiyonunundan HTTP response
# dondurmeye calisacagiz. (string, html template olabilir.)

@app.route('/search') # yeni bir url tanimlamis olduk
def search():
    return 'Search Page'

@app.route('/delete/item') # yeni bir url tanimlamis olduk
def delete():
    return 'Delete Item'

# Dinamik url yapilarini nasil ortaya cikaracagiz? ==> item in her seferinde degisebilecegini dusunelim
@app.route('/delete/<string:id>') # string seklinde id degeri gelebilir diyoruz
def dinamik_url (id): # yukaridaki id degerini yazacagiz
    return 'id : ' + id 



if __name__ == '__main__': # yukarida tanimlanan name degiskeninin main olup olmadigini kontrol etmemiz gerekmektedir.
# Bu dosya direk terminalden mi calistirilmis seklinde kontrol ediyoruz.
    app.run(debug = True) # app.run ile web sunucumuzu calistirmis oluyoruz.  Biz gelistirme ortaminda isek
    # debug = True olarak tanimlamamiz gerekmektedir. Herhangi bir hata varsa web sitesinde bize ayrintiyi belirtir.
    # debug = True ile her degisiklik yenilenir ve sayfaya kaydedilir, yeni sonuc aliriz 
    # Asagida cikan localhost:5000 yazarsak url sonucunu alabiliriz. 