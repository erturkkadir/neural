CREATE DATABASE  IF NOT EXISTS `neural` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `neural`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 192.168.1.166    Database: neural
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.21.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `global`
--

DROP TABLE IF EXISTS `global`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global` (
  `status` enum('Free','Learn') NOT NULL DEFAULT 'Free',
  `eps` float DEFAULT '0.1',
  `test` double DEFAULT NULL,
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global`
--

LOCK TABLES `global` WRITE;
/*!40000 ALTER TABLE `global` DISABLE KEYS */;
/*!40000 ALTER TABLE `global` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neuron`
--

DROP TABLE IF EXISTS `neuron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `neuron` (
  `nr_no` bigint NOT NULL AUTO_INCREMENT COMMENT 'Neuron Number',
  `nr_x` int NOT NULL COMMENT 'x position of neuron',
  `nr_y` int NOT NULL COMMENT 'y position of neuron',
  `nr_z` int NOT NULL COMMENT 'z position of neuron',
  `nr_shiftr` float NOT NULL DEFAULT '0' COMMENT 'real part of shift factor',
  `nr_shifti` float NOT NULL DEFAULT '0' COMMENT 'imag part of shift factor',
  `nr_inpr` float NOT NULL DEFAULT '0' COMMENT 'real part of neuron input',
  `nr_inpi` float NOT NULL DEFAULT '0' COMMENT 'imag part of neuron input',
  `nr_outr` float NOT NULL DEFAULT '0' COMMENT 'real part of neuron output',
  `nr_outi` float NOT NULL DEFAULT '0' COMMENT 'imag part of neuron output',
  `nr_type` enum('input','hidden','output') NOT NULL DEFAULT 'hidden' COMMENT 'neuron type (input, hidden or output)',
  `nr_class` enum('standart','lstm','rnn','sensor') DEFAULT 'standart' COMMENT 'neuron class (standart, lstm, rnn, sensor)',
  `nr_delr` float NOT NULL DEFAULT '0' COMMENT 'real delta value',
  `nr_deli` float NOT NULL DEFAULT '0' COMMENT 'imag delta value',
  `nr_desr` float NOT NULL DEFAULT '0' COMMENT 'real part of desired',
  `nr_desi` float NOT NULL DEFAULT '0' COMMENT 'imag part of desired',
  `nr_train` tinyint NOT NULL DEFAULT '0' COMMENT 'if induced to train or not',
  `nr_status` tinyint NOT NULL DEFAULT '0' COMMENT 'neuron status (induced=1)',
  `nr_forgetr` float DEFAULT '0',
  `nr_forgeti` float DEFAULT '0',
  `nr_cellstate_r` float DEFAULT '0',
  `nr_cellstate_i` int DEFAULT '0',
  `nr_outputgate_r` float DEFAULT '0',
  `nr_outputgate_i` float DEFAULT '0',
  `nr_inputstate_r` float DEFAULT '0',
  `nr_inputstate_i` float DEFAULT '0',
  PRIMARY KEY (`nr_no`),
  UNIQUE KEY `xyz_dx` (`nr_x`,`nr_y`,`nr_z`)
) ENGINE=InnoDB AUTO_INCREMENT=11000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neuron`
--

LOCK TABLES `neuron` WRITE;
/*!40000 ALTER TABLE `neuron` DISABLE KEYS */;
/*!40000 ALTER TABLE `neuron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `rg_name` varchar(20) NOT NULL,
  `rg_sta_x` int NOT NULL DEFAULT '0',
  `rg_end_x` int NOT NULL DEFAULT '0',
  `rg_sta_y` int NOT NULL DEFAULT '0',
  `rg_end_y` int NOT NULL DEFAULT '0',
  `rg_sta_z` int NOT NULL DEFAULT '0',
  `rg_end_z` int NOT NULL DEFAULT '0',
  `rg_num_neuron` int NOT NULL DEFAULT '0',
  `rg_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table describes brain regions and allowed limit in 3D space';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('amyglada_left',0,0,0,0,0,0,0,'workes with hippocampus, fears and emotions'),('amyglada_right',0,0,0,0,0,0,0,'workes with hippocampus, fears and emotions'),('broca area',0,0,0,0,0,0,0,'language mainly'),('cerebellum_left',0,0,0,0,0,0,35,'little brain, talent, detects errors in movement'),('cerebellum_right',0,0,0,0,0,0,35,'little brain, talent, detects errors in movement '),('cranial_nerve_left',0,0,0,0,0,0,0,'nose, eye and upper face sensor'),('cranial_nerve_right',0,0,0,0,0,0,0,'nose, eye and upper face sensor'),('frontal lobe',0,0,0,0,0,0,0,'largest lobe, personality, decision making, motor control, understant memories, emotiona nd envioremnet'),('hippocampus_left',0,0,0,0,0,0,0,'long term memory, make neurons always'),('hippocampus_right',0,0,0,0,0,0,0,'long_term memory, make neuron always'),('hypotalamus',0,0,0,0,0,0,0,'link between brain and spinal cord'),('interior frontal gyr',0,0,0,0,0,0,0,'production of language'),('left cerebral',0,0,0,0,0,0,0,NULL),('medulla',0,0,0,0,0,0,0,'breating'),('midbrain',0,0,0,0,0,0,0,'regulate movement'),('middle frontal gyrus',0,0,0,0,0,0,0,'recoincile indformation with other parts'),('motor cortex',0,0,0,0,0,0,0,'fine motor control'),('orbitofrontal cortex',0,0,0,0,0,0,0,'depression and complex social behaviour'),('pituitary_gland',0,0,0,0,0,0,0,'releases hormones'),('pon_left',0,0,0,0,0,0,0,'attention'),('pon_right',0,0,0,0,0,0,0,'attention'),('prefrontal cortex',0,0,0,0,0,0,0,'decision maker'),('premotor cortex',0,0,0,0,0,0,0,'complex movement'),('right cerebral ',0,0,0,0,0,0,16,NULL),('subiculum',0,0,0,0,0,0,0,'memories'),('thalamus_left',0,0,0,0,0,0,0,'message coordinator, receives feedback amd connects hippocampus and brainstem '),('thalamus_right',0,0,0,0,0,0,0,'message coordinator, receives feedback amd connects hippocampus and brainstem '),('ventricles',0,0,0,0,0,0,0,'cerebrospinal fluid');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weight`
--

DROP TABLE IF EXISTS `weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weight` (
  `we_no` int NOT NULL AUTO_INCREMENT,
  `we_fromx` int NOT NULL COMMENT 'from neuron x',
  `we_fromy` int NOT NULL COMMENT 'from neuron y',
  `we_fromz` int NOT NULL COMMENT 'from neuron z',
  `we_tox` int NOT NULL COMMENT 'to neuron x',
  `we_toy` int NOT NULL COMMENT 'to neuron y',
  `we_toz` int NOT NULL COMMENT 'to neuron z',
  `we_real` float NOT NULL DEFAULT '0' COMMENT 'real part of weight',
  `we_imag` float NOT NULL DEFAULT '0' COMMENT 'imag part of weight',
  `we_preal` float NOT NULL DEFAULT '0' COMMENT 'real value of previous weight',
  `we_pimag` float NOT NULL DEFAULT '0' COMMENT 'imag value of previous weight',
  PRIMARY KEY (`we_no`),
  KEY `idx_from` (`we_fromx`,`we_fromy`,`we_fromz`),
  KEY `idx_to` (`we_tox`,`we_toy`,`we_toz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weight`
--

LOCK TABLES `weight` WRITE;
/*!40000 ALTER TABLE `weight` DISABLE KEYS */;
/*!40000 ALTER TABLE `weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words_tr`
--

DROP TABLE IF EXISTS `words_tr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `words_tr` (
  `word` varchar(255) NOT NULL DEFAULT 'Free',
  `num` int DEFAULT '0',
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words_tr`
--

LOCK TABLES `words_tr` WRITE;
/*!40000 ALTER TABLE `words_tr` DISABLE KEYS */;
INSERT INTO `words_tr` VALUES ('01',1),('02',29),('03',11),('05',1),('06',7),('07',1),('1',25),('10',51),('1048',5),('11',15),('1131',5),('12',24),('1207',5),('1273',5),('13',24),('1341',1),('1370',6),('1377',5),('14',37),('1417',6),('1426',1),('1444',1),('1460',5),('1469',5),('1470',6),('1480',6),('1497',1),('15',39),('1506',5),('1520',7),('1526',5),('1550',1),('1556',5),('1572',1),('16',14),('1600',5),('1606',5),('1679',5),('1680',1),('17',29),('1730',1),('1732',5),('1740',5),('1759',5),('1795',1),('1799',5),('18',25),('1802',5),('1803',5),('1805',5),('1814',1),('1824',5),('1825',1),('1835',5),('1836',1),('1837',5),('1841',1),('1842',5),('1843',5),('1844',6),('1847',1),('1854',5),('1855',5),('1856',5),('1859',1),('1860',5),('1861',5),('1865',6),('1869',1),('1870',1),('1874',1),('1875',6),('1876',5),('1877',11),('1878',6),('1880',6),('1882',5),('1885',6),('1886',6),('1887',2),('1888',1),('1889',7),('1890',1),('1891',5),('1892',1),('1893',11),('1894',6),('1895',1),('1896',13),('1897',1),('1898',13),('1899',6),('19',22),('1900',6),('1901',16),('1904',5),('1906',5),('1907',16),('1908',1),('1909',1),('1911',10),('1912',1),('1913',11),('1914',7),('1915',11),('1916',10),('1918',11),('1919',6),('1920',7),('1921',5),('1922',11),('1923',12),('1924',15),('1925',2),('1926',28),('1927',19),('1928',12),('1929',6),('1930',11),('1931',10),('1933',6),('1935',1),('1936',15),('1937',10),('1938',3),('1939',4),('1940',5),('1942',1),('1944',7),('1945',15),('1946',7),('1947',3),('1948',11),('1950',1),('1951',11),('1952',2),('1953',11),('1954',5),('1955',12),('1956',14),('1957',17),('1958',11),('1959',2),('1960',2),('1961',11),('1962',20),('1963',7),('1964',7),('1966',7),('1967',27),('1968',5),('1969',1),('1970',5),('1971',6),('1972',2),('1973',6),('1974',2),('1977',1),('1979',6),('1980',5),('1981',1),('1983',6),('1984',21),('1985',1),('1987',6),('1988',6),('1989',1),('1991',1),('1992',11),('1993',6),('1994',10),('1995',1),('1996',5),('1998',1),('1999',6),('2',24),('20',19),('2000',1),('2002',11),('2003',11),('2004',10),('2005',5),('2007',10),('2008',1),('2009',1),('2013',6),('2014',7),('2015',10),('2016',14),('2021',6),('21',45),('22',29),('23',21),('24',2),('25',22),('26',33),('27',27),('28',12),('29',24),('3',17),('30',35),('31',1),('32',1),('33',5),('38',1),('39',1),('4',26),('41',5),('45',7),('478',5),('479',1),('49',6),('5',26),('500',6),('52',6),('53',6),('6',17),('666',5),('7',34),('8',33),('9',33),('a',8),('Abbas',6),('Abdal',2),('Abdullah',6),('Abdurrahim',5),('Açık',5),('Açıkel',1),('Acının',1),('Acıyla',1),('Ada',1),('Adam',1),('adlı',28),('Adnan',12),('Adolfo',1),('Ady',5),('Afşar',1),('Ağustos',58),('Ah',5),('Ahmatova',1),('Ahmed',4),('Ahmet',12),('Ahvali',1),('aittir',12),('Akarsu',1),('Akbulut',44),('Akif',1),('Akıncıoğlu',1),('aksi',6),('Ala',6),('Alaaddin',11),('alan',18),('aldı',6),('Aleksandr',10),('Ali',9),('alıntı',5),('Allahaısmarladık',1),('amacı',6),('amacıyla',6),('an',5),('ANASAYFA',13),('anda',6),('Andre',1),('Andreas',5),('Anılar',5),('Anna',6),('Anne',1),('Antoloji',31),('Aralık',54),('ARDAHAN',6),('Arif',13),('Arkadaş',5),('Arolat',1),('Arthur',5),('Artık',1),('ARTVİN',1),('Asaf',5),('aşı',7),('Aşık',12),('Aşk',32),('Aşka',1),('Atalay',1),('Ataol',5),('Atatürk',11),('Atsız',1),('Ayçiçeği',5),('Ayçil',1),('aydınlığında',6),('Ayel',1),('Ayfer',5),('Ayhan',5),('Ayın',6),('Aykın',1),('ayrıca',6),('Ayrılık',12),('Azar',1),('Aziz',5),('Bahtiyar',1),('Baki',5),('Bakiler',1),('Bakmayan',5),('Bana',6),('Baran',6),('Barış',12),('Başaran',5),('Basri',1),('Batur',1),('Baudelaire',1),('Bayazıt',1),('Bayburtlu',1),('Bayram',6),('Becquer',1),('Bedrettin',1),('Behçet',5),('Behramoğlu',5),('Bekir',10),('belirtilmediği',6),('Ben',1),('Beni',1),('Benim',10),('Berker',1),('Bertolt',1),('Betül',5),('Beyan',1),('Bildir',6),('bilgilendirme',6),('bilgilerin',6),('bir',29),('Bitme',5),('bırak',6),('Blaga',5),('Blaise',1),('Blok',5),('bölümünde',6),('Bonnefoy',1),('Boris',1),('Boşuna',5),('Brecht',1),('Breton',1),('Bu',14),('Bukowski',5),('Buldum',1),('Bülent',1),('Bulut',6),('buradasınız',6),('Bütün',1),('Çağlar',16),('Cahit',10),('Çakır',5),('Çamlıbel',2),('Can',6),('Caner',7),('Canip',1),('Çantay',1),('Çapan',5),('Carl',6),('Çarşamba',6),('Cavidan',1),('Celal',1),('Celaleddin',5),('Çelebi',6),('Cemal',6),('Cenap',1),('Cendrars',1),('Cengiz',1),('Cenk',7),('Çerez',6),('Cesar',1),('Cesare',1),('Cevat',5),('Cevdet',5),('Cezmi',2),('Char',6),('Charles',6),('Che',1),('Çiçeği',7),('Çiğdem',1),('Cihan',5),('Çile',5),('Çimen',5),('com',31),('Copyright',6),('Coşkun',5),('cü',5),('Cummings',5),('Czeslaw',5),('d',6),('Dalkıç',5),('Damar',6),('Defterinde',5),('Deniz',2),('Dersin',11),('Dertli',5),('Dertsiz',1),('Desnos',5),('Devamını',24),('Devrim',1),('Dilek',1),('Dilekçe',5),('Dimitrova',5),('Dinamo',1),('dinliy',5),('Dino',5),('Divani',5),('Doğan',10),('Dost',6),('Durman',5),('düş',1),('duvarı',1),('Ece',5),('Edebiyat',13),('Edip',1),('Edward',5),('eğitim',6),('Ekim',68),('Ekle',12),('ekledi',22),('Ekrem',2),('Elhân',1),('Eluard',1),('Emanet',5),('Emerson',5),('Emile',5),('Emin',1),('Emre',6),('Enderunlu',5),('Endre',5),('Enis',1),('Enver',1),('Enzensberger',1),('Ercan',5),('Erdem',6),('Erdoğan',5),('Erenus',1),('Ergin',1),('Erir',1),('Erkeğe',1),('Erman',5),('Ernest',5),('Ernesto',1),('Ersöz',2),('Ertepınar',5),('Esirî',5),('eşkıya',1),('Eşrefoğlu',5),('Estlin',5),('etmez',5),('Evli',1),('Evliyagil',1),('Evrensel',1),('Evrim',1),('Eylül',59),('Ezra',1),('Faruk',7),('Fazıl',10),('Federico',6),('Ferman',5),('Ferruhzad',1),('Feyzi',5),('Fişekçi',1),('Friedrich',5),('Frost',1),('Füruğ',1),('Fuzuli',6),('Gabriela',6),('Garcia',6),('Gece',7),('Gecenin',6),('Geceye',5),('Geçti',1),('geldiği',5),('Genç',7),('Gençosmanoğlu',5),('Geyik',5),('Giderken',7),('Gökalp',10),('Gökçe',1),('Gökhan',5),('GÖLE',6),('Gönenç',1),('Gör',12),('Gözlerine',1),('Gözlüm',1),('Gruda',6),('GRUPLAR',13),('Guevara',1),('Gül',5),('Gülseli',1),('Gültekin',7),('günah',5),('Günçe',1),('güneşe',5),('Güney',5),('Güntan',5),('GÜNÜN',12),('Gustavo',1),('gütmemektedir',6),('Güzel',1),('Güzelliğin',5),('Güzellik',6),('HAKKIMIZDA',6),('hakkı',6),('Hakkımızda',6),('hakları',6),('Halet',5),('Halide',5),('Halim',11),('Halit',1),('Halıcı',5),('Hamdi',1),('Hamzatov',5),('Hanım',11),('Hans',1),('Hareketler',6),('Harun',1),('Hasan',7),('Hata',6),('Hatun',5),('hayallerim',5),('hayat',6),('Hayyam',5),('Haziran',63),('Hazır',1),('Hekimhanlı',5),('Hemingway',5),('Henri',1),('her',6),('Hesabım',12),('hiç',6),('Hicran',6),('Hıfzı',1),('Hugo',5),('Hüsamettin',6),('Hüseyin',12),('Hüzün',6),('I',1),('İbrahim',6),('İçinden',5),('İçindeyim',1),('İdris',21),('Ignac',5),('İhsan',6),('İld',1),('İldeniz',1),('İletişim',12),('İlgilenmiyorum',1),('İlham',6),('İlhami',11),('İnal',1),('İnci',1),('İnsan',1),('Irgat',5),('İşçioğlu',1),('Işılak',1),('İsmet',1),('Isparta',6),('İstanbul',6),('ister',5),('İzzettin',1),('Jacques',1),('K',2),('kadın',11),('Kağızmanlı',1),('Kamu',5),('Kaplan',10),('kâr',6),('Karaçam',5),('Karacaoğlan',6),('Karagüzel',1),('Karakoç',5),('karanlığında',6),('Karatay',5),('Karizma',5),('Kasım',60),('Katlı',11),('Kavafis',5),('Kaydı',6),('Kaygusuz',1),('Keçibor',6),('Kemal',1),('Kemalettin',5),('kendilerine',6),('kendime',1),('kendinize',5),('Kendinizi',5),('Kerimkar',1),('Keskin',5),('Kipling',6),('kişilere',6),('kitap',5),('Kırnak',1),('Kısakürek',10),('Konstantinos',5),('KONULAR',6),('KONULARI',6),('Korkmazgil',5),('Koza',1),('Kudret',5),('Kul',1),('Külcüoğlu',11),('Kullanım',12),('Kunos',5),('Künye',6),('Kurdakul',5),('kürsü',1),('Kurtuluş',1),('Kuşa',5),('Kutay',1),('Kutlar',1),('Kutsi',1),('Lermontov',1),('Levni',5),('Lorca',6),('Lou',5),('Magnus',1),('Mahmud',1),('Mahmut',1),('Mahzun',5),('Mahzuni',5),('Mallarme',5),('Margulies',1),('Maria',6),('Marmara',6),('Mart',61),('materyaller',6),('Mayakovski',5),('Mayıs',73),('Mehmed',1),('Mehmet',6),('Mert',1),('MESAJLAR',13),('Mesajlarım',6),('Mesele',1),('Metin',1),('Mevlana',10),('Michaux',1),('Mihail',1),('Mihri',5),('Milosz',5),('Miraç',5),('Mistral',6),('MO',6),('Mübahtı',11),('Muhlis',1),('Mümtaz',1),('Murat',5),('Mustafa',10),('Mustafaoğlu',14),('Müştak',1),('Mutluluk',6),('Muzaffer',5),('Nafiz',2),('Nail',6),('Namdar',5),('nasılsın',6),('Nasırlaşmış',7),('ne',6),('Necatigil',5),('Necdet',1),('Necip',10),('Nedim',1),('Nedir',25),('neler',19),('Nesimi',12),('Nesin',5),('Nigar',5),('Nilgün',6),('Nisan',76),('Niyazi',6),('not',1),('Nurettin',5),('Nurullah',2),('Nusret',5),('nutuk',1),('Nüzhet',5),('Öbek',6),('Ocak',67),('Odabaşı',5),('öğretmenine',5),('öğretsen',6),('öğretti',6),('Oğuz',10),('Oktay',1),('Oku',12),('Olm',1),('Olmadı',7),('Ölüm',6),('Ölüp',7),('OLUYOR',13),('Ömer',15),('On',5),('Onat',1),('ONLİNE',6),('Özer',6),('Özgen',10),('Özger',5),('Özkan',1),('Özlem',7),('Par',5),('Paşa',2),('Pasternak',1),('Paul',7),('Pavese',1),('Peker',1),('Pelit',6),('Pir',1),('Pıtırcık',1),('Politikası',6),('POPÜLER',12),('Pound',1),('Prevert',1),('Puşkin',5),('Quasimodo',5),('Rahmi',5),('Raif',6),('Rainer',6),('Ralph',5),('Ramazan',13),('Rastgele',6),('Rauf',14),('Recaizade',1),('Rene',6),('Rengi',1),('Resul',5),('Rilke',6),('Rimbaud',5),('Robert',6),('Roni',1),('Rudyard',6),('Ruh',1),('Ruhi',1),('Ruhsati',5),('Rumi',10),('S',1),('Sabri',1),('Saç',13),('Sacid',6),('Sadettin',5),('Şahabettin',1),('şair',42),('şairi',6),('ŞAİRLER',19),('şairlerin',6),('Salome',5),('Salvatore',5),('Samanoğlu',1),('Şamlu',1),('Sandburg',6),('Sarı',7),('Şartları',12),('Satıcı',5),('Şatıroğlu',5),('ŞAVŞAT',1),('Sayar',6),('sayfada',6),('sayfasına',22),('Schiller',5),('Seçkin',5),('Sedat',6),('Sefa',5),('Sefai',6),('Şehir',5),('şekilde',6),('Selda',5),('Selim',6),('Sepehri',5),('serbest',1),('Sergeyeviç',5),('Şerif',5),('seslenin',5),('Sevdalanma',1),('Sevdam',5),('Sevgi',6),('sevmek',1),('Sexton',1),('şey',1),('Seyyid',6),('Sezer',1),('Shakespeare',1),('Şiir',38),('ŞİİRİ',12),('şiirini',22),('ŞİİRLER',25),('Şiirleri',108),('şiirlerin',6),('Simge',1),('Şitâ',1),('Sitemiz',6),('sitemizde',12),('Siyah',1),('size',6),('Sık',6),('Sılay',1),('şıp',2),('Sohrab',5),('Sorulan',6),('Sorular',6),('söylesem',24),('Söz',11),('Stephane',5),('Şu',12),('Şuan',6),('Şubat',70),('şubatta',1),('Sudenur',44),('Şükran',5),('Sükût',7),('Sultan',7),('Sungur',6),('sunulmaktadır',6),('sürece',6),('Süreya',5),('takibe',6),('Talat',5),('Tanpınar',1),('Tansel',5),('Tanyol',1),('Tarık',5),('Tarıman',5),('Taşpınar',1),('Tayyip',5),('Tecer',1),('telif',6),('Temizyürek',1),('Temmuz',59),('Tenekeci',5),('terimine',6),('Tez',5),('Tezcan',1),('Timuçin',1),('Timuroğlu',6),('tımarhane',1),('Tokat',5),('Top',6),('Toprak',7),('Tosun',5),('Tristan',1),('Tuba',6),('Tufan',5),('Tugan',5),('Tuğrul',6),('Tukay',6),('Tükenmişliklere',10),('tüm',12),('Tümerkan',1),('Turgay',2),('Türkan',1),('türkü',6),('Tzara',1),('üç',1),('Ufukta',11),('uğruna',5),('Uğur',1),('Ülker',1),('üm',5),('Umran',6),('Umut',12),('Unutamadığım',1),('Uslu',5),('uyanınca',6),('ÜYELER',25),('ÜYELERDEN',6),('Uz',1),('Vahapzade',1),('Vallejo',1),('Vapuru',5),('Var',11),('Vasıf',5),('Vatan',6),('ve',26),('Vecihi',6),('verdikleri',6),('Verhaeren',5),('Verlaine',6),('veya',6),('Veysel',6),('Victor',5),('Vladimir',5),('Vladimiroviç',5),('Waldo',5),('William',1),('Yağcıoğlu',5),('yağınca',6),('Yağız',1),('Yağmur',13),('Yahya',1),('yalnızca',6),('Yardım',6),('Yaşar',5),('Yavuz',7),('yazdı',6),('Yazıcı',10),('Yedi',1),('yeni',34),('yer',18),('Yetişoğlu',5),('yetki',6),('Yıldırım',12),('Yılmaz',21),('Yol',6),('Yöntem',1),('Yorgunu',6),('yorum',5),('Yüce',5),('Yücel',2),('Yüksel',7),('Yurdakul',1),('yüreğim',6),('Yuryeviç',1),('Yusuf',1),('Yüzüne',1),('Yves',1),('yy',6),('Zafer',5),('Zahrad',5),('Zaman',1),('Zamanın',1),('Zarifoğlu',5),('Zekai',5),('Zengin',5),('Zerrin',1),('Zihni',1),('Ziya',11),('Zorlutuna',5);
/*!40000 ALTER TABLE `words_tr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'neural'
--

--
-- Dumping routines for database 'neural'
--
/*!50003 DROP FUNCTION IF EXISTS `cdiv_i` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cdiv_i`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    NO SQL
BEGIN

declare denom, r float;
 
 set denom = (p2real*p2real + p2imag*p2imag);
 
 set r = (p1imag*p2real-p1real*p2imag)/denom;
 
 RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cdiv_r` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cdiv_r`(
        `p1real` FLOAT,
        `p1imag` FLOAT,
        `p2real` FLOAT,
        `p2imag` FLOAT
    ) RETURNS float
    NO SQL
BEGIN
declare denom, r  float;
 
 set denom = (p2real*p2real + p2imag*p2imag);
 
 set r = (p1real*p2real+p1imag*p2imag)/denom;
 
 RETURN r;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cmul_i` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cmul_i`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    NO SQL
    DETERMINISTIC
BEGIN
 
 RETURN p1real*p2imag + p1imag*p2real;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cmul_r` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `cmul_r`(
 `p1real` FLOAT,
 `p1imag` FLOAT,
 `p2real` FLOAT,
 `p2imag` FLOAT
 ) RETURNS float
    DETERMINISTIC
BEGIN
 
 RETURN p1real*p2real - p1imag*p2imag;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `del2_i` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `del2_i`(
 `pcreal` FLOAT,
 `pcimag` FLOAT,
 `pdreal` FLOAT,
 `pdimag` FLOAT
 ) RETURNS float
    DETERMINISTIC
BEGIN

 declare preal, pimag, tmp_i float;
 
 set preal = car_r(pcreal, pcimag, pdreal, pdimag );
 set pimag = car_i(pcreal, pcimag, pdreal, pdimag );

 set tmp_i = car_i(preal, pimag, (1-pcreal), -pcimag );

 RETURN tmp_i;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `del2_r` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `del2_r`(
 `pcreal` FLOAT,
 `pcimag` FLOAT,
 `pdreal` FLOAT,
 `pdimag` FLOAT
 ) RETURNS float
    DETERMINISTIC
BEGIN
 declare preal, pimag, tmp_r float;
 
 set preal = car_r(pcreal, pcimag, pdreal, pdimag );
 set pimag = car_i(pcreal, pcimag, pdreal, pdimag );

 set tmp_r = car_r(preal, pimag, (1-pcreal), -pcimag );

 RETURN tmp_r;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `del_i` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `del_i`(
 `pcreal` FLOAT,
 `pcimag` FLOAT,
 `pdreal` FLOAT,
 `pdimag` FLOAT
 ) RETURNS float
    DETERMINISTIC
BEGIN
 declare tmp_r, tmp_i, preal, pimag float;
 
 set tmp_r = pcreal - pdreal;
 set tmp_i = pcimag - pdimag;
  
 set preal = car_r(tmp_r, tmp_i, pcreal, pcimag );
 set pimag = car_i(tmp_r, tmp_i, pcreal, pcimag );
 /*
 set tmp_r = car_r(preal, pimag, (1-pcreal), -pcimag );
 */
 set tmp_i = car_i(preal, pimag, (1-pcreal), -pcimag );

 RETURN tmp_i;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `del_r` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `del_r`(
 `pcreal` FLOAT,
 `pcimag` FLOAT,
 `pdreal` FLOAT,
 `pdimag` FLOAT
 ) RETURNS float
    DETERMINISTIC
