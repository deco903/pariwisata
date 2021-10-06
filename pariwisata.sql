-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for pariwisata
CREATE DATABASE IF NOT EXISTS `pariwisata` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pariwisata`;

-- Dumping structure for table pariwisata.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_province_id_foreign` (`province_id`),
  CONSTRAINT `cities_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.cities: ~17 rows (approximately)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `province_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 5, 'surabaya', 'surabaya', '2020-05-23 07:50:16', '2020-06-01 12:46:52'),
	(2, 5, 'malang', 'malang', '2020-05-23 07:50:17', '2020-05-23 07:50:17'),
	(3, 5, 'mojokerto', 'mojokerto', '2020-05-23 07:50:17', '2020-05-23 07:50:17'),
	(4, 5, 'pacitan', 'pacitan', '2020-05-23 07:50:17', '2020-05-23 07:50:17'),
	(5, 5, 'jember', 'jember', '2020-05-23 07:50:17', '2020-05-23 07:50:17'),
	(6, 3, 'bandung', 'bandung', '2020-05-29 13:51:39', '2020-07-03 13:28:14'),
	(7, 3, 'cirebon', 'cirebon', '2020-05-29 13:52:43', '2020-05-29 13:52:43'),
	(8, 3, 'sukabumi', 'sukabumi', '2020-05-29 13:53:24', '2020-07-03 13:28:22'),
	(9, 3, 'majalengka', 'majalengka', '2020-05-29 14:09:23', '2020-05-29 14:09:23'),
	(10, 3, 'indramayu', 'indramayu', '2020-05-29 14:09:38', '2020-05-29 14:09:38'),
	(11, 8, 'solok', 'solok', '2020-05-29 15:08:03', '2020-05-29 15:08:03'),
	(15, 5, 'kediri', 'kediri', '2020-06-01 12:47:27', '2020-06-01 12:47:27'),
	(16, 8, 'bukittinggi', 'bukittinggi', '2020-06-10 13:59:59', '2020-06-10 13:59:59'),
	(17, 8, 'pariaman', 'pariaman', '2020-07-03 13:46:30', '2020-07-03 13:46:30'),
	(18, 8, 'painan', 'painan', '2020-07-03 13:46:40', '2020-07-03 13:46:40'),
	(19, 8, 'payakumbuh', 'payakumbuh', '2020-07-03 14:24:40', '2020-07-03 14:24:40'),
	(20, 23, 'lombok', 'lombok', '2020-07-04 15:07:01', '2020-07-04 15:07:01'),
	(21, 23, 'sumbawa', 'sumbawa', '2020-07-04 15:07:52', '2020-07-04 15:07:52'),
	(22, 23, 'bima', 'bima', '2020-07-04 15:13:36', '2020-07-04 15:13:36'),
	(23, 9, 'deli serdang', 'deli-serdang', '2020-07-12 08:44:39', '2020-07-12 08:44:39'),
	(24, 9, 'tebing tinggi', 'tebing-tinggi', '2020-07-12 08:47:00', '2020-07-12 08:47:00'),
	(25, 9, 'binjai', 'binjai', '2020-07-12 08:47:08', '2020-07-12 08:47:08'),
	(26, 9, 'sibolga', 'sibolga', '2020-07-19 04:50:45', '2020-07-19 04:50:45'),
	(27, 9, 'pematang siantar', 'pematang-siantar', '2020-07-19 04:50:54', '2020-07-19 04:50:54'),
	(28, 18, 'Badung', 'badung', '2020-08-01 09:07:03', '2020-08-13 14:37:17'),
	(29, 18, 'Tabanan', 'tabanan', '2020-08-01 09:10:33', '2020-08-13 14:37:33'),
	(30, 18, 'bangli', 'bangli', '2020-08-01 09:12:20', '2020-08-13 15:20:01'),
	(31, 18, 'karangasem', 'karangasem', '2020-08-13 14:21:55', '2020-08-13 14:21:55'),
	(32, 18, 'tabanan', 'tabanan', '2020-08-13 14:23:50', '2020-08-13 14:23:50');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Dumping structure for table pariwisata.contents
