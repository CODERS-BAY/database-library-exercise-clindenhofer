-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Dez 2021 um 09:02
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_firstname` varchar(30) DEFAULT NULL,
  `author_lastname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_id`, `author_firstname`, `author_lastname`) VALUES
(101, 'Franz', 'Kafka'),
(102, 'Hermann', 'Hesse'),
(145, 'Fjodor', 'Dostojewski'),
(205, 'Thomas', 'Bernhard'),
(258, 'George', 'Orwell'),
(305, 'William', 'Golding'),
(359, 'Aldous', 'Huxley'),
(456, 'Leo', 'Tolstoy');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author_has_book`
--

CREATE TABLE `author_has_book` (
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_isbn` int(11) DEFAULT NULL,
  `book_name` varchar(30) DEFAULT NULL,
  `publishinghouse_id` int(11) DEFAULT NULL,
  `subjectarea_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`book_id`, `book_isbn`, `book_name`, `publishinghouse_id`, `subjectarea_id`) VALUES
(146, 7536, 'Frost', 1, 2),
(147, 2565, 'Narziß und Goldmund', 2, 1),
(203, 1234, 'Die Verwandlung', 1, 3),
(234, 4567, 'Der Steppenwolf', 2, 1),
(384, 6532, 'Anna Karenina', 3, 2),
(423, 7895, 'Schuld und Sühne', 3, 2),
(456, 2345, 'Unterm Rad', 2, 1),
(543, 2364, 'Krieg und Frieden', 3, 2),
(565, 7415, 'Die Dämonen', 3, 2),
(654, 7654, 'Brave new world', 2, 3),
(765, 2365, 'Animal Farm', 2, 4),
(785, 7415, 'Der Idiot', 3, 2),
(789, 7963, 'Der Untergeher', 1, 2),
(876, 8765, '1985', 2, 3),
(965, 74582, 'Die Brüder Karamasov', 3, 2),
(987, 9875, 'Lord of the flies', 2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_copy`
--

CREATE TABLE `book_copy` (
  `book_copy_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `shelf_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_has_keywords`
--

CREATE TABLE `book_has_keywords` (
  `book_id` int(11) NOT NULL,
  `keywords_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_firstname` varchar(30) DEFAULT NULL,
  `customer_lastname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_firstname`, `customer_lastname`) VALUES
(5, 'Hans', 'Rauscher'),
(25, 'Ottfried', 'Fischer'),
(185, 'Armin', 'Wolf'),
(253, 'Barbara', 'Stöckl'),
(452, 'Pamela', 'Rendi-Wagner');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_firstname` varchar(30) DEFAULT NULL,
  `employee_lastname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_firstname`, `employee_lastname`) VALUES
(1, 'Dieter', 'Bohlen'),
(2, 'Verona', 'Feldbusch'),
(3, 'Thomas', 'Anders');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `journal`
--

CREATE TABLE `journal` (
  `journal_id` int(11) NOT NULL,
  `shelf_id` int(11) DEFAULT NULL,
  `journal_name` varchar(30) DEFAULT NULL,
  `publishing_house_id` int(11) DEFAULT NULL,
  `subject_area_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `journal`
--

INSERT INTO `journal` (`journal_id`, `shelf_id`, `journal_name`, `publishing_house_id`, `subject_area_id`) VALUES
(1, 1, 'Die gute Küche', 2, 5),
(2, 1, 'Die durchschnittliche Küche', 2, 5),
(3, 1, 'Die schlechte Küche', 2, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `keyword`
--

CREATE TABLE `keyword` (
  `keyword_id` int(11) NOT NULL,
  `keyword_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `keyword`
--

INSERT INTO `keyword` (`keyword_id`, `keyword_name`) VALUES
(1, 'Bildung'),
(2, 'Dystopie'),
(3, 'Gesellschaft');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loan`
--

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `loan_customer_id` int(11) DEFAULT NULL,
  `loan_employee_id_input` int(11) DEFAULT NULL,
  `loan_employee_id_output` int(11) DEFAULT NULL,
  `loan_reservation_id` int(11) DEFAULT NULL,
  `loan_returndate` date DEFAULT NULL,
  `loan_createdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publishinghouse`
--

CREATE TABLE `publishinghouse` (
  `publishinghouse_id` int(11) NOT NULL,
  `publishinghouse_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `publishinghouse`
--

INSERT INTO `publishinghouse` (`publishinghouse_id`, `publishinghouse_name`) VALUES
(1, 'CH. Beck'),
(2, 'Random House'),
(3, 'Fischer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `reservation_customer_id` int(11) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `reservation_customer_id`, `reservation_date`) VALUES
(12, 5, '2022-05-23'),
(36, 253, '2023-01-05');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation_has_bookcopy`
--

CREATE TABLE `reservation_has_bookcopy` (
  `reservation_id` int(11) NOT NULL,
  `bookcopy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shelf`
--

CREATE TABLE `shelf` (
  `shelf_id` int(11) NOT NULL,
  `subjectarea_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shelf`
--

INSERT INTO `shelf` (`shelf_id`, `subjectarea_id`) VALUES
(5, 1),
(3, 2),
(4, 3),
(2, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subjectarea`
--

CREATE TABLE `subjectarea` (
  `subjectarea_id` int(11) NOT NULL,
  `subjectarea_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `subjectarea`
--

INSERT INTO `subjectarea` (`subjectarea_id`, `subjectarea_name`) VALUES
(1, 'Bildungsroman'),
(2, 'Realismus'),
(3, 'Science Fiction'),
(4, 'Politik'),
(5, 'Kochen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `synonym`
--

CREATE TABLE `synonym` (
  `synonym_id` int(11) NOT NULL,
  `synonym_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `synonym`
--

INSERT INTO `synonym` (`synonym_id`, `synonym_name`) VALUES
(1, 'Zukunft'),
(2, 'Gesellschaft'),
(3, 'Haushalt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `synonym_has_keyword`
--

CREATE TABLE `synonym_has_keyword` (
  `synonym_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `author_has_book`
--
ALTER TABLE `author_has_book`
  ADD PRIMARY KEY (`author_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `publishinghouse_id` (`publishinghouse_id`),
  ADD KEY `subjectarea_id` (`subjectarea_id`);

--
-- Indizes für die Tabelle `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`book_copy_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `shelf_id` (`shelf_id`);

--
-- Indizes für die Tabelle `book_has_keywords`
--
ALTER TABLE `book_has_keywords`
  ADD PRIMARY KEY (`book_id`,`keywords_id`),
  ADD KEY `keywords_id` (`keywords_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`journal_id`),
  ADD KEY `publishing_house_id` (`publishing_house_id`),
  ADD KEY `subject_area_id` (`subject_area_id`);

--
-- Indizes für die Tabelle `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keyword_id`);

--
-- Indizes für die Tabelle `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `loan_customer_id` (`loan_customer_id`),
  ADD KEY `loan_employee_id_input` (`loan_employee_id_input`),
  ADD KEY `loan_employee_id_output` (`loan_employee_id_output`),
  ADD KEY `loan_reservation_id` (`loan_reservation_id`);

--
-- Indizes für die Tabelle `publishinghouse`
--
ALTER TABLE `publishinghouse`
  ADD PRIMARY KEY (`publishinghouse_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `reservation_customer_id` (`reservation_customer_id`);

--
-- Indizes für die Tabelle `reservation_has_bookcopy`
--
ALTER TABLE `reservation_has_bookcopy`
  ADD PRIMARY KEY (`reservation_id`,`bookcopy_id`),
  ADD KEY `bookcopy_id` (`bookcopy_id`);

--
-- Indizes für die Tabelle `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`shelf_id`),
  ADD KEY `subjectarea_id` (`subjectarea_id`);

--
-- Indizes für die Tabelle `subjectarea`
--
ALTER TABLE `subjectarea`
  ADD PRIMARY KEY (`subjectarea_id`);

--
-- Indizes für die Tabelle `synonym`
--
ALTER TABLE `synonym`
  ADD PRIMARY KEY (`synonym_id`);

--
-- Indizes für die Tabelle `synonym_has_keyword`
--
ALTER TABLE `synonym_has_keyword`
  ADD PRIMARY KEY (`synonym_id`,`keyword_id`),
  ADD KEY `keyword_id` (`keyword_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `author_has_book`
--
ALTER TABLE `author_has_book`
  ADD CONSTRAINT `author_has_book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `author_has_book_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`);

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publishinghouse_id`) REFERENCES `publishinghouse` (`publishinghouse_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`subjectarea_id`) REFERENCES `subjectarea` (`subjectarea_id`);

--
-- Constraints der Tabelle `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `book_copy_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `book_copy_ibfk_2` FOREIGN KEY (`shelf_id`) REFERENCES `shelf` (`shelf_id`);

--
-- Constraints der Tabelle `book_has_keywords`
--
ALTER TABLE `book_has_keywords`
  ADD CONSTRAINT `book_has_keywords_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `book_has_keywords_ibfk_2` FOREIGN KEY (`keywords_id`) REFERENCES `keyword` (`keyword_id`);

--
-- Constraints der Tabelle `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`publishing_house_id`) REFERENCES `publishinghouse` (`publishinghouse_id`),
  ADD CONSTRAINT `journal_ibfk_2` FOREIGN KEY (`subject_area_id`) REFERENCES `subjectarea` (`subjectarea_id`);

--
-- Constraints der Tabelle `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`loan_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`loan_employee_id_input`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`loan_employee_id_output`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `loan_ibfk_4` FOREIGN KEY (`loan_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`reservation_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `reservation_has_bookcopy`
--
ALTER TABLE `reservation_has_bookcopy`
  ADD CONSTRAINT `reservation_has_bookcopy_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `reservation_has_bookcopy_ibfk_2` FOREIGN KEY (`bookcopy_id`) REFERENCES `book_copy` (`book_copy_id`);

--
-- Constraints der Tabelle `shelf`
--
ALTER TABLE `shelf`
  ADD CONSTRAINT `shelf_ibfk_1` FOREIGN KEY (`subjectarea_id`) REFERENCES `subjectarea` (`subjectarea_id`);

--
-- Constraints der Tabelle `synonym_has_keyword`
--
ALTER TABLE `synonym_has_keyword`
  ADD CONSTRAINT `synonym_has_keyword_ibfk_1` FOREIGN KEY (`synonym_id`) REFERENCES `synonym` (`synonym_id`),
  ADD CONSTRAINT `synonym_has_keyword_ibfk_2` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