BEGIN
 declare tmp_r, tmp_i, preal, pimag float;
 
 set tmp_r = pdreal - pcreal;
 set tmp_i = pdimag - pcimag;
 

 
 set preal = car_r(tmp_r, tmp_i, pcreal, pcimag );
 set pimag = car_i(tmp_r, tmp_i, pcreal, pcimag );
 
 set tmp_r = car_r(preal, pimag, (1-pcreal), -pcimag );
/* set tmp_i = car_i(preal, pimag, (1-pcreal), -pcimag );
*/
 RETURN tmp_r;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `myrandom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `myrandom`(
        `pmin` INTEGER,
        `pmax` INTEGER
    ) RETURNS int
    NO SQL
    DETERMINISTIC
BEGIN

  RETURN floor(pmin+RAND()*(pmax-pmin));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sigm_imag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `sigm_imag`(
 `a` FLOAT,
 `b` FLOAT
 ) RETURNS float
    DETERMINISTIC
BEGIN
declare up float;
declare dn float;
declare res float;
set up = exp(-a) * sin(b);
set dn = 1.0 + exp(-2*a) + (2*exp(-a)* cos(b));
if (dn=0) then 
 set res = 0;
else
 set res = up / dn;
end if;
return res; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sigm_real` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` FUNCTION `sigm_real`(
 `a` DOUBLE,
 `b` DOUBLE
 ) RETURNS double
    DETERMINISTIC
BEGIN
declare up float;
declare dn float;
declare res float;
set up = 1.0 + exp(-a) * cos(b);
set dn = 1.0 + exp(-2*a) + (2*exp(-a)* cos(b));
if (dn=0) then 
 set res = 0;
else
 set res = up / dn;
end if;
return res; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backpropogation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `backpropogation`(
 OUT `res` BOOLEAN
 )
BEGIN
declare nrn, done integer;
declare res boolean;
declare eps float;
set eps = 1.0;
set done = 0;
set nrn = 0;
/* start from output layer till to input layer */

/* Is there any data to propogate */
select count(*) into nrn from neuron where nr_type='output' and nr_train = 1;

if (nrn<1) then
 call noting_to_backpropogate(); 
end if;
/* Yes there is some data to process, so start with output layer */
/* ****************************************************************** */ 
update neuron n1 /* find deltas for output layer */
,
(select
n2.nr_x as x, n2.nr_y as y, n2.nr_z as z,
(n2.nr_desr - n2.nr_outr) * (1.0 - n2.nr_outr)* n2.nr_outr as delr,
(n2.nr_desi - n2.nr_outi) * (1.0 - n2.nr_outi)* n2.nr_outi as deli
from
neuron n2
where
 n2.nr_type='output' and 
 n2.nr_train = 1) n
 
set 
 n1.nr_delr = n.delr,
 n1.nr_deli = n.deli

where
 n1.nr_x = n.x and 
 n1.nr_y = n.y and 
 n1.nr_z = n.z;
/* ****************************************************************** */ 
 
update weight wu, /* update the weight to output layer */ 

(select
 w.we_fromx, w.we_fromy, w.we_fromz,
 w.we_tox, w.we_toy, w.we_toz, 
 w.we_real,
 w.we_imag, 
 w.we_real - eps * (n.nr_delr * b.nr_outr + n.nr_deli * b.nr_outi) as nw_real,
 w.we_imag - eps * (n.nr_deli * b.nr_outr - n.nr_delr * b.nr_outi) as nw_imag 
from 
 neuron n, weight w, neuron b
where
 n.nr_type = 'output' and 
 n.nr_train = 1 and 
 w.we_tox = n.nr_x and
 w.we_toy = n.nr_y and 
 w.we_toz = n.nr_z and 
 w.we_fromx = b.nr_x and 
 w.we_fromy = b.nr_y and 
 w.we_fromz = b.nr_z) wn
set 
 wu.we_preal = wu.we_real,
 wu.we_pimag = wu.we_imag,
 wu.we_real = wn.nw_real,
 wu.we_imag = wn.nw_imag
where
 wu.we_fromx = wn.we_fromx and 
 wu.we_fromy = wn.we_fromy and 
 wu.we_fromz = wn.we_fromz and 
 
 wu.we_tox = wn.we_tox and 
 wu.we_toy = wn.we_toy and 
 wu.we_toz = wn.we_toz; 



/*calculate new shift value of the neuron at output layer */
update neuron n
set 
 n.nr_shiftr = n.nr_shiftr - eps * (n.nr_shiftr * n.nr_delr + n.nr_shifti * n.nr_deli),
 n.nr_shifti = n.nr_shifti - eps * (n.nr_shifti * n.nr_delr - n.nr_shiftr * n.nr_deli)
where
 n.nr_type = 'output' and 
 n.nr_train = 1;



/* induce the previous layer in order to be updated and relax output layer*/ 
update 
 neuron o, weight w, neuron n /* o output layer n previous layer */
set
 n.nr_train = 1,
 o.nr_train = 0
where
 o.nr_type = 'output' and
 o.nr_train = 1 and 
 o.nr_x = w.we_tox and
 o.nr_y = w.we_toy and
 o.nr_z = w.we_toz and
 w.we_fromx = n.nr_x and 
 w.we_fromy = n.nr_y and 
 w.we_fromz = n.nr_z; 
 

/* Loop until input layer */
while not done do
 begin
 call train(@res);
 select sum(nr_train) into nrn from neuron where nr_type = 'input';
 if (nrn>0) then
 update neuron set nr_train = 0 where nr_type='input';
 set done = 1; 
 end if;
 end;
end while; 
 
 
set @res = true; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bolum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `bolum`(
 IN `p1real` FLOAT,
 IN `p1imag` FLOAT,
 IN `p2real` FLOAT,
 IN `p2imag` FLOAT,
 OUT `preal` FLOAT,
 OUT `pimag` FLOAT
 )
BEGIN
declare denom float;

set denom = (p2real * p2real - p2real * p2real );

if not (denom=0) then 
 begin
 set preal = (p1real * p2real + p1imag * primag) / denom;
 set pimag = (p1imag * p2real - p1real * p2imag) / denom;
 end;
end if; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `carp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `carp`(
 IN `p1real` FLOAT,
 IN `p1imag` FLOAT,
 IN `p2real` FLOAT,
 IN `p2imag` FLOAT,
 OUT `preal` FLOAT,
 OUT `pimag` FLOAT
 )