CREATE TABLE IF NOT EXISTS `contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_publish` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contents_city_id_foreign` (`city_id`),
  KEY `contents_user_id_foreign` (`user_id`),
  CONSTRAINT `contents_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.contents: ~19 rows (approximately)
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` (`id`, `city_id`, `user_id`, `title`, `slug`, `content`, `thumbnail`, `status_publish`, `created_at`, `updated_at`) VALUES
	(2, 2, 1, 'pulau sempu', 'pulau-sempu', '<p>pulau sempu di kota malang&nbsp; provinsi jawa timur habis edit</p>', 'wisata/CSsxYZkHjS01G1gO891wJHU8EddOwfPPkuWfdDfT.jpeg', 0, '2020-06-05 13:20:37', '2021-07-02 07:08:08'),
	(4, 16, 1, 'jam gadang', 'jam-gadang', '<p>wisata jam gadang di bukittingi</p>', 'wisata/dfQsn8eErIoobJW9thZyeZk6beGiMgFKndKwwtjl.jpeg', 1, '2020-06-11 13:35:58', '2021-07-02 06:55:34'),
	(5, 11, 1, 'danau singkarak', 'danau-singkarak', '<p><strong>Danau Singkarak</strong>&nbsp;adalah sebuah danau&nbsp;yang membentang di dua kabupaten yang terdapat di provinsi sumatera barat indonesia, yaitu kabupaten solok&nbsp;dan kabupaten tanah datar.</p>\r\n\r\n<p>Danau ini memiliki luas 107,8&nbsp;km&sup2; dan merupakan danau terluas kedua di pulau&nbsp;<a href="https://id.wikipedia.org/wiki/Sumatra">Sumatra</a>&nbsp;setelah danau toba di Sumatra Utara. Danau ini merupakan hulu dari sungai atau&nbsp;<a href="https://id.wikipedia.org/wiki/Batang_Ombilin">Batang Ombilin</a>. Namun sebagian air danau ini dialirkan melalui terowongan menembus&nbsp;<a href="https://id.wikipedia.org/wiki/Bukit_Barisan">Bukit Barisan</a>&nbsp;ke&nbsp;<a href="https://id.wikipedia.org/wiki/Batang_Anai">Batang Anai</a>&nbsp;untuk menggerakkan generator&nbsp;<a href="https://id.wikipedia.org/wiki/PLTA_Singkarak">PLTA Singkarak</a><a href="https://id.wikipedia.org/wiki/Danau_Singkarak#cite_note-1">[1]</a>&nbsp;di dekat&nbsp;<a href="https://id.wikipedia.org/wiki/Lubuk_Alung,_Padang_Pariaman">Lubuk Alung</a>, kabupaten&nbsp;<a href="https://id.wikipedia.org/wiki/Padang_Pariaman">Padang Pariaman</a>.</p>\r\n\r\n<p>Danau Singkarak merupakan salah satu hasil dari proses&nbsp;<a href="https://id.wikipedia.org/wiki/Tektonika_lempeng">tektonik</a>&nbsp;yang dipengaruhi oleh Sesar Sumatra. Danau ini adalah bagian dari Cekungan Singkarak-Solok yang termasuk di antara segmen dari Sesar Sumatra. Cekungan dari danau ini terbentuk dari sebuah amblesan yang disebabkan oleh aktivitas pergerakan Sesar Sumatra. Cekungan besar ini terbendung oleh material vulkanik dari letusan gunung api sekitarnya. Akibat pembendungan material vulkanik ini terbentuklah Danau singkarak di satu bagian Cekungan Singkarak-Solok. Berbeda dengan&nbsp;<a href="https://id.wikipedia.org/wiki/Danau_Maninjau">Danau Maninjau</a>&nbsp;yang terbentuk akibat letusan gunung api, Danau Singkarak terbentuk utamanya karena proses tektonik.</p>', 'wisata/G4W0zLWKeVRhEjZrcLcpJVjBYVnU6egNpoY1kv3Q.jpeg', 1, '2020-07-03 13:43:19', '2020-07-19 05:19:09'),
	(6, 17, 1, 'pantai gondoriah', 'pantai-gondoriah', '<p>Rasanya tidak lengkap jika Anda bertandang ke Kota Pariaman belum singgah ke pantai yang satu ini. Pantai Gandoriah namanya, sebuah ruas pantai wisata dengan panorama pulau-pulau kecil di pusat Kota Pariaman. Perpaduan posisi yang strategis, panorama yang indah, dan konturnya yang landai, membuat pantai ini menjadi salah satu objek wisata pantai paling populer di sini.</p>\r\n\r\n<p>Asal-usul nama Pantai Gandoriah memiliki kisah tersendiri. Gandoriah merupakan nama seorang gadis dalam cerita rakyat Minangkabau. Menurut Kabid Pemasaran dan Kerjasama Pariwisata Kota Pariaman, Asnul Nazar, kisah ini sudah semakin jarang diketahui masyarakat, kecuali oleh kalangan sesepuh masyarakat. Kisah tersebut menceritakan perjalanan cinta seorang pemuda bernama Anggun Nan Tongga dengan Puti Gandoriah, yang tak lain adalah sepupunya.</p>', 'wisata/qsUgdypYLb8dSBmgouULpN4pUrf5WSD8IuazuIxQ.jpeg', 1, '2020-07-03 14:03:01', '2020-07-26 14:00:38'),
	(7, 18, 1, 'pulau mandeh', 'pulau-mandeh', '<p>Sumatera Barat adalah salah satu kota di Indonesia yang terkenal karena keajaiban alamnya, mulai dari pegunungan, sawah hijau, ngarai dalam, serta rumah-rumah besar dengan atap seperti tanduk kerbau. Dari banyaknya tempat wisata yang ada di Sumatera Barat, ada satu surga tersembunyi yang tersimpan cantik dengan sajian pesona alam yang mengagumkan. Jika di Papua terdapat Raja Ampat, kamu bisa menemukan Pulau Mandeh yang disebut-sebut sebagai Raja Ampat-nya Sumatera Barat.</p>', 'wisata/vZeC0HQtCa7UCbH4ay7fIHC8pYkxgaRdDdqfI7g0.jpeg', 1, '2020-07-03 14:23:52', '2020-07-26 14:04:14'),
	(8, 19, 1, 'lembah harau', 'lembah-harau', '<p><strong>Padang, Padangkita.com</strong>&nbsp;&ndash; RASA kagum akan menghampiri saat pandangan tertuju pada setumpukan batu-batu granit yang menjulang hingga ratusan meter di kawasan Lembah Harau, Kabupaten 50 Kota, Sumatera Barat. Seperti tersusun rapi, batu-batu granit dengan dinding alami ini menampilkan kesan eksotik yang sulit dijumpai di belahan bumi ini. Saat berkunjung ke lokasi wisata alam ini, hamparan padi yang menguning dan sungai-sungai jernih mengalir dari sarasah (air terjun) di Lembah Harau memberikan suasana damai nan menenangkan.&nbsp;Berjarak sekitar ratusan kilometer dari Kota Padang, Lembah Harau bisa ditempuh lewat jalur darat dengan lama perjalanan sekitar 3,5 jam. Sedang, dari Bukittinggi, Lembah Harau bisa dicapai dalam tempo satu jam. Letaknya yang tak jauh dari pasar tradisional Sari Lamak dan Kantor Bupati, tak akan menyulitkan wisatawan dan sejumlah pemanjat tebing dari berbagai belahan dunia untuk menaklukan walk alam Lembah Harau.</p>', 'wisata/2jOOooJDN1R3SRLPvhCcTAewFx2YKAc7cMbboS8o.jpeg', 1, '2020-07-03 14:31:40', '2020-07-19 06:03:51'),
	(9, 4, 1, 'pantai watu karang', 'pantai-watu-karang', '<p>Kota Pacitan tidak hanya terkenal sebagai spot macet saat terjadi liburan panjang atau mudik lebaran saja, namun juga terkenal dengan berbagai nuansa alam yang tentunya mempesona jutaan pengunjung. Sebut saja Pantai Watu Bale dengan batu karang nya yang khas, Pantai Buyutan dengan dongeng mahkota Dewa Narada dan tentunya Pantai Watu Karung yang terkenal dengan bongkahan batu karang eksotis. Pantai yang dikelilingi oleh perbukitan karang dengan sabana hijau ini juga menghadirkan hamparan pasir putih yang luas dan eksotis serta sekilas mirip Pantai Merah. Pantai yang terletak di Dusun Pringkuku ini seringkali dikunjungi wisatawan mancanegara untuk sekedar berjemur hingga bermain selancar karena tempat nya yang masih alami dan tidak ramai bak Pantai di pulau terpencil.</p>', 'wisata/zWZm61LleLr9IFw9FKYbbJOSWjZ49Lv7JwaCnSJZ.jpeg', 1, '2020-07-04 14:54:48', '2020-07-26 14:00:45'),
	(10, 1, 1, 'monumen kapal selam', 'monumen-kapal-selam', '<p>Monumen Kapal Selam sejatinya adalah KRI Pasopati 410 yang sempat ikut berpartisipasi di operasi Trikora. Kapal tersebut kemudian dipensiunkan dan dijadikan monumen hingga kini. Lokasinya ada di Jl Pemuda no 39, Embong Kaliasin, Genteng Di Monumen Kapal Selam alias Monkasel, Teman Traveler bisa melihat langsung interior sebuah kendaraan militer. Informasi mengenai sejarah dan sedikit gambaran pengoperasian kapal juga dicantumkan di sana. Pengunjung juga disuguhkan film pendek mengenai pertempuran di Laut Aru.</p>', 'wisata/qkBgbyWzEhktGV2bcTlen8MPfjcusEgxLpxDdSxb.jpeg', 1, '2020-07-04 14:58:03', '2020-07-19 06:04:05'),
	(11, 15, 1, 'gunung kelud', 'gunung-kelud', '<p>Gunung Kelud menjadi salah satu destinasi wisata favorit di Kediri. Gunung ini masih aktif dan pernah meletus tahun 2014. Pendakian akan membuat kamu dapat melihat kubah batu yang memiliki daya tarik tersendiri dari gunung ini. Kamu tidak perlu khawatir untuk mendaki Gunung Kelud, karena terdapat jalan beraspal yang dilalui kendaraan.<br />\r\n&nbsp;</p>', 'wisata/momY5phWQ8T9fwTCydsnFMBpIEqnut6qfXA9JC9f.jpeg', 1, '2020-07-04 15:01:13', '2020-07-19 06:04:12'),
	(12, 3, 1, 'puncak jengger', 'puncak-jengger', '<p>Jawa Timur masih saja menyimpan sejuta rahasia alam yang manakjubkan, baik dari sisi pantai yang indah maupun gunung-gunung yang menarik hati untuk dikunjungi. Salah satu kota yang memiliki surge tersembunyi di Jawa Timur adalah Mojokerto. Hal ini dikarenakan Mojokerto memiliki deretan pegunungan yang wajib dikunjungi selain Gunung Bromo di Probolinggo dan Gunung Semeru di Lumajang.Salah satu yang saat ini menjadi primadona para penikmat alam bebas adalah Watu Jengger. Watu jengger&nbsp;memiliki ketinggian 1050 MDPL berada di Kecamatan Jatirejo &ndash; Mojokerto yang bisa dilalui dari 2 jalur yaitu Desa Rejosari dan Desa Nawangan Kec. Jatirejo &ndash; Mojokerto. Di jalur Nawangan memerlukan waktu 1,5 jam untuk sampai ke puncak jengger&nbsp;dengan estimasi waktu 1 jam sampai di tempat camp B9 dan setengah jam dari camp B9 ke Puncak Jengger.</p>', 'wisata/0arYicGvWrSo9Vs44StrgPphhS3WZzgV8vortUQX.jpeg', 1, '2020-07-04 15:04:44', '2020-07-19 06:04:18'),
	(13, 6, 1, 'gunung tangkuban perahu', 'gunung-tangkuban-perahu', '<p>Gunung Tangkuban Perahu Merupakan salah satu objek wisata alam yang sangat terkenal di kawasan Cikole, Kecamatan Lembang Kabupaten Bandung Barat. Jika kita membicarakan tentang Gunung Tangkuban Perahu ini tentunya tidak akan terlepas dengan cerita yang sudah melegenda di masyarakat, yaitu legenda Sangkuriang. Menurut cerita rakyat setempat nama Tangkuban Perahu berkaitan dengan legenda Sangkuriang, yang dikisahkan jatuh cinta kepada ibunya, Dayang Sumbi.&nbsp;<em>Tempat Wisat</em>a Untuk menggagalkan niat anaknya menikahinya, Dayang Sumbi mengajukan syarat, salah satunya Sangkuriang harus membuat perahu dalam semalam.</p>', 'wisata/pFabmRv8z65aojuvXc1d6wQ1zXRhObCkg9RCPLsY.jpeg', 1, '2020-07-12 06:02:01', '2020-07-26 14:00:53'),
	(14, 7, 1, 'bukit gronggong', 'bukit-gronggong', '<p>Bukit Gronggong merupakan lokasi nongkrong favorit anak muda Cirebon dan sekitarnya. Di kawasan Bukit Gronggong, Anda dapat menikmati indahnya pemandangan Cirebon pada malam hari dari ketinggian sambil duduk di bangku dan menikmati minuman hangat di tengah sejuknya cuaca perbukitan. Kini, di kawasan tempat wisata di Cirebon ini sudah banyak berdiri restoran dan penginapan yang menyajikan panorama perbukitan yang memesona. Jadi, liburan bersama keluarga dan sahabat pun bisa semakin menyenangkan. Buat Anda yang tertarik menikmati pemandangan malam khas Bukit Gronggong yang berlokasi di daerah Patapan, Beber, Cirebon, Anda hanya diharuskan membayar biaya parkir sebesar Rp2.000 untuk kendaraan roda dua, dan Rp5.000 untuk mobil.</p>', 'wisata/DP1cGuQH0eF1dJryc2nezdg9TYsExLyeEMqpQ8Ts.jpeg', 1, '2020-07-12 06:07:15', '2020-07-26 14:01:16'),
	(15, 8, 6, 'pantai ombak tujuh', 'pantai-ombak-tujuh', '<p>Lokasi Pantai Ombak Tujuh berada di Kecamatan Ciracap, Kabupaten Sukabumi, Jawa Barat. Hamparan pasir putih yang menyelimuti pantai ini dan memiliki air yang bersih dan jernih membuat suasana menjadi adem dan menenangkan. Karena ombak di pantai ini besar Anda bisa berselancar di pantai ini. Anda juga bisa melihat biota laut, seperti rumput laut, kepiting, bintang laut dan berbagai macam ikan.</p>', 'wisata/kmvMDzdMSWEbQKyykNjES5icBBxscPN8R5bRZfLD.jpeg', 1, '2020-07-12 08:17:02', '2020-07-19 06:05:07'),
	(16, 25, 7, 'taman selfie', 'taman-selfie', '<p>Begitu menginjakkan kaki di pintu masuk Taman Selfie, virus selfie sudah ditularkan kepada para pengunjung, sehingga mereka akan tergoda untuk mengaktifkan kamera smartphone dan ingin segera berswafoto. Pesona yang ditebarkan tempat ini semakin terasa saat masuk ke bagian dalam bersamaan dengan sejuknya udara yang dihembuskan pepohonan rindang di setiap sudut taman. Gemerisik suara dedaunan ditambah angin yang semilir membuat tubuh serasa dimanjakan.</p>', 'wisata/3lNoQXw9qr77btrEJcTKklupg4tJiD8rMebYPeyJ.jpeg', 1, '2020-07-12 08:59:21', '2020-07-19 06:05:16'),
	(17, 24, 7, 'danau laut tador', 'danau-laut-tador', '<p>Rekomendasi wisata alam selanjutny adalah Danau Laut Tador. Tempat wisata sajtu ini sudah populer di kalangan masyarakat Tebing Tinggi. Keindahan alam di Danau satu ini memang susah untuk ditampik, tempat wisata satu ini akan memberikanmu kedamaian dengan pemandangan alam yang menenangkan. Danau laut yang jernih berpadu dengan hijaunya pepohonan yang rimbun terlihat alami dan menyejukkan mata. Di danau juga masih terdapat banyak ragam ikan yang bisa kamu pancing sambil menghabiskan waktu menenangkan diri sejenak.</p>', 'wisata/mTjlaEebgSkirNrqKa4xu1njKCH6hHhe8tqj3Ov8.jpeg', 1, '2020-07-12 09:02:16', '2020-07-19 06:05:26'),
	(18, 26, 6, 'pulau sarudik', 'pulau-sarudik', '<p>Pulau yang biasa juga dikenal dengan nama Pulau Sarudut sebagai salah satu tempat wisata di sibolga ini memiliki ciri pantai berpasir warna putih yang indah. Dengan semua keindahan ini, Anda dapat membuatnya menjadi sepaket dengan melihat keindahan matahari terbit maupun terbenam saat berada disini. Jika bepergian dari pusat kota Sibolga, Anda hanya harus menempuh ke lokasi pulau ini sekitar 3 km. Atau jika Anda ingin menggunakan kendaraan pribadi, umum, maupun sewa juga masih bisa untuk sampai ke pulau ini. Setelah sampai di pulau, untuk menyeberangi pulau, bisa menggunakan kapal nelayan setempat.</p>', 'wisata/KCHZS5ZwTpqsFwYHuiSWXIZOZ8SOS9qxKgpaK7on.jpeg', 1, '2020-07-19 04:58:31', '2020-07-25 15:03:29'),
	(19, 28, 6, 'pura ulwatu', 'pura-ulwatu', '<p>Pura Uluwatu Bali, memiliki status sebagai Pura Sad Kahyangan Jagat atau penyangga poros mata angin pulau Bali. Lokasi pura terletak di atas sebuah bukit karang dengan ketinggian sekitar 97 meter di atas permukaan laut.&nbsp;Karena lokasi pura yang berada di atas tebing batu karang, maka pura ini di beri nama Uluwatu, yang dalam bahasa Sanskerta berarti puncak batu karang.</p>', 'wisata/wGohkNGrSTeSmDD18Mjl6xKCY9b429aUDTRX13jH.jpeg', 0, '2020-08-13 14:43:25', '2020-08-13 14:43:25'),
	(20, 29, 6, 'pura tanah lot', 'pura-tanah-lot', '<p>Pura dibangun pada dua tempat yang berbeda. Satu pura terletak di atas bongkahan batu besar, dan satunya lagi terletak di atas tebing yang menjorok ke laut mirip dengan tempat wisata. Tebing inilah yang menghubungkan pura dengan daratan. Serta bentuk tebing melengkung seperti jembatan.</p>\r\n\r\n<p>Pura Tanah Lot merupakan bagian dari Pura Kahyangan Jagat di Bali, ditujukan sebagai tempat memuja dewa penjaga laut. Pada saat air laut pasang, pura akan kelihatan dikelilingi air laut.&nbsp;Di bawahnya terdapat goa kecil yang didalamnya ada beberapa ular laut. Sedangkan pada saat air laut pasang, anda akan dapat berjalan mendekati lokasi pura.</p>', 'wisata/EmLqPimhhW7BY11niBKpzMrmv84JXJ9xiMI4WEF3.jpeg', 0, '2020-08-13 14:52:23', '2020-08-13 14:52:23'),
	(21, 30, 6, 'pegunungan kintamani', 'pegunungan-kintamani', '<p>Daerah kawasan pariwisata Kintamani berada di bagian timur laut pulau Bali dan berada di bawah kaldera Gunung Batur, salah satu gunung berapi yang masih aktif di Bali. Selain terdapat gunung Berapi, di kawasan pariwisata Kintamani wisatawan juga dapat melihat pemandangan danau alami yang bernama danau Batur. Di dalam area kawasan pariwisata terdapat beberapa desa. Seperti desa Penelokan, desa Abung, desa Songan, desa Toya Bungkah, desa Batur, desa Kedisan, dan desa Kintamani yang masuk dalam pemerintahan kabupaten Bangli. Sebagian besar wisatawan yang liburan ke salah satu desa lebih mengenal dengan sebutan Kintamani, walaupun sebenarnya wisatawan berlibur di desa Penelokan atau desa lainnya.</p>', 'wisata/D4qQvXgZBWaIKc8mnVgA6S3H7xUsbuswR0mrLcDI.jpeg', 0, '2020-08-13 15:26:05', '2020-08-13 15:26:05'),
	(22, 31, 6, 'pura bekasih', 'pura-bekasih', '<p>Pura ini berdiri kokh di kaki Gunung Agung, yang menjadi gunung tertinggi di Pulau Bali. Di kompleks Pura Besakih ini terdapat 1 pura Basukian serta 17 pura lainnya. Dapat dikatakan, jika Pura Besakih merupakan pusat kegiatan dari seluruh pura yang ada di Pulau Bali. Pura Besakih tak hanya kental akan suasana religiusnya, namun pemandangannya yang indah dengan latar belakang Gunung Agung. Tak heran jika Pura yang dibangun sejak 1007 Masehi ini masuk ke dalam salah satu warisan Dunia. Karena tempat yang sangat suci, pastikan anda mengenakan pakaian Sopan saat sedang memasuki kawasan ini, Bagi wanita yang sedang haid, tidak diperkenankan untuk memasuki kawasan Pura Besakih.</p>', 'wisata/4PQvYnYCjWxJWQ7VekQzCQJ2Bqfus0nPLQyXhQJG.jpeg', 0, '2020-08-13 15:30:31', '2020-08-13 15:30:31');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;

-- Dumping structure for table pariwisata.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table pariwisata.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.migrations: ~8 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2019_08_19_000000_create_failed_jobs_table', 1),
	(3, '2020_05_22_090107_create_permission_tables', 1),
	(4, '2020_05_22_091347_create_provinces_table', 1),
	(5, '2020_05_22_091423_create_cities_table', 1),
	(6, '2020_05_22_091450_create_contents_table', 1),
	(7, '2014_10_12_100000_create_password_resets_table', 2),
	(8, '2020_07_19_050320_add_field_slug_on_contents', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table pariwisata.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.model_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table pariwisata.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.model_has_roles: ~5 rows (approximately)
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\User', 1),
	(2, 'App\\User', 2),
	(2, 'App\\User', 4),
	(2, 'App\\User', 6),
	(2, 'App\\User', 7);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table pariwisata.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table pariwisata.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table pariwisata.provinces
CREATE TABLE IF NOT EXISTS `provinces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.provinces: ~20 rows (approximately)
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'DKI Jakarta', 'dki-jakarta', '2020-05-23 07:50:16', '2020-05-27 15:07:01'),
	(2, 'Banten', 'banten', '2020-05-23 07:50:16', '2020-05-26 14:27:09'),
	(3, 'Jawa Barat', 'jawa-barat', '2020-05-23 07:50:16', '2020-05-26 05:58:30'),
	(4, 'Jawa Tengah', 'jawa-tengah', '2020-05-23 07:50:16', '2020-05-26 14:27:17'),
	(5, 'Jawa Timur', 'jawa-timur', '2020-05-23 07:50:16', '2020-05-26 06:06:17'),
	(7, 'aceh', 'aceh', '2020-05-26 13:12:56', '2020-07-12 05:57:32'),
	(8, 'sumatera barat', 'sumatera-barat', '2020-05-26 13:13:31', '2020-05-26 13:13:31'),
	(9, 'sumatera utara', 'sumatera-utara', '2020-05-26 13:13:40', '2020-05-26 13:13:40'),
	(10, 'sumatera selatan', 'sumatera-selatan', '2020-05-26 13:14:15', '2020-05-26 13:14:15'),
	(13, 'sulawesi selatan', 'sulawesi-selatan', '2020-05-26 14:09:10', '2020-08-13 14:09:55'),
	(15, 'sulawesi utara', 'sulawesi-utara', '2020-05-26 14:16:35', '2020-05-26 14:16:35'),
	(16, 'sulawesi barat', 'sulawesi-barat', '2020-05-26 14:16:52', '2020-08-13 14:11:13'),
	(17, 'sulawesi tenggara', 'sulawesi-tenggara', '2020-05-26 14:18:36', '2020-08-13 14:11:40'),
	(18, 'bali', 'bali', '2020-05-27 14:04:10', '2020-08-01 09:08:27'),
	(19, 'gorontalo', 'gorontalo', '2020-05-27 14:04:48', '2020-05-27 14:04:48'),
	(20, 'kalimantan barat', 'kalimantan-barat', '2020-05-27 14:06:28', '2020-05-27 14:06:28'),
	(21, 'riau', 'riau', '2020-05-27 14:15:49', '2020-07-04 15:05:18'),
	(22, 'kepulauan riau', 'kepulauan-riau', '2020-05-27 14:57:17', '2020-05-27 14:57:17'),
	(23, 'nusa tenggara barat', 'nusa-tenggara-barat', '2020-05-27 14:59:04', '2020-05-27 14:59:04'),
	(24, 'nusa tenggara timur', 'nusa-tenggara-timur', '2020-05-27 15:01:16', '2020-07-26 15:46:10'),
	(25, 'maluku', 'maluku', '2020-05-28 12:09:19', '2020-05-28 12:09:19'),
	(26, 'maluku utara', 'maluku-utara', '2020-05-28 12:09:41', '2020-05-28 12:09:41');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;

