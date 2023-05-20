-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 18, 2023 alle 09:39
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pc_builder`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cpu`
--

CREATE TABLE `cpu` (
  `IdCPU` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Series` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(65,2) NOT NULL,
  `ImageURL` varchar(100) DEFAULT NULL,
  `NumberOfCores` int(11) NOT NULL,
  `ClockSpeed` float NOT NULL COMMENT '[GHz]',
  `TDP` int(11) NOT NULL COMMENT '[W]',
  `Architecture` varchar(100) NOT NULL,
  `Socket` varchar(100) NOT NULL,
  `IntegratedGraphics` tinyint(1) NOT NULL,
  `CoolerIncluded` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `cpu`
--

INSERT INTO `cpu` (`IdCPU`, `Brand`, `Series`, `Name`, `Price`, `ImageURL`, `NumberOfCores`, `ClockSpeed`, `TDP`, `Architecture`, `Socket`, `IntegratedGraphics`, `CoolerIncluded`) VALUES
(1, 'AMD', 'Ryzen 5', '5600X', '170.40', 'CPU1.png', 6, 3.7, 65, 'Zen 3', 'AM4', 0, 1),
(2, 'AMD', 'Ryzen 7', '5700X', '203.90', 'CPU2.png', 8, 3.4, 65, 'Zen 3', 'AM4', 0, 0),
(3, 'AMD', 'Ryzen 7', '5800X3D', '310.00', 'CPU3.png', 8, 3.4, 105, 'Zen 3', 'AM4', 0, 0),
(4, 'AMD', 'Ryzen 9', '5950X', '513.36', 'CPU4.png', 16, 3.4, 105, 'Zen 3', 'AM4', 0, 0),
(5, 'AMD', 'Ryzen 5', '7600X', '243.40', 'CPU5.png', 6, 4.7, 105, 'Zen 4', 'AM5', 1, 0),
(6, 'AMD', 'Ryzen 7', '7700X', '335.35', 'CPU6.png', 8, 4.5, 105, 'Zen 4', 'AM5', 1, 0),
(7, 'AMD', 'Ryzen 7', '7800X3D', '520.90', 'CPU7.png', 8, 4.2, 120, 'Zen 4', 'AM5', 1, 0),
(8, 'AMD', 'Ryzen 9', '7950X', '600.00', 'CPU8.png', 16, 4.5, 170, 'Zen 4', 'AM5', 1, 0),
(9, 'AMD', 'Ryzen 9', '7950X3D', '777.27', 'CPU9.png', 16, 4.2, 120, 'Zen 4', 'AM5', 1, 0),
(10, 'Intel', 'Core i3', '12100F', '100.70', 'CPU10.png', 4, 3.3, 58, 'Alder Lake', 'LGA1700', 0, 1),
(11, 'Intel', 'Core i3', '12100', '148.99', 'CPU11.png', 4, 3.3, 60, 'Alder Lake', 'LGA1700', 1, 1),
(12, 'Intel', 'Core i5', '12600KF', '253.71', 'CPU12.png', 10, 3.7, 125, 'Alder Lake', 'LGA1700', 0, 0),
(13, 'Intel', 'Core i5', '12600K', '286.39', 'CPU13.png', 10, 3.7, 125, 'Alder Lake', 'LGA1700', 1, 0),
(14, 'Intel', 'Core i7', '12700KF', '329.68', 'CPU14.png', 12, 3.6, 125, 'Alder Lake', 'LGA1700', 0, 0),
(15, 'Intel', 'Core i7', '12700K', '360.79', 'CPU15.png', 12, 3.6, 125, 'Alder Lake', 'LGA1700', 1, 0),
(16, 'Intel', 'Core i9', '12900K', '475.58', 'CPU16.png', 16, 3.2, 125, 'Alder Lake', 'LGA1700', 1, 0),
(17, 'Intel', 'Core i9', '12900KS', '571.04', 'CPU17.png', 16, 3.4, 150, 'Alder Lake', 'LGA1700', 1, 0),
(18, 'Intel', 'Core i3', '13100F', '133.31', 'CPU18.png', 4, 3.4, 58, 'Raptor Lake', 'LGA1700', 0, 1),
(19, 'Intel', 'Core i3', '13100', '162.00', 'CPU19.png', 4, 3.4, 60, 'Raptor Lake', 'LGA1700', 1, 1),
(20, 'Intel', 'Core i5', '13600KF', '322.06', 'CPU20.png', 14, 3.5, 125, 'Raptor Lake', 'LGA1700', 0, 0),
(21, 'Intel', 'Core i5', '13600K', '341.88', 'CPU21.png', 14, 3.5, 125, 'Raptor Lake', 'LGA1700', 1, 0),
(22, 'Intel', 'Core i7', '13700KF', '415.96', 'CPU22.png', 16, 3.4, 125, 'Raptor Lake', 'LGA1700', 0, 0),
(23, 'Intel', 'Core i7', '13700K', '437.04', 'CPU23.png', 16, 3.4, 125, 'Raptor Lake', 'LGA1700', 1, 0),
(24, 'Intel', 'Core i9', '13900K', '599.49', 'CPU24.png', 24, 3, 125, 'Raptor Lake', 'LGA1700', 1, 0),
(25, 'Intel', 'Core i9', '13900KS', '981.27', 'CPU25.png', 24, 3, 150, 'Raptor Lake', 'LGA1700', 1, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `gpu`
--

CREATE TABLE `gpu` (
  `IdGPU` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(65,2) NOT NULL,
  `ImageURL` varchar(100) DEFAULT NULL,
  `ChipsetBrand` varchar(100) NOT NULL,
  `Chipset` varchar(100) NOT NULL,
  `VRAMSize` int(11) NOT NULL COMMENT '[GB]',
  `ClockSpeed` float NOT NULL COMMENT '[GHz]',
  `Length` int(11) NOT NULL COMMENT '[mm]',
  `Size` int(11) NOT NULL COMMENT '[Slots]',
  `TDP` int(11) NOT NULL COMMENT '[W]',
  `NumberOfHDMI` int(11) NOT NULL,
  `NumberOfDisplayPort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `gpu`
--

INSERT INTO `gpu` (`IdGPU`, `Brand`, `Name`, `Price`, `ImageURL`, `ChipsetBrand`, `Chipset`, `VRAMSize`, `ClockSpeed`, `Length`, `Size`, `TDP`, `NumberOfHDMI`, `NumberOfDisplayPort`) VALUES
(1, 'Asus', 'TUF GAMING', '1379.99', 'GPU1.png', 'NVIDIA GeForce', 'RTX 4080', 16, 2.205, 348, 4, 320, 2, 3),
(2, 'MSI', 'SUPRIM X', '2049.98', 'GPU2.png', 'NVIDIA GeForce', 'RTX 4090', 23, 2.234, 336, 4, 450, 3, 1),
(3, 'Asus', 'ROG STRIX GAMING', '2193.44', 'GPU3.png', 'NVIDIA GeForce', 'RTX 4090', 24, 2.235, 358, 4, 450, 2, 3),
(4, 'Gigabyte', 'GAMING', '1383.81', 'GPU4.png', 'NVIDIA GeForce', 'RTX 4080', 16, 2.205, 342, 4, 320, 1, 3),
(5, 'MSI', 'GAMING X TRIO', '1365.72', 'GPU5.png', 'NVIDIA GeForce', 'RTX 4080', 16, 2.205, 337, 3, 320, 1, 3),
(6, 'MSI', 'VENTUS 2X', '267.62', 'GPU6.png', 'NVIDIA GeForce', 'RTX 3050', 8, 1.15, 235, 2, 130, 1, 3),
(7, 'Asus', 'STRIX GAMING', '2349.00', 'GPU7.png', 'NVIDIA GeForce', 'RTX 3090', 24, 1.395, 318, 3, 350, 2, 3),
(8, 'Asus', 'DUAL', '362.05', 'GPU8.png', 'NVIDIA GeForce', 'RTX 3060', 8, 1.32, 200, 2, 170, 1, 3),
(9, 'Gigabyte', 'GAMING', '2888.88', 'GPU9.png', 'NVIDIA GeForce', 'RTX 3080', 10, 1.44, 320, 3, 320, 2, 3),
(10, 'MSI', 'GAMING Z TRIO', '1354.59', 'GPU10.png', 'AMD Radeon', 'RX 6800 XT', 16, 1.825, 324, 3, 300, 3, 1),
(11, 'Gigabyte', 'GAMING', '1124.45', 'GPU11.png', 'AMD Radeon', 'RX 7900 XTX', 24, 2.3, 331, 3, 335, 2, 2),
(12, 'Gigabyte', 'EAGLE', '379.00', 'GPU12.png', 'AMD Radeon', 'RX 6600 XT', 8, 1.968, 282, 2, 160, 2, 2),
(13, 'Gigabyte', 'AORUS MASTER', '972.50', 'GPU13.png', 'AMD Radeon', 'RX 6900 XT', 16, 1.825, 322, 3, 300, 2, 2),
(14, 'Asus', 'TUF GAMING', '1024.14', 'GPU14.png', 'AMD Radeon', 'RX 7900 XT', 20, 2, 353, 4, 300, 1, 3),
(15, 'Asus', 'DUAL', '166.57', 'GPU15.png', 'AMD Radeon', 'RX 6500 XT', 4, 2.31, 201, 2, 107, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `motherboard`
--

CREATE TABLE `motherboard` (
  `IdMotherboard` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(65,2) NOT NULL,
  `ImageURL` varchar(100) DEFAULT NULL,
  `Socket` varchar(100) NOT NULL,
  `Chipset` varchar(100) NOT NULL,
  `FormFactor` varchar(100) NOT NULL,
  `RAMType` varchar(100) NOT NULL COMMENT 'DDR4, DDR5',
  `NumberOfRAMSlots` int(11) NOT NULL,
  `MaxEthernetSpeed` float NOT NULL,
  `WifiIncluded` tinyint(1) NOT NULL,
  `BluetoothIncluded` tinyint(1) NOT NULL,
  `PCIe_x16_5` int(11) NOT NULL,
  `PCIe_x16_4` int(11) NOT NULL,
  `PCIe_x8` int(11) NOT NULL,
  `PCIe_x4` int(11) NOT NULL,
  `PCIe_x1` int(11) NOT NULL,
  `M2_5` int(11) NOT NULL,
  `M2_4` int(11) NOT NULL,
  `NumberOfSATA` int(11) NOT NULL,
  `USB_2` int(11) NOT NULL,
  `USB_32_1` int(11) NOT NULL,
  `USB_32_2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `motherboard`
--

INSERT INTO `motherboard` (`IdMotherboard`, `Brand`, `Name`, `Price`, `ImageURL`, `Socket`, `Chipset`, `FormFactor`, `RAMType`, `NumberOfRAMSlots`, `MaxEthernetSpeed`, `WifiIncluded`, `BluetoothIncluded`, `PCIe_x16_5`, `PCIe_x16_4`, `PCIe_x8`, `PCIe_x4`, `PCIe_x1`, `M2_5`, `M2_4`, `NumberOfSATA`, `USB_2`, `USB_32_1`, `USB_32_2`) VALUES
(1, 'Asus', 'ROG STRIX B550-A GAMING', '146.75', 'Motherboard1.png', 'AM4', 'B550', 'ATX', 'DDR4', 4, 2.5, 0, 0, 0, 2, 0, 0, 3, 0, 2, 3, 2, 1, 0),
(2, 'MSI ', 'MPG B650I EDGE WIFI', '260.49', 'Motherboard2.png', 'AM5', 'B650', 'Mini ITX', 'DDR5', 2, 2.5, 1, 1, 0, 1, 0, 0, 0, 0, 2, 1, 1, 1, 1),
(3, 'MSI', 'MAG X570S TOMAHAWK MAX WIFI', '279.14', 'Motherboard3.png', 'AM4', 'X570', 'ATX', 'DDR4', 4, 2.5, 1, 1, 0, 2, 0, 0, 2, 0, 2, 6, 2, 2, 1),
(4, 'MSI', 'PRO X670-P WIFI', '317.02', 'Motherboard4.png', 'AM5', 'X670', 'ATX', 'DDR5', 4, 2.5, 1, 1, 0, 3, 0, 0, 1, 1, 3, 6, 2, 2, 1),
(5, 'Asus', 'ROG STRIX X670E-E GAMING WIFI', '531.41', 'Motherboard5.png', 'AM5', 'X670E', 'ATX', 'DDR5', 4, 2.5, 1, 1, 2, 1, 0, 0, 0, 3, 1, 4, 3, 1, 1),
(6, 'Asus', 'PRIME Z690M-PLUS D4', '207.25', 'Motherboard6.png', 'LGA1700', 'Z690', 'Micro ATX', 'DDR4', 4, 1, 0, 0, 0, 2, 0, 0, 2, 0, 3, 4, 2, 1, 1),
(7, 'MSI', 'MAG Z790 TOMAHAWK WIFI', '319.32', 'Motherboard7.png', 'LGA1700', 'Z790', 'ATX', 'DDR5', 4, 2.5, 1, 1, 1, 1, 0, 0, 1, 0, 4, 7, 2, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `orderhistory`
--

CREATE TABLE `orderhistory` (
  `IdOrder` int(11) NOT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp() COMMENT 'Returned as:\r\nYYYY-MM-DD',
  `TotalCost` decimal(65,2) NOT NULL,
  `User` varchar(100) NOT NULL,
  `CPU` int(11) DEFAULT NULL,
  `Motherboard` int(11) DEFAULT NULL,
  `RAM` int(11) DEFAULT NULL,
  `GPU` int(11) DEFAULT NULL,
  `Storage` int(11) DEFAULT NULL,
  `PSU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `orderhistory`
--

INSERT INTO `orderhistory` (`IdOrder`, `Date`, `TotalCost`, `User`, `CPU`, `Motherboard`, `RAM`, `GPU`, `Storage`, `PSU`) VALUES
(2, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2023-05-18', '1.00', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `psu`
--

CREATE TABLE `psu` (
  `IdPSU` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(65,2) NOT NULL,
  `ImageURL` varchar(100) DEFAULT NULL,
  `Wattage` int(11) NOT NULL COMMENT '[W]',
  `FormFactor` varchar(100) NOT NULL COMMENT 'ATX, SFX',
  `Length` int(11) NOT NULL COMMENT '[mm]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `psu`
--

INSERT INTO `psu` (`IdPSU`, `Brand`, `Name`, `Price`, `ImageURL`, `Wattage`, `FormFactor`, `Length`) VALUES
(1, 'Corsair', 'RM550x', '119.99', 'PSU1.png', 550, 'ATX', 160),
(2, 'Corsair', 'RM650x', '160.24', 'PSU2.png', 650, 'ATX', 160),
(3, 'Corsair', 'RM750x', '139.22', 'PSU3.png', 750, 'ATX', 160),
(4, 'Corsair', 'RM850x', '157.99', 'PSU4.png', 850, 'ATX', 160),
(5, 'Corsair', 'RM1000x', '184.00', 'PSU5.png', 1000, 'ATX', 180),
(6, 'SeaSonic', 'PRIME TX', '203.94', 'PSU6.png', 650, 'ATX', 170),
(7, 'SeaSonic', 'PRIME TX', '291.98', 'PSU7.png', 750, 'ATX', 170),
(8, 'SeaSonic', 'PRIME TX', '292.01', 'PSU8.png', 850, 'ATX', 170),
(9, 'SeaSonic', 'PRIME TX', '459.00', 'PSU9.png', 1000, 'ATX', 170);

-- --------------------------------------------------------

--
-- Struttura della tabella `ram`
--

CREATE TABLE `ram` (
  `IdRAM` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(65,2) NOT NULL,
  `ImageURL` varchar(100) DEFAULT NULL,
  `RAMType` varchar(100) NOT NULL COMMENT 'DDR4, DDR5',
  `Speed` int(11) NOT NULL COMMENT '[MT/s]',
  `TotalSize` int(11) NOT NULL COMMENT '[GB]',
  `NumberOfSticks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ram`
--

INSERT INTO `ram` (`IdRAM`, `Brand`, `Name`, `Price`, `ImageURL`, `RAMType`, `Speed`, `TotalSize`, `NumberOfSticks`) VALUES
(1, 'Corsair', 'Vengeance RGB Pro SL', '129.99', 'RAM1.png', 'DDR4', 3200, 32, 4),
(2, 'Corsair', 'Vengeance RGB', '144.06', 'RAM2.png', 'DDR5', 6000, 32, 2),
(3, 'G.Skill', 'Trident Z RGB', '241.00', 'RAM3.png', 'DDR4', 3600, 64, 2),
(4, 'G.Skill', 'Trident Z RGB', '67.21', 'RAM4.png', 'DDR4', 3200, 8, 1),
(5, 'Kingston', 'FURY Beast RGB', '90.33', 'RAM5.png', 'DDR5', 5600, 16, 1),
(6, 'Corsair', 'Vengeance', '223.07', 'RAM6.png', 'DDR5', 7200, 32, 2),
(7, 'Corsair', 'Vengeance RGB', '272.44', 'RAM7.png', 'DDR5', 7200, 32, 2),
(8, 'Corsair', 'Vengeance RGB', '658.71', 'RAM8.png', 'DDR5', 6600, 64, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `storage`
--

CREATE TABLE `storage` (
  `IdStorage` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(65,2) NOT NULL,
  `ImageURL` varchar(100) DEFAULT NULL,
  `Type` varchar(100) NOT NULL COMMENT 'NVMe M.2 5/4, SATA',
  `Size` int(11) NOT NULL COMMENT 'GB'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `storage`
--

INSERT INTO `storage` (`IdStorage`, `Brand`, `Name`, `Price`, `ImageURL`, `Type`, `Size`) VALUES
(1, 'Samsung', '980 Pro', '72.98', 'Storage1.png', 'NVMe M.2 4.0', 500),
(2, 'Samsung', '980 Pro', '96.45', 'Storage2.png', 'NVMe M.2 4.0', 1000),
(3, 'Samsung', '980 Pro', '154.90', 'Storage3.png', 'NVMe M.2 4.0', 2000),
(4, 'Gigabyte', 'AORUS', '516.50', 'Storage4.png', 'NVMe M.2 5.0', 2000),
(5, 'Corsair', 'MP700', '376.00', 'Storage5.png', 'NVMe M.2 5.0', 2000),
(6, 'Samsung', '870 Evo', '36.99', 'Storage6.png', 'SATA', 250),
(7, 'Samsung', '870 Evo', '45.90', 'Storage7.png', 'SATA', 500),
(8, 'Samsung', '870 Evo', '76.38', 'Storage8.png', 'SATA', 1000),
(9, 'Samsung', '870 Evo', '125.01', 'Storage9.png', 'SATA', 2000);

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Balance` decimal(65,2) NOT NULL DEFAULT 0.00,
  `CPU` int(11) DEFAULT NULL,
  `Motherboard` int(11) DEFAULT NULL,
  `RAM` int(11) DEFAULT NULL,
  `GPU` int(11) DEFAULT NULL,
  `Storage` int(11) DEFAULT NULL,
  `PSU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`Username`, `Password`, `Balance`, `CPU`, `Motherboard`, `RAM`, `GPU`, `Storage`, `PSU`) VALUES
('Admin', 'admin', '0.00', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cpu`
--
ALTER TABLE `cpu`
  ADD PRIMARY KEY (`IdCPU`),
  ADD UNIQUE KEY `ImageURL` (`ImageURL`);

--
-- Indici per le tabelle `gpu`
--
ALTER TABLE `gpu`
  ADD PRIMARY KEY (`IdGPU`),
  ADD UNIQUE KEY `ImageURL` (`ImageURL`);

--
-- Indici per le tabelle `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`IdMotherboard`),
  ADD UNIQUE KEY `ImageURL` (`ImageURL`);

--
-- Indici per le tabelle `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD PRIMARY KEY (`IdOrder`),
  ADD KEY `Commission_User` (`User`);

--
-- Indici per le tabelle `psu`
--
ALTER TABLE `psu`
  ADD PRIMARY KEY (`IdPSU`),
  ADD UNIQUE KEY `ImageURL` (`ImageURL`);

--
-- Indici per le tabelle `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`IdRAM`),
  ADD UNIQUE KEY `ImageURL` (`ImageURL`);

--
-- Indici per le tabelle `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`IdStorage`),
  ADD UNIQUE KEY `ImageURL` (`ImageURL`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`),
  ADD KEY `User_CPU` (`CPU`),
  ADD KEY `User_Motherboard` (`Motherboard`),
  ADD KEY `User_RAM` (`RAM`),
  ADD KEY `User_GPU` (`GPU`),
  ADD KEY `User_Storage` (`Storage`),
  ADD KEY `User_PSU` (`PSU`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `cpu`
--
ALTER TABLE `cpu`
  MODIFY `IdCPU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT per la tabella `gpu`
--
ALTER TABLE `gpu`
  MODIFY `IdGPU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `IdMotherboard` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `orderhistory`
--
ALTER TABLE `orderhistory`
  MODIFY `IdOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT per la tabella `psu`
--
ALTER TABLE `psu`
  MODIFY `IdPSU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `ram`
--
ALTER TABLE `ram`
  MODIFY `IdRAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1218;

--
-- AUTO_INCREMENT per la tabella `storage`
--
ALTER TABLE `storage`
  MODIFY `IdStorage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `Orderhistory_User` FOREIGN KEY (`User`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `User_CPU` FOREIGN KEY (`CPU`) REFERENCES `cpu` (`IdCPU`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `User_GPU` FOREIGN KEY (`GPU`) REFERENCES `gpu` (`IdGPU`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `User_Motherboard` FOREIGN KEY (`Motherboard`) REFERENCES `motherboard` (`IdMotherboard`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `User_PSU` FOREIGN KEY (`PSU`) REFERENCES `psu` (`IdPSU`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `User_RAM` FOREIGN KEY (`RAM`) REFERENCES `ram` (`IdRAM`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `User_Storage` FOREIGN KEY (`Storage`) REFERENCES `storage` (`IdStorage`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