BEGIN
set preal = p1real * p2real - p1imag * p2imag;
set pimag = p1real * p2imag + p1imag * p2real;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `cika`(
 IN `p1real` FLOAT,
 IN `p1imag` FLOAT,
 IN `p2real` FLOAT,
 IN `p2imag` FLOAT,
 OUT `preal` FLOAT,
 OUT `pimag` FLOAT
 )
BEGIN
set preal = p1real - p2real ;
set pimag = p1imag - p2imag;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createnn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `createnn`(
        IN `px` INTEGER,
        IN `py` INTEGER,
        IN `pz` INTEGER
    )
BEGIN
/* **********************************************************/
/* CREATES A MODEL FROM SCRATCH 						   	*/
/* Input Params 											*/
/* px : Number of cell in x direction (100)				    */
/* py : Number of cell in y direction (100) 				*/
/* pz : Number of cell in z direction (100)				    */
/* if(x<5) then the cell is input (x surface)				*/
/* if(y<5) then the cell is input (y surface) 				*/
/* if(z<5) then the cell is input (z surface) 				*/
/*															*/
/* if(x>45 and x<55) then the cell is output			 	*/
/* if(y>45 and y<55) then the cell is output			 	*/
/* if(z>45 and z<55) then the cell is output			 	*/
/*															*/
/* ******************************************************* 	*/
/* Kadir Erturk April 16th, 2016 							*/
/* Rev 1 10th Dec 2021
/* All rights reserved and restricted, do not copy or use 	*/

