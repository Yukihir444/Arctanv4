/*
 Navicat MySQL Dump SQL

 Source Server         : server
 Source Server Type    : MySQL
 Source Server Version : 80017 (8.0.17)
 Source Host           : localhost:3306
 Source Schema         : arctan

 Target Server Type    : MySQL
 Target Server Version : 80017 (8.0.17)
 File Encoding         : 65001

 Date: 15/01/2025 09:55:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for playlist
-- ----------------------------
DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist`  (
  `PLID` int(11) NOT NULL AUTO_INCREMENT,
  `SONGID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  PRIMARY KEY (`PLID`) USING BTREE,
  INDEX `plowner`(`USERID` ASC) USING BTREE,
  INDEX `plsong`(`SONGID` ASC) USING BTREE,
  CONSTRAINT `plowner` FOREIGN KEY (`USERID`) REFERENCES `tbl_users` (`USERID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playlist
-- ----------------------------
INSERT INTO `playlist` VALUES (1, 1, 1);
INSERT INTO `playlist` VALUES (2, 2, 1);

-- ----------------------------
-- Table structure for tbl_bands
-- ----------------------------
DROP TABLE IF EXISTS `tbl_bands`;
CREATE TABLE `tbl_bands`  (
  `BANDID` int(10) NOT NULL AUTO_INCREMENT,
  `band_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`BANDID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_bands
-- ----------------------------
INSERT INTO `tbl_bands` VALUES (1, 'withme');
INSERT INTO `tbl_bands` VALUES (2, 'Journey');

-- ----------------------------
-- Table structure for tbl_follows
-- ----------------------------
DROP TABLE IF EXISTS `tbl_follows`;
CREATE TABLE `tbl_follows`  (
  `FOLLOWID` int(11) NOT NULL AUTO_INCREMENT,
  `follower` int(11) NULL DEFAULT NULL COMMENT 'has',
  `following` int(11) NULL DEFAULT NULL COMMENT 'this guy',
  PRIMARY KEY (`FOLLOWID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_follows
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_keys
-- ----------------------------
DROP TABLE IF EXISTS `tbl_keys`;
CREATE TABLE `tbl_keys`  (
  `k_id` int(2) NOT NULL AUTO_INCREMENT,
  `k_major_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `k_minor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `k_scales` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`k_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_keys
-- ----------------------------
INSERT INTO `tbl_keys` VALUES (1, 'C', 'Am', '0');
INSERT INTO `tbl_keys` VALUES (2, 'G', 'Em', '1 sharp');
INSERT INTO `tbl_keys` VALUES (3, 'D', 'Bm', '2 sharps');
INSERT INTO `tbl_keys` VALUES (4, 'A', 'F#m', '3 sharps');
INSERT INTO `tbl_keys` VALUES (5, 'E', 'C#m', '4 sharps');
INSERT INTO `tbl_keys` VALUES (6, 'B', 'G#m', '5 sharps');
INSERT INTO `tbl_keys` VALUES (7, 'F#', 'D#m', '6 sharps');
INSERT INTO `tbl_keys` VALUES (8, 'C#', 'A#m', '7 sharps');
INSERT INTO `tbl_keys` VALUES (9, 'G#', 'E#m', '8 sharps');
INSERT INTO `tbl_keys` VALUES (10, 'D#', 'B#m', '9 sharps');
INSERT INTO `tbl_keys` VALUES (11, 'A#', 'F##m', '10 sharps');
INSERT INTO `tbl_keys` VALUES (12, 'E#', 'C##m', '11 sharps');
INSERT INTO `tbl_keys` VALUES (13, 'B#', 'G##m', '12 sharps');
INSERT INTO `tbl_keys` VALUES (14, 'F', 'Dm', '1 flat');
INSERT INTO `tbl_keys` VALUES (15, 'Bb', 'Gm', '2 flats');
INSERT INTO `tbl_keys` VALUES (16, 'Eb', 'Cm', '3 flats');
INSERT INTO `tbl_keys` VALUES (17, 'Ab', 'Fm', '4 flats');
INSERT INTO `tbl_keys` VALUES (18, 'Db', 'Bbm', '5 flats');
INSERT INTO `tbl_keys` VALUES (19, 'Gb', 'Ebm', '6 flats');
INSERT INTO `tbl_keys` VALUES (20, 'Cb', 'Abm', '7 flats');
INSERT INTO `tbl_keys` VALUES (21, 'Fb', 'Dbm', '8 flats');
INSERT INTO `tbl_keys` VALUES (22, 'Bbb', 'Gbm', '9 flats');
INSERT INTO `tbl_keys` VALUES (23, 'Ebb', 'Cbm', '10 flats');
INSERT INTO `tbl_keys` VALUES (24, 'Abb', 'Fbm', '11 flats');

-- ----------------------------
-- Table structure for tbl_members_band
-- ----------------------------
DROP TABLE IF EXISTS `tbl_members_band`;
CREATE TABLE `tbl_members_band`  (
  `MEMBERID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NULL DEFAULT NULL,
  `BANDID` int(11) NULL DEFAULT NULL,
  `TYPEID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`MEMBERID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_members_band
-- ----------------------------
INSERT INTO `tbl_members_band` VALUES (1, 1, 1, 1);
INSERT INTO `tbl_members_band` VALUES (2, 1, 2, 5);
INSERT INTO `tbl_members_band` VALUES (4, 3, 2, 3);

-- ----------------------------
-- Table structure for tbl_places
-- ----------------------------
DROP TABLE IF EXISTS `tbl_places`;
CREATE TABLE `tbl_places`  (
  `PLACEID` int(10) NOT NULL,
  `placename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `placeprovice` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `carpark_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `placeaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PLACEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_places
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_positions
-- ----------------------------
DROP TABLE IF EXISTS `tbl_positions`;
CREATE TABLE `tbl_positions`  (
  `TYPEID` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TYPEID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_positions
-- ----------------------------
INSERT INTO `tbl_positions` VALUES (1, 'Vocal');
INSERT INTO `tbl_positions` VALUES (2, 'Guitar');
INSERT INTO `tbl_positions` VALUES (3, 'Bass');
INSERT INTO `tbl_positions` VALUES (4, 'Drum');
INSERT INTO `tbl_positions` VALUES (5, 'Keyboard');
INSERT INTO `tbl_positions` VALUES (6, 'Sound Engineer');

-- ----------------------------
-- Table structure for tbl_post
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post`  (
  `POSTID` int(100) NOT NULL AUTO_INCREMENT,
  `UID` int(100) NOT NULL,
  `e_date` date NOT NULL,
  `e_time_start` time NOT NULL,
  `e_time_end` time NOT NULL,
  `e_price` float NOT NULL,
  `e_price_add` float NOT NULL,
  `e_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `e_location_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `e_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `e_status` enum('Pending','Matched','Expired') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `position_type` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL,
  `havereport` bigint(20) NOT NULL,
  `haveliked` int(11) NOT NULL,
  `haveshared` int(11) NOT NULL,
  `havecommented` int(11) NOT NULL,
  PRIMARY KEY (`POSTID`) USING BTREE,
  INDEX `postowner`(`UID` ASC) USING BTREE,
  CONSTRAINT `postowner` FOREIGN KEY (`UID`) REFERENCES `tbl_users` (`USERID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_post
-- ----------------------------
INSERT INTO `tbl_post` VALUES (1, 3, '2025-01-15', '23:00:00', '00:00:00', 8900, 0, 'Terra', '', '', 'Pending', 'Bass', '2025-01-13 09:51:00', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for tbl_skills
-- ----------------------------
DROP TABLE IF EXISTS `tbl_skills`;
CREATE TABLE `tbl_skills`  (
  `SKILLID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NULL DEFAULT NULL,
  `TYPEID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`SKILLID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_skills
-- ----------------------------
INSERT INTO `tbl_skills` VALUES (1, 1, 5);
INSERT INTO `tbl_skills` VALUES (2, 1, 1);
INSERT INTO `tbl_skills` VALUES (3, 3, 3);

-- ----------------------------
-- Table structure for tbl_songs
-- ----------------------------
DROP TABLE IF EXISTS `tbl_songs`;
CREATE TABLE `tbl_songs`  (
  `SONGID` int(11) NOT NULL AUTO_INCREMENT,
  `songname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `artist` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ownercompany` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `keyofsong` set('C / Am','G / Em','D / Bm','A / F#m','E / C#m','B / G#m','F# / D#m','C# / A#m','G# / E#m','D# / B#m','A# / F##m','E# / C##m','B# / G##m','F / Dm','Bb / Gm','Eb / Cm','Ab / Fm','Db / Bbm','Gb / Ebm','Cb / Abm','Fb / Dbm',' Bbb / Gbm') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `genre` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `original` enum('Yes','No') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `composername` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  INDEX `SONGID`(`SONGID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_songs
-- ----------------------------
INSERT INTO `tbl_songs` VALUES (1, 'จะบอกว่ารักทำไม', 'withme feat. Howdyfirzt', NULL, 'G / Em', 'Rock', 'Yes', 'Detnarong J.');
INSERT INTO `tbl_songs` VALUES (2, 'ชีวิตของกะต๊อก', 'withme feat. Skokdark', NULL, 'E / C#m', 'Pop', 'Yes', 'Detnarong J.');
INSERT INTO `tbl_songs` VALUES (5, 'ร (w8)', 'จีน กษิฏิษ', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (6, 'ฟ้า', 'Tattoo Colour', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (7, 'ลืมไปแล้วว่าต้องลืมยังไง (Fade)', 'Jeff Satur', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (8, 'แปดโมงเช้าวันอังคาร', 'Palmy', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (9, 'ไม่ต้องรู้ว่าเราคบกันแบบไหน', 'ETC.', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (10, 'ทางของฝุ่น', 'Atom', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (11, 'ดินแดนแห่งความรัก', 'Crecendo', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (12, 'พิง', 'Non Thanon', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (13, 'เลือดกรุ๊ปบี B Blood Type', 'CHRRISSA', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (14, 'Kryptonite', 'PUN', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (15, 'ที่เดิมในหัวใจ', 'TMT feat. ตู่ ภพธร', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (16, 'เลือกได้ไหม', 'Zaza', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (17, 'ผู้ถูกเลือกให้ผิดหวัง(ดอกไม้ฤดูหนาว)', 'เรนิษรา', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (18, 'เธอรักเขาตอนเรารักกัน', 'BEAN NAPASON', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (19, 'เรื่องที่ขอ', 'ลุลา', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (20, 'แค่คุณ', 'Musketeers', NULL, 'Ab / Fm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (21, 'วันนั้นฝนก็ตกแบบนี้แหละ', 'MEAN', NULL, 'B / G#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (22, 'หมายความว่าอะไร', 'MEAN', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (23, 'ด้วยความคิดถึง', 'Drama Stream', NULL, 'Ab / Fm', 'Pop, Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (24, 'แกล้ง', 'Silly Fools', NULL, 'F# / D#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (25, 'คนไม่มีแฟน', 'เบิร์ด ธงไชย แมคอินไตย์', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (26, 'Unloveable ', 'Mild', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (27, 'Unfriend', 'Helmetheads', NULL, 'B / G#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (28, 'ฝนตกไหม', 'Three Man Down', NULL, 'A / F#m', 'Pop, Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (29, 'นะหน้าทอง ', 'โจอี้ ภูวศิษฐ์', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (30, 'ใจนักเลง', 'พงษ์พัฒน์ วชิรบรรจง', NULL, 'F / Dm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (31, 'ใจเหลือๆ', 'Dr.Fuu', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (32, 'กลับมา', '2 Days Ago Kids', NULL, 'D / Bm', 'Pop, Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (33, 'วอน', 'The Peach Band', NULL, 'F / Dm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (34, 'ขอวอน 2', 'SOMKIAT', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (35, 'ว่าว ', 'มินตรา', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (36, 'ภาวนา', 'โก้ เศกพล', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (37, 'ดาวหางฮัลเลย์ (Hallyes Comet)', 'fellow fellow', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (38, 'คนข้างล่าง', 'บอย โกสิยพงษ์', NULL, 'D / Bm', 'Pop, Jazz', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (39, 'เวลาเธอยิ้ม', 'POLYCAT', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (40, 'ตุ๊กตาหน้ารถ', 'ลุลา', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (41, 'ทะเลสีดำ', 'ลุลา  feat. ต้าร์ Paradox', NULL, 'G / Em', '', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (42, 'รักเดียวใจเดียว', 'เสือ ธนพล', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (43, 'รักเธอให้น้อยลง ', 'Bandwagon', NULL, 'Ab / Fm', '', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (44, 'ทําไมต้องเธอ', 'เบิร์ด ธงไชย แมคอินไตย์', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (45, 'ทําไมต้องเธอ', 'Instict', NULL, 'C / Am', 'Pop', 'No', '');
INSERT INTO `tbl_songs` VALUES (46, 'ครึ่งหนึ่งของชีวิต', 'แอม เสาวลักษณ์', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (47, 'ยินดีที่ไม่รู้จัก', '25 Hours', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (48, 'การเดินทางที่แสนพิเศษ', 'Da Endorphine', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (49, 'ครั้งหนึ่ง...เราเคยรักกัน', 'Da Endorphine', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (50, 'เล่าสู่กันฟัง', 'เบิร์ด ธงไชย แมคอินไตย์', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (51, 'รักแรกพบ', 'Tattoo Colour', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (52, 'เขียนไว้ข้างเตียง', 'นันทิดา แก้วบัวสาย', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (53, 'เขียนไว้ข้างเตียง', 'Paradox', NULL, 'A / F#m', 'Rock', 'No', '');
INSERT INTO `tbl_songs` VALUES (54, 'นอนไม่หลับ', 'Zaza', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (55, 'อยู่ต่อเลยได้ไหม', 'สิงโต นำโชค', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (56, 'คิดถึงจัง(มาหาหน่อย)', 'ปราโมทย์ ปาทาน', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (57, 'แพ้คำว่ารัก', 'Calories Blah Blah', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (58, 'เหงาๆ', 'INK WARUNTORN', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (59, 'ทำไมต้องรักเธอ', 'เอิ้น พิยะดา feat. คริส หอวัง, อุ๋ย Buddha bless', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (60, 'เราคงต้องเป็นแฟนกัน', 'พั้นช์', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (61, 'Mr. Everything', 'Billkin', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (62, 'ร้ายก็รัก', 'Joey Boy', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (63, 'ในวันที่เราต้องไกลห่าง', 'ลุลา', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (64, 'Miss call', 'Senorita', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (65, 'คาใจ', 'เจ เจตริน', NULL, 'F / Dm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (66, 'อยากให้เธอลอง', 'Musketeers', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (67, 'ลืมไปก่อน', 'Buddha Bless Feat. เกรียน peace', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (68, 'อยากเจอ', 'Blue shade', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (69, 'เนื้อคู่', 'Boy Peacemaker', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (70, 'Play girl', 'ส้ม อมรา', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (71, 'I JUST WANNA PEN FAN YOU DAI BOR ?', 'สิงโต นำโชค', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (72, 'Event', 'Season Five', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (73, 'สถานีดวงจันทร์', 'วัชราวลี', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (74, 'ถามจันทร์ ', '25 Hours', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (75, 'รักเก่าๆ', 'Soul After Six', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (76, 'ก้อนหินละเมอ', 'Soul After Six', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (77, 'เที่ยงคืนสิบห้านาที', '25 Hours', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (78, 'Lady', '25 Hours', NULL, 'Db / Bbm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (79, 'เช้าไม่กลัว', 'ลีโอ พุฒ', NULL, 'B / G#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (80, 'หมวยนี่คะ', 'China Dolls', NULL, 'Db / Bbm', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (81, 'ไม่อยากให้เธอไว้ใจ', 'มาช่า วัฒนพานิช', NULL, 'Ab / Fm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (82, 'ไม่อยากให้เธอไว้ใจ', 'Jetset\'er', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (83, 'แอบเหงา', 'เสนาหอย', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (84, 'ฤดูที่ฉันเหงา', 'Flure', NULL, 'Eb / Cm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (85, 'ทน', 'SPRITE x GUYGEEGEE', NULL, 'Bb / Gm', 'Hip-Hop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (86, 'Music Lover', 'มาช่า วัฒนพานิช', NULL, 'Gb / Ebm', 'Pop, EDM', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (87, 'จำเก่ง', 'F.HERO x Tilly Birds', NULL, 'Db / Bbm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (88, 'ร่มสีเทา', 'วัชราวลี', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (89, 'ร่มสีเทา', 'Klear', NULL, 'G / Em', 'Pop', 'No', '');
INSERT INTO `tbl_songs` VALUES (90, 'ร่มสีเทา', 'Klear', NULL, 'G / Em', 'Pop', 'No', '');
INSERT INTO `tbl_songs` VALUES (91, 'รู้งี้เป็นแฟนกันตั้งนานแล้ว', 'Three Man Down', NULL, 'A / F#m', 'Pop, Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (92, 'น้อง', 'Three Man Down', NULL, 'Ab / Fm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (93, 'มูเตลู (MUTELU)', 'PiXXiE', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (94, 'ติดฝน', 'PiXXiE', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (95, 'อ๊อด อ๊อด', 'The Richman Toy', NULL, 'D / Bm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (96, '12345 i love you', 'The Bottom Blues', NULL, 'A / F#m', 'Blues', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (97, 'Ooh', 'Palmy', NULL, 'F / Dm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (98, 'ทนได้ทุกที', 'ดั้ม สมประสงค์', NULL, 'A / F#m', 'Pop, Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (99, 'ทนได้ทุกที', 'มาตัง ระดับดาว', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (100, 'บรรยากาศ', 'Only Monday', NULL, 'B / G#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (101, 'เพลงที่เธอไม่ฟัง', 'Bedroom Audio', NULL, 'E / C#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (102, 'อยากมีแฟนแล้ว', 'Lipta feat. Lazyloxy', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (103, 'แฟน', 'Lipta', NULL, 'B / G#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (104, 'มองนานๆ', 'Vitamin A', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (105, 'ตอบยังไง', 'ป๊อป ปองกูล', NULL, 'F / Dm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (106, 'Too Much So Much Very Much', 'เบิร์ด ธงไชย แมคอินไตย์', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (107, 'ยังโสด', 'Olives', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (108, 'คนใจง่าย', 'ไอซ์ ศรัณยู', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (109, 'เกรงใจ', 'Raptors', NULL, 'C / Am', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (110, 'O.K. นะคะ', 'แคทรียา อิงลิช', NULL, 'C / Am', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (111, 'รักแท้...ยังไง', 'น้ำชา ชีรณัฐ', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (112, 'จินนี่จ๋า', '2002 ราตรี', NULL, 'F / Dm', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (113, 'กระเป๋าแบนแฟนยิ้ม', 'The Richman Toy', NULL, 'G / Em', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (114, 'Cinderella', 'Tattoo Colour', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (115, 'โกหก', 'Tattoo Colour', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (116, 'เพียงพอ', 'POTATO', NULL, 'B / G#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (117, 'สักวันฉันจะดีพอ', 'Bodyslam', NULL, 'G / Em', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (118, 'อยากร้องดังๆ', 'Palmy', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (119, 'ขาหมู', 'Tattoo Colour', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (120, 'เพ้อเจ้อ', 'ALARM9', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (121, 'คอแห้ง', 'F.HERO x จ๊ะ นงผณี', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (122, 'คิดมาก', 'Palmy', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (123, 'คิดถึงนะ', 'แพรว คณิตกุล', NULL, 'F / Dm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (124, 'เคลิ้ม', 'Slot Machine', NULL, 'A / F#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (125, 'จันทร์เจ้า', 'Slot Machine', NULL, 'E / C#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (126, 'คุณและคุณ', 'แกงส้ม ธณทัต', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (127, 'ทักครับ', 'Lipto ft. GUYGEEGEE', NULL, 'Gb / Ebm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (128, 'ทรงอย่างแบด (Bad Boy)', 'Papar Planes', NULL, 'D / Bm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (129, 'เพียงกระซิบบอก', 'The Innocent', NULL, 'Bb / Gm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (130, 'เพียงกระซิบ', 'Black Head', NULL, 'D / Bm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (131, 'ฤดูร้อน', 'Paradox', NULL, 'A / F#m', 'Pop, Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (132, 'ใจเย็น', 'Pancake', NULL, 'Ab / Fm', 'Pop, Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (133, 'รอพี่ก่อน', 'Shade', NULL, 'Ab / Fm', 'Pop, Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (134, 'แฟนเก่าคนโปรด', 'SLAPKISS', NULL, 'B / G#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (135, 'กระหล่ำปลี', 'Joey Boy', NULL, 'F / Dm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (136, 'เล่นของสูง', 'Big Ass', NULL, 'B / G#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (137, 'เล่นของสูง', 'Klear', NULL, 'D / Bm', 'Rock', 'No', '');
INSERT INTO `tbl_songs` VALUES (138, 'จะรักจะร้าย', 'Klear', NULL, 'E / C#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (139, 'ดีแต่ปาก', 'Big Ass', NULL, 'B / G#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (140, 'วัดปะหล่ะ? (TEST ME)', '4EVE', NULL, 'Db / Bbm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (141, 'มันคงเป็นความรัก', 'STAMP', NULL, 'A / F#m', 'Pop, Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (142, 'หวั่นไหว', 'Bodyslam', NULL, 'E / C#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (143, 'คนที่ถูกรัก', 'Bodyslam', NULL, 'A / F#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (144, 'โปรดส่งใครมารักฉันที', 'Instict', NULL, 'G / Em', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (145, 'KIMINOTO', 'SPRITE ft. YOUNGOHM', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (146, 'DONG', 'Bear Knuckle', NULL, 'Ab / Fm', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (147, 'ข้าน้อยสมควรตาย', 'Big Ass', NULL, 'B / G#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (148, 'Slow Motion (ระวังมันส์ชนโอ๋!!)', 'Joey Boy', NULL, 'Db / Bbm', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (149, 'ซ่าส์...(สั่นๆ)', 'D2B', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (150, 'ผ่าน', 'Slot Machine', NULL, 'A / F#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (151, 'คนไม่คุย (Silent Mode)', 'PROXY', NULL, 'G / Em', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (152, 'FIRE BOY', 'PP Krit', NULL, 'Db / Bbm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (153, 'สายตาหลอกกันไม่ได้ (Eyes Don’t Lie)', 'INK WARUNTORN', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (154, 'เอาปากกามาวง', 'Bell Warisara', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (155, 'อกหัก', 'Bodyslam', NULL, 'D / Bm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (156, 'คุกเข่า', 'Cocktail', NULL, 'Db / Bbm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (157, 'วัดใจ', 'Silly Fools', NULL, 'E / C#m', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (158, 'น้ำลาย', 'Silly Fools', NULL, 'Gb / Ebm', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (159, 'ทะลึ่ง', 'Thaitanium', NULL, 'C / Am', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (160, 'เมียไม่มี', 'Joey Boy', NULL, 'G / Em', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (161, 'ไหวอ่ะเปล่า เบเบ้', 'SouthSide', NULL, 'Eb / Cm', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (162, 'Fire', 'Buddha Bless', NULL, 'Ab / Fm', 'Hip-Hop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (163, 'ธาตุทองซาวด์', 'ํYOUNGOHM feat. SONOFO', NULL, 'C / Am', 'Hip-Hop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (164, 'เอวติดไฟ', 'Bear Knuckle', NULL, 'Db / Bbm', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (165, 'หัวไหล่ตูด', 'MAF', NULL, 'G / Em', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (166, 'มะลึกกึ๊กกึ๋ยย์', 'นาตาลี สตีเบิร์ท', NULL, 'G / Em', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (167, 'ผีเสื้อราตรี', '2002 ราตรี', NULL, 'C / Am', 'EDM, Dance', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (168, 'เจ้าช่อมาลี', 'Mr. Team', NULL, 'C / Am', 'Rock', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (169, 'ผ้าเช็ดหน้า', 'Triumph Kingdom', NULL, 'B / G#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (170, 'รักคือฝันไป', 'สาว สาว สาว', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (171, 'เกินต้าน (Too Cute)', 'PiXXiE', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (172, 'เฮอร์ไมโอน้อง (Hermionong)', 'อูน TheChanisara', NULL, 'F / Dm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (173, 'ฉันจะฉาปเธอ (CURSE)', 'BAMM', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (174, 'ช่วยไม่ได้ (CAN\'T HELP)', 'UrBoyTJ', NULL, 'Bb / Gm', 'Hip-Hop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (175, 'แค่ที่รัก (My boo)', '3.2.1', NULL, 'Bb / Gm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (176, 'รักฉันเรียกว่าเธอ', 'Kamikaze', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (177, 'มีอีกไหม', '3.2.1', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (178, 'ตกหลุมรัก', 'Waii', NULL, 'C / Am', 'Hip-Hop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (179, 'วายร้าย', 'UrBoyTJ', NULL, 'A / F#m', 'Hip-Hop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (180, 'Closer', 'The Chainsmokers', NULL, 'Ab / Fm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (181, 'รบกวนมารักกัน', 'ทาทา ยัง', NULL, 'Eb / Cm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (182, 'โอ๊ะ...โอ๊ย', 'ทาทา ยัง', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (183, 'พูดอีกที', 'คริสติน่า อากีล่าร์', NULL, 'C / Am', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (184, 'L.O.V.E', 'คูณสามซุปเปอร์แก๊งค์', NULL, 'A / F#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (185, 'รักอยู่หนใด', 'Pop Angels', NULL, 'D / Bm', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (186, 'ห้ามทิ้ง', 'Atom Mic idol', NULL, 'E / C#m', 'Pop', 'Yes', '');
INSERT INTO `tbl_songs` VALUES (187, 'ลูกกรุง', 'แมว จิรศักดิ์', NULL, 'C / Am', 'Rock', 'Yes', '');

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users`  (
  `USERID` int(10) NOT NULL AUTO_INCREMENT,
  `username` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `displayname` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(1) NOT NULL,
  `type` enum('Admin','User') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tel` char(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Approved','Waiting','None') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'None',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `profile_dir` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'assets/img/none.jpeg',
  `online_status` enum('Online','Offline') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USERID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_users
-- ----------------------------
INSERT INTO `tbl_users` VALUES (1, 'yukihir444', 'Yukihira', '1234', 1, 'Admin', NULL, '0924409614', 'Approved', NULL, 'yukihir444-profile.jpg', 'Online');
INSERT INTO `tbl_users` VALUES (3, 'sippanon', 'Sippanon Wattanamongkol', '1234', 1, 'User', NULL, '', 'Approved', NULL, 'nonny.jpg', 'Offline');

SET FOREIGN_KEY_CHECKS = 1;
