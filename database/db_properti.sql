-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Sep 2020 pada 12.03
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_properti`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_daerah`
--

CREATE TABLE `tb_daerah` (
  `id_daerah` int(11) NOT NULL,
  `nama_daerah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_daerah`
--

INSERT INTO `tb_daerah` (`id_daerah`, `nama_daerah`) VALUES
(1, 'Kuranji'),
(2, 'Pauh'),
(3, 'Bungus'),
(4, 'Koto Tangah'),
(5, 'Lubuk Begalung'),
(6, 'Lubuk Kilangan'),
(7, 'Nanggalo'),
(8, 'Padang Barat'),
(9, 'Padang Selatan'),
(10, 'Padang Timur'),
(11, 'Padang Utara');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gambar`
--

CREATE TABLE `tb_gambar` (
  `id_gambar` int(11) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `id_properti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_investasi`
--

CREATE TABLE `tb_investasi` (
  `id_investasi` int(11) NOT NULL,
  `tgl_investasi` date NOT NULL,
  `id_properti` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jml_investasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_investasi`
--

INSERT INTO `tb_investasi` (`id_investasi`, `tgl_investasi`, `id_properti`, `id_user`, `jml_investasi`) VALUES
(1, '2020-09-24', 3, 1, 10000000),
(2, '2020-09-24', 3, 2, 3156800);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_notifikasi`
--

CREATE TABLE `tb_notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `waktu` time NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_notifikasi`
--

INSERT INTO `tb_notifikasi` (`id_notifikasi`, `tgl`, `waktu`, `id_user`, `judul`, `isi`) VALUES
(1, '2020-09-28', '14:00:00', 1, 'Pemesanan rumah di approve', 'Lorem ipsum dolor set amet'),
(2, '2020-09-29', '00:00:00', 0, 'Terima kasih!', 'Lorem ipsum dolor set amet');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_properti`
--

CREATE TABLE `tb_properti` (
  `id_properti` int(11) NOT NULL,
  `nama_properti` varchar(100) NOT NULL,
  `lokasi` text NOT NULL,
  `id_daerah` int(11) NOT NULL,
  `latitude` varchar(150) NOT NULL,
  `longitude` varchar(150) NOT NULL,
  `kamar_tidur` int(11) NOT NULL,
  `kamar_mandi` int(11) NOT NULL,
  `luas` int(11) NOT NULL,
  `modal_investasi` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `besar_angsuran` int(11) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `gambar_properti` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_properti`
--

INSERT INTO `tb_properti` (`id_properti`, `nama_properti`, `lokasi`, `id_daerah`, `latitude`, `longitude`, `kamar_tidur`, `kamar_mandi`, `luas`, `modal_investasi`, `harga_jual`, `besar_angsuran`, `lama_angsuran`, `gambar_properti`, `deskripsi`) VALUES
(1, 'Tipe 45/84', 'Limau manis (rindang alam)', 1, '', '', 2, 2, 5, 150000000, 200000000, 2000000, 36, 'terrahholly.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(2, 'Tipe 60', 'Lubuk lintah, Kec. Kuranji, Padang', 3, '', '', 3, 2, 5, 200000000, 300000000, 2500000, 36, 'merah.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(3, 'Tipe 45', 'Lorem ipsum dolor set amet', 1, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '1.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(4, 'Tipe 46', 'Lorem ipsum dolor set amet', 2, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '2.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(5, 'Tipe 47', 'Lorem ipsum dolor set amet', 1, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '3.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(6, 'Tipe 48', 'Lorem ipsum dolor set amet', 1, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '4.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(7, 'Tipe 49', 'Lorem ipsum dolor set amet', 1, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '5.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(8, 'Tipe 50', 'Lorem ipsum dolor set amet', 1, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '6.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(9, 'Tipe 51', 'Lorem ipsum dolor set amet', 1, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '7.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(10, 'Tipe 52', 'Lorem ipsum dolor set amet', 1, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '8.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(11, 'Tipe 53', 'Lorem ipsum dolor set amet', 1, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '9.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n'),
(12, 'Tipe 54', 'Lorem ipsum dolor set amet', 2, '', '', 3, 4, 5, 50000000, 100000000, 1500000, 48, '10.jpg', '- Pasti disetujui (tanpa bank)\r\n<br>- Ga ribet\r\n<br>- Modal ktp saja\r\n<br>- Rumah lunas, langsung berangkat haji\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_slider`
--

CREATE TABLE `tb_slider` (
  `id_slider` int(11) NOT NULL,
  `gambar_slider` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_slider`
--

INSERT INTO `tb_slider` (`id_slider`, `gambar_slider`) VALUES
(1, 'slide1.jpg'),
(2, 'slide2.jpg'),
(3, 'slide3.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `id_properti` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `besar_angsuran` int(11) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `no_telp_sdr` varchar(20) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `npwp` varchar(15) NOT NULL,
  `foto_ktp` varchar(50) NOT NULL,
  `foto_selfie` varchar(50) NOT NULL,
  `foto_npwp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `email`, `no_telp`, `password`, `pekerjaan`, `no_telp_sdr`, `nik`, `nama_lengkap`, `npwp`, `foto_ktp`, `foto_selfie`, `foto_npwp`) VALUES
(1, 'rizki@gmail.com', '081299029393', '827ccb0eea8a706c4c34a16891f84e7b', 'Android Dev', '085658593347', '12345678987653', 'Rizki Kurniawan', '24354657586787', 'ktp.png', 'selfie.png', 'npwp.png'),
(2, 'user2@gmail.com', '088888888888', '827ccb0eea8a706c4c34a16891f84e7b', 'Tukang', '089999999999', '123321231312', 'Juragan tanah wkwk', '42424232432432', 'ktp1.png', 'selfie1.png', 'npwp1.png'),
(3, 'tes@gmail.com', '0999999999', '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', '', '', '', ''),
(4, 'teslagi@gmail.com', '081212121212', '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', '', '', '', ''),
(5, 'rizki2@gmail.com', '098765543', '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', '', '', '', ''),
(6, 'rere@gmail.com', '123456', '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_daerah`
--
ALTER TABLE `tb_daerah`
  ADD PRIMARY KEY (`id_daerah`);

--
-- Indeks untuk tabel `tb_gambar`
--
ALTER TABLE `tb_gambar`
  ADD PRIMARY KEY (`id_gambar`);

--
-- Indeks untuk tabel `tb_investasi`
--
ALTER TABLE `tb_investasi`
  ADD PRIMARY KEY (`id_investasi`);

--
-- Indeks untuk tabel `tb_notifikasi`
--
ALTER TABLE `tb_notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`);

--
-- Indeks untuk tabel `tb_properti`
--
ALTER TABLE `tb_properti`
  ADD PRIMARY KEY (`id_properti`);

--
-- Indeks untuk tabel `tb_slider`
--
ALTER TABLE `tb_slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_daerah`
--
ALTER TABLE `tb_daerah`
  MODIFY `id_daerah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_gambar`
--
ALTER TABLE `tb_gambar`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_investasi`
--
ALTER TABLE `tb_investasi`
  MODIFY `id_investasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_notifikasi`
--
ALTER TABLE `tb_notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_properti`
--
ALTER TABLE `tb_properti`
  MODIFY `id_properti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_slider`
--
ALTER TABLE `tb_slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