/* **********************************************************/

declare x, y, z integer;
declare inp_width integer; /* input layer width  in 3D */
declare cen_width integer; /* output layer width in 3D*/
declare ntype varchar(20);

set inp_width = 5;
set cen_width = 5;

set x = 0;
set y = 0;
set z = 0;
commit;
delete from neuron;
commit;

while z<pz do 
	start transaction;
	while y<py do 
    	while x<px do 
	        set ntype = 'hidden';
        	if( (x<inp_width) || (y<inp_width) || (z<inp_width) ) then set ntype='input'; end if; 
            /*
            if( 
            ( (x > 45 ) or (x < 55) ) and 
            ( (y > 45 ) or (y < 55) ) and 
            ( (z > 45 ) or (z < 55) ) 
            
            ) then set ntype='output'; end if; 
            */
            insert into neuron(nr_x, nr_y, nr_z, nr_shiftr, nr_shifti, nr_inpr, nr_inpi, nr_outr, nr_outi, nr_type,  nr_class, nr_delr, nr_deli, nr_desr, nr_desi, nr_train, nr_status)
                        values(   x,    y,    z,    rand(), rand()/10,       0,       0,       0,       0,   ntype,'standart',       0,       0,       0,       0,        0,         0);
        	set x = x + 1;
        end while;
        set x = 0;
    	set y = y + 1;    
    end while; 
    /* commit;  */
    set y = 0;
	set z = z + 1;
