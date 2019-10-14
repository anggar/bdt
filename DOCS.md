# Dokumentasi ETS BDT

## Tujuan

*Deployment* untuk sistem basis data terdistribusi menggunakan metode replikasi grup. Replikasi akan menggunakan tiga server basis data, satu *load balancer*, dan satu *server web*. 

## Desain Infrastruktur

Secara umum, desain dari infrastruktur seperti berikut.

![Skema Infrasktruktur](img/infra.png)

### Web Server

Web server yang akan digunakan adalah `apache2` untuk meladeni program yang ditulis dengan bahasa pemrograman `PHP` dan `NodeJS`. Aplikasi yang akan digunakan adalah aplikasi (*realworld*)[https://github.com/gothinkster/realworld] Pada bagian *backend* akan menggunakan *framework* Laravel, sedangkan untuk antarmuka akan menggunakan *framework* Svelte dengan NodeJS sebagai *runtime*.

### Load Balancer

Pembagi beban atau *load balancer* akan menggunakan HAProxy. Perbedaan umum 

### Database Server

Peladen basis data akan menggunakan MySQL dengan skema replikasi grup.

## Deployment

### Vagrant

*Provisioning* akan dibantu menggunakan perangkat lunak Vagrant. Vagrant akan membangun mesin virtual *(vm)* sesuai dengan konfigurasi yang ada di `Vagrantfile`. Dalam kasus ini, *box* yang akan digunakan adalah `bento/ubuntu-16.04`.

### DB Server

Untuk melakukan replikasi grup, kita memerlukan UUID yang dapat kita peroleh melalui command `uuidgen`. 