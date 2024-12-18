CREATE DATABASE sibeta;
GO

USE sibeta;
GO

CREATE TABLE users (
    username VARCHAR(20) PRIMARY KEY NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL,
);

-- Tabel mahasiswa
CREATE TABLE mahasiswa
(
    nim VARCHAR(20) PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    program_studi VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    foto_profil VARCHAR(100) NULL,
	CONSTRAINT FK_User_Mahasiswa FOREIGN KEY (nim) REFERENCES users(username),
    CONSTRAINT ck_mahasiswa_program_studi CHECK (program_studi IN ('D-IV Teknik Informatika', 'D-IV Sistem Informasi Bisnis'))
);

-- Tabel super_admin
CREATE TABLE super_admin
(
    nip VARCHAR(20) PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
	foto_profil VARCHAR(100) NULL,
	CONSTRAINT FK_User_SuperAdmin FOREIGN KEY (nip) REFERENCES users(username)
);

-- Tabel admin
CREATE TABLE admin
(
    nip VARCHAR(20) PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(20) NOT NULL,
    nip_super_admin VARCHAR(20) NOT NULL,
	foto_profil VARCHAR(100) NULL,
	CONSTRAINT FK_User_Admin FOREIGN KEY (nip) REFERENCES users(username),
    FOREIGN KEY (nip_super_admin) REFERENCES super_admin(nip),
    CONSTRAINT ck_admin_role CHECK (role IN ('Teknisi', 'Admin Prodi', 'Admin Jurusan'))
);

-- Tabel dokumen
CREATE TABLE dokumen
(
    id_dokumen INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nim VARCHAR(20) NOT NULL,
    jenis_dokumen VARCHAR(100) NOT NULL,
    file_dokumen VARCHAR(255) NOT NULL,
    tanggal_upload DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
);

-- Tabel verifikasi_admin
CREATE TABLE verifikasi_admin
(
    id_verifikasi_admin INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nip_admin VARCHAR(20) NULL,
    nim VARCHAR(20) NOT NULL,
    tahap_verifikasi VARCHAR(50) NOT NULL,
    status_verifikasi VARCHAR(20) NOT NULL,
    tanggal_verifikasi DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (nip_admin) REFERENCES admin(nip),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
    CONSTRAINT ck_verifikasi_status CHECK (status_verifikasi IN ('Unverified', 'Pending', 'Verified'))
);

-- Tabel log_aktivitas_admin
CREATE TABLE log_aktivitas_admin
(
    id_log INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nip_admin VARCHAR(20) NOT NULL,
    aktivitas VARCHAR(100) NOT NULL,
    detail TEXT NULL,
    tanggal_aktivitas DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (nip_admin) REFERENCES admin(nip)
);

-- Tabel pengajuan_bebas_tanggungan
CREATE TABLE pengajuan_bebas_tanggungan
(
    id_pengajuan INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nip_admin VARCHAR(20) NULL,
    nim VARCHAR(20) NOT NULL,
    tanggal_pengajuan DATE NOT NULL,
    status_pengajuan VARCHAR(20) NOT NULL,
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
    FOREIGN KEY (nip_admin) REFERENCES admin(nip),
    CONSTRAINT ck__status_pengajuan CHECK (status_pengajuan IN ('Rejected', 'Pending', 'Accepted'))
);

-- Tabel notifikasi
CREATE TABLE notifikasi
(
    id_notifikasi INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nip_admin VARCHAR(20) NOT NULL,
    nim VARCHAR(20) NOT NULL,
    tipe_pengirim VARCHAR(20) NOT NULL,
    pesan TEXT NOT NULL,
    komentar TEXT NULL,
    status_notifikasi VARCHAR(20) NOT NULL DEFAULT 'Unread',
    tanggal_notifikasi DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (nip_admin) REFERENCES admin(nip),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
    CONSTRAINT ck_notifikasi_status CHECK (status_notifikasi IN ('Unread', 'Read')),
    CONSTRAINT ck_tipe_pengirim CHECK (tipe_pengirim IN ('Teknisi', 'Admin Prodi', 'Admin Jurusan'))
);

-- Tabel pemberitahuan
CREATE TABLE pemberitahuan
(
    id_pemberitahuan INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nip_super_admin VARCHAR(20) NOT NULL,
    tipe VARCHAR(100) NOT NULL,
    judul TEXT NOT NULL,
    isi TEXT NOT NULL,
    FOREIGN KEY (nip_super_admin) REFERENCES super_admin(nip)
);