end while; 
set z = 0;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createwei` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `createwei`(
        IN `px` INTEGER,
        IN `py` INTEGER,
        IN `pz` INTEGER
    )
BEGIN
/********************************************************************************/
/* Creates random connection weight array between neurons       				*/
/* px, py, pz are the dimension or neurons, has to be match    					*/
/* with createnn procedure sizes. The connection can only go   					*/
/* one level down in z direction, len_x and len_y in x and y   					*/
/* direction respectively.														*/ 
/********************************************************************************/
declare x, y, z, i, j, k, len_x, len_y, nconn_x, nconn_y integer;
set px = 100;
set py = 100;
set pz = 50;
set len_x = 20;  /* How far the connection can go in x direction */
set len_y = 20;  /* How far the connection can go in y direction */


set z = 0, y = 0, x = 0, i = 0, j = 0, k = 0;

while z<(pz-1) do 		/* Last column does not have any outward connections 	*/ 
	while y<py do 		/* y dimension											*/	
    	while x<px do 	/* x dimension											*/	
        	set i = 0, j = 0, k = 0;             
	        set nconn_x = myrandom(2,30);		/* How many connection from this cell to next layer(s) x dimension	min 2 max :30 */
            set nconn_y = myrandom(2,30);		/* How many connection from this cell to next layer(s) x dimension	min 2 max :30 */
            
            while(i<nconn_x) do				
            	while(j<nconn_y) do
                	insert into weight(we_fromx, we_fromy, we_fromz,               we_tox,              we_toy, we_toz, we_real,   we_imag, we_preal, we_pimag)
                                values(       x,        y,        z,  x+myrandom(0,len_x), y+myrandom(0,len_y),    z+1,  rand(), rand()/10,        0,        0);
                	set j = j + 1;
                end while;
                set i = i + 1;
            end while;
                       
           set x = x + 1;           
        end while;
        set x = 0;
    	set y = y + 1;    
    end while; 
    set y = 0;
	set z = z + 1;
end while; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deletenn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `deletenn`(
 IN `pnno` INTEGER
 )
BEGIN
delete from networkd where nno=pnno;
delete from networkm where nno=pnno;
delete from neuron where nno=pnno;
delete from weight where nno=pnno;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ffwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `ffwd`(
 OUT `res` INTEGER
 )
BEGIN
declare nrn, done integer;
declare res boolean;
set done = 0;

select count(*) into nrn from neuron where nr_type='input' and nr_status = 1;

if (nrn<1) then
 call noting_to_propogate(); 
end if;


while not done do
 begin
 call forward(@res);
 select sum(nr_status) into nrn from neuron where nr_type = 'output';
 if (nrn>0) then
 call forward(@res);
 update neuron set nr_status = 0 where nr_type='output';
 set done = 1; 
 end if;
 end;
end while; 


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `forward` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `forward`(
        OUT `res` BOOLEAN
    )
BEGIN
/* ******************************************************* */
/* ONLY CALCULATE ONE STEP IF THERE IS ANY INDUCED NEURON */
/* */ 
/* 1. This procedure update output of all induced neurons */
/* Since frequency is almost 50 hz, this procedure ideally */
/* need to be called 50 times per second */
/* */
/* 2.Induce all linked neuron so that they will be */
/* calculated in the next step set passive to all induced */
/* neurons at the current stage */
/* ******************************************************* */
/* Kadir Erturk April 16th, 2014 */ 
/* All rights reserved and restricted, do not copy or use */ 
/* ******************************************************* */

update neuron n3,
(select
 n1.nr_x as x, n1.nr_y as y, n1.nr_z as z, 
 sigm_real(
 sum(cmul_r(n0.nr_outr, n0.nr_outi, w.we_real, w.we_imag)) + n1.nr_shiftr,
 sum(cmul_i(n0.nr_outr, n0.nr_outi, w.we_real, w.we_imag)) + n1.nr_shifti
 ) as r,
 sigm_imag(
 sum(cmul_r(n0.nr_outr, n0.nr_outi, w.we_real, w.we_imag)) + n1.nr_shiftr,
 sum(cmul_i(n0.nr_outr, n0.nr_outi, w.we_real, w.we_imag)) + n1.nr_shifti
 ) as i
from
 neuron n1, weight w, neuron n0 
where
 n1.nr_status = 1 and 
 n1.nr_x = w.we_tox and 
 n1.nr_y = w.we_toy and 
 n1.nr_z = w.we_toz and
 
 n0.nr_x = w.we_fromx and 
 n0.nr_y = w.we_fromy and 
 n0.nr_z = w.we_fromz
GROUP BY
 n1.nr_x, n1.nr_y, n1.nr_z) n4 
 set 
 n3.nr_outr = n4.r,
 n3.nr_outi = n4.i
 where
 n3.nr_x = n4.x and 
 n3.nr_y = n4.y and 
 n3.nr_z = n4.z;
 
update 
 neuron c, weight w, neuron f
set
 c.nr_status = 0,
 f.nr_status = 1
where
 c.nr_status = 1 and 
 c.nr_x = w.we_fromx and 
 c.nr_y = w.we_fromy and 
 c.nr_z = w.we_fromz and 
 
 f.nr_x = w.we_tox and 
 f.nr_y = w.we_toy and 
 f.nr_z = w.we_toz ; 
 
 set res = 1; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sigmoid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `sigmoid`(
 IN `preal` FLOAT,
 IN `pimag` FLOAT,
 OUT `rreal` FLOAT,
 OUT `rimag` FLOAT
 )
BEGIN
/* ********************************************** */
/* Complex Valued Sigmod Function                 */
/*                                                */
/* r = (1+e(-a)cosb) / (1+e(-2a) + 2e(-a)cosb)    */
/* i = e(-a)sinb / (1+e(-2a) + 2e(-a)cosb)        */
/* ********************************************** */
/* Copyright by Kadir Erturk 16th April, 2014     */
/* Please refer to gedenek.com/index.html         */
/* ********************************************** */
declare up float;
declare dn float;

set up := 1.0 + exp(-preal) * cos(pimag);
set dn := 1.0 + exp(-2*preal) + (2*exp(-preal)* cos(pimag));
set rreal := up/dn;

set up := exp(-preal) * sin(pimag);
set dn := 1.0 + exp(-2*preal) + (2*exp(-preal)* cos(pimag));
set rimag := up/dn;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `topl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `topl`(
 IN `p1real` FLOAT,
 IN `p1imag` FLOAT,
 IN `p2real` FLOAT,
 IN `p2imag` FLOAT,
 OUT `preal` FLOAT,
 OUT `pimag` FLOAT
 )