-- Dumping structure for table pariwisata.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'administrator', 'web', '2020-05-23 07:50:15', '2020-05-23 07:50:15'),
	(2, 'contributor', 'web', '2020-05-23 07:50:15', '2020-05-23 07:50:15');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table pariwisata.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.role_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table pariwisata.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table pariwisata.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'deco', 'deco99@gmail.com', NULL, '$2y$10$G/.n9BCiGCMgY3fDkCXFT.IBbYJ9jpvLY/nFF3OshOQ3p18iCtn0i', 'profile/8LRd4wXdHuPof7FpKOXw5pyAuAUga37rNgm8XHhx.jpeg', NULL, '2020-05-23 07:50:15', '2020-07-11 15:09:09'),
	(2, 'amirul ihsan', 'amirul99@gmail.com', NULL, '$2y$10$XMhDkWBiLBQqoU4VHc/zFuCPgrVDKYghojnC7mtWBhLLt2e9quJSC', NULL, NULL, '2020-05-23 07:50:16', '2020-05-23 07:50:16'),
	(6, 'dewi', 'dewe22@yahoo.com', NULL, '$2y$10$os2XZc2jz5ReZUdoZ6/fIuSrnF4l2jUupyLKtcFQ9.YmxQ23DDbum', 'profile/HEttARMzRSk2z3QL0aTgsdUPtXw2zlsbwggH2pyq.jpeg', NULL, '2020-07-03 13:29:57', '2020-07-03 13:31:40'),
	(7, 'retno', 'retno98@gmail.com', NULL, '$2y$10$QePpFDR2EVHmUsvFZ6NsxO87BxrtRnyqNLX2m0bUnCp/bdJefr7p6', 'profile/bvBaZapQcQJTLZF93IFbDSMX0Fy2l5BXbWrskfDT.jpeg', NULL, '2020-07-03 13:34:10', '2020-07-03 13:34:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
