/*
  Pada home terdapat sebuah home_controller yang mensetting data pada tampilan home, terdapat obs sehingga kita menggunakan OBX
  nantinya dan tak lupa menggunakan rxList karena data yang disimpan merupakan list. Kita memanggil instance dari db_manager;
  
  Di dalam db_manager terdapat instansiasi instance yang bertipe databaseManager yang akan dapat digunakan oleh class lain
  namun class lain tidak dapat membuat objek baru karena menggunakan _privateConstructor, terdapat instansiasi tipe Database
  dari sqflite yang berguna untuk menyimpan data berupa SQL. Terdapat pula getter yang dapat dipanggil dengan
  instance (inilah kegunaan instance) tadi, getter ini digunakan untuk mendapatkan database dan jikalau database kosong maka
  akan dibuatkan template database dengan SQL menggunakan openDatabase oleh sqflite.
  OpenDatabase sendiri memerlukan tempat penyimpanan pada lokal sistem, jadi dibutuhkan function getApplicationDocumentsDirectory
  untuk mencarikan letak penyimpanan dan join menambahkan letak penyimpanan tadi dengan nama file database yang akan disimpan.

  Kembali kedalam home_controller, setelah mendapatkan instance tadi kita membutuhkan function getAllNotes() yang berfungsi
  mengumpulkan semua data yang ada maupun kosong. Jadi kita akan memanggil getter dari db_manager dan menyimpannya kedalam variabel
  bertipe yang sama dengan function yang akan kita panggil dengan getter yaitu .query('namaTabel'), jika variabel yang berisi
  data .query() tadi tidak kosong maka kita ubah menjadi bentuk tipedata objek yang sama dengan RxList menggunakan toJsonList lalu
  langsung saja replace variabel RxList dengan data yang telah diubah barusan. Lalu kita paksa GetX melakukan pembaruan terhadap UI-nya.

  Berlanjut kepada add_note_controller, disini kita membutuhkan fungsi addNote() untuk memproses tambah data dari input user,
  karena menggunakan input user pasti membutuhkan TextEditingController maka dari itu didalam class ini kita akan instansiasi
  variabel-variabel TexEditingController yang diperlukan untuk menyimpan input user, lalu terdapat validasi jika variabel2
  TextEditingController tidak kosong maka kita akan memasukkannya kedalam database sehingga membutuhkan instance dan getter.
  Kita memasukkan data variabel TextEditingCOntroller menggunakan function .insert() dan jangan lupa mengkonversi variabel menjadi .text
  agar berubah menjadi String. Pada akhirnya, didalam class addNote() kita membutuhkan Get.find<HomeController>().getAllNotes() untuk
  memperbarui tampilan, kode inilah yang dibutuhkan karena addNote sendiri tidak bersentuhan dengan Obs sehingga tidak akan diperbarui
  secara otomatis.
*/