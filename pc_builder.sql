-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 10, 2023 alle 20:27
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cpu`
--

INSERT INTO `cpu` (`IdCPU`, `Brand`, `Series`, `Name`, `Price`, `ImageURL`, `NumberOfCores`, `ClockSpeed`, `TDP`, `Architecture`, `Socket`, `IntegratedGraphics`, `CoolerIncluded`) VALUES
(1, 'AMD', 'Ryzen 5', '5600X', 170.40, 'CPU1.png', 6, 3.7, 65, 'Zen 3', 'AM4', 0, 1),
(2, 'AMD', 'Ryzen 7', '5700X', 203.90, 'CPU2.png', 8, 3.4, 65, 'Zen 3', 'AM4', 0, 0),
(3, 'AMD', 'Ryzen 7', '5800X3D', 310.00, 'CPU3.png', 8, 3.4, 105, 'Zen 3', 'AM4', 0, 0),
(4, 'AMD', 'Ryzen 9', '5950X', 513.36, 'CPU4.png', 16, 3.4, 105, 'Zen 3', 'AM4', 0, 0),
(5, 'AMD', 'Ryzen 5', '7600X', 243.40, 'CPU5.png', 6, 4.7, 105, 'Zen 4', 'AM5', 1, 0),
(6, 'AMD', 'Ryzen 7', '7700X', 335.35, 'CPU6.png', 8, 4.5, 105, 'Zen 4', 'AM5', 1, 0),
(7, 'AMD', 'Ryzen 7', '7800X3D', 520.90, 'CPU7.png', 8, 4.2, 120, 'Zen 4', 'AM5', 1, 0),
(8, 'AMD', 'Ryzen 9', '7950X', 600.00, 'CPU8.png', 16, 4.5, 170, 'Zen 4', 'AM5', 1, 0),
(9, 'AMD', 'Ryzen 9', '7950X3D', 777.27, 'CPU9.png', 16, 4.2, 120, 'Zen 4', 'AM5', 1, 0),
(10, 'Intel', 'Core i3', '12100F', 100.70, 'CPU10.png', 4, 3.3, 58, 'Alder Lake', 'LGA1700', 0, 1),
(11, 'Intel', 'Core i3', '12100', 148.99, 'CPU11.png', 4, 3.3, 60, 'Alder Lake', 'LGA1700', 1, 1),
(12, 'Intel', 'Core i5', '12600KF', 253.71, 'CPU12.png', 10, 3.7, 125, 'Alder Lake', 'LGA1700', 0, 0),
(13, 'Intel', 'Core i5', '12600K', 286.39, 'CPU13.png', 10, 3.7, 125, 'Alder Lake', 'LGA1700', 1, 0),
(14, 'Intel', 'Core i7', '12700KF', 329.68, 'CPU14.png', 12, 3.6, 125, 'Alder Lake', 'LGA1700', 0, 0),
(15, 'Intel', 'Core i7', '12700K', 360.79, 'CPU15.png', 12, 3.6, 125, 'Alder Lake', 'LGA1700', 1, 0),
(16, 'Intel', 'Core i9', '12900K', 475.58, 'CPU16.png', 16, 3.2, 125, 'Alder Lake', 'LGA1700', 1, 0),
(17, 'Intel', 'Core i9', '12900KS', 571.04, 'CPU17.png', 16, 3.4, 150, 'Alder Lake', 'LGA1700', 1, 0),
(18, 'Intel', 'Core i3', '13100F', 133.31, 'CPU18.png', 4, 3.4, 58, 'Raptor Lake', 'LGA1700', 0, 1),
(19, 'Intel', 'Core i3', '13100', 162.00, 'CPU19.png', 4, 3.4, 60, 'Raptor Lake', 'LGA1700', 1, 1),
(20, 'Intel', 'Core i5', '13600KF', 322.06, 'CPU20.png', 14, 3.5, 125, 'Raptor Lake', 'LGA1700', 0, 0),
(21, 'Intel', 'Core i5', '13600K', 341.88, 'CPU21.png', 14, 3.5, 125, 'Raptor Lake', 'LGA1700', 1, 0),
(22, 'Intel', 'Core i7', '13700KF', 415.96, 'CPU22.png', 16, 3.4, 125, 'Raptor Lake', 'LGA1700', 0, 0),
(23, 'Intel', 'Core i7', '13700K', 437.04, 'CPU23.png', 16, 3.4, 125, 'Raptor Lake', 'LGA1700', 1, 0),
(24, 'Intel', 'Core i9', '13900K', 599.49, 'CPU24.png', 24, 3, 125, 'Raptor Lake', 'LGA1700', 1, 0),
(25, 'Intel', 'Core i9', '13900KS', 981.27, 'CPU25.png', 24, 3, 150, 'Raptor Lake', 'LGA1700', 1, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `gpu`
--

CREATE TABLE `gpu` (
  `IdGPU` int(11) NOT NULL,
  `Brand` int(11) NOT NULL,
  `Name` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `ImageURL` int(11) DEFAULT NULL,
  `ChipsetBrand` int(11) NOT NULL,
  `Chipset` int(11) NOT NULL,
  `VRAMSize` int(11) NOT NULL COMMENT '[GB]',
  `ClockSpeed` int(11) NOT NULL COMMENT '[GHz]',
  `Length` int(11) NOT NULL COMMENT '[mm]',
  `Size` int(11) NOT NULL COMMENT '[Slots]',
  `TDP` int(11) NOT NULL,
  `NumberOfHDMI` int(11) NOT NULL,
  `NumberOfDisplayPort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `motherboard`
