# Dokumentasi

## Setup

Setup akan menggunakan droplet pada DigitalOcean, oleh karena itu konfigurasi pada `Vagrantfile` akan berbeda. Sebelumnya harus menginstall terklebih dahulu plugin *DigitalOcean* pada Vagrant yang dapatt dilakukan dengan cara

```bash
vagrant plugin install vagrant-digitalocean
```

Agar memudahkan pengaksesan, sebaiknya kita generasi key SSH yang nantinya akan didaftarkan pada Dashboard Account di DigitalOcean. Cara generasi kuncinya sendiri seperti berikut:

```bash
ssh-keygen -t rsa
```

Nantinya, pindahkan kedua kunci tersebut ke folder root vagrant. Selain itu, tambahkan kunci publik ke dalam daftar kunci SSH di Dashboard Account pada DigitalOcean dengan nama `Vagrant`.

![]()
*Hasil sesuai dengan gambar*

Kemudian untuk konfigurasi masing-masing vm akan menjadi seperti ini

```ruby
config.vm.define "mongo-configsvr1" do |droplet|
  droplet.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = PRIVATE_KEY_PATH
    override.vm.box = 'digital_ocean'
    override.vm.box_url = DO_BOX_URL
    override.nfs.functional = false
    override.vm.allowed_synced_folder_types = :rsync
    provider.token = TOKEN
    provider.image = 'ubuntu-18-04-x64'
    provider.region = 'sgp1'
    provider.size = '1gb'
    provider.private_networking = true
  end
end
```

Hal yang perlu diperhatikan dari konfigurasi di atas adalah kita harus menghidupkan *private networking* pada droplet, mengingat nantinya antar droplet akan berkomunikasi satu sama lain.

Sedangkan untuk *environment variable* yang dipakai pada konfigurasi berupa

```ruby
DO_BOX_URL = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
PRIVATE_KEY_PATH = "./id_rsa"
TOKEN = ENV['DO_TOKEN']
```

Lakukan deployment dengan menggunakan perintah `vagrant up` kemudian diharapkan akan menghasilkan droplet di Dashboar DigitalOcean.

![]()
*Kebetulan droplet telah diprovision sebelumnya*

![]()
*Hasil yang diharapkan, sewaktu pengambilan gambar memang baru membuat tiga droplet*

Mengingat sebelumnya kita harus memakai private netowrking pada DigitalOcean maka 

