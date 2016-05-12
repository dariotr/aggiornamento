-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Creato il: Mag 12, 2016 alle 13:20
-- Versione del server: 5.5.42
-- Versione PHP: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_slingshot`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `appartenenze`
--

CREATE TABLE `appartenenze` (
  `UTENTE` int(11) NOT NULL,
  `COMPETENZA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `aziende`
--

CREATE TABLE `aziende` (
  `ID_UTENTE` int(11) NOT NULL,
  `PARTITA_IVA` decimal(11,0) NOT NULL,
  `RAGIONE_SOCIALE` varchar(100) NOT NULL,
  `INDIRIZZO` varchar(150) NOT NULL,
  `NUMERO_CIVICO` decimal(10,0) DEFAULT NULL,
  `CAP` decimal(5,0) unsigned NOT NULL,
  `CITTA` varchar(50) NOT NULL,
  `REGIONE` varchar(50) NOT NULL,
  `NAZIONE` varchar(50) NOT NULL,
  `PROVINCIA` char(2) NOT NULL,
  `FOTO` varchar(500) DEFAULT NULL,
  `DESCRIZIONE` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `aziende`
--

INSERT INTO `aziende` (`ID_UTENTE`, `PARTITA_IVA`, `RAGIONE_SOCIALE`, `INDIRIZZO`, `NUMERO_CIVICO`, `CAP`, `CITTA`, `REGIONE`, `NAZIONE`, `PROVINCIA`, `FOTO`, `DESCRIZIONE`) VALUES
(6, '152544789', 'spa altervista', 'via ottaviano ', '54625', '80125', 'Napoli', 'Campania', 'Campania', 'NA', NULL, 'qUESTA AZIENDA è MOLTO BELLA'),
(16, '87458745126', 'SPA Nazioni UniteLK', 'viasjsha', '454548', '99999', 'naposk', 'ITlosk', 'naiisjah', 'ND', NULL, NULL),
(17, '87458745126', 'SPA Nazioni Unite', 'viasjsha', '454548', '99999', 'naposk', 'ITlosk', 'naiisjah', 'ND', NULL, NULL),
(21, '87458745126', 'SPA Nazioni Unite', 'viasjsha', '454548', '99999', 'naposk', 'ITlosk', 'naiisjah', 'ND', NULL, NULL),
(24, '87458745126', 'SPA Nazioni Unite', 'viasjsha', '454548', '99999', 'naposk', 'ITlosk', 'naiisjah', 'ND', NULL, NULL),
(27, '0', 'jhgfghjk', 'via giotto', '214545', '2154', 'napoli', 'italiana', 'campania', 'NA', NULL, NULL),
(29, '0', 'jhgfghjk', 'via giotto', '214545', '2154', 'napoli', 'italianajhj', 'campania', 'ND', NULL, NULL),
(30, '0', 'jhgfghjk', 'via giotto', '214545', '2154', 'napoli', 'italiana', 'campania', 'RO', NULL, NULL),
(31, '2151515516', 'Spa Anged', 'via orrti', '21548', '80125', 'napoli', 'ITALIANA', 'campania', 'NA', NULL, NULL),
(32, '2151515516', 'Spa Anged', 'via orrti', '21548', '80125', 'napoli', 'italiana', 'campania', 'ND', NULL, NULL),
(35, '99999999999', 'Spa Posa', 'via asdaj', '2515885', '80125', 'napoli', 'italia', 'campania', 'RO', NULL, NULL),
(36, '125585896', 'Spa Posatere', 'via asdaj', '2515885', '80125', 'napoli', 'nonsa', 'camp', 'ND', NULL, NULL),
(37, '125585896', 'Spa Posatere', 'via asdaj', '2515885', '80125', 'napoli', 'nonsa', 'camp', 'ND', NULL, NULL),
(39, '124542155', 'NonSense spa', 'via orticosola', '882454', '80126', 'napoli', 'italia', 'Napoli', 'NA', NULL, NULL),
(48, '54554521', 'NNhaij', 'linoak', '5653', '54512', 'napol', 'fghjhg', 'najs', 'ND', NULL, NULL),
(52, '455124848', 'SPA Nazioni Unite', 'via orisorigerino', '1254', '80125', 'Napoli', 'Italia', 'Campania', 'NA', NULL, ''),
(53, '12553256', 'Mario SPA jj', 'vidoso', '5423', '12556', 'campans', 'jenovdg', 'collisoke', 'ND', NULL, NULL),
(56, '3333', 'Silent Hill', 'via sidsj', '2155', '11252', 'jhakfo', 'Britnais', 'inglese', 'ND', 'cat.jpeg', '');

--
-- Trigger `aziende`
--
DELIMITER $$
CREATE TRIGGER `VALIDAIONE_UTENTE_INSERIMENTO_AZIENDA` BEFORE INSERT ON `aziende`
 FOR EACH ROW BEGIN
        IF ( (SELECT `TIPO`
        FROM UTENTI 
        WHERE `ID` = NEW.`ID_UTENTE`) != 'AZIENDA')
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'l UTENTE che vuoi inserire è un PERSONA';
        END IF;
         
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `VALIDAIONE_UTENTE_MODIFICA_AZIENDA` BEFORE UPDATE ON `aziende`
 FOR EACH ROW BEGIN
        IF ( (SELECT `TIPO`
        FROM UTENTI 
        WHERE `ID` = NEW.`ID_UTENTE`) != 'AZIENDA')
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'l UTENTE che vuoi inserire è un PERSONA';
        END IF;
         
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `commenti`
--

CREATE TABLE `commenti` (
  `ID` int(11) NOT NULL,
  `CORPO` varchar(5000) NOT NULL,
  `DATA_INSERIMENTO` datetime NOT NULL,
  `COMMENTATORE` int(11) NOT NULL,
  `IDEA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `commenti`
--
DELIMITER $$
CREATE TRIGGER `INSERIMENTO_COMMENTO` BEFORE INSERT ON `commenti`
 FOR EACH ROW BEGIN
        SET NEW.`DATA_INSERIMENTO` = NOW();
         
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `competenze`
--

CREATE TABLE `competenze` (
  `TAG` varchar(50) NOT NULL,
  `TITOLO` varchar(50) NOT NULL,
  `DESCRIZIONE` varchar(5000) NOT NULL,
  `SETTORE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `contatti`
--

CREATE TABLE `contatti` (
  `ID` int(11) NOT NULL,
  `TELEFONO` decimal(12,0) DEFAULT NULL,
  `FAX` decimal(12,0) DEFAULT NULL,
  `CELLULARE` decimal(12,0) DEFAULT NULL,
  `SITO_WEB` varchar(150) DEFAULT NULL,
  `FACEBOOK` varchar(150) DEFAULT NULL,
  `TWITTER` varchar(150) DEFAULT NULL,
  `LINKEDIN` varchar(150) DEFAULT NULL,
  `PROPRIETARIO` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `contatti`
--

INSERT INTO `contatti` (`ID`, `TELEFONO`, `FAX`, `CELLULARE`, `SITO_WEB`, `FACEBOOK`, `TWITTER`, `LINKEDIN`, `PROPRIETARIO`) VALUES
(1, '215545', NULL, '125464', 'www.met.it', NULL, NULL, 'linkem', 6),
(4, '215454', NULL, NULL, NULL, NULL, NULL, NULL, 16),
(5, '215454', NULL, NULL, NULL, NULL, NULL, NULL, 17),
(6, '215454', NULL, NULL, NULL, NULL, NULL, NULL, 21),
(7, '215454', NULL, NULL, NULL, NULL, NULL, NULL, 24),
(10, '12442155', NULL, NULL, NULL, NULL, NULL, NULL, 27),
(11, '12442155', NULL, NULL, NULL, NULL, NULL, NULL, 29),
(12, '12442155', NULL, NULL, NULL, NULL, NULL, NULL, 30),
(13, '254558', NULL, NULL, NULL, NULL, NULL, NULL, 31),
(14, '254558', NULL, NULL, NULL, NULL, NULL, NULL, 32),
(15, '551254545', NULL, NULL, 'www.alfaroger.com', NULL, NULL, NULL, 35),
(16, '551254545', NULL, NULL, 'www.alfaroger.com', NULL, NULL, NULL, 36),
(17, '551254545', NULL, NULL, 'www.alfaroger.com', NULL, NULL, NULL, 37),
(18, '1255542', NULL, NULL, 'www.altervista.it', NULL, NULL, NULL, 39),
(27, '2245488', NULL, NULL, NULL, NULL, NULL, NULL, 48),
(30, '125565488', NULL, NULL, 'www.altrtable.it', NULL, NULL, NULL, 52),
(31, '215565458', NULL, NULL, NULL, NULL, NULL, NULL, 53),
(33, '21545', '5555', '222222', 'ssss', 'sssss', 'ciaoo', 'ciaoao', 56);

-- --------------------------------------------------------

--
-- Struttura della tabella `eventi`
--

CREATE TABLE `eventi` (
  `ID` int(11) NOT NULL,
  `IDEA` int(11) DEFAULT NULL,
  `DATA_INSERIMENTO` datetime NOT NULL,
  `DATA_SVOLGIMENTO` datetime NOT NULL,
  `TITOLO` varchar(50) NOT NULL,
  `DESCRIZIONE` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `eventi`
--
DELIMITER $$
CREATE TRIGGER `INSERIMENTO_EVENTO` BEFORE INSERT ON `eventi`
 FOR EACH ROW BEGIN
        SET NEW.`DATA_INSERIMENTO` = NOW();
         
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `feedback`
--

CREATE TABLE `feedback` (
  `REFERENTE` int(11) NOT NULL,
  `RIFERITO` int(11) NOT NULL,
  `VOTO` int(10) DEFAULT NULL,
  `DESCRIZIONE` varchar(1000) DEFAULT NULL,
  `IDEA` int(11) NOT NULL,
  `DATA_INSERIMENTO` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `feedback`
--
DELIMITER $$
CREATE TRIGGER `ERRORE_MODIFICA_FEEDBACK` BEFORE UPDATE ON `feedback`
 FOR EACH ROW BEGIN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'I FEEDBACK NON possono essere modificati';
         
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `MODIFICA_REPUTAZIONE_UTENTE` AFTER INSERT ON `feedback`
 FOR EACH ROW BEGIN
        UPDATE UTENTI SET REPUTAZIONE = (SELECT AVG(VOTO)
        FROM FEEDBACK
        WHERE FEEDBACK.`RIFERITO` = UTENTI.`ID`) 
        WHERE  UTENTI.`ID` = NEW.`RIFERITO`;
                 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `VALIDAZIONE_INSERIMENTO_FEEDBACK` BEFORE INSERT ON `feedback`
 FOR EACH ROW BEGIN
        IF ( (SELECT `ID`
        FROM UTENTI
        WHERE `ID` = NEW.`REFERENTE`) IS NULL)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'L utente REFERENTE NON esiste sul database';
        END IF;
                IF ( (SELECT `ID`
        FROM UTENTI
        WHERE `ID` = NEW.`RIFERITO`) IS NULL)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'L utente RIFERITO NON esiste sul database';
        END IF;
        IF ( (SELECT `ID`
        FROM IDEE
        WHERE `ID` = NEW.`IDEA`) IS NULL)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Questa IDEA NON esiste sul database';
        END IF;
            IF ( (SELECT `ID`
        FROM UTENTI
        WHERE `ID` = NEW.`REFERENTE`) = NEW.`RIFERITO`)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'L utente REFERENTE NON può essere uguale al RIFERITO';
        END IF;
        IF ( (SELECT `UTENTE`
        FROM PARTECIPAZIONI
        WHERE `UTENTE` = NEW.`REFERENTE`AND `IDEA`= NEW.`IDEA`) IS NULL)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'il REFERENTE che vuoi inserire NON ha partecipato all IDEA';
        END IF;
        IF ( (SELECT `UTENTE`
        FROM PARTECIPAZIONI
        WHERE `UTENTE` = NEW.`RIFERITO`AND `IDEA`= NEW.`IDEA`) IS NULL)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'il RIFERITO che vuoi inserire NON ha partecipato all IDEA';
        END IF;
    IF (NEW.`VOTO` < -5 OR NEW.`VOTO` > 5)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Il VOTO deve essere compreso tra -5 e 5';
        END IF;      
    SET NEW.`DATA_INSERIMENTO` = NOW();
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `idee`
--

CREATE TABLE `idee` (
  `ID` int(11) NOT NULL,
  `TITOLO` varchar(150) NOT NULL,
  `DESCRIZIONE` varchar(5000) NOT NULL,
  `TERMINATA` tinyint(1) NOT NULL DEFAULT '0',
  `NUMERO_LIKE` int(11) DEFAULT '0',
  `DATA_UPDATE` datetime NOT NULL,
  `DATA_CREAZIONE` datetime NOT NULL,
  `DATA_FINE` datetime DEFAULT NULL,
  `SITO_WEB` varchar(150) DEFAULT NULL,
  `CREATORE` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `idee`
--

INSERT INTO `idee` (`ID`, `TITOLO`, `DESCRIZIONE`, `TERMINATA`, `NUMERO_LIKE`, `DATA_UPDATE`, `DATA_CREAZIONE`, `DATA_FINE`, `SITO_WEB`, `CREATORE`) VALUES
(1, 'IDEA', 'quest aè la mia prima idea', 0, 0, '2016-05-11 21:10:54', '2016-05-11 21:10:54', NULL, 'aaaaa.com', 56),
(2, 'aaaa', 'aaaa', 0, 0, '2016-05-11 21:12:04', '2016-05-11 21:12:04', NULL, NULL, 54);

--
-- Trigger `idee`
--
DELIMITER $$
CREATE TRIGGER `INSERIMENTO_IDEA` BEFORE INSERT ON `idee`
 FOR EACH ROW BEGIN
        SET NEW.`DATA_CREAZIONE` = NOW();
        SET NEW.`DATA_UPDATE` = NOW();
         
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE_IDEA` BEFORE UPDATE ON `idee`
 FOR EACH ROW BEGIN
        IF (OLD.`TERMINATA` = FALSE AND NEW.`TERMINATA` = TRUE)
        THEN
            SET NEW.`DATA_FINE` = NOW();
        END IF;
        SET NEW.`DATA_UPDATE` = NOW();
         
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `inclusioni`
--

CREATE TABLE `inclusioni` (
  `SETTORE` int(11) NOT NULL,
  `COMPETENZA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `messaggi`
--

CREATE TABLE `messaggi` (
  `ID` int(11) NOT NULL,
  `OGGETTO` varchar(150) DEFAULT NULL,
  `DATA_INVIO` datetime NOT NULL,
  `TESTO` varchar(5000) NOT NULL,
  `MITTENTE` int(11) NOT NULL,
  `DESTINATARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `messaggi`
--
DELIMITER $$
CREATE TRIGGER `INSERIMENTO_MESSAGGIO` BEFORE INSERT ON `messaggi`
 FOR EACH ROW BEGIN
        SET NEW.`DATA_INVIO` = NOW();
         
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `occorrenze`
--

CREATE TABLE `occorrenze` (
  `IDEA` int(11) NOT NULL,
  `COMPETENZA_RICHIESTA` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `osservazioni`
--

CREATE TABLE `osservazioni` (
  `UTENTE` int(11) NOT NULL,
  `IDEA` int(11) NOT NULL,
  `DATA_INIZIO` datetime NOT NULL,
  `DATA_FINE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `osservazioni`
--
DELIMITER $$
CREATE TRIGGER `INSERIMENTO_OSSERVAZIONE` BEFORE INSERT ON `osservazioni`
 FOR EACH ROW BEGIN
        SET NEW.`DATA_INIZIO` = NOW();
         
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipazioni`
--

CREATE TABLE `partecipazioni` (
  `UTENTE` int(11) NOT NULL,
  `IDEA` int(11) NOT NULL,
  `DATA_INIZIO` datetime NOT NULL,
  `DATA_FINE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Trigger `partecipazioni`
--
DELIMITER $$
CREATE TRIGGER `INSERIMENTO_PARTECIPAZIONE` BEFORE INSERT ON `partecipazioni`
 FOR EACH ROW BEGIN
        SET NEW.`DATA_INIZIO` = NOW();
         
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `persone`
--

CREATE TABLE `persone` (
  `ID_UTENTE` int(11) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `COGNOME` varchar(50) NOT NULL,
  `LUOGO_NASCITA` varchar(50) NOT NULL,
  `DATA_NASCITA` datetime NOT NULL,
  `SESSO` char(1) NOT NULL,
  `INDIRIZZO` varchar(150) NOT NULL,
  `NUMERO_CIVICO` decimal(10,0) DEFAULT NULL,
  `CAP` decimal(5,0) unsigned NOT NULL,
  `CITTA` varchar(50) NOT NULL,
  `REGIONE` varchar(50) NOT NULL,
  `NAZIONE` varchar(50) NOT NULL,
  `PROVINCIA` char(2) NOT NULL,
  `AZIENDA` int(11) DEFAULT NULL,
  `RUOLO` varchar(50) DEFAULT NULL,
  `EDUCAZIONE` varchar(250) DEFAULT NULL,
  `INFO` varchar(500) DEFAULT NULL,
  `FOTO` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `persone`
--

INSERT INTO `persone` (`ID_UTENTE`, `NOME`, `COGNOME`, `LUOGO_NASCITA`, `DATA_NASCITA`, `SESSO`, `INDIRIZZO`, `NUMERO_CIVICO`, `CAP`, `CITTA`, `REGIONE`, `NAZIONE`, `PROVINCIA`, `AZIENDA`, `RUOLO`, `EDUCAZIONE`, `INFO`, `FOTO`) VALUES
(34, 'marco', 'Maresca', 'Nen', '2016-04-27 10:59:52', 'm', 'via attiniano', '1155', '12563', 'napoli', 'camania', 'italia', 'RO', 56, 'programmatore', NULL, NULL, 'cat.jpeg'),
(54, 'Mario', 'Varlese', '', '2016-05-02 00:00:00', 'M', '', NULL, '0', '', '', '', '', 56, 'editor', NULL, NULL, 'random.png'),
(57, 'iao', 'C', '', '2016-05-01 00:00:00', 'M', '', NULL, '0', '', '', '', '', 56, NULL, NULL, NULL, NULL),
(59, 'A', 'B', '', '2016-05-02 00:00:00', 'M', '', NULL, '0', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(60, 'Angelo', 'Rako', '', '2016-05-08 00:00:00', 'M', '', NULL, '0', '', '', '', '', NULL, NULL, NULL, NULL, NULL);

--
-- Trigger `persone`
--
DELIMITER $$
CREATE TRIGGER `VALIDAZIONE_UTENTE_INSERIMENTO_PERSONA` BEFORE INSERT ON `persone`
 FOR EACH ROW BEGIN
        IF ( (SELECT `TIPO`
        FROM UTENTI 
        WHERE `ID` = NEW.`ID_UTENTE`) != 'PERSONA')
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'l UTENTE che vuoi inserire è un AZIENDA';
        END IF;
         
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `VALIDZAIONE_UTENTE_MODIFICA_PERSONA` BEFORE UPDATE ON `persone`
 FOR EACH ROW BEGIN
        IF ( (SELECT `TIPO`
        FROM UTENTI 
        WHERE `ID` = NEW.`ID_UTENTE`) != 'PERSONA')
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'l UTENTE che vuoi inserire è un AZIENDA';
        END IF;
         
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `province`
--

CREATE TABLE `province` (
  `CODICE` char(2) NOT NULL,
  `NOME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `province`
--

INSERT INTO `province` (`CODICE`, `NOME`) VALUES
('NA', 'Napoli'),
('ND', NULL),
('RO', 'Roma');

-- --------------------------------------------------------

--
-- Struttura della tabella `relazioni`
--

CREATE TABLE `relazioni` (
  `IDEA` int(11) NOT NULL,
  `SETTORE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `settori`
--

CREATE TABLE `settori` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `DESCRIZIONE` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `ID` int(11) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PWD` varchar(50) NOT NULL,
  `DATA_REGISTRAZIONE` datetime NOT NULL,
  `DATA_UPDATE` datetime NOT NULL,
  `DATA_ULTIMA_CONNESSIONE` datetime NOT NULL,
  `ONLINE` tinyint(1) NOT NULL,
  `TIPO` char(7) NOT NULL,
  `REPUTAZIONE` int(10) NOT NULL DEFAULT '0',
  `ATTIVO` tinyint(1) NOT NULL DEFAULT '0',
  `CODICE_ATTIVAZIONE` varchar(70) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`ID`, `EMAIL`, `PWD`, `DATA_REGISTRAZIONE`, `DATA_UPDATE`, `DATA_ULTIMA_CONNESSIONE`, `ONLINE`, `TIPO`, `REPUTAZIONE`, `ATTIVO`, `CODICE_ATTIVAZIONE`) VALUES
(6, 'test@test.it', '1234', '2016-04-20 13:31:07', '2016-04-27 10:53:31', '2016-04-20 13:31:07', 0, 'azienda', 0, 1, NULL),
(16, 'test@test.itl', '12345', '2016-04-25 20:24:55', '2016-05-10 12:52:08', '2016-04-25 20:24:55', 0, 'azienda', 0, 1, NULL),
(17, 'test@test.itko', '12345', '2016-04-25 20:25:50', '2016-04-25 20:25:50', '2016-04-25 20:25:50', 0, 'azienda', 0, 0, NULL),
(21, 'test@test.itkok', '126565', '2016-04-25 20:28:50', '2016-04-25 20:28:50', '2016-04-25 20:28:50', 0, 'azienda', 0, 0, NULL),
(24, 'test@tst.itkok', '12364', '2016-04-25 20:31:35', '2016-04-25 20:31:35', '2016-04-25 20:31:35', 0, 'azienda', 0, 1, NULL),
(27, 'taaest@test.it', '1235', '2016-04-25 20:42:09', '2016-04-25 20:42:09', '2016-04-25 20:42:09', 0, 'azienda', 0, 0, NULL),
(29, 'taaest@test.itjkbhh', '123554', '2016-04-25 20:45:14', '2016-04-25 20:45:14', '2016-04-25 20:45:14', 0, 'azienda', 0, 0, NULL),
(30, 'taaest@te.bhh', '12155', '2016-04-25 20:45:45', '2016-04-25 20:45:45', '2016-04-25 20:45:45', 0, 'azienda', 0, 0, NULL),
(31, 'test@test.itmj', '1234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'azienda', 0, 0, NULL),
(32, 'st@test.itmj', '1215', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'azienda', 0, 0, NULL),
(34, 'test@test.com', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2016-04-27 10:59:28', '2016-04-30 11:41:18', '2016-04-27 10:59:28', 0, 'persona', 0, 1, NULL),
(35, 'tals@test.it', '1234', '2016-04-27 11:22:12', '2016-04-27 11:22:12', '2016-04-27 11:22:12', 0, 'azienda', 0, 0, NULL),
(36, 'tals@test.itaaa', '12354', '2016-04-27 11:26:01', '2016-04-27 11:26:01', '2016-04-27 11:26:01', 0, 'azienda', 0, 0, NULL),
(37, 'tals@test.itaa', '12354', '2016-04-27 11:27:13', '2016-04-27 11:29:14', '2016-04-27 11:27:13', 0, 'azienda', 0, 1, NULL),
(38, 'a@a.it', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2016-04-27 12:16:56', '2016-04-27 12:16:56', '2016-04-27 12:16:56', 0, 'azienda', 0, 0, NULL),
(39, 'mario@test.it', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2016-04-30 11:43:59', '2016-04-30 11:44:15', '2016-04-30 11:43:59', 0, 'azienda', 0, 1, NULL),
(48, 'test@test.itlojs', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9', '2016-04-30 12:47:21', '2016-04-30 12:59:12', '2016-04-30 12:47:21', 0, 'azienda', 0, 1, 'ab2b41c63853f0a651ba9fbf502b0cd8'),
(52, 'komish@test.it', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2016-05-03 16:46:08', '2016-05-03 16:59:17', '2016-05-03 16:46:08', 0, 'azienda', 0, 1, 'dcf6070a4ab7f3afbfd2809173e0824b'),
(53, 'alfa@test.it', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2016-05-03 17:00:57', '2016-05-03 17:07:07', '2016-05-03 17:00:57', 0, 'azienda', 0, 0, 'f542eae1949358e25d8bfeefe5b199f1'),
(54, 'a@b.it', '*7EF30F4B0B6C052CE74EA65ABF79C2E188DA56B4', '2016-05-03 22:33:25', '2016-05-03 22:34:14', '2016-05-03 22:33:25', 0, 'PERSONA', 0, 1, 'c98f7372d5'),
(56, 'tst@test.it', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2016-05-06 22:52:36', '2016-05-12 13:16:06', '2016-05-06 22:52:36', 0, 'AZIENDA', 0, 1, 'd7657583058394c828ee150fada65345'),
(57, 'test@test.net', '*A4B6157319038724E3560894F7F932C8886EBFCF', '2016-05-10 14:03:22', '2016-05-10 14:09:08', '2016-05-10 14:03:22', 0, 'PERSONA', 0, 1, 'bcda6e1a6a'),
(58, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', 0, 0, NULL),
(59, 'a@a.a', '$2y$10$CN6fYnQxFNHCypB3CPcBAOBVh6RV/xUIUV59Dk/zHvV', '0000-00-00 00:00:00', '2016-05-10 14:10:14', '0000-00-00 00:00:00', 0, 'PERSONA', 0, 1, '6094640b86'),
(60, 'angelorako@gmail.com', '$2y$10$W1tvHI5lMql66El30LCwnu6jaGxcwKWhD6B66sgwu1M', '0000-00-00 00:00:00', '2016-05-10 14:14:15', '0000-00-00 00:00:00', 0, 'PERSONA', 0, 1, '60a6e758fc');

--
-- Trigger `utenti`
--
DELIMITER $$
CREATE TRIGGER `INSERIMENTO_UTENTE` BEFORE INSERT ON `utenti`
 FOR EACH ROW BEGIN
        SET NEW.`DATA_REGISTRAZIONE` = NOW();
        SET NEW.`DATA_UPDATE` = NOW();
        SET NEW.`DATA_ULTIMA_CONNESSIONE` = NOW();
        IF (NEW.TIPO != 'PERSONA' AND NEW.TIPO != 'AZIENDA')
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'non puoi inserire un utente con TIPO diverso da PERSONA o AZIENDA';
        END IF;
         SET NEW.PWD = PASSWORD(NEW.PWD);
         
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE_UTENTE` BEFORE UPDATE ON `utenti`
 FOR EACH ROW BEGIN
        IF (NEW.`ONLINE` = OLD.`ONLINE`)
        THEN
        SET NEW.`DATA_UPDATE` = NOW();
        END IF;
        IF (NEW.`PWD` != OLD.`PWD`)
        THEN
            SET NEW.`PWD` = PASSWORD(NEW.PWD);
        END IF;
         
END
$$
DELIMITER ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `appartenenze`
--
ALTER TABLE `appartenenze`
  ADD PRIMARY KEY (`UTENTE`,`COMPETENZA`),
  ADD KEY `COMPETENZA` (`COMPETENZA`);

--
-- Indici per le tabelle `aziende`
--
ALTER TABLE `aziende`
  ADD PRIMARY KEY (`ID_UTENTE`),
  ADD KEY `PROVINCIA` (`PROVINCIA`);

--
-- Indici per le tabelle `commenti`
--
ALTER TABLE `commenti`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `COMMENTATORE` (`COMMENTATORE`),
  ADD KEY `IDEA` (`IDEA`);

--
-- Indici per le tabelle `competenze`
--
ALTER TABLE `competenze`
  ADD PRIMARY KEY (`TAG`),
  ADD KEY `SETTORE` (`SETTORE`);

--
-- Indici per le tabelle `contatti`
--
ALTER TABLE `contatti`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PROPRIETARIO` (`PROPRIETARIO`);

--
-- Indici per le tabelle `eventi`
--
ALTER TABLE `eventi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDEA` (`IDEA`);

--
-- Indici per le tabelle `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`REFERENTE`,`RIFERITO`,`IDEA`),
  ADD KEY `RIFERITO` (`RIFERITO`),
  ADD KEY `IDEA` (`IDEA`);

--
-- Indici per le tabelle `idee`
--
ALTER TABLE `idee`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TITOLO` (`TITOLO`),
  ADD KEY `CREATORE` (`CREATORE`);

--
-- Indici per le tabelle `inclusioni`
--
ALTER TABLE `inclusioni`
  ADD PRIMARY KEY (`SETTORE`,`COMPETENZA`),
  ADD KEY `COMPETENZA` (`COMPETENZA`);

--
-- Indici per le tabelle `messaggi`
--
ALTER TABLE `messaggi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MITTENTE` (`MITTENTE`),
  ADD KEY `DESTINATARIO` (`DESTINATARIO`);

--
-- Indici per le tabelle `occorrenze`
--
ALTER TABLE `occorrenze`
  ADD PRIMARY KEY (`IDEA`,`COMPETENZA_RICHIESTA`),
  ADD KEY `COMPETENZA_RICHIESTA` (`COMPETENZA_RICHIESTA`);

--
-- Indici per le tabelle `osservazioni`
--
ALTER TABLE `osservazioni`
  ADD PRIMARY KEY (`UTENTE`,`IDEA`),
  ADD KEY `IDEA` (`IDEA`);

--
-- Indici per le tabelle `partecipazioni`
--
ALTER TABLE `partecipazioni`
  ADD PRIMARY KEY (`UTENTE`,`IDEA`),
  ADD KEY `IDEA` (`IDEA`);

--
-- Indici per le tabelle `persone`
--
ALTER TABLE `persone`
  ADD PRIMARY KEY (`ID_UTENTE`),
  ADD KEY `AZIENDA` (`AZIENDA`);

--
-- Indici per le tabelle `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`CODICE`);

--
-- Indici per le tabelle `relazioni`
--
ALTER TABLE `relazioni`
  ADD PRIMARY KEY (`IDEA`,`SETTORE`),
  ADD KEY `SETTORE` (`SETTORE`);

--
-- Indici per le tabelle `settori`
--
ALTER TABLE `settori`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `commenti`
--
ALTER TABLE `commenti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `contatti`
--
ALTER TABLE `contatti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT per la tabella `eventi`
--
ALTER TABLE `eventi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `idee`
--
ALTER TABLE `idee`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `messaggi`
--
ALTER TABLE `messaggi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `settori`
--
ALTER TABLE `settori`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `appartenenze`
--
ALTER TABLE `appartenenze`
  ADD CONSTRAINT `appartenenze_ibfk_1` FOREIGN KEY (`UTENTE`) REFERENCES `utenti` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `appartenenze_ibfk_2` FOREIGN KEY (`COMPETENZA`) REFERENCES `competenze` (`TAG`) ON DELETE CASCADE;

--
-- Limiti per la tabella `aziende`
--
ALTER TABLE `aziende`
  ADD CONSTRAINT `aziende_ibfk_1` FOREIGN KEY (`ID_UTENTE`) REFERENCES `utenti` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `aziende_ibfk_2` FOREIGN KEY (`PROVINCIA`) REFERENCES `province` (`CODICE`) ON DELETE NO ACTION;

--
-- Limiti per la tabella `commenti`
--
ALTER TABLE `commenti`
  ADD CONSTRAINT `commenti_ibfk_1` FOREIGN KEY (`COMMENTATORE`) REFERENCES `utenti` (`ID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `commenti_ibfk_2` FOREIGN KEY (`IDEA`) REFERENCES `idee` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `competenze`
--
ALTER TABLE `competenze`
  ADD CONSTRAINT `competenze_ibfk_1` FOREIGN KEY (`SETTORE`) REFERENCES `settori` (`ID`) ON DELETE SET NULL;

--
-- Limiti per la tabella `contatti`
--
ALTER TABLE `contatti`
  ADD CONSTRAINT `contatti_ibfk_1` FOREIGN KEY (`PROPRIETARIO`) REFERENCES `utenti` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `eventi`
--
ALTER TABLE `eventi`
  ADD CONSTRAINT `eventi_ibfk_1` FOREIGN KEY (`IDEA`) REFERENCES `idee` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`REFERENTE`) REFERENCES `utenti` (`ID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`RIFERITO`) REFERENCES `utenti` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`IDEA`) REFERENCES `idee` (`ID`) ON DELETE NO ACTION;

--
-- Limiti per la tabella `idee`
--
ALTER TABLE `idee`
  ADD CONSTRAINT `idee_ibfk_1` FOREIGN KEY (`CREATORE`) REFERENCES `utenti` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `inclusioni`
--
ALTER TABLE `inclusioni`
  ADD CONSTRAINT `inclusioni_ibfk_1` FOREIGN KEY (`SETTORE`) REFERENCES `settori` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `inclusioni_ibfk_2` FOREIGN KEY (`COMPETENZA`) REFERENCES `competenze` (`TAG`) ON DELETE CASCADE;

--
-- Limiti per la tabella `messaggi`
--
ALTER TABLE `messaggi`
  ADD CONSTRAINT `messaggi_ibfk_1` FOREIGN KEY (`MITTENTE`) REFERENCES `utenti` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `messaggi_ibfk_2` FOREIGN KEY (`DESTINATARIO`) REFERENCES `utenti` (`ID`) ON DELETE NO ACTION;

--
-- Limiti per la tabella `occorrenze`
--
ALTER TABLE `occorrenze`
  ADD CONSTRAINT `occorrenze_ibfk_1` FOREIGN KEY (`IDEA`) REFERENCES `idee` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `occorrenze_ibfk_2` FOREIGN KEY (`COMPETENZA_RICHIESTA`) REFERENCES `competenze` (`TAG`) ON DELETE NO ACTION;

--
-- Limiti per la tabella `osservazioni`
--
ALTER TABLE `osservazioni`
  ADD CONSTRAINT `osservazioni_ibfk_1` FOREIGN KEY (`UTENTE`) REFERENCES `utenti` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `osservazioni_ibfk_2` FOREIGN KEY (`IDEA`) REFERENCES `idee` (`ID`) ON DELETE CASCADE;

--
-- Limiti per la tabella `partecipazioni`
--
ALTER TABLE `partecipazioni`
  ADD CONSTRAINT `partecipazioni_ibfk_1` FOREIGN KEY (`UTENTE`) REFERENCES `utenti` (`ID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `partecipazioni_ibfk_2` FOREIGN KEY (`IDEA`) REFERENCES `idee` (`ID`) ON DELETE NO ACTION;

--
-- Limiti per la tabella `persone`
--
ALTER TABLE `persone`
  ADD CONSTRAINT `persone_ibfk_1` FOREIGN KEY (`ID_UTENTE`) REFERENCES `utenti` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `persone_ibfk_2` FOREIGN KEY (`AZIENDA`) REFERENCES `aziende` (`ID_UTENTE`) ON DELETE SET NULL;

--
-- Limiti per la tabella `relazioni`
--
ALTER TABLE `relazioni`
  ADD CONSTRAINT `relazioni_ibfk_1` FOREIGN KEY (`IDEA`) REFERENCES `idee` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `relazioni_ibfk_2` FOREIGN KEY (`SETTORE`) REFERENCES `settori` (`ID`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