-- Super Admin
INSERT INTO users (username, password, role)
VALUES
    ('123456789012345678', 'supr1@d1', 'Super Admin');

-- Admins
INSERT INTO users (username, password, role)
VALUES
    ('987654321012345678', 'BudiS1023', 'Teknisi'),
    ('876543210123456789', 'Amin@h79', 'Admin Prodi'),
    ('765432101234567890', 'h3rMawaN', 'Admin Jurusan');

-- Mahasiswa
INSERT INTO users (username, password, role)
VALUES
    ('2340271532', 'azkacahya@94', 'Mahasiswa'),
    ('2340271533', 'arrdwnhasbi4@8', 'Mahasiswa'),
    ('2340271534', 'putra128@fm', 'Mahasiswa'),
    ('2341271505', 'regitaay15@', 'Mahasiswa'),
    ('2341271506', 'rmdhnak12m4l', 'Mahasiswa'),
    ('2341271507', 'sltnrzn0134', 'Mahasiswa'),
    ('2340271535', 'ndaaulya24@t', 'Mahasiswa'),
    ('2340271536', 'rahmanf1kri56@f', 'Mahasiswa'),
    ('2340271537', 'ramdhnryzki78@', 'Mahasiswa'),
    ('2341271508', 'lst3ridewi@90', 'Mahasiswa'),
    ('2341271509', 'pamngksbayu@99', 'Mahasiswa'),
    ('2341271510', 'kart1karina11@', 'Mahasiswa'),
    ('2340271538', 'ad1nugroho82@', 'Mahasiswa'),
    ('2340271539', 'sar1maya87@', 'Mahasiswa'),
    ('2341271511', 'suhendaras7p@', 'Mahasiswa');


INSERT INTO super_admin (nip, nama, email, foto_profil)
VALUES
    ('123456789012345678', 'Dr. Ahmad Supriadi', 'aSupriadi@polinema.ac.id', NULL);


INSERT INTO admin (nip, nama, email, role, nip_super_admin, foto_profil)
VALUES
    ('987654321012345678', 'Budi Santoso', 'budiSantoso23@polinema.ac.id', 'Teknisi', '123456789012345678', NULL),
    ('876543210123456789', 'Siti Aminah', 'sitiAminah@polinema.ac.id', 'Admin Prodi', '123456789012345678', NULL),
    ('765432101234567890', 'Rudi Hermawan', 'hermawanRudi@polinema.ac.id', 'Admin Jurusan', '123456789012345678', NULL);



INSERT INTO mahasiswa (nim, nama, program_studi, email, foto_profil)
VALUES
    ('2340271532', 'Azka Cahya', 'D-IV Teknik Informatika', 'azka.cahyam@gmail.com', NULL),
    ('2340271533', 'Hasbi Arridwan', 'D-IV Teknik Informatika', 'hasbi.arridwan@gmail.com', NULL),
    ('2340271534', 'Fahmi Putra', 'D-IV Teknik Informatika', 'fahmi.putra@gmail.com', NULL),
    ('2341271505', 'Regita Ayu', 'D-IV Sistem Informasi Bisnis', 'regita.ayu@gmail.com', NULL),
    ('2341271506', 'Marco Ivano', 'D-IV Sistem Informasi Bisnis', 'marco.ivano@gmail.com', NULL),
    ('2341271507', 'Sultan Rozan', 'D-IV Sistem Informasi Bisnis', 'sultan.rozan@gmail.com', NULL),
    ('2340271535', 'Nadia Aulia', 'D-IV Teknik Informatika', 'nadia.aulia@gmail.com', NULL),
    ('2340271536', 'Fikri Rahman', 'D-IV Teknik Informatika', 'fikri.rahman@gmail.com', NULL),
    ('2340271537', 'Rizky Ramadhan', 'D-IV Teknik Informatika', 'rizky.ramadhan@gmail.com', NULL),
    ('2341271508', 'Dewi Lestari', 'D-IV Sistem Informasi Bisnis', 'dewi.lestari@gmail.com', NULL),
    ('2341271509', 'Bayu Pamungkas', 'D-IV Sistem Informasi Bisnis', 'bayu.pamungkas@gmail.com', NULL),
    ('2341271510', 'Rina Kartika', 'D-IV Sistem Informasi Bisnis', 'rina.kartika@gmail.com', NULL),
    ('2340271538', 'Adi Nugroho', 'D-IV Teknik Informatika', 'adi.nugroho@gmail.com', NULL),
    ('2340271539', 'Maya Sari', 'D-IV Teknik Informatika', 'maya.sari@gmail.com', NULL),
    ('2341271511', 'Asep Suhendar', 'D-IV Sistem Informasi Bisnis', 'asep.suhendar@gmail.com', NULL);


