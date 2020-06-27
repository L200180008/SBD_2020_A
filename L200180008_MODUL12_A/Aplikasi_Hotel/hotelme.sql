-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2020 at 06:55 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelme`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `kamar_kode` int(11) NOT NULL,
  `kelas` varchar(25) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`kamar_kode`, `kelas`, `tarif`) VALUES
(11, 'Single Bed', 350000),
(123, 'Single Bed', 350000),
(990, 'Single Bed', 350000),
(1012, 'Double Bed', 400000);

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `tamu_nama` varchar(60) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `no_hp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`tamu_nama`, `alamat`, `no_hp`) VALUES
('  Budi', '  Bandung', 8162777),
('  hasan', '  klaten', 85562732),
('  rifqi', '  lalung', 875562562),
(' joko', '  jakarta', 8665464);

-- --------------------------------------------------------

--
-- Table structure for table `tamu_has_kamar`
--

CREATE TABLE `tamu_has_kamar` (
  `tamu_nama` varchar(60) NOT NULL,
  `kamar_kode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tamu_has_kamar`
--

INSERT INTO `tamu_has_kamar` (`tamu_nama`, `kamar_kode`) VALUES
('  hasan', 990),
('  rifqi', 123),
(' joko', 11),
('  Budi', 1012);

-- --------------------------------------------------------

--
-- Table structure for table `tamu_has_transaksi`
--

CREATE TABLE `tamu_has_transaksi` (
  `kode_transaksi` int(11) NOT NULL,
  `tamu_nama` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tamu_has_transaksi`
--

INSERT INTO `tamu_has_transaksi` (`kode_transaksi`, `tamu_nama`) VALUES
(991, '  hasan'),
(125, '  rifqi'),
(2011, ' joko'),
(1103, '  Budi');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_transaksi` int(11) NOT NULL,
  `kamar_kode` int(11) NOT NULL,
  `tamu_nama` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`kode_transaksi`, `kamar_kode`, `tamu_nama`) VALUES
(125, 123, '  rifqi'),
(991, 990, '  hasan'),
(1103, 1012, '  Budi'),
(2011, 11, ' joko');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`kamar_kode`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`tamu_nama`);

--
-- Indexes for table `tamu_has_kamar`
--
ALTER TABLE `tamu_has_kamar`
  ADD KEY `tamu_nama` (`tamu_nama`),
  ADD KEY `kamar_kode` (`kamar_kode`);

--
-- Indexes for table `tamu_has_transaksi`
--
ALTER TABLE `tamu_has_transaksi`
  ADD KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `tamu_nama` (`tamu_nama`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kamar_kode` (`kamar_kode`),
  ADD KEY `tamu_nama` (`tamu_nama`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tamu_has_kamar`
--
ALTER TABLE `tamu_has_kamar`
  ADD CONSTRAINT `tamu_has_kamar_ibfk_1` FOREIGN KEY (`tamu_nama`) REFERENCES `tamu` (`tamu_nama`),
  ADD CONSTRAINT `tamu_has_kamar_ibfk_2` FOREIGN KEY (`kamar_kode`) REFERENCES `kamar` (`kamar_kode`);

--
-- Constraints for table `tamu_has_transaksi`
--
ALTER TABLE `tamu_has_transaksi`
  ADD CONSTRAINT `tamu_has_transaksi_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `transaksi` (`kode_transaksi`),
  ADD CONSTRAINT `tamu_has_transaksi_ibfk_2` FOREIGN KEY (`tamu_nama`) REFERENCES `tamu` (`tamu_nama`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kamar_kode`) REFERENCES `kamar` (`kamar_kode`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`tamu_nama`) REFERENCES `tamu` (`tamu_nama`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
