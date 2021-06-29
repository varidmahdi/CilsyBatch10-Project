Referensi: https://www.digitalocean.com/community/tutorials/how-to-install-and-set-up-laravel-with-docker-compose-on-ubuntu-20-04-id

## Cara running laravel app

### build image:

```
$ docker-compose build app
```

### menjalankan container:

```
docker-compose up -d
```

### cek container yang berjalan:

```
docker-compose ps
```

### menginstall depensesi

```
docker-compose exec app composer install
```

### generate key untuk sesi pengguna

```
docker-compose exec app php artisan key:generate
```