INSERT INTO verifikasi_admin
    (nip_admin, nim, tahap_verifikasi, status_verifikasi, tanggal_verifikasi)
VALUES
    ('987654321012345678', '2340271533', 'Teknisi', 'Verified', '2024-10-12'),
    ('876543210123456789', '2340271533', 'Admin Prodi', 'Verified', '2024-10-22'),
    ('987654321012345678', '2340271534', 'Teknisi', 'Verified', '2024-10-13'),
    ('876543210123456789', '2340271534', 'Admin Prodi', 'Pending', '2024-10-23'),
    ('987654321012345678', '2341271505', 'Teknisi', 'Pending', '2024-10-11'),
    ('876543210123456789', '2341271505', 'Admin Prodi', 'Pending', '2024-10-11'),
    ('987654321012345678', '2341271506', 'Teknisi', 'Verified', '2024-10-15'),
    ('876543210123456789', '2341271506', 'Admin Prodi', 'Verified', '2024-10-25'),
    ('987654321012345678', '2341271507', 'Teknisi', 'Pending', '2024-10-16'),
    ('876543210123456789', '2341271507', 'Admin Prodi', 'Pending', '2024-10-16'),
    ('987654321012345678', '2340271535', 'Teknisi', 'Verified', '2024-10-17'),
    ('876543210123456789', '2340271535', 'Admin Prodi', 'Verified', '2024-10-26'),
    ('987654321012345678', '2340271536', 'Teknisi', 'Pending', '2024-10-18'),
    ('876543210123456789', '2340271536', 'Admin Prodi', 'Pending', '2024-10-18'),
    ('987654321012345678', '2340271537', 'Teknisi', 'Verified', '2024-10-19'),
    ('876543210123456789', '2340271537', 'Admin Prodi', 'Pending', '2024-10-19'),
    ('987654321012345678', '2341271508', 'Teknisi', 'Verified', '2024-10-20'),
    ('876543210123456789', '2341271508', 'Admin Prodi', 'Verified', '2024-10-30'),
    ('987654321012345678', '2341271509', 'Teknisi', 'Pending', '2024-10-21'),
    ('876543210123456789', '2341271509', 'Admin Prodi', 'Pending', '2024-10-21'),
    ('987654321012345678', '2341271510', 'Teknisi', 'Verified', '2024-10-22'),
    ('876543210123456789', '2341271510', 'Admin Prodi', 'Verified', '2024-10-31'),
    ('987654321012345678', '2340271538', 'Teknisi', 'Pending', '2024-10-23'),
    ('876543210123456789', '2340271538', 'Admin Prodi', 'Pending', '2024-10-23'),
    ('987654321012345678', '2340271539', 'Teknisi', 'Verified', '2024-10-24'),
    ('876543210123456789', '2340271539', 'Admin Prodi', 'Pending', '2024-10-24'),
    ('987654321012345678', '2341271511', 'Teknisi', 'Pending', '2024-10-25'),
    ('876543210123456789', '2341271511', 'Admin Prodi', 'Pending', '2024-10-25');



INSERT INTO pengajuan_bebas_tanggungan
    (nip_admin, nim, tanggal_pengajuan, status_pengajuan)
VALUES
    ('765432101234567890', '2340271535', '2024-10-26', 'Accepted'),
    ('765432101234567890', '2340271536', '2024-10-27', 'Rejected'),
    ('765432101234567890', '2340271537', '2024-10-28', 'Pending'),
    ('765432101234567890', '2341271508', '2024-10-29', 'Accepted'),
    ('765432101234567890', '2341271509', '2024-10-30', 'Pending'),
    ('765432101234567890', '2341271510', '2024-10-31', 'Accepted'),
    ('765432101234567890', '2340271538', '2024-11-01', 'Rejected'),
    ('765432101234567890', '2340271539', '2024-11-02', 'Pending'),
    ('765432101234567890', '2341271511', '2024-11-03', 'Accepted');




