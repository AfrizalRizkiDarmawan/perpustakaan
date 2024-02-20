-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2024 at 01:13 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpusrijal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `password` varchar(25) NOT NULL,
  `kode_admin` varchar(12) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `role` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama_admin`, `password`, `kode_admin`, `no_tlp`, `role`) VALUES
(1, 'rijal', 'rpl', '123', '087770142169', 'admin'),
(2, 'ijal', 'rpl', '123', '081808773194', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `cover` varchar(250) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `kategori` varchar(225) NOT NULL,
  `judul` varchar(225) NOT NULL,
  `pengarang` varchar(225) NOT NULL,
  `penerbit` varchar(225) NOT NULL,
  `tahun_terbit` date NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `buku_deskripsi` text NOT NULL,
  `isi_buku` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`cover`, `id_buku`, `kategori`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `jumlah_halaman`, `buku_deskripsi`, `isi_buku`) VALUES
('65cda511cdc42.jpg', 'z01', 'Dongeng', '5 Dongeng Anak Dunia', 'Dedik Dwi Prihatmoko', 'Kementerian Pendidikan dan Kebudayaan Balai Bahasa Daerah Istimewa Yogyakarta', '2019-07-15', 28, 'Cerita atau dongeng yang baik mengedukasi anak untuk menjadi baik.\r\nHadirnya buku 5 Dongeng Anak Dunia pun mengarah pada ceritacerita yang baik', '3.  Lima Dongeng Anak Dunia SQUARE-membaca awal 21x21 28hlm.pdf'),
('65cda7c4a9d0f.png', 'Z02', 'Dongeng', 'Cerita Gambar Pajak Kita', 'Wahyu', 'Gramedia ', '2020-12-03', 44, 'Menyuruh bayar pajak', 'Buku Cergam Pajak Kita.pdf'),
('65cda8a7d34b8.png', 'Z03', 'Dongeng', 'Cerita Kancil', 'Dr Rita Kurnia', 'Gramedia', '2018-02-15', 24, 'Menceritakan tentang si kancil', 'BUKU-CERITA-KANCIL.pdf'),
('65cdaae8162af.png', 'Z04', 'Pendidikan', 'Pendidikan Kewarganegaraan ', 'Yusnawan Lubis dan Mohamad Sodeli', 'Pusat Kurikulum dan Perbukuan, Balitbang, Kemendikbud', '2017-01-09', 240, 'Mengajarkan tentang pendidikan kewarganegaraan ', 'PPKn Kelas XI BS press.pdf'),
('65cdad13d8ca8.png', 'Z05', 'Dongeng', 'Timun Emas', 'Dian Sidik', 'PT Balai Pustaka ', '2007-02-15', 56, 'Dongeng tentang timun emas', 'ebook083.pdf'),
('65cdadea847aa.png', 'Z06', 'Dongeng', 'Kalah Oleh Si Cerdik', 'Atisah', 'Gramedia ', '2015-02-15', 65, 'Menceritakan tentang kecerdasan sang kancil', '74._Isi_dan_Sampul_Kalah_oleh_Si_Cerdik.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_buku`
--

CREATE TABLE `kategori_buku` (
  `kategori` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_buku`
--

INSERT INTO `kategori_buku` (`kategori`) VALUES
('Dongeng'),
('Pendidikan');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `nisn` int(11) NOT NULL,
  `kode_member` varchar(12) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `no_tlp` varchar(12) NOT NULL,
  `tgl_pendaftaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`nisn`, `kode_member`, `nama`, `password`, `jenis_kelamin`, `kelas`, `jurusan`, `no_tlp`, `tgl_pendaftaran`) VALUES
(12345, '12345', 'rijal', '$2y$10$dTV/SdrwQisDXWV99Q1yPursD1fzTR1zaBPKxg7JoXybncnuqzGYO', 'Laki laki', 'XII', 'Teknik Komputer Jaringan', '0897585469', '2024-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `Id_buku` varchar(20) NOT NULL,
  `nisn` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `tgl_peminjaman` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `status` enum('ya','tdak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `nisn` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `buku_kembali` date NOT NULL,
  `keterlambatan` enum('YA','TIDAK') NOT NULL,
  `denda` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_admin` (`kode_admin`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `kategori` (`kategori`);

--
-- Indexes for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD PRIMARY KEY (`kategori`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `kode_member` (`kode_member`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `Id_buku` (`Id_buku`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `id_peminjaman` (`id_peminjaman`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
