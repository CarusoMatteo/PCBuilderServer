-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 30, 2023 alle 09:12
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

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
-- Struttura della tabella `commission`
--

CREATE TABLE `commission` (
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
-- Struttura della tabella `cpu`
--

CREATE TABLE `cpu` (
  `IdCPU` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Series` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(65,2) NOT NULL,
  `ImageURL` varchar(100) NOT NULL,
  `NumberOfCores` int(11) NOT NULL,
  `ClockSpeed` float NOT NULL COMMENT '[GHz]',
  `TDP` int(11) NOT NULL COMMENT '[W]',
  `Architecture` varchar(100) NOT NULL,
  `Socket` varchar(100) NOT NULL,
  `IntegratedGraphics` tinyint(1) NOT NULL,
  `CoolerIncluded` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `gpu`
--

CREATE TABLE `gpu` (
  `IdGPU` int(11) NOT NULL,
  `Brand` int(11) NOT NULL,
  `Name` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `ImageURL` int(11) NOT NULL,
  `ChipsetBrand` int(11) NOT NULL,
  `Chipset` int(11) NOT NULL,
  `VRAMSize` int(11) NOT NULL COMMENT '[GB]',
  `ClockSpeed` int(11) NOT NULL COMMENT '[GHz]',
  `Length` int(11) NOT NULL COMMENT '[mm]',
  `Height` int(11) NOT NULL COMMENT '[Slots]',
  `TDP` int(11) NOT NULL,
  `NumebrOfHDMI` int(11) NOT NULL,
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
  `ImageURL` varchar(100) NOT NULL,
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
  `ESPConnectors` int(11) NOT NULL,
  `USB_2` int(11) NOT NULL,
  `USB_32_1` int(11) NOT NULL,
  `USB_32_2` int(11) NOT NULL
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
  `ImageURL` varchar(100) NOT NULL,
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
  `ImageURL` varchar(100) NOT NULL,
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
  `ImageURL` varchar(100) NOT NULL,
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
('Admin', 'admin', '0.00', NULL, NULL, NULL, NULL, NULL, NULL),
('Matteo', 'P', '0.00', NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`IdOrder`),
  ADD KEY `Commission_User` (`User`);

--
-- Indici per le tabelle `cpu`
--
ALTER TABLE `cpu`
  ADD PRIMARY KEY (`IdCPU`);

--
-- Indici per le tabelle `gpu`
--
ALTER TABLE `gpu`
  ADD PRIMARY KEY (`IdGPU`);

--
-- Indici per le tabelle `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`IdMotherboard`);

--
-- Indici per le tabelle `psu`
--
ALTER TABLE `psu`
  ADD PRIMARY KEY (`IdPSU`);

--
-- Indici per le tabelle `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`IdRAM`);

--
-- Indici per le tabelle `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`IdStorage`);

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
-- AUTO_INCREMENT per la tabella `commission`
--
ALTER TABLE `commission`
  MODIFY `IdOrder` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `cpu`
--
ALTER TABLE `cpu`
  MODIFY `IdCPU` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `gpu`
--
ALTER TABLE `gpu`
  MODIFY `IdGPU` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `IdMotherboard` int(11) NOT NULL AUTO_INCREMENT;

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
-- Limiti per la tabella `commission`
--
ALTER TABLE `commission`
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