INSERT INTO dokumen
    (nim, jenis_dokumen, file_dokumen, tanggal_upload)
VALUES
    ('2340271532', 'Laporan Tugas Akhir/Skripsi', '2340271532_Azka Cahya_Laporan Tugas Akhir/Skripsi.pdf', '2024-10-01'),
    ('2340271532', 'Program/Aplikasi Tugas Akhir/Skripsi', '2340271532_Azka Cahya_Program/Aplikasi Tugas Akhir/Skripsi.zip', '2024-10-02'),
    ('2340271532', 'Surat Pernyataan Publikasi Jurnal', '2340271532_Azka Cahya_Surat Pernyataan Publikasi.pdf', '2024-10-03'),
    ('2340271532', 'Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi', '2340271532_Azka Cahya_Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi/Skripsi.pdf', '2024-10-04'),
    ('2340271532', 'Tanda Terima Penyerahan Laporan PKL/Magang', '2340271532_Azka Cahya_Tanda Terima Penyerahan Laporan PKL/Magang.pdf', '2024-10-04'),
    ('2340271532', 'Scan Hasil TOEIC', '2340271532_Azka Cahya_Scan Hasil TOEIC.pdf', '2024-10-05'),
    ('2340271532', 'Surat Bebas Kompen', '2340271532_Azka Cahya_Surat Bebas Kompen.pdf', '2024-10-06'),

    ('2340271533', 'Laporan Tugas Akhir/Skripsi', '2340271533_Hasbi Arridwan_Laporan Tugas Akhir/Skripsi.pdf', '2024-10-01'),
    ('2340271533', 'Program/Aplikasi Tugas Akhir/Skripsi', '2340271533_Hasbi Arridwan_Program/Aplikasi Tugas Akhir/Skripsi.zip', '2024-10-02'),
    ('2340271533', 'Surat Pernyataan Publikasi Jurnal', '2340271533_Hasbi Arridwan_Surat Pernyataan Publikasi.pdf', '2024-10-03'),
    ('2340271533', 'Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi', '2340271533_Hasbi Arridwan_Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi/Skripsi.pdf', '2024-10-04'),
    ('2340271533', 'Tanda Terima Penyerahan Laporan PKL/Magang', '2340271533_Hasbi Arridwan_Tanda Terima Penyerahan Laporan PKL/Magang.pdf', '2024-10-04'),
    ('2340271533', 'Scan Hasil TOEIC', '2340271533_Hasbi Arridwan_Scan Hasil TOEIC.pdf', '2024-10-05'),
    ('2340271533', 'Surat Bebas Kompen', '2340271533_Hasbi Arridwan_Surat Bebas Kompen.pdf', '2024-10-06'),

    ('2340271534', 'Laporan Tugas Akhir/Skripsi', '2340271534_Fahmi Putra_Laporan Tugas Akhir/Skripsi.pdf', '2024-10-01'),
    ('2340271534', 'Program/Aplikasi Tugas Akhir/Skripsi', '2340271534_Fahmi Putra_Program/Aplikasi Tugas Akhir/Skripsi.zip', '2024-10-02'),
    ('2340271534', 'Surat Pernyataan Publikasi Jurnal', '2340271534_Fahmi Putra_Surat Pernyataan Publikasi.pdf', '2024-10-03'),
    ('2340271534', 'Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi', '2340271534_Fahmi Putra_Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi/Skripsi.pdf', '2024-10-04'),
    ('2340271534', 'Tanda Terima Penyerahan Laporan PKL/Magang', '2340271534_Fahmi Putra_Tanda Terima Penyerahan Laporan PKL/Magang.pdf', '2024-10-04'),
    ('2340271534', 'Scan Hasil TOEIC', '2340271534_Fahmi Putra_Scan Hasil TOEIC.pdf', '2024-10-05'),
    ('2340271534', 'Surat Bebas Kompen', '2340271534_Fahmi Putra_Surat Bebas Kompen.pdf', '2024-10-06'),

    ('2341271505', 'Laporan Tugas Akhir/Skripsi', '2341271505_Regita Ayu_Laporan Tugas Akhir/Skripsi.pdf', '2024-10-01'),
    ('2341271505', 'Program/Aplikasi Tugas Akhir/Skripsi', '2341271505_Regita Ayu_Program/Aplikasi Tugas Akhir/Skripsi.zip', '2024-10-02'),
    ('2341271505', 'Surat Pernyataan Publikasi Jurnal', '2341271505_Regita Ayu_Surat Pernyataan Publikasi.pdf', '2024-10-03'),
    ('2341271505', 'Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi', '2341271505_Regita Ayu_Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi/Skripsi.pdf', '2024-10-04'),
    ('2341271505', 'Tanda Terima Penyerahan Laporan PKL/Magang', '2341271505_Regita Ayu_Tanda Terima Penyerahan Laporan PKL/Magang.pdf', '2024-10-04'),
    ('2341271505', 'Scan Hasil TOEIC', '2341271505_Regita Ayu_Scan Hasil TOEIC.pdf', '2024-10-05'),
    ('2341271505', 'Surat Bebas Kompen', '2341271505_Regita Ayu_Surat Bebas Kompen.pdf', '2024-10-06'),

    ('2341271506', 'Laporan Tugas Akhir/Skripsi', '2341271506_Marco Ivano_Laporan Tugas Akhir/Skripsi.pdf', '2024-10-01'),
    ('2341271506', 'Program/Aplikasi Tugas Akhir/Skripsi', '2341271506_Marco Ivano_Program/Aplikasi Tugas Akhir/Skripsi.zip', '2024-10-02'),
    ('2341271506', 'Surat Pernyataan Publikasi Jurnal', '2341271506_Marco Ivano_Surat Pernyataan Publikasi.pdf', '2024-10-03'),
    ('2341271506', 'Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi', '2341271506_Marco Ivano_Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi/Skripsi.pdf', '2024-10-04'),
    ('2341271506', 'Tanda Terima Penyerahan Laporan PKL/Magang', '2341271506_Marco Ivano_Tanda Terima Penyerahan Laporan PKL/Magang.pdf', '2024-10-04'),
    ('2341271506', 'Scan Hasil TOEIC', '2341271506_Marco Ivano_Scan Hasil TOEIC.pdf', '2024-10-05'),
    ('2341271506', 'Surat Bebas Kompen', '2341271506_Marco Ivano_Surat Bebas Kompen.pdf', '2024-10-06'),

    ('2341271507', 'Laporan Tugas Akhir/Skripsi', '2341271507_Sultan Rozan_Laporan Tugas Akhir/Skripsi.pdf', '2024-10-01'),
    ('2341271507', 'Program/Aplikasi Tugas Akhir/Skripsi', '2341271507_Sultan Rozan_Program/Aplikasi Tugas Akhir/Skripsi.zip', '2024-10-02'),
    ('2341271507', 'Surat Pernyataan Publikasi Jurnal', '2341271507_Sultan Rozan_Surat Pernyataan Publikasi.pdf', '2024-10-03'),
    ('2341271507', 'Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi', '2341271507_Sultan Rozan_Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi/Skripsi.pdf', '2024-10-04'),
    ('2341271507', 'Tanda Terima Penyerahan Laporan PKL/Magang', '2341271507_Sultan Rozan_Tanda Terima Penyerahan Laporan PKL/Magang.pdf', '2024-10-04'),
    ('2341271507', 'Scan Hasil TOEIC', '2341271507_Sultan Rozan_Scan Hasil TOEIC.pdf', '2024-10-05'),
    ('2341271507', 'Surat Bebas Kompen', '2341271507_Sultan Rozan_Surat Bebas Kompen.pdf', '2024-10-06');


