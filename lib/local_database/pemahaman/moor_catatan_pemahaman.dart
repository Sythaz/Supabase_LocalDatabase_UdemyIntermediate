/*
Didalam DatabaseManager terdapat class 'Notes' yang extends Table, karena moor/drift sendiri tidak menggunakan sql. Kita membutuhkan id yang autoIncrement
dan dapat kosong, title dan desc. Dibawah class pertama ini terdapat @UseMoor sebagai acuan build_runner. Class kedua yang extends class dari g.dart
yang didapatkan dari build_runner build, didalam class DatabaseManager ini terdapat constructor yang yang mengirimkan parameter executor yang berguna
untuk menentukan path, tak lupa dengan schemaVersion. Terdapat juga function CRUD didalamnya, mulai dari Read yang menggunakan select,
Create menggunakan into, Update menggunakan update dan Delete menggunakan delete.

Pada MainPage terdapat instansiasi2 Get.put dari controller page, karena menggunakan Get kita menggunakan GetMaterialApp() dan
getPages untuk memudahkan pergantian halaman. Didalam body memilih menggunakan StreamBuilder karena didalam DatabaseManager menggunakan
stream.watch sehingga stream dapat memanggil streamAllNote yang berupa watch tadi. Terdapat validasi apakah snapshot memiliki data jika
tidak maka menampilkan tidak ada data dan jika ada akan tampak beberapa ListTile yang memiliki logo nomor id, judul, deskripsi dan
tombol hapus di samping kiri untuk menghapus. Jika ListTile di klik akan berpindah halaman ke EditNote

Di page lain jika ingin menggunakan DatabaseManager dapat menggunakan instance yang berada di HomeController dengan mengetikkan
Get.find(). Untuk memanggil fungsi CRUD dapat langsung dipanggil dan menyertakan data pada parameternya, Get.back maupun clear juga
berada di tempat yang sama dengan fungsi dipanggil.

Didalam class controller hanya terdapat TextEditingController maupun isLoading.
*/