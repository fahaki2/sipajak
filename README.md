## Installation
Requires :
- java
- postgressql

Terdapat 3 aplikasi dan 1 folder static.
- SSO 		-> 	ssoApp
- Portal 	-> 	portalApp
- Admin 	->	adminApp
- Static    ->	static (berisi assets dan content yang digunakan oleh 3 aplikasi tsb).

Langkah untuk menjalankan aplikasi:
```sh
- buat database dengan nama oauthdb pada postgressql.
- import database pada file public.sql ke oauthdb.
- sesuaikan setting database pada file application.yml masing2 aplikasi.  
- copy folder static ke /opt/static, atau ubah path directory yang mengarah ke static pada file application.yml masing2 aplikasi.
- sesuaikan setting email (smtp) pada ssoApp dan adminApp yang terdapat pada tiap application.yml.
- jalankan masing2 run.sh.
- cek pada folder console untuk melihat hasil running aplikasi.
```

Default url :
Portal
```sh
http://localhost:8080/
```
SSO
```sh
http://localhost:9191/
```
Admin
```sh
http://localhost:8081/
```