-- Aktivitas Login dan Logout
INSERT INTO log_aktivitas_admin
    (nip_admin, aktivitas, detail, tanggal_aktivitas)
VALUES
    -- Aktivitas Login
    ('987654321012345678', 'Login', 'Admin Budi Santoso melakukan login ke sistem.', '2024-10-11'),
    ('987654321012345678', 'Login', 'Admin Budi Santoso melakukan login ke sistem.', '2024-10-19'),
    ('987654321012345678', 'Login', 'Admin Budi Santoso melakukan login ke sistem.', '2024-10-20'),
    ('876543210123456789', 'Login', 'Admin Siti Aminah melakukan login ke sistem.', '2024-10-20'),
    ('876543210123456789', 'Login', 'Admin Siti Aminah melakukan login ke sistem.', '2024-10-21'),
    ('876543210123456789', 'Login', 'Admin Siti Aminah melakukan login ke sistem.', '2024-10-27'),
    ('765432101234567890', 'Login', 'Admin Rudi Hermawan melakukan login ke sistem.', '2024-10-27'),

    -- Aktivitas Logout
    ('987654321012345678', 'Logout', 'Admin Budi Santoso melakukan logout dari sistem.', '2024-10-11'),
    ('987654321012345678', 'Logout', 'Admin Budi Santoso melakukan logout dari sistem.', '2024-10-19'),
    ('987654321012345678', 'Logout', 'Admin Budi Santoso melakukan logout dari sistem.', '2024-10-20'),
    ('876543210123456789', 'Logout', 'Admin Siti Aminah melakukan logout dari sistem.', '2024-10-20'),
    ('876543210123456789', 'Logout', 'Admin Siti Aminah melakukan logout dari sistem.', '2024-10-21'),
    ('876543210123456789', 'Logout', 'Admin Siti Aminah melakukan logout dari sistem.', '2024-10-27'),
    ('765432101234567890', 'Logout', 'Admin Rudi Hermawan melakukan logout dari sistem.', '2024-10-27');


