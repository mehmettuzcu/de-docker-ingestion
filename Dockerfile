# Base imaj olarak python resmi imajını kullanıyoruz.
FROM python:3.9

# Uygulama depolarından mevcut paketlerin en son listesini çekip güncelliyoruz.
# RUN apt-get update -y

# Uygulama için gerekli olan kütüphaneleri indiriyoruz.

RUN apt-get update -y && \
    pip install numpy && \
    pip install sqlalchemy && \
    pip install pandas && \
    pip install psycopg2-binary

# app klasörünün içerisine geçiyoruz.
RUN mkdir /app

WORKDIR /app

# main klasörünün içerisindeki dosyaları app klasörüne kopyalıyoruz.
COPY . /app

# Bu imajdan container yaratıldığı zaman çalışmasını istediğimiz komutu buraya giriyoruz
CMD ["python3", "main.py"]