BEGIN
set preal = p1real + p2real ;
set pimag = p1imag + p2imag;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `train` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`kadir`@`%` PROCEDURE `train`(
 OUT `res` BOOLEAN
 )
BEGIN
declare eps float;
set eps = 1.0;
update neuron nu, 

(select 
 n.nr_x, n.nr_y, n.nr_z,
 (1.0 - n.nr_outr) * (1 + n.nr_outr) * sum(w.we_real * n1.nr_delr + w.we_imag * n1.nr_deli) as r,
 (1.0 - n.nr_outi) * (1 + n.nr_outi) * sum(w.we_real * n1.nr_deli - w.we_imag * n1.nr_delr) as i
from 
 neuron n, weight w, neuron n1
where
 n.nr_type = 'hidden' and 
 n.nr_train = 1 and 
 w.we_tox = n1.nr_x and
 w.we_toy = n1.nr_y and 
 w.we_toz = n1.nr_z and
 
 w.we_fromx = n.nr_x and 
 w.we_fromy = n.nr_y and 
 w.we_fromz = n.nr_z 
group by 
 n.nr_x, n.nr_y, n.nr_z
order by 
 n.nr_x, n.nr_y, n.nr_z) nz
set 
 nu.nr_delr = r,
 nu.nr_deli = i