INSERT INTO notifikasi
    (nip_admin, nim, tipe_pengirim, pesan, komentar, status_notifikasi, tanggal_notifikasi)
VALUES
    ('987654321012345678', '2340271532', 'Teknisi', 'Teknisi telah memverifikasi 3 berkas Anda', NULL, 'Unread', GETDATE()),
    ('987654321012345678', '2340271533', 'Teknisi', 'Teknisi memberikan komentar pada Laporan Tugas Akhir Anda', 'Isi berkas tidak lengkap. Silakan lengkapi sesuai ketentuan', 'Unread', GETDATE()),
    ('987654321012345678', '2340271534', 'Teknisi', 'Teknisi telah memverifikasi 3 berkas Anda', NULL, 'Unread', GETDATE()),
    ('987654321012345678', '2341271505', 'Teknisi', 'Teknisi memberikan komentar pada Laporan Tugas Akhir Anda', 'Isi berkas tidak lengkap. Silakan lengkapi sesuai ketentuan', 'Unread', GETDATE()),
    ('876543210123456789', '2340271532', 'Admin Prodi', 'Admin Prodi telah memverifikasi 4 berkas Anda', NULL, 'Unread', GETDATE()),
    ('876543210123456789', '2340271533', 'Admin Prodi', 'Admin Prodi memberikan komentar pada Laporan Tugas Akhir Anda', 'Isi berkas tidak lengkap. Silakan lengkapi sesuai ketentuan', 'Unread', GETDATE()),
    ('765432101234567890', '2340271534', 'Admin Jurusan', 'Admin Jurusan telah menyetujui pengajuan Anda', NULL, 'Unread', GETDATE()),
    ('765432101234567890', '2341271505', 'Admin Jurusan', 'Admin Jurusan memberikan komentar pada Laporan Tugas Akhir Anda', 'Isi berkas tidak lengkap. Silakan lengkapi sesuai ketentuan', 'Unread', GETDATE());


INSERT INTO pemberitahuan
    (nip_super_admin, tipe, judul, isi)
