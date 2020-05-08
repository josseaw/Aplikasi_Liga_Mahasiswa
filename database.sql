-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Bulan Mei 2020 pada 15.01
-- Versi server: 10.3.15-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_uas_1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `jadwal` varchar(255) NOT NULL,
  `tim_a` varchar(255) NOT NULL,
  `vs` varchar(200) NOT NULL,
  `tim_b` varchar(255) NOT NULL,
  `tahap` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`jadwal`, `tim_a`, `vs`, `tim_b`, `tahap`) VALUES
('12/13/19', 'UNEJ', 'VS', 'ITS', 'T1P2'),
('12/14/19', 'UNISMA', 'VS', 'UNMER', 'T1P3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `nama_tim` varchar(255) NOT NULL,
  `asal_tim` varchar(255) NOT NULL,
  `nama_pelatih` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`nama_tim`, `asal_tim`, `nama_pelatih`) VALUES
('AGUNG', 'BWI', 'JOSSE'),
('arep', 'ringin pitu', 'agung'),
('Dunasi', 'Banyuwangi', 'Duwi'),
('ITS', 'SURABAYA', 'RIZKI'),
('jos', 'malang', 'gjfhtjy'),
('josse', 'ke', 'yes'),
('qwert', 'ert', 'qwerty'),
('UM', 'MALANG', 'PATRICK'),
('UMM', 'MALANG', 'ONG'),
('UNEJ', 'JEMBER', 'SAMUEL'),
('UNIBRAW', 'MALANG', 'JACK'),
('UNISMA', 'malang', 'uus'),
('UNMER', 'MALANG', 'KRISH'),
('wibowo', 'jombang', 'wibowo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `skor`
--

CREATE TABLE `skor` (
  `pertandingan` varchar(255) NOT NULL,
  `tim_a` varchar(255) NOT NULL,
  `skor_a` varchar(200) NOT NULL,
  `vs` varchar(255) NOT NULL,
  `skor_b` varchar(200) NOT NULL,
  `tim_b` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `skor`
--

INSERT INTO `skor` (`pertandingan`, `tim_a`, `skor_a`, `vs`, `skor_b`, `tim_b`) VALUES
('T1P2', 'UNEJ', '4', 'VS', '5', 'ITS'),
('T1P3', 'UNISMA', '1', 'VS', '1', 'UNMER');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`tim_a`,`tahap`),
  ADD KEY `tim_b` (`tim_b`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`nama_tim`);

--
-- Indeks untuk tabel `skor`
--
ALTER TABLE `skor`
  ADD PRIMARY KEY (`tim_b`),
  ADD KEY `tim_a` (`tim_a`),
  ADD KEY `tim_a_2` (`tim_a`,`tim_b`),
  ADD KEY `tim_a_3` (`tim_a`),
  ADD KEY `tim_b` (`tim_b`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `tim_a` FOREIGN KEY (`tim_a`) REFERENCES `skor` (`tim_a`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `skor`
--
ALTER TABLE `skor`
  ADD CONSTRAINT `skor_ibfk_1` FOREIGN KEY (`tim_b`) REFERENCES `jadwal` (`tim_b`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