--

INSERT INTO `motherboard` (`IdMotherboard`, `Brand`, `Name`, `Price`, `ImageURL`, `Socket`, `Chipset`, `FormFactor`, `RAMType`, `NumberOfRAMSlots`, `MaxEthernetSpeed`, `WifiIncluded`, `BluetoothIncluded`, `PCIe_x16_5`, `PCIe_x16_4`, `PCIe_x8`, `PCIe_x4`, `PCIe_x1`, `M2_5`, `M2_4`, `NumberOfSATA`, `USB_2`, `USB_32_1`, `USB_32_2`) VALUES
(1, 'Asus', 'ROG STRIX B550-A GAMING', 146.75, 'Motherboard1.png', 'AM4', 'B550', 'ATX', 'DDR4', 4, 2.5, 0, 0, 0, 2, 0, 0, 3, 0, 2, 3, 2, 1, 0),
(2, 'MSI ', 'MPG B650I EDGE WIFI', 260.49, 'Motherboard2.png', 'AM5', 'B650', 'Mini ITX', 'DDR5', 2, 2.5, 1, 1, 0, 1, 0, 0, 0, 0, 2, 1, 1, 1, 1),
(3, 'MSI', 'MAG X570S TOMAHAWK MAX WIFI', 279.14, 'Motherboard3.png', 'AM4', 'X570', 'ATX', 'DDR4', 4, 2.5, 1, 1, 0, 2, 0, 0, 2, 0, 2, 6, 2, 2, 1),
(4, 'MSI', 'PRO X670-P WIFI', 317.02, 'Motherboard4.png', 'AM5', 'X670', 'ATX', 'DDR5', 4, 2.5, 1, 1, 0, 3, 0, 0, 1, 1, 3, 6, 2, 2, 1),
(5, 'Asus', 'ROG STRIX X670E-E GAMING WIFI', 531.41, 'Motherboard5.png', 'AM5', 'X670E', 'ATX', 'DDR5', 4, 2.5, 1, 1, 2, 1, 0, 0, 0, 3, 1, 4, 3, 1, 1),
(6, 'Asus', 'PRIME Z690M-PLUS D4', 207.25, 'Motherboard6.png', 'LGA1700', 'Z690', 'Micro ATX', 'DDR4', 4, 1, 0, 0, 0, 2, 0, 0, 2, 0, 3, 4, 2, 1, 1),
(7, 'MSI', 'MAG Z790 TOMAHAWK WIFI', 319.32, 'Motherboard7.png', 'LGA1700', 'Z790', 'ATX', 'DDR5', 4, 2.5, 1, 1, 1, 1, 0, 0, 1, 0, 4, 7, 2, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `orderhistory`
--

CREATE TABLE `orderhistory` (
  `IdOrder` int(11) NOT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `TotalCost` decimal(65,2) NOT NULL,
  `User` varchar(100) NOT NULL,
  `CPU` int(11) NOT NULL,
  `Motherboard` int(11) NOT NULL,
  `RAM` int(11) NOT NULL,
  `GPU` int(11) NOT NULL,
  `Storage` int(11) NOT NULL,
  `PSU` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Length` int(11) NOT NULL COMMENT '[mm]',
  `ESPConnectors` int(11) NOT NULL,
  `PCIeConnectors` int(11) NOT NULL,
  `SATAConnectors` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`Username`, `Password`, `Balance`, `CPU`, `Motherboard`, `RAM`, `GPU`, `Storage`, `PSU`) VALUES
('Admin', 'admin', 0.00, 23, 4, NULL, NULL, NULL, NULL),
('Matteo', 'p', 0.00, 1, 7, NULL, NULL, NULL, NULL),
('Utente', 'u', 0.00, NULL, NULL, NULL, NULL, NULL, NULL);

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
  MODIFY `IdGPU` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `IdMotherboard` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `orderhistory`
--
ALTER TABLE `orderhistory`
  MODIFY `IdOrder` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `psu`
--
ALTER TABLE `psu`
  MODIFY `IdPSU` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ram`
--
ALTER TABLE `ram`
  MODIFY `IdRAM` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `storage`
--
ALTER TABLE `storage`
  MODIFY `IdStorage` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `Commission_User` FOREIGN KEY (`User`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

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