VALUES
    ('123456789012345678', 'Panduan Mahasiswa', 'Panduan Sistem Bebas Tanggungan', 'Untuk mahasiswa yang telah berhasil lulus Tugas Akhir (Skripsi), berikut adalah prosedur untuk memperoleh Surat Bebas Tanggungan sebagai syarat pengambilan Ijazah, Transkrip, dan SKPI.<br /> <br />  Berkas yang Harus Diupload untuk Verifikasi Teknisi:<br />  1. Laporan Tugas Akhir/Skripsi.<br />  2. Program/Skripsi Aplikasi.<br />  3. Surat Pernyataan untuk Publikasi Jurnal/Makalah/Konferensi/Seminar/HAKI, dll.<br />  <br />  Berkas yang Harus Diupload untuk Verifikasi Admin:<br />  1. Bukti Pengumpulan Laporan Tugas Akhir/Skripsi ke Ruang Baca.<br />  2. Bukti Pengumpulan Laporan PKL/Praktek Kerja Lapangan ke Ruang Baca (jika PKL/Praktek Kerja Lapangan dilakukan lebih dari sekali).<br />  3. Dokumen Bebas Kompen.<br />  4. Scan TOEIC dengan skor minimal 450 untuk Diploma 4 atau sertifikat dari UPA Language Center.'),
    ('123456789012345678', 'Ajukan Verifikasi Teknisi', 'Syarat dan Ketentuan', 'Students are requested to read the following terms and conditions carefully. Ensure that all documents meet the specified format, size, and file type requirements.<br /> <br />  1. Thesis Report : The report must include the Cover, Table of Contents, List of Figures, List of Tables, Preface, Abstract (in both Indonesian and English), Approval (with full signature), Chapter 1 to Conclusion, References, and Appendices (if applicable). Upload in PDF format, signed, with the file name format: “[Name]_[NIM]_Thesis Report.pdf”.<br />  2. Thesis Program/Application : Upload in ZIP or RAR format containing the program or application developed in the Final Project/Thesis, with the file name format: “[Name]_[NIM]_Thesis Application.pdf”.<br />  3. Publication : Publication Statement Letter , upload in PDF format, with the file name format: “[Name]_[NIM]_Publication.pdf”.'),
    ('123456789012345678', 'Ajukan Verifikasi Admin Prodi', 'Syarat dan Ketentuan', 'Mahasiswa diminta untuk membaca syarat dan ketentuan berikut dengan seksama. Pastikan semua dokumen memenuhi persyaratan format, ukuran, dan jenis file yang ditentukan.<br /> <br />  1. Bukti Pengumpulan Laporan Tugas Akhir/Skripsi: Upload dalam format PDF, dengan format nama file: “[Nama]_[NIM]_Bukti Pengumpulan Tugas Akhir.pdf”.<br />  2. Bukti Pengumpulan Laporan PKL/Praktek Kerja Lapangan: Upload dalam format PDF, dengan format nama file: “[Nama]_[NIM]_Bukti Pengumpulan Laporan PKL.pdf”.<br />  3. Bukti Bebas Kompen: Upload dalam format PDF, dengan format nama file: “[Nama]_[NIM]_Bukti Bebas Kompen.pdf”.<br />  4. Scan Sertifikat TOEIC: Upload dalam format PDF, dengan format nama file: “[Nama]_[NIM]_Scan Sertifikat TOEIC.pdf”.');

ALTER TABLE notifikasi
DROP COLUMN komentar;

ALTER TABLE dokumen
ADD komentar TEXT NULL;

--nambah kolom keterangan
ALTER TABLE verifikasi_admin
ADD keterangan VARCHAR(255) NULL;

--buat trigger untuk set keterangan otomatis
CREATE TRIGGER tr_SetVerificationMessage
ON verifikasi_admin
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE va
    SET keterangan = 
        CASE 
            WHEN va.tahap_verifikasi = 'Teknisi' THEN
                CASE va.status_verifikasi
                    WHEN 'Verified' THEN 'Your 3 files has been verified by Technician.'
                    WHEN 'Pending' THEN 'Your 3 files are being checked by the Technician.'
                    WHEN 'Unverified' THEN 'Your 3 files have not been checked by Technician.'
                END
            WHEN va.tahap_verifikasi = 'Admin Prodi' THEN
                CASE va.status_verifikasi
                    WHEN 'Verified' THEN 'Your 4 files has been verified by Admin.'
                    WHEN 'Pending' THEN 'Your 4 files are being checked by the Admin.'
                    WHEN 'Unverified' THEN 'Your 4 files have not been checked by Admin.'
                END
        END
    FROM verifikasi_admin va
    INNER JOIN inserted i ON va.id_verifikasi_admin = i.id_verifikasi_admin;
END;

-- Example UPDATE (keterangan will be updated automatically)
UPDATE verifikasi_admin 
SET keterangan = 'Your 3 files have been verified by Technician.'
WHERE status_verifikasi = 'Verified' and tahap_verifikasi = 'Teknisi';

UPDATE verifikasi_admin 
SET keterangan = 'Your 3 files are being checked by the Technician.'
WHERE status_verifikasi = 'Pending' and tahap_verifikasi = 'Teknisi';

UPDATE verifikasi_admin 
SET keterangan = 'Your 3 files have not been checked by Technician.'
WHERE status_verifikasi = 'Unverified' and tahap_verifikasi = 'Teknisi';

UPDATE verifikasi_admin 
SET keterangan = 'Your 4 files have been verified by Admin.'
WHERE status_verifikasi = 'Verified' and tahap_verifikasi = 'Admin Prodi';

UPDATE verifikasi_admin 
SET keterangan = 'Your 4 files are being checked by the Admin.'
WHERE status_verifikasi = 'Pending' and tahap_verifikasi = 'Admin Prodi';

