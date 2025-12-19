# Portable Run (Laptop Lain)

Project ini adalah Next.js + Prisma (PostgreSQL).

## Yang perlu diinstall di laptop lain
- Node.js 18+ (disarankan 20 LTS)
- Akses ke database PostgreSQL (cloud seperti Neon/Supabase/Railway, atau Postgres lokal)

## Cara menjalankan (Windows PowerShell)
1) Extract zip
2) Masuk folder project
3) Jalankan:
   - Pertama kali: `./run.ps1`
     (script akan buat `.env` dari `.env.example` kalau belum ada)
4) Edit file `.env` dan isi minimal:
   - `DATABASE_URL="..."`
   - `JWT_SECRET="..."`
5) Jalankan lagi: `./run.ps1`

## Cara menjalankan (Mac/Linux)
1) Extract zip
2) Masuk folder project
3) `./run.sh`
   (akan buat `.env` dari `.env.example` kalau belum ada)
4) Isi `.env`, lalu jalankan lagi `./run.sh`

## Catatan
- Folder `node_modules` dan `.next` tidak dibundle supaya zip kecil dan kompatibel lintas laptop.
- Jangan commit/publish `.env` karena berisi credential.
