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