UPDATE verifikasi_admin 
SET keterangan = 'Your 4 files have not been checked by Admin.'
WHERE status_verifikasi = 'Unverified' and tahap_verifikasi = 'Admin Prodi';

-- Update verifikasi_admin records for Teknisi to Verified status
UPDATE verifikasi_admin
SET status_verifikasi = 'Verified'
WHERE tahap_verifikasi = 'Teknisi';

UPDATE mahasiswa
SET foto_profil = '2341720251_Hamdan Azizul Hakim.jpg'
WHERE nim = '2341720251';

UPDATE dokumen
SET file_dokumen = CASE
    WHEN jenis_dokumen = 'Laporan Tugas Akhir/Skripsi' THEN CONCAT(nim, '_', 
        SUBSTRING(file_dokumen, CHARINDEX('_', file_dokumen) + 1, CHARINDEX('_', file_dokumen, CHARINDEX('_', file_dokumen) + 1) - CHARINDEX('_', file_dokumen) - 1), 
        '_Laporan Tugas Akhir.', RIGHT(file_dokumen, LEN(file_dokumen) - CHARINDEX('.', file_dokumen)))
    WHEN jenis_dokumen = 'Program/Aplikasi Tugas Akhir/Skripsi' THEN CONCAT(nim, '_', 
        SUBSTRING(file_dokumen, CHARINDEX('_', file_dokumen) + 1, CHARINDEX('_', file_dokumen, CHARINDEX('_', file_dokumen) + 1) - CHARINDEX('_', file_dokumen) - 1), 
        '_Aplikasi Tugas Akhir.', RIGHT(file_dokumen, LEN(file_dokumen) - CHARINDEX('.', file_dokumen)))
    WHEN jenis_dokumen = 'Surat Pernyataan Publikasi Jurnal' THEN CONCAT(nim, '_', 
        SUBSTRING(file_dokumen, CHARINDEX('_', file_dokumen) + 1, CHARINDEX('_', file_dokumen, CHARINDEX('_', file_dokumen) + 1) - CHARINDEX('_', file_dokumen) - 1), 
        '_Surat Pernyataan Publikasi.', RIGHT(file_dokumen, LEN(file_dokumen) - CHARINDEX('.', file_dokumen)))
    WHEN jenis_dokumen = 'Tanda Terima Penyerahan Laporan Tugas Akhir/Skripsi' THEN CONCAT(nim, '_', 
        SUBSTRING(file_dokumen, CHARINDEX('_', file_dokumen) + 1, CHARINDEX('_', file_dokumen, CHARINDEX('_', file_dokumen) + 1) - CHARINDEX('_', file_dokumen) - 1), 
        '_Tanda Terima Penyerahan Laporan Tugas Akhir.', RIGHT(file_dokumen, LEN(file_dokumen) - CHARINDEX('.', file_dokumen)))
    WHEN jenis_dokumen = 'Tanda Terima Penyerahan Laporan PKL/Magang' THEN CONCAT(nim, '_', 
        SUBSTRING(file_dokumen, CHARINDEX('_', file_dokumen) + 1, CHARINDEX('_', file_dokumen, CHARINDEX('_', file_dokumen) + 1) - CHARINDEX('_', file_dokumen) - 1), 
        '_Tanda Terima Penyerahan Laporan Magang.', RIGHT(file_dokumen, LEN(file_dokumen) - CHARINDEX('.', file_dokumen)))
    WHEN jenis_dokumen = 'Scan Hasil TOEIC' THEN CONCAT(nim, '_', 
        SUBSTRING(file_dokumen, CHARINDEX('_', file_dokumen) + 1, CHARINDEX('_', file_dokumen, CHARINDEX('_', file_dokumen) + 1) - CHARINDEX('_', file_dokumen) - 1), 
        '_Scan Hasil TOEIC.', RIGHT(file_dokumen, LEN(file_dokumen) - CHARINDEX('.', file_dokumen)))
    WHEN jenis_dokumen = 'Surat Bebas Kompen' THEN CONCAT(nim, '_', 
        SUBSTRING(file_dokumen, CHARINDEX('_', file_dokumen) + 1, CHARINDEX('_', file_dokumen, CHARINDEX('_', file_dokumen) + 1) - CHARINDEX('_', file_dokumen) - 1), 
        '_Surat Bebas Kompen.', RIGHT(file_dokumen, LEN(file_dokumen) - CHARINDEX('.', file_dokumen)))
    ELSE file_dokumen
END;