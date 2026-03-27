## Proses Pengerjaan Level Latihan Mandiri

### Membuat Scene Level 2
Pada pengerjaan Level 2, langkah pertama yang dilakukan adalah membuat scene baru bernama `Level2.tscn`. Setelah itu, node `Player` dari scene yang sudah ada ditambahkan ke dalam scene ini. Posisi awal `Player` juga diatur agar sesuai dengan desain level yang direncanakan.

### Membuat TileMap
Selanjutnya, sebuah `TileMapLayer` ditambahkan untuk membangun struktur level. Tileset yang digunakan berasal dari `spritesheet_gr_grass.png`, dengan ukuran tile yang diatur menjadi 128x128 pixel. Collision juga ditambahkan pada tile agar tile bisa berinteraksi dengan `Player`.

### Membuat AreaTrigger untuk Win dan Lose
Untuk membuat kondisi menang dan kalah, dua area khusus ditambahkan. Area menang direpresentasikan dengan node `Sprite2D` bernama `WinArea`, sedangkan area kalah menggunakan node `Sprite2D` bernama `LoseArea`. Masing-masing area dilengkapi dengan node `AreaTrigger`. Properti `sceneName` pada `AreaTrigger` diatur agar `WinArea` mengarahkan ke `WinScreen` dan `LoseArea` mengarahkan ke `LoseScreen`. Posisi dan skala `LoseArea` juga disesuaikan agar mencakup area jatuh.

### Membuat Obstacle
Obstacle pada level ini menggunakan scene `Slime.tscn`. Collider ditambahkan pada obstacle untuk mendeteksi tabrakan dengan `Player`.

### Membuat Spawner
Untuk menambahkan dinamika pada level, sebuah node `Spawner` ditambahkan. Script `spawner.gd` ditempelkan pada node ini, dan properti `obstacle` diatur untuk menggunakan scene `Slime`. Spawner ditempatkan di atas level agar dapat menjatuhkan obstacle secara periodik.

### Mengedit Script Menang di Level 1
Terakhir, script pada `AreaTrigger` di Level 1 diedit agar mengarahkan ke `Level2` setelah pemain berhasil menyelesaikan level tersebut. Logika tambahan juga ditambahkan untuk memastikan transisi antar level berjalan lancar tanpa error.

## Proses Pengerjaan Tutorial 6

### 1. Membuat Layar Menu Utama (Main Menu)
Pembuatan layar menu utama dilakukan dengan membuat scene baru `MainMenu.tscn` berbasis `MarginContainer`. Elemen antarmuka disusun secara terstruktur menggunakan `HBoxContainer`, `VBoxContainer`, dan `CenterContainer` untuk meletakkan judul permainan, tombol navigasi ("New Game" dan "Stage Select"), serta gambar pendukung. Teks diformat menggunakan font kustom. Interaksi diimplementasikan melalui script pada `LinkButton` yang memanfaatkan fungsi `get_tree().change_scene_to_file()` untuk berpindah ke scene tujuan.

### 2. Membuat Indikator Nyawa (Life Counter)
Sistem nyawa dibuat menggunakan **Global Variable**. Sebuah script `Global.gd` dibuat dan didaftarkan sebagai Autoload/Singleton di Project Settings agar variabel `lives` tidak ter-reset saat scene diulang. Selanjutnya, scene GUI `Life Counter.tscn` berisi `Label` selalu memperbarui teksnya di dalam fungsi `_process()`. Scene GUI ini dipasang sebagai *child* dari `CanvasLayer` pada level agar posisinya mengikuti pinggiran layar dengan baik. Script rintangan jatuh juga diperbarui untuk mengurangi `Global.lives` sebesar 1 poin setiap kali mendeteksi sentuhan dari `Player`.

### 3. Membuat Layar Kalah (Game Over Screen)
Layar `GameOver.tscn` (LoseScreen) dibangun dengan node dasar `ColorRect` untuk mengisi seluruh layar (Full Rect) dengan latar warna yang disesuaikan. Label teks besar "GAME OVER" ditempatkan secara terpusat di layar. Pada logika script, jika `Global.lives` yang sebelumnya dikurangi menyentuh angka 0, permainan akan diarahkan ke layar Game Over ini menggunakan `call_deferred("change_scene_to_file", "...")`. 

### 4. Latihan Mandiri: Fitur Tombol Game Over & Select Stage
Latihan mandiri dikerjakan dengan memperluas fitur navigasi antar scene di dalam game:
- **Tombol Retry & Main Menu di Layar Game Over**: 
  - **Main Menu**: Membuat node `LinkButton` bertuliskan "Main Menu" lalu mengekspor nilai `scene_to_load` menjadi "MainMenu". Sinyal `pressed()` disambungkan pada node itu sendiri ke method `_on_New_Game_pressed()` dengan tepat, sehingga ketika diklik pemain akan teredireksi secara mulus kembali ke layar awal permainan.
  - **Retry**: Tombol "Retry" dikonfigurasi serupa menggunakan nilai `scene_to_load` bernilai level permainan awal (contohnya "Level1"). Fitur ini mempermudah pemain yang Game Over untuk langsung mengulang gameplay level bersangkutan tanpa harus melewati Main Menu lagi.
- **Fitur Select Stage**: Mengaktifkan tombol "Stage Select" di Main Menu sebagai fitur tambahan agar pemain dapat langsung memilih *stage/level* mana yang mau dimainkan (Misal: Level 1 atau Level 2) menggunakan logika perpindahan scene secara dinamis. Pengerjaannya berjalan sinkron dengan mekanisme GUI utama game.