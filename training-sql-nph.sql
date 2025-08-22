-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Agu 2025 pada 08.57
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `training-sql-nph`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kapal`
--

CREATE TABLE `kapal` (
  `kapal_id` int(11) NOT NULL,
  `nama_kapal` varchar(100) DEFAULT NULL,
  `bendera` varchar(50) DEFAULT NULL,
  `kapasitas_teus` int(11) DEFAULT NULL,
  `tahun_pembuatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kapal`
--

INSERT INTO `kapal` (`kapal_id`, `nama_kapal`, `bendera`, `kapasitas_teus`, `tahun_pembuatan`) VALUES
(1, 'Kendhaga Nusantara 11', 'Indonesia', 100, NULL),
(2, 'MV PELABUHAN MAKMUR ', 'Indonesia', 848, NULL),
(3, 'KM Lognus 4', 'Indonesia', 115, NULL),
(4, 'Meratus Kupang', 'Malaysia', 1000, NULL),
(5, 'MSC Tessa', 'Singapore', 900, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontainer`
--

CREATE TABLE `kontainer` (
  `kontainer_id` int(11) NOT NULL,
  `nomor_kontainer` varchar(20) DEFAULT NULL,
  `tipe` varchar(10) DEFAULT NULL,
  `berat_ton` decimal(10,2) DEFAULT NULL,
  `kapal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontainer`
--

INSERT INTO `kontainer` (`kontainer_id`, `nomor_kontainer`, `tipe`, `berat_ton`, `kapal_id`) VALUES
(1, 'A101', '20FT', 2.20, 1),
(2, 'A102', '40FT', 3.80, 2),
(3, 'A103', '40FT', 3.90, 3),
(4, 'A104', '20FT', 20.10, 3),
(5, 'A105', '40FT', 30.70, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `kontainer_id` int(11) DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `tujuan` varchar(100) DEFAULT NULL,
  `biaya` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `kontainer_id`, `tanggal_keluar`, `tujuan`, `biaya`) VALUES
(1, 1, '2025-08-20', 'Surabaya', 200000000.00),
(2, 2, '2025-08-20', 'Singapore', 300000000.00),
(3, 3, '2025-08-21', 'Malaysia', 150000000.00),
(4, 4, '2025-08-21', 'China', 500000000.00),
(5, 5, '2025-08-22', 'Surabaya', 400000000.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kapal`
--
ALTER TABLE `kapal`
  ADD PRIMARY KEY (`kapal_id`);

--
-- Indeks untuk tabel `kontainer`
--
ALTER TABLE `kontainer`
  ADD PRIMARY KEY (`kontainer_id`),
  ADD KEY `kapal_id` (`kapal_id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `kontainer_id` (`kontainer_id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kontainer`
--
ALTER TABLE `kontainer`
  ADD CONSTRAINT `kontainer_ibfk_1` FOREIGN KEY (`kapal_id`) REFERENCES `kapal` (`kapal_id`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kontainer_id`) REFERENCES `kontainer` (`kontainer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