where
 nu.nr_x = nz.nr_x and 
 nu.nr_y = nz.nr_y and 
 nu.nr_z = nz.nr_z;
 
 
 update weight wu, /* update the weight to output layer */ 

(select
 w.we_fromx, w.we_fromy, w.we_fromz,
 w.we_tox, w.we_toy, w.we_toz, 
 w.we_real,
 w.we_imag, 
 w.we_real - eps * (n.nr_delr * b.nr_outr + n.nr_deli * b.nr_outi) as nw_real,
 w.we_imag - eps * (n.nr_deli * b.nr_outr - n.nr_delr * b.nr_outi) as nw_imag 
from 
 neuron n, weight w, neuron b
where
 n.nr_train = 1 and 
 n.nr_type = 'hidden' and 
 w.we_tox = n.nr_x and
 w.we_toy = n.nr_y and 
 w.we_toz = n.nr_z and 
 w.we_fromx = b.nr_x and 
 w.we_fromy = b.nr_y and 
 w.we_fromz = b.nr_z) wn
set 
 wu.we_preal = wu.we_real,
 wu.we_pimag = wu.we_imag,
 wu.we_real = wn.nw_real,
 wu.we_imag = wn.nw_imag
where
 wu.we_fromx = wn.we_fromx and 
 wu.we_fromy = wn.we_fromy and 
 wu.we_fromz = wn.we_fromz and 
 
 wu.we_tox = wn.we_tox and 
 wu.we_toy = wn.we_toy and 
 wu.we_toz = wn.we_toz;
 
 
 
update neuron n
set 
 n.nr_shiftr = n.nr_shiftr - eps * (n.nr_shiftr * n.nr_delr + n.nr_shifti * n.nr_deli),
 n.nr_shifti = n.nr_shifti - eps * (n.nr_shiftr * n.nr_deli - n.nr_shifti * n.nr_delr)
where
 n.nr_train = 1 and
 n.nr_type = 'hidden';
 
 
update 
 neuron o, weight w, neuron n 
set
 n.nr_train = 1,
 o.nr_train = 0
where
 o.nr_train = 1 and
 o.nr_x = w.we_tox and
 o.nr_y = w.we_toy and
 o.nr_z = w.we_toz and
 w.we_fromx = n.nr_x and 
 w.we_fromy = n.nr_y and 
 w.we_fromz = n.nr_z;
 
 set res=true;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-11 11:35:22
