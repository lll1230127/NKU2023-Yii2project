CREATE DATABASE  IF NOT EXISTS `yii2advanced`;
USE `yii2advanced`;
/*
Navicat MySQL Data Transfer

Source Server         : 91
Source Server Version : 50728
Source Host           : 49.233.130.58:3306
Source Database       : yii2advanced

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-06-14 10:22:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `content` text,
  `date` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `fk-article-user_id` (`created_by`),
  FULLTEXT KEY `title` (`title`,`description`),
  CONSTRAINT `fk-article-user_id` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('6', '核污水排放现场海水呈现两种颜色', '<p>当地时间8月24日13时，日本单方面强行启动福岛核污染水排入海洋。经过17分钟，核污染水经由1公里的海底隧道流进太平洋。从现场航拍画面中可以看到，福岛海面上已呈现出两种颜色。</p>\r\n', '2021-06-07', 'https://imagecloud.thepaper.cn/thepaper/image/267/110/483.jpg', '11', '2', '1', '1');
INSERT INTO `article` VALUES ('7', '清华深研院团队发文分析福岛核废水在太平洋的扩散机理', '<p style="padding:0px;outline:0px;background-color:#ffffff;font-family:微软雅黑, &quot;microsoft yahei&quot;;font-size:16px;color:#000000;line-height:1.75em;margin-top:10px;margin-bottom:10px;">团队进行的宏观模拟结果表明，核废水在排放后240天就会到达我国沿岸海域，1200天后将到达北美沿岸并覆盖几乎整个北太平洋。随后，污染物一边在赤道洋流的作用下沿着美洲海岸向南太平洋快速扩散，另一边通过澳大利亚北部海域向印度洋转移。值得注意的是，尽管污染物的排放位置是在福岛附近，但随着时间的推移，污染物高浓度区域将沿着35°N线附近向东延伸，从开始的东亚附近海域扩散到北美附近海域。在第2400天时，中国东南沿岸海域主要呈现浓度较低的浅粉色，而北美西侧海域已经基本被浓度较高的红色覆盖。</p>\r\n', '2021-12-01', 'https://www.sigs.tsinghua.edu.cn/_upload/article/images/52/50/2c7759344698a58a29fbe3433778/b194d946-93fb-4766-944d-f2c6f892e4c5.jpg', '1', '2', '1', '1');

-- ----------------------------
-- Table structure for `article_tag`
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_article_article_id` (`article_id`),
  KEY `idx_tag_id` (`tag_id`),
  CONSTRAINT `fk-tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tag_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '日本排放核废水相关新闻');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `video_id` varchar(16) DEFAULT 'null',
  `password` varchar(20) DEFAULT 'pass123',
  PRIMARY KEY (`id`),
  KEY `idx-post-user_id` (`user_id`),
  KEY `idx-article_id` (`article_id`),
  CONSTRAINT `fk-post-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', 'lol', '2', '2', '1', '2020-05-09', 'null', 'pass123');
INSERT INTO `comment` VALUES ('2', 'soom', '2', '2', '1', '2020-05-09', null, 'pass123');
INSERT INTO `comment` VALUES ('4', 'hello\r\n', '2', '2', '1', '2020-05-09', null, 'pass123');
INSERT INTO `comment` VALUES ('5', 'hello', '2', null, '1', '2020-05-09', null, 'pass123');
INSERT INTO `comment` VALUES ('6', 'a', '2', '2', '1', '2020-05-09', 'null', 'pass123');
INSERT INTO `comment` VALUES ('7', 'lala', '2', '2', '1', '2020-05-09', 'null', 'pass123');
INSERT INTO `comment` VALUES ('8', 'kk', '4', '2', '1', '2020-05-09', 'null', 'pass123');
INSERT INTO `comment` VALUES ('13', 'kk', '2', '0', '1', '2020-05-09', 'ECR47F1S', 'pass123');
INSERT INTO `comment` VALUES ('14', 'video', '2', '0', '1', '2020-05-09', 'ECR47F1S', 'pass123');
INSERT INTO `comment` VALUES ('15', 'videoagin', '2', null, '1', '2020-05-09', 'ECR47F1S', 'pass123');
INSERT INTO `comment` VALUES ('16', 'testing testing', '6', '3', '1', '2020-06-01', 'null', 'pass123');

-- ----------------------------
-- Table structure for `contact_form`
-- ----------------------------
DROP TABLE IF EXISTS `contact_form`;
CREATE TABLE `contact_form` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `wechatid` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of contact_form
-- ----------------------------
INSERT INTO `contact_form` VALUES ('12', 'Tony', 'Stark', '1', 'iamironman', '159876-546-64', 'I think your web page is pretty good.');
INSERT INTO `contact_form` VALUES ('13', 'Tony', 'Stark', '1', 'iamironman', '159876-546-64', 'I think your web page is pretty good.');
INSERT INTO `contact_form` VALUES ('14', 'Steve', 'Rogers', '1', 'america', '157952-32468', 'Good job!');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `country_code_idx` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('AD', 'Andorra');
INSERT INTO `country` VALUES ('AE', 'United Arab Emirates');
INSERT INTO `country` VALUES ('AF', 'Afghanistan');
INSERT INTO `country` VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO `country` VALUES ('AI', 'Anguilla');
INSERT INTO `country` VALUES ('AL', 'Albania');
INSERT INTO `country` VALUES ('AM', 'Armenia');
INSERT INTO `country` VALUES ('AO', 'Angola');
INSERT INTO `country` VALUES ('AQ', 'Antarctica');
INSERT INTO `country` VALUES ('AR', 'Argentina');
INSERT INTO `country` VALUES ('AS', 'American Samoa');
INSERT INTO `country` VALUES ('AT', 'Austria');
INSERT INTO `country` VALUES ('AU', 'Australia');
INSERT INTO `country` VALUES ('AW', 'Aruba');
INSERT INTO `country` VALUES ('AX', 'Åland Islands');
INSERT INTO `country` VALUES ('AZ', 'Azerbaijan');
INSERT INTO `country` VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO `country` VALUES ('BB', 'Barbados');
INSERT INTO `country` VALUES ('BD', 'Bangladesh');
INSERT INTO `country` VALUES ('BE', 'Belgium');
INSERT INTO `country` VALUES ('BF', 'Burkina Faso');
INSERT INTO `country` VALUES ('BG', 'Bulgaria');
INSERT INTO `country` VALUES ('BH', 'Bahrain');
INSERT INTO `country` VALUES ('BI', 'Burundi');
INSERT INTO `country` VALUES ('BJ', 'Benin');
INSERT INTO `country` VALUES ('BL', 'Saint Barthélemy');
INSERT INTO `country` VALUES ('BM', 'Bermuda');
INSERT INTO `country` VALUES ('BN', 'Brunei Darussalam');
INSERT INTO `country` VALUES ('BO', 'Bolivia (Plurinational State of)');
INSERT INTO `country` VALUES ('BQ', 'Bonaire - Sint Eustatius and Saba');
INSERT INTO `country` VALUES ('BR', 'Brazil');
INSERT INTO `country` VALUES ('BS', 'Bahamas');
INSERT INTO `country` VALUES ('BT', 'Bhutan');
INSERT INTO `country` VALUES ('BV', 'Bouvet Island');
INSERT INTO `country` VALUES ('BW', 'Botswana');
INSERT INTO `country` VALUES ('BY', 'Belarus');
INSERT INTO `country` VALUES ('BZ', 'Belize');
INSERT INTO `country` VALUES ('CA', 'Canada');
INSERT INTO `country` VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO `country` VALUES ('CD', 'Democratic Republic of the Congo');
INSERT INTO `country` VALUES ('CF', 'Central African Republic');
INSERT INTO `country` VALUES ('CG', 'Congo');
INSERT INTO `country` VALUES ('CH', 'Switzerland');
INSERT INTO `country` VALUES ('CI', 'Côte d\'Ivoire');
INSERT INTO `country` VALUES ('CK', 'Cook Islands');
INSERT INTO `country` VALUES ('CL', 'Chile');
INSERT INTO `country` VALUES ('CM', 'Cameroon');
INSERT INTO `country` VALUES ('CN', 'China');
INSERT INTO `country` VALUES ('CO', 'Colombia');
INSERT INTO `country` VALUES ('CR', 'Costa Rica');
INSERT INTO `country` VALUES ('CU', 'Cuba');
INSERT INTO `country` VALUES ('CV', 'Cabo Verde');
INSERT INTO `country` VALUES ('CW', 'Curaçao');
INSERT INTO `country` VALUES ('CX', 'Christmas Island');
INSERT INTO `country` VALUES ('CY', 'Cyprus');
INSERT INTO `country` VALUES ('CZ', 'Czechia');
INSERT INTO `country` VALUES ('DE', 'Germany');
INSERT INTO `country` VALUES ('DJ', 'Djibouti');
INSERT INTO `country` VALUES ('DK', 'Denmark');
INSERT INTO `country` VALUES ('DM', 'Dominica');
INSERT INTO `country` VALUES ('DO', 'Dominican Republic');
INSERT INTO `country` VALUES ('DZ', 'Algeria');
INSERT INTO `country` VALUES ('EC', 'Ecuador');
INSERT INTO `country` VALUES ('EE', 'Estonia');
INSERT INTO `country` VALUES ('EG', 'Egypt');
INSERT INTO `country` VALUES ('EH', 'Western Sahara');
INSERT INTO `country` VALUES ('ER', 'Eritrea');
INSERT INTO `country` VALUES ('ES', 'Spain');
INSERT INTO `country` VALUES ('ET', 'Ethiopia');
INSERT INTO `country` VALUES ('FI', 'Finland');
INSERT INTO `country` VALUES ('FJ', 'Fiji');
INSERT INTO `country` VALUES ('FK', 'Falkland Islands (Malvinas)');
INSERT INTO `country` VALUES ('FM', 'Micronesia (Federated States of)');
INSERT INTO `country` VALUES ('FO', 'Faroe Islands');
INSERT INTO `country` VALUES ('FR', 'France');
INSERT INTO `country` VALUES ('GA', 'Gabon');
INSERT INTO `country` VALUES ('GB', 'United Kingdom of Great Britain and Northern Ireland');
INSERT INTO `country` VALUES ('GD', 'Grenada');
INSERT INTO `country` VALUES ('GE', 'Georgia');
INSERT INTO `country` VALUES ('GF', 'French Guiana');
INSERT INTO `country` VALUES ('GG', 'Guernsey');
INSERT INTO `country` VALUES ('GH', 'Ghana');
INSERT INTO `country` VALUES ('GI', 'Gibraltar');
INSERT INTO `country` VALUES ('GL', 'Greenland');
INSERT INTO `country` VALUES ('GM', 'Gambia');
INSERT INTO `country` VALUES ('GN', 'Guinea');
INSERT INTO `country` VALUES ('GP', 'Guadeloupe');
INSERT INTO `country` VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO `country` VALUES ('GR', 'Greece');
INSERT INTO `country` VALUES ('GS', 'South Georgia and the South Sandwich Islands');
INSERT INTO `country` VALUES ('GT', 'Guatemala');
INSERT INTO `country` VALUES ('GU', 'Guam');
INSERT INTO `country` VALUES ('GW', 'Guinea-Bissau');
INSERT INTO `country` VALUES ('GY', 'Guyana');
INSERT INTO `country` VALUES ('HK', 'China - Hong Kong Special Administrative Region');
INSERT INTO `country` VALUES ('HM', 'Heard Island and McDonald Islands');
INSERT INTO `country` VALUES ('HN', 'Honduras');
INSERT INTO `country` VALUES ('HR', 'Croatia');
INSERT INTO `country` VALUES ('HT', 'Haiti');
INSERT INTO `country` VALUES ('HU', 'Hungary');
INSERT INTO `country` VALUES ('ID', 'Indonesia');
INSERT INTO `country` VALUES ('IE', 'Ireland');
INSERT INTO `country` VALUES ('IL', 'Israel');
INSERT INTO `country` VALUES ('IM', 'Isle of Man');
INSERT INTO `country` VALUES ('IN', 'India');
INSERT INTO `country` VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO `country` VALUES ('IQ', 'Iraq');
INSERT INTO `country` VALUES ('IR', 'Iran (Islamic Republic of)');
INSERT INTO `country` VALUES ('IS', 'Iceland');
INSERT INTO `country` VALUES ('IT', 'Italy');
INSERT INTO `country` VALUES ('JE', 'Jersey');
INSERT INTO `country` VALUES ('JM', 'Jamaica');
INSERT INTO `country` VALUES ('JO', 'Jordan');
INSERT INTO `country` VALUES ('JP', 'Japan');
INSERT INTO `country` VALUES ('KE', 'Kenya');
INSERT INTO `country` VALUES ('KG', 'Kyrgyzstan');
INSERT INTO `country` VALUES ('KH', 'Cambodia');
INSERT INTO `country` VALUES ('KI', 'Kiribati');
INSERT INTO `country` VALUES ('KM', 'Comoros');
INSERT INTO `country` VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO `country` VALUES ('KP', 'Democratic People\'s Republic of Korea');
INSERT INTO `country` VALUES ('KR', 'Republic of Korea');
INSERT INTO `country` VALUES ('KW', 'Kuwait');
INSERT INTO `country` VALUES ('KY', 'Cayman Islands');
INSERT INTO `country` VALUES ('KZ', 'Kazakhstan');
INSERT INTO `country` VALUES ('LA', 'Lao People\'s Democratic Republic');
INSERT INTO `country` VALUES ('LB', 'Lebanon');
INSERT INTO `country` VALUES ('LC', 'Saint Lucia');
INSERT INTO `country` VALUES ('LI', 'Liechtenstein');
INSERT INTO `country` VALUES ('LK', 'Sri Lanka');
INSERT INTO `country` VALUES ('LR', 'Liberia');
INSERT INTO `country` VALUES ('LS', 'Lesotho');
INSERT INTO `country` VALUES ('LT', 'Lithuania');
INSERT INTO `country` VALUES ('LU', 'Luxembourg');
INSERT INTO `country` VALUES ('LV', 'Latvia');
INSERT INTO `country` VALUES ('LY', 'Libya');
INSERT INTO `country` VALUES ('MA', 'Morocco');
INSERT INTO `country` VALUES ('MC', 'Monaco');
INSERT INTO `country` VALUES ('MD', 'Republic of Moldova');
INSERT INTO `country` VALUES ('ME', 'Montenegro');
INSERT INTO `country` VALUES ('MF', 'Saint Martin (French Part)');
INSERT INTO `country` VALUES ('MG', 'Madagascar');
INSERT INTO `country` VALUES ('MH', 'Marshall Islands');
INSERT INTO `country` VALUES ('MK', 'The former Yugoslav Republic of Macedonia');
INSERT INTO `country` VALUES ('ML', 'Mali');
INSERT INTO `country` VALUES ('MM', 'Myanmar');
INSERT INTO `country` VALUES ('MN', 'Mongolia');
INSERT INTO `country` VALUES ('MO', 'China - Macao Special Administrative Region');
INSERT INTO `country` VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO `country` VALUES ('MQ', 'Martinique');
INSERT INTO `country` VALUES ('MR', 'Mauritania');
INSERT INTO `country` VALUES ('MS', 'Montserrat');
INSERT INTO `country` VALUES ('MT', 'Malta');
INSERT INTO `country` VALUES ('MU', 'Mauritius');
INSERT INTO `country` VALUES ('MV', 'Maldives');
INSERT INTO `country` VALUES ('MW', 'Malawi');
INSERT INTO `country` VALUES ('MX', 'Mexico');
INSERT INTO `country` VALUES ('MY', 'Malaysia');
INSERT INTO `country` VALUES ('MZ', 'Mozambique');
INSERT INTO `country` VALUES ('NA', 'Namibia');
INSERT INTO `country` VALUES ('NC', 'New Caledonia');
INSERT INTO `country` VALUES ('NE', 'Niger');
INSERT INTO `country` VALUES ('NF', 'Norfolk Island');
INSERT INTO `country` VALUES ('NG', 'Nigeria');
INSERT INTO `country` VALUES ('NI', 'Nicaragua');
INSERT INTO `country` VALUES ('NL', 'Netherlands');
INSERT INTO `country` VALUES ('NO', 'Norway');
INSERT INTO `country` VALUES ('NP', 'Nepal');
INSERT INTO `country` VALUES ('NR', 'Nauru');
INSERT INTO `country` VALUES ('NU', 'Niue');
INSERT INTO `country` VALUES ('NZ', 'New Zealand');
INSERT INTO `country` VALUES ('OM', 'Oman');
INSERT INTO `country` VALUES ('PA', 'Panama');
INSERT INTO `country` VALUES ('PE', 'Peru');
INSERT INTO `country` VALUES ('PF', 'French Polynesia');
INSERT INTO `country` VALUES ('PG', 'Papua New Guinea');
INSERT INTO `country` VALUES ('PH', 'Philippines');
INSERT INTO `country` VALUES ('PK', 'Pakistan');
INSERT INTO `country` VALUES ('PL', 'Poland');
INSERT INTO `country` VALUES ('PM', 'Saint Pierre and Miquelon');
INSERT INTO `country` VALUES ('PN', 'Pitcairn');
INSERT INTO `country` VALUES ('PR', 'Puerto Rico');
INSERT INTO `country` VALUES ('PS', 'State of Palestine');
INSERT INTO `country` VALUES ('PT', 'Portugal');
INSERT INTO `country` VALUES ('PW', 'Palau');
INSERT INTO `country` VALUES ('PY', 'Paraguay');
INSERT INTO `country` VALUES ('QA', 'Qatar');
INSERT INTO `country` VALUES ('RE', 'Réunion');
INSERT INTO `country` VALUES ('RO', 'Romania');
INSERT INTO `country` VALUES ('RS', 'Serbia');
INSERT INTO `country` VALUES ('RU', 'Russian Federation');
INSERT INTO `country` VALUES ('RW', 'Rwanda');
INSERT INTO `country` VALUES ('SA', 'Saudi Arabia');
INSERT INTO `country` VALUES ('SB', 'Solomon Islands');
INSERT INTO `country` VALUES ('SC', 'Seychelles');
INSERT INTO `country` VALUES ('SD', 'Sudan');
INSERT INTO `country` VALUES ('SE', 'Sweden');
INSERT INTO `country` VALUES ('SG', 'Singapore');
INSERT INTO `country` VALUES ('SH', 'Saint Helena');
INSERT INTO `country` VALUES ('SI', 'Slovenia');
INSERT INTO `country` VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO `country` VALUES ('SK', 'Slovakia');
INSERT INTO `country` VALUES ('SL', 'Sierra Leone');
INSERT INTO `country` VALUES ('SM', 'San Marino');
INSERT INTO `country` VALUES ('SN', 'Senegal');
INSERT INTO `country` VALUES ('SO', 'Somalia');
INSERT INTO `country` VALUES ('SR', 'Suriname');
INSERT INTO `country` VALUES ('SS', 'South Sudan');
INSERT INTO `country` VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO `country` VALUES ('SV', 'El Salvador');
INSERT INTO `country` VALUES ('SX', 'Sint Maarten (Dutch part)');
INSERT INTO `country` VALUES ('SY', 'Syrian Arab Republic');
INSERT INTO `country` VALUES ('SZ', 'Swaziland');
INSERT INTO `country` VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO `country` VALUES ('TD', 'Chad');
INSERT INTO `country` VALUES ('TF', 'French Southern Territories');
INSERT INTO `country` VALUES ('TG', 'Togo');
INSERT INTO `country` VALUES ('TH', 'Thailand');
INSERT INTO `country` VALUES ('TJ', 'Tajikistan');
INSERT INTO `country` VALUES ('TK', 'Tokelau');
INSERT INTO `country` VALUES ('TL', 'Timor-Leste');
INSERT INTO `country` VALUES ('TM', 'Turkmenistan');
INSERT INTO `country` VALUES ('TN', 'Tunisia');
INSERT INTO `country` VALUES ('TO', 'Tonga');
INSERT INTO `country` VALUES ('TR', 'Turkey');
INSERT INTO `country` VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO `country` VALUES ('TV', 'Tuvalu');
INSERT INTO `country` VALUES ('TW', 'Taiwan');
INSERT INTO `country` VALUES ('TZ', 'United Republic of Tanzania');
INSERT INTO `country` VALUES ('UA', 'Ukraine');
INSERT INTO `country` VALUES ('UG', 'Uganda');
INSERT INTO `country` VALUES ('UM', 'United States Minor Outlying Islands');
INSERT INTO `country` VALUES ('US', 'USA');
INSERT INTO `country` VALUES ('UY', 'Uruguay');
INSERT INTO `country` VALUES ('UZ', 'Uzbekistan');
INSERT INTO `country` VALUES ('VA', 'Holy See');
INSERT INTO `country` VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO `country` VALUES ('VE', 'Venezuela (Bolivarian Republic of)');
INSERT INTO `country` VALUES ('VG', 'British Virgin Islands');
INSERT INTO `country` VALUES ('VI', 'United States Virgin Islands');
INSERT INTO `country` VALUES ('VN', 'Viet Nam');
INSERT INTO `country` VALUES ('VU', 'Vanuatu');
INSERT INTO `country` VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO `country` VALUES ('WS', 'Samoa');
INSERT INTO `country` VALUES ('YE', 'Yemen');
INSERT INTO `country` VALUES ('YT', 'Mayotte');
INSERT INTO `country` VALUES ('ZA', 'South Africa');
INSERT INTO `country` VALUES ('ZM', 'Zambia');
INSERT INTO `country` VALUES ('ZW', 'Zimbabwe');

-- ----------------------------
-- Table structure for `cov_news`
-- ----------------------------
DROP TABLE IF EXISTS `cov_news`;
CREATE TABLE `cov_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pubDate` varchar(225) DEFAULT NULL,
  `title` varchar(225) DEFAULT NULL,
  `summary` varchar(2000) DEFAULT NULL,
  `infoSource` varchar(225) DEFAULT NULL,
  `sourceUrl` varchar(225) DEFAULT NULL,
  `image` mediumblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43713 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cov_news
-- ----------------------------

INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10200, '日本将于2024年2月启动第四轮核污染水排海 总量7800吨', '<div class=\"left_zw\">\n<p>　　中新网12月18日电 据日本放送协会(NHK)报道，日本东京电力公司18日表示，福岛第一核电站第四轮核污染水排海将于2024年2月下旬开始，排海总量预计为7800吨，预计将于3月结束。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/12/18/d957f36fa55149efb53efc75b13b7439.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　报道称，东电表示，前三次核污染水排海过程中，每次都将使用海水稀释后的核污染水临时储存，以确认放射性物质氚的浓度，该步骤将减少为每年一次。</p>\n<p>　　此前报道，日本在8月24日正式启动福岛核污染水排海，并已完成三批次排放，累计排放量超2.3万吨。</p>\n<p>　　中国外交部曾表示，日本福岛核污染水排海事关人类健康、事关全球海洋环境、事关国际公共利益。日方应当严肃对待国内外的合理关切，本着负责任和建设性的态度妥善处理。日方应当以严肃认真的态度回应国际社会的关切，以负责任的方式处置核污染水，全面配合建立有日本周边邻国等利益攸关方实质性参与、长期有效的国际监测安排，防止核污染水排海造成不可挽回的后果。</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:于晓】 </span></div></div>\n</div>', '2023-12-18 20:25:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10201, '福岛第一核电站一名工作人员被放射性物质污染 中方回应', '<div class=\"left_zw\">\n<p>　　中新网北京12月13日电  (李京泽  谢雁冰)中国外交部发言人毛宁12月13日主持例行记者会。</p>\n<p>　　有记者提问：据报道，日本东京电力公司11日发布消息，确认1名在福岛第一核电站2号机组进行废炉作业的工作人员被放射性物质污染，存在内照射导致射线直接作用在人体器官上的可能性。中方对此有何评论？</p>\n<p>　　毛宁：我也注意到有关报道。日本福岛第一核电站退役、核污染水处置过程中，接连发生工作人员遭受核污染水溅射、放射性物质污染等事故，充分说明问题的严重性，也再次证明妥善处理核污染水的极端重要性。</p>\n<p>　　日方核污染水排海计划长达30年甚至更久，存在巨大的风险隐患。中方敦促日方重视各利益攸关方的关切，全面配合建立各方实质参与、长期有效的国际监测安排，切实防止排海对海洋环境和人类健康造成长期危害。(完）</p>\n<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:陈海峰】 </span></div></div>\n</div>', '2023-12-13 16:18:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10202, '日本福岛第一核电站一名废炉作业工人遭放射性物质污染', '<div class=\"left_zw\">\n<p>　　中新社东京12月11日电 据日本《朝日新闻》报道，东京电力公司11日发布消息称，在福岛第一核电站内进行废炉作业的一名工人面部受到放射性物质污染。</p>\n<p>　　东电公司称，遭放射性物质污染的工人为一名20多岁的男子，当日在福岛第一核电站2号机组附近对已解体的围栏进行除污作业。他在除污作业结束后，被发现鼻腔受到了放射性物质污染，其体内可能吸入了放射性物质。</p>\n<p>　　据《每日新闻》报道，东电公司称，当日14时42分左右，该名工人被确认其鼻腔受到了放射性物质污染。据福岛中央电视台报道，该名工人被检测出的数值约为正常情况下的17倍。</p>\n<p>　　东电公司推测该名工人可能是在摘除口罩时受到放射性物质污染。报道称，东电公司正在对此事进行详细调查。</p>\n<p>　　10月25日，福岛第一核电站发生放射性废液溅射事件，进行核污染水处理工作的5名作业员被放射性废液溅射，其中2人被紧急送医。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:张乃月】 </span></div></div>\n</p></div>', '2023-12-11 21:10:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10203, '中方：日方应认真对待利益攸关方要求进行损害认定与赔偿的正当诉求', '<div class=\"left_zw\">\n<p>　　中新网北京11月28日电 (记者 黄钰钦)中国外交部发言人汪文斌28日主持例行记者会。</p>\n<p>　　有记者提问：据报道，在日本政府启动福岛核污染水排海3个月之际，东京电力公司近日面向日本国内福岛核污染水排海受害者启动了损害认定和赔偿。发言人对此有何评论？</p>\n<p>　　汪文斌：日本福岛核污染水排海事关全人类健康、全球海洋环境、国际公共利益。日方不仅应当严肃对待国内民众关切，同样应当正视国际社会特别是周边邻国的强烈担忧，本着负责任和建设性的态度同利益攸关方进行沟通，认真对待利益攸关方要求进行损害认定与赔偿的正当诉求。</p>\n<p>　　在越来越多的福岛核污染水排入大海的情况下，日方必须以真诚的态度同利益攸关方特别是周边邻国充分协商，尽快建立各利益攸关方全面、有效、独立推进的长期监测机制，防止核污染水排海造成不可挽回的后果。(完）<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:田博川】 </span></div></div>\n</p></div>', '2023-11-28 15:54:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10204, '内外抗议声不断 日方应配合建立长期有效国际监测安排', '<div class=\"left_zw\">\n<p>　　□ 唐兴</p>\n<p>　　11月20日，东京电力公司(以下简称东电)发布消息称，已经完成第三轮核污染水排放，第四轮将在明年初实施。按照计划，东电在2024年3月底前共进行四轮排放，共计排放3.12万吨核污染水。自8月24日正式启动核污染水排海以来，日本国内外反对抗议持续，不断暴露的事故和问题也进一步加重了国际社会的担忧。事实证明，东电管理体制存在漏洞，日方宣称的“安全、透明”的排海计划不能令人信服。</p>\n<p>　　随着越来越多的福岛核污染水排入大海，国际社会迫切要求日方严肃对待国内外的合理关切，本着负责任和建设性的态度妥善处理，全面配合建立有日本周边邻国等利益攸关方实质性参与、长期有效的国际监测安排，防止核污染水排海造成不可挽回的后果。</p>\n<p><strong>　　内外抗议之声不断</strong></p>\n<p>　　8月24日以来，伴随着核污染水的每轮排放，日本国内外都会出现新一波反对抗议高潮。</p>\n<p>　　11月1日，日本启动第三轮排放前夕，日本多个市民团体在东电总部前集会，强烈反对启动第三轮排放。活动组织方代表柳田真在现场表示，日本政府和东电以推进福岛第一核电站报废工作为由强行将核污染水排海，是“彻头彻尾的谎言”，核电站报废工作至今没有明确的路线图和时间表。此前，第二轮排放前的9月23日，以及第一轮排放后的8月27日，在日本东京、福岛县等地也发生了反对排海的抗议活动。</p>\n<p>　　国外方面，排海启动以来，多国政府、民间团体、专家学者不断发出反对抗议之声。据不完全统计，菲律宾、斐济、马来西亚、韩国、朝鲜、俄罗斯等国分别以游行示威、抗议集会、外交抗议等方式表达反对立场。</p>\n<p>　　11月6日开幕的“太平洋岛国论坛”首脑会议上，排海问题成为会议焦点，会议联合声明中写明，许多国家及地区对排海表示“强烈担忧”，其中，所罗门群岛等国对排海表示强烈反对。11月4日，第24次中日韩环境部长会议在名古屋举行。韩国环境部长官韩和真出席会议，并就核污染水排海向日方表示担忧。中国生态环境部部长黄润秋指出，日方应正视国际社会普遍关切，同利益攸关方特别是周边邻国进行充分协商，以负责任方式处置核污染水。</p>\n<p>　　值得注意的是，自启动排海以来，日本政府对内安抚、对外游说，竭力寻求国内外对核污染水排海的支持。据日本广播协会报道，日本外务省针对涉核污染水信息制定了加强性应对与传播政策，并划拨700亿日元“公关预算”。</p>\n<p>　　有评论指出，日本政府宁愿花钱公关，也不愿采用危害更小的处理方案。</p>\n<p><strong>　　事故频发加重担忧</strong></p>\n<p>　　核污染水含有多种放射性物质，处置风险极高，安全容不得半点差池，正因如此，信用与责任意识事关重大。近来发生的福岛核电站放射性废液溅射等多个事故再次证明，负责核污染水排放的东电内部管理混乱、惯于隐瞒欺骗，日方宣称的“安全、透明”的排海计划根本不能令人信服。</p>\n<p>　　据报道，10月25日，就在国际原子能机构到日本开展安全审查的第二天，东电却发生安全事故。由于作业人员在清洗核污染水多核素去除设备(ALPS)管道时发生水管脱落，核污染水溅出，5名工作人员接触核污染水，虽然5人当时都佩戴口罩和穿着全身防护服，但其中2人因体表辐射量一直未降到安全标准而入院。</p>\n<p>　　针对此次事故，东电起初称溅出的废液量为100毫升，但据日媒调查，实际溅出的废液量是东电最初公布量的数十倍。10月30日东电也改口称，当时溅出的废液量有数升。鉴于东电历史上的失信记录，此次事件进一步加重了外界对东电信用和管理漏洞的质疑。</p>\n<p>　　无独有偶，10月26日，在日本福岛县核污染区内，又发生了可能存在放射性风险的废弃金属被非法转卖的案件。据警方调查，被盗金属废弃物总量达数十吨，已经被相关收购企业熔解后进入市场流通，无法追踪去向并回收。按照规定，核污染区内的废弃物都应闭环管理，经除染后才能再利用，否则放射性危害将扩散并对环境造成长期影响。此案件虽然与核污染水排海没有直接关系，但却暴露出现实中存在的管理漏洞和混乱，涉及核放射物品的管理本应做到专业、严谨，这再次凸显了对核污染水排海开展国际监督的重要性。</p>\n<p><strong>　　国际监测亟待推进</strong></p>\n<p>　　排海启动以来，日本环境省、东电都定期向外界公布放射性检测报告，国际原子能机构也定期赴日开展安全审查、独立检测，并发布独立报告，但该机制对确保安全而言还远远不够。</p>\n<p>　　据《韩民族日报》报道，日本通过各种手段阻止他国对核污染水的独立验证。要保证核污染水的安全，需要多国科学家多次取样，分析放射性物质的浓度变化。但是，日本一直反对韩国等相关国家直接取样，并在排海后也坚持这一立场。</p>\n<p>　　中国外交部发言人指出，国际原子能机构秘书处在日本开展的海洋监测活动本质上仍然是根据与日方双边安排开展的，不足以构成一个利益攸关方充分实质参与、长期有效的国际监测安排，中方敦促日方认真回应国际社会关切，以严肃认真的态度，建立长期有效的国际监测安排。</p>\n<p>　　日本可再生能源研究所代表北村和哉指出，福岛事故核电站内的堆芯熔毁废物总量为880吨，目前尚无确定的取出办法，正在考虑的试验性回收措施也只是以克为单位。如果按照现在的情况发展下去，将继续产生更多核污染水，核污染水排放期限为30年的结论并不可靠。日本原子能协会福岛第一核电站废堆研讨委员会委员长宫野广也指出，“估计堆芯熔毁废物的取出最快也要50年，长则100年”。</p>\n<p>　　日本福岛核污染水总量巨大，排放时间长，事关全人类健康、全球海洋环境。日方应严肃对待国内外合理关切，接受利益攸关方充分实质参与、长期有效的国际监测安排，切实以科学、安全、透明方式处置核污染水。<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:卞立群】 </span></div></div>\n</p></div>', '2023-11-27 05:39:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10205, '中国代表敦促日本全面配合接受严格国际监督', '<div class=\"left_zw\">\n<p>　　中新社柏林11月24日电 　维也纳消息：中国常驻国际原子能机构代表李松大使24日在国际原子能机构11月理事会上发言，重申中方坚决反对日本福岛核污染水排海，敦促日方全面配合接受严格国际监督。</p>\n<div><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/ypt/2023/231125/4151933c-5b6b-4036-bd90-896f0f95534e_zsite.jpg\" style=\"display: block; margin: auto; cursor: pointer;\"/></div>\n\n<p>　　李松表示，日方不顾国际社会普遍质疑和有关国家强烈反对，强行启动并不断推进福岛核污染水排海。福岛核污染水排海绝不是日本一家的私事，是重大核安全问题，事关全人类健康、全球海洋环境、国际公共利益。中方坚决反对日方排海行径，敦促日方停止排海。日本应该严肃对待国内外合理关切，本着负责任和建设性态度妥善处理福岛核污染水问题。</p>\n<p>　　李松指出，人为向海洋排放核事故污染水前所未有，大量放射性核素排入大海产生的累积海洋效应存在极大不确定性。随着越来越多福岛核污染水排入大海，国际社会不能假定日方净化装置长期有效、可靠，也不能假定日方排海管理30年不失误、不犯错。针对日方一意孤行推进排海的行径，中方始终坚决主张和积极推动全面加强对日国际监督，不断完善对福岛核污染水排海的长期国际监测安排。中方要求国际原子能机构秘书处秉持客观、公正、科学态度，加强与成员国的沟通，不断加强对日国际监测安排。机构成员国、理事会应在对日国际监测安排完善过程中发挥作用，并对日方排海问题和国际监测安排进行定期审议。</p>\n<p>　　李松强调指出，日本如果真的在福岛核污染水处置问题上负起责任，对处置的安全性有信心，就应更加开放、更加透明、更加合作，与利益攸关国家进行充分、有意义的协商，高度重视各方关切和意见，积极支持机构不断完善和加强国际监测安排。中方敦促日方本着认真负责和建设性的态度，继续与机构秘书处和成员国开展讨论，全面配合接受严格国际监督。他表示，中方愿与利益攸关方共同努力，支持机构发挥主导作用，本着科学、负责的态度，积极参加在加强对日独立、长期、有效国际监测安排方面的努力，切实防止日方排海行径对海洋环境和人类健康造成长期危害。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:田博群】 </span></div></div>\n</div>', '2023-11-25 05:52:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10206, '福岛核污染水排海已三个月 中方：国际社会迫切要求建立长期有效的国际监测安排', '<div class=\"left_zw\">\n<p>　　中新网北京11月23日电  (记者 李京泽)中国外交部发言人毛宁23日主持例行记者会。</p>\n<p>　　有记者提问：东京电力公司排放核污染水已经三个月，中方对此如何评论？</p>\n<p>　　毛宁：中方反对福岛核污染水排海的立场是一贯的，也是很明确的。我们认为，日本福岛核污染水排海事关人类健康、事关全球海洋环境、事关国际公共利益。日方应当严肃对待国内外的合理关切，本着负责任和建设性的态度妥善处理。</p>\n<p>　　我想强调的是，随着越来越多的福岛核污染水排入大海，国际社会迫切要求建立长期有效的国际监测安排。日方应当以严肃认真的态度回应国际社会的关切，以负责任的方式处置核污染水，全面配合建立有日本周边邻国等利益攸关方实质性参与、长期有效的国际监测安排，防止核污染水排海造成不可挽回的后果。(完）<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:陈海峰】 </span></div></div>\n</p></div>', '2023-11-23 15:51:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10207, '日本第三轮核污染水排海结束 累计排放量超2.3万吨', '<div class=\"left_zw\">\n<p>　　据日本广播协会(NHK)当地时间20日报道，东京电力公司称，福岛第一核电站第三轮核污染水排海已于当天中午左右结束。</p>\n<p>　　本次排放自11月2日开始，总排放量为7753吨。第四轮排海预计将于明年年初开始，四次排放总排放量约为3.12万吨，目前已排放2.3351万吨。(央视新闻客户端 总台报道员 林博翰)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:张子怡】 </span></div></div>\n</div>', '2023-11-20 15:40:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10208, '国际热评：超2.3万吨核污水全部入海 日本，请住手！', '<div class=\"left_zw\">\n<p>　　中新网11月20日电 (张奥林)11月20日，福岛核电站第三批次核污水排放结束，从8月24日正式开启排污，不到三个月的时间，已有超2.3万吨核污水流入太平洋。</p>\n<ol class=\"banquan_pic\" style=\"margin: 0;padding: 0;border: 0;outline: 0;list-style:none;vertical-align: baseline;background: transparent;\">\n<div style=\"text-align:center\"><img alt=\"资料图：福岛第一核电站。\" src=\"//image1.chinanews.com.cn/cnsupload/big/2023/09-11/4-426/98ea98f161ab40559e269e123c0ba934.jpg\" title=\"资料图：福岛第一核电站。\"><input id=\"98ea98f161ab40559e269e123c0ba934\" name=\"98ea98f161ab40559e269e123c0ba934\" type=\"hidden\"/></img></div>\n\n</ol>\n<p>　　在这期间，福岛核电站员工被核污水辐射、排放设备发生故障等问题不断。同时，由于核污水的巨大危害，日本国内外反对声浪此起彼伏。尽管如此，日本政府和东京电力公司仍坚持排污。</p>\n<p>　　核污水排放开始前，除了将核污水混淆为“处理水”，日方还大肆吹嘘东电的管理流程，称排放开始后会按既定流程和计划“安全排放”。</p>\n<p>　　但事实却与日本政府描述的截然相反。10月25日，东电称，福岛第一核电站进行核污水处理工作的4名作业员被核污水溅射，2人全身多处遭辐射被紧急送医。而对于事故中溅射出的废液总量，东电先是称在100毫升左右，后又改口为数升左右，前后差距达几十倍。</p>\n<ol class=\"banquan_pic\" style=\"margin: 0;padding: 0;border: 0;outline: 0;list-style:none;vertical-align: baseline;background: transparent;\">\n<div style=\"text-align:center\"><img alt=\"资料图：福岛第一核电站排污设施。图片来源：美联社\" src=\"//image1.chinanews.com.cn/cnsupload/big/2023/08-28/4-426/ab7caaae6e374d4681d8fcdb380f43c7.jpg\" title=\"资料图：福岛第一核电站排污设施。图片来源：美联社\"><input id=\"ab7caaae6e374d4681d8fcdb380f43c7\" name=\"ab7caaae6e374d4681d8fcdb380f43c7\" type=\"hidden\"/></img></div>\n\n</ol>\n<p>　　不仅如此，东电称，第二批核污水排放期间，用于输送核污水的水泵压力一度降低，原因是水中含有的锈附着在过滤器上，引发了堵塞。</p>\n<p>　　接二连三出现的问题，也引起日本原子能规制委员会的高度关注，该机构也将矛头指向东电。有委员质疑：“东电完全应该对废液溅射问题有预案，作业开始前到底有没有落实安全检查？”另一名委员直接指出：“这很明显是作业管理上的失败。”</p>\n<p>　　日本原子能规制委员会委员长山中伸介更是表示：“东电实际上已经违反了核污水排放的实施规定。”</p>\n<p>　　日本《朝日新闻》一针见血地指出：日本民众对东电的不信任，比其核污染水储存罐还深。</p>\n<p>　　不仅在日本国内，国际社会同样密切关注这一问题。当地时间11月10日，在库克群岛举办的太平洋岛国论坛首脑会议发布了共同声明，声明中明确写有“首脑对太平洋核污染潜在威胁的严重关切”。</p>\n<p>　　此外，包括中国、俄罗斯在内的多方，也持续呼吁日本重新审视排污计划。</p>\n<p>　　尽管问题和质疑声不断，但日本政府仍未打算悬崖勒马，反而大肆宣扬核污水无害论，企图继续营造“排污正义”。</p>\n<p>　　有数据显示，在正式排污开始前，核污染水已存到了130万吨。按日方计划，要把核污染水全部排完，至少需要30年。</p>\n<p>　　东电这样一家劣迹斑斑的企业，如何能够确保在长达30年甚至更久的排放管理中，做到安全可靠？日方宣称的“安全、透明”的排海计划又如何让人放心？</p>\n<p>　　对于日方而言，当务之急是彻底搞清东电在排污流程中的种种问题，并借此机会重新审视排污计划，以全球海洋环境和全人类的健康安全为前提，及时停止排污，不要在错误的道路上越走越远。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:甘甜】 </span></div></div>\n</div>', '2023-11-20 13:22:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10209, '习近平会见日本首相岸田文雄', '<div class=\"left_zw\">\n<p>　　中新社旧金山11月16日电 (记者 郭金超 梁晓辉)当地时间11月16日下午，中国国家主席习近平在旧金山会见日本首相岸田文雄。</p>\n<p>　　两国领导人重申恪守中日四个政治文件的原则和共识，重新确认全面推进战略互惠关系的两国关系定位，致力于构建契合新时代要求的建设性、稳定的中日关系。</p>\n<p>　　习近平指出，今年是中日和平友好条约缔结45周年，条约以法律形式确立了中日和平、友好、合作的大方向，成为两国关系史上的里程碑。45年来，在包括条约在内的中日四个政治文件指引下，两国关系尽管历经风雨，但总体保持发展势头，给两国人民带来福祉，也为促进地区和平、发展、繁荣发挥了积极作用。当前国际形势变乱交织，风险挑战层出不穷，中日和平共处、世代友好、互利合作、共同发展，符合两国人民根本利益。当前，中日关系正处于承前启后的关键时期，双方应该顺应时代潮流，把握正确方向，本着“以史为鉴、开辟未来”的精神，保持邦交正常化初心，客观理性看待彼此发展，树立积极友善相互认知，建设性管控矛盾分歧，将“互为合作伙伴、互不构成威胁”的政治共识体现到具体政策和实际行动中。</p>\n<p>　　习近平强调，历史、台湾等重大原则问题关乎两国关系政治基础，日方必须恪守信义，确保中日关系的基础不受损、不动摇。中日经济利益和产业链供应链深度交融，搞“小院高墙”“脱钩断链”对谁都没有好处。中国正在推进高质量发展和高水平对外开放，将给包括日本在内的世界各国带来前所未有的机遇。双方应该深化合作、相互成就，切实维护全球自由贸易体系，实现更高水平的互利双赢。两国应立足更高站位、秉持更广阔视野，弘扬以和平、合作、包容、融合为核心的亚洲价值观，践行真正的多边主义，弘扬开放的区域主义，推动区域一体化进程，共同应对全球性挑战。</p>\n<p>　　习近平指出，日本福岛核污染水排海事关全人类健康、全球海洋环境、国际公共利益。日方应该严肃对待国内外合理关切，本着负责任和建设性的态度妥善处理。</p>\n<p>　　岸田文雄表示，值此日中和平友好条约缔结45周年的重要契机，两国人民深切追思两国老一辈领导人在广泛领域为推动日中友好关系发展作出的努力。当前国际社会处于历史性转折点，日方希望着眼未来，同中方加强高层沟通对话，增加两国关系积极因素，坚持和平共处。日方无意同中国“脱钩断链”，希望继续推动民间往来和人文交流，深化数字经济、绿色发展、财政金融、医疗养老等各领域务实合作。日方将继续致力于走和平发展道路，坚持日中联合声明处理台湾问题的立场没有丝毫改变。</p>\n<p>　　双方积极评价刚成立的中日出口管制对话机制，同意保持各层级对话沟通，适时举办新一轮中日经济高层对话、中日高级别人文交流磋商机制会议，就国际地区事务保持沟通协调，共同应对气候变化等全球性挑战。双方同意，本着建设性态度通过磋商谈判找到解决福岛核污染水排海问题的合适途径。</p>\n<p>　　双方还就共同关心的国际地区问题交换了意见。</p>\n<p>　　蔡奇、王毅等参加会见。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:姜雨薇】 </span></div></div>\n</p></div>', '2023-11-17 17:04:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10210, '日本首相要求中方取消禁止从日本进口食品的措施 外交部回应', '<div class=\"left_zw\">\n<p>　　中新网北京11月17日电(记者 李京泽)中国外交部发言人毛宁17日主持例行记者会。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/11/17/1e9e144009a741ee924c41c7a90d54d4.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　有记者提问：今天中日首脑会见的时候，中国国家主席习近平用“战略互惠关系”这一词汇来定位两国关系。这个词汇已经很久未使用，此次再次提及有何意义？</p>\n<p>　　毛宁：当地时间16日下午，中国国家主席习近平在旧金山会见了日本首相岸田文雄。两国领导人重申，恪守中日四个政治文件的原则和共识，重新确认全面推进战略互惠关系的两国关系定位，致力于构建契合新时代要求的建设性、稳定的中日关系。</p>\n<p>　　另有记者提问：日本首相岸田文雄在美国旧金山和习近平主席会见的时候，明确要求，中方立即取消禁止从日本进口食品的措施。发言人对此有何评论？</p>\n<p>　　毛宁：习近平主席在会见日本首相岸田文雄的时候指出，日本福岛核污染水排海事关全人类健康、全球海洋环境、国际公共利益，日方应该严肃对待国内外的合理关切，本着负责任和建设性的态度妥善处理。</p>\n<p>　　包括中方在内的各国采取相应的防范和应对措施，维护食品安全和民众健康完全是正当、合理和必要的。希望日方同中方相向而行，本着建设性的态度，通过磋商谈判，找到解决福岛核污染水排海问题的合适途径。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:付子豪】 </span></div></div>\n</div>', '2023-11-17 16:18:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10211, '王毅会见日本内阁特别顾问、国家安全保障局长秋叶刚男', '<div class=\"left_zw\">\n<p>　　2023年11月9日，中共中央政治局委员、中央外办主任王毅在北京会见日本内阁特别顾问、国家安全保障局长秋叶刚男并举行中日高级别政治对话机制磋商。</p>\n<p>　　王毅阐明了中方对当前中日关系的原则立场，指出了改善和发展中日关系的正确路径。</p>\n<p>　　双方重申恪守中日四个政治文件确定的各项原则，努力推动两国关系重回健康稳定发展轨道。双方同意继续就此保持沟通。</p>\n<p>　　王毅还就福岛核污染水排海、台湾、历史等问题表明中方的立场和关切，强调日方应把希尽快改善中日关系的表态体现在具体行动上。(外交部网站)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:梁异】 </span></div></div>\n</p></div>', '2023-11-10 08:19:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10212, '王毅同志在第四届“海洋合作与治理论坛”开幕式上的致辞', '<div class=\"left_zw\">\n<p style=\"text-align: center;\"><strong>共建和平安宁、公平正义、清洁美丽、 繁荣昌盛的海洋家园</strong></p>\n<p style=\"text-align: center;\"><strong>——王毅同志在第四届“海洋合作与治理论坛”开幕式上的致辞</strong></p>\n<p style=\"text-align: center;\">(2023年11月8日)</p>\n<p>　　各位来宾，各位朋友：</p>\n<p>　　大家好！很高兴出席第四届海洋合作与治理论坛开幕式。首先，我谨代表中国政府对论坛的成功召开表示热烈祝贺，向出席论坛的各国和国际组织代表、专家学者、媒体朋友们表示热烈欢迎！</p>\n<p>　　海洋是人类赖以生存发展的重要基础，也是文明交流互鉴的天然平台，加强海洋合作，完善海洋治理，反映了各国的共同愿望，也是时代的大势所趋。与此同时，当今世界并不太平，海洋的发展正面临前所未有的风险挑战。我们看到，冷战思维、零和博弈威胁着海洋的和平稳定，气候变化、过度开发损害着海洋的持续发展，环境污染、随意排放破坏着海洋的清洁美丽，自然灾害、海盗犯罪扰乱着海洋的安宁秩序。</p>\n<p>　　海洋作为全人类共同生活的家园，需要全人类共同建设与呵护。习近平主席高瞻远瞩，从中国和世界的共同利益、从全人类的共同福祉出发，提出构建海洋命运共同体的重要理念，为引领全球海洋治理指明了前进方向，也为建设和呵护美丽繁荣的海洋家园提供了中国方案。为此，我们建议，</p>\n<p>　　<strong>要坚持对话协商，守护海洋和平安宁。</strong>海洋的和平安宁关乎世界各国的安危和利益。我们要重视各国合理关切，坚持以对话解决争端、以协商化解矛盾，不断完善危机沟通机制，加强区域安全合作，构建基础牢固、真正持久的海洋安全。对于历史遗留的海上领土和权益争端，应当坚持由直接当事方友好协商解决，要坚决抵制在海上进行阵营对抗和零和博弈。中国愿同东盟国家全面有效落实《南海各方行为宣言》，早日达成“南海行为准则”，构建和平与安全的南海秩序。</p>\n<p>　　<strong>要坚持公平正义，完善海洋治理体系。</strong>海洋治理离不开共同规则，有效规则植根于公平正义。我们要践行真正的多边主义，推进公正合理的国际海洋治理。中国将坚定维护以联合国为核心的国际体系，以国际法为基础的国际秩序，继续全面参与联合国框架内海洋规则的制定与治理机制的实施，认真履行包括《联合国海洋法公约》在内的国际海洋法义务。与此同时，《公约》生效已近30年，实施过程中出现了不少新的课题和挑战，我们要实事求是，与时俱进，推动《公约》更加健全和公平。</p>\n<p>　　南海仲裁案是国际海洋法治被政治利用的一个例子，出台以来，恶化了地区海洋和平合作的环境，损害了公平与正义的基本价值，应当引起国际社会的警惕和抵制。</p>\n<p>　　<strong>要坚持生态优先，永葆海洋清洁美丽。</strong>人类的可持续发展很大程度上取决于海洋的健康生存。习近平主席指出，“我们要像对待生命一样关爱海洋”。中国高度重视海洋生态环境保护，坚持走生态优先、绿色低碳的发展道路，积极投身应对气候变化、减灾防灾，反对核污染水排海，为全球海洋可持续发展作出自己的贡献。中国积极参与谈判并率先签署《海洋生物多样性协定》，将坚持渔业资源可持续利用，继续实施休渔制度，坚决打击非法捕捞。</p>\n<p>　　<strong>要坚持合作共赢，实现海洋繁荣昌盛。</strong>海洋联通世界，应成为各国促进交流、增进合作的纽带，而不应成为脱钩断链、隔绝彼此的阻碍。我们要秉持互利共赢的合作观，实现各方共享发展机遇和成果。中国将在共商共建共享原则基础上，同各方高质量建设“海上丝绸之路”，打造蓝色经济伙伴关系。中国将继续与世界各国加大港口码头、海底光缆等基础设施建设合作，维护航道安全，不断提升海上互联互通水平。</p>\n<p>　　各位朋友，</p>\n<p>　　自古以来，中国人就有“海晏河清，四海安澜”的追求，“海纳百川，有容乃大”的胸怀。我们愿秉持海洋命运共同体理念，与国际社会携手努力，将海洋建设成世界各国共享的和平之海、繁荣之海、美丽之海。</p>\n<p>　　预祝论坛取得圆满成功。谢谢大家！<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:付子豪】 </span></div></div>\n</p></div>', '2023-11-08 11:13:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10213, '中国生态环境部部长：坚决反对日本单方面启动核污染水排海行动', '<div class=\"left_zw\">\n<p>　　中新社北京11月5日电 中国生态环境部部长黄润秋在第二十四次中日韩环境部长会议上强调，海洋是全人类共同的财产。核污染水处置关乎全球海洋生态环境和民众健康。日方应忠实履行本国的国际义务，同邻国等利益攸关方充分协商，以科学、负责任方式处置核污染水。</p>\n<p>　　11月3日至4日，第二十四次中日韩环境部长会议在日本名古屋市举行。黄润秋、日本环境大臣伊藤信太郎、韩国环境部部长韩和真分别率团出席会议，交流本国环境政策及最新进展，并就共同关心的区域和全球环境议题交换意见。</p>\n<p>　　会前，黄润秋分别与伊藤信太郎、韩和真举行了中日、中韩双边会谈。会见伊藤信太郎时，黄润秋表示双方在应对气候变化、生物多样性保护、塑料污染防治等方面加强务实合作，强调坚决反对日本单方面启动核污染水排海行动。</p>\n<p>　　黄润秋还指出，关于核污染水处置，日方应尽快建立一套包括日本邻国等利益攸关方参与的长期国际监测机制，切实保护好全球海洋生态环境。</p>\n<p>　　在会后召开的新闻发布会上，黄润秋表示，加强生态环境保护合作、推进区域绿色发展、增进人民福祉，是中日韩三国的共同愿望。期待三方进一步拓宽合作渠道，继续推进2030年可持续发展议程、环境公约等多边进程，共同推动三国环境合作成果造福区域人民。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:曹子健】 </span></div></div>\n</p></div>', '2023-11-05 22:37:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10214, '亚太观察丨日本启动第三轮核污染水排海 专家指出东电管理体制存在漏洞', '<div class=\"left_zw\">\n<p>　　日本东京电力公司11月2日启动第三轮核污染水排海，预计将持续到11月20日，排放量约为7800吨。而就在此前的10月25日，福岛第一核电站发生放射性废液溅射事件，处理核污染水的5名工作人员接触到放射性废液，其中2人被紧急送医。东电公司最初公布称，溅射的放射性废液量仅为100毫升，但数日后却进行订正称，溅出的废液量达数升之多，比最初的数据高出几十倍。此次事故，在日本社会备受关注。</p>\n<p>　　日本律师户冢悦朗毕业于核能专业，作为环境法领域的律师，几十年来，他处理过多起大型环境问题诉讼案件。对于10月25日发生在福岛第一核电站的放射性废液溅射事件以及东电公司所公布的信息，户冢悦朗指出，必须深刻关注和反思。</p>\n<p>　　户冢悦朗认为，福岛第一核电站发生放射性废液溅射事件，导致两名工作人员被紧急送往医院处理，这暴露出东电管理不善的弊端。核污染水排放至少要持续30年，东电的做法无法令人接受，也难以让外界放心。</p>\n<p>　　日本环境省工作人员服部弘表示，这是绝不应该发生的事情，必须把安全放在首位。如果发生事故，又会让人们觉得那是危险的地方。必须强化“安全第一”的意识。今后要彻底防止类似事情发生。</p>\n<p>　　户冢悦朗表示，东电把核污染水称为“处理水”，但“多核素去除设备”根本无法去除“氚”。东电公司也承认这一点。用所谓“科学”的检测数据称排海后是“安全”的，很多人会被蒙骗。海洋环境、地球环境将遭到破坏。人类也将付出巨大代价，必须停止排海。</p>\n<p>　　从国际法的角度来看，户冢悦朗指出，将核电站因核事故而产生的核污染水排入大海的只有日本，国际上没有先例。日本政府和东电公司必须认真回应日本国内和国际社会的关切，采取负责任的行动来处理核污染水，同时积极配合建立一个能够充分让日本周边邻国等利益攸关方参与的有效国际监测体制，防止核污染水排海对海洋环境和人类健康造成长期危害。</p>\n<p>　　户冢悦朗表示，为了安全废除福岛第一核电站机组，必须建立由多国政府机构和科学家组成的监测机构，汇聚世界各国研究者的智慧。如果无法确认安全，就不能将核污染水排海。日本政府和东电应该抱有诚意解决这一难题。(央视新闻客户端 总台记者 何欣蕾 雷昊)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:梁异】 </span></div></div>\n</p></div>', '2023-11-04 22:06:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10215, '亚太观察丨长期管理混乱 对公众欺瞒推责 日本东电痼疾积重难返', '<div class=\"left_zw\">\n<p>　　近日，日本福岛第一核电站发生的放射性废液溅射事件再次表明，东京电力公司长期存在的内部管理混乱无序、对公众隐瞒欺骗等痼疾积重难返。</p>\n<p>　　事实上，福岛核事故发生12年来，东电善后处理漏洞百出，迟报、瞒报事件频繁发生。对于因核事故而罹患癌症等严重疾病的日本民众，东电也始终是在推卸责任。从核污染水排海到所谓计划中的福岛第一核电站拆除，按照日本政府和东电的说法，将持续数十年的时间。而一直以来，福岛核事故善后工作的混乱和无序让不少日本民众对福岛核事故今后的处理充满担忧。</p>\n<p>　　一名核事故后曾在福岛第一核电站进行施工工作的工人日前接受了中央广播电视总台记者的采访。这位不愿透露姓名和身份的受访者当年因长时间暴露在辐射环境下而罹患白血病。</p>\n<p>　　采访当天，他正在茨城县水户市的一场活动中，向当地民众介绍自己当时在福岛第一核电站工作时的危险环境。他告诉记者，福岛核事故发生之后，他在媒体上看到了福岛当地的受灾情况，决定前往福岛进行支援。2011年10月，他和其他几名工人先是前往了福岛第二核电站进行施工作业。一年后，他又前往福岛第一核电站工作。在福岛第一核电站工作的1年半左右时间里，他逐渐发现，现场辐射防护工作存在很多令人疑惑的地方。</p>\n<p>　　除防护服不足外，他还告诉记者，当时在施工现场佩戴的个人辐射测量仪质量也是参差不齐。因为在福岛第一核电站工作的人数众多，原本准备的辐射测量仪数量不足，东电当时从其他核电站调配了一些测量仪，但因为设备老旧，一些测量仪的功能出现缺失。他说：“当时我和别人一起工作，我的辐射测量仪显示是0.3毫西弗，但我旁边的人工作完却发现他的辐射是0.00毫西弗，很明显，他的辐射测量仪是坏了的。”</p>\n<p>　　在福岛第一核电站现场工作给该受访者的身体健康带来了严重影响。2013年年底，他的身体状况突然急剧恶化，经常出现发烧、咳嗽等症状。2014年1月，他被确诊为白血病。随后的治疗过程也是饱受艰辛，因治疗导致毛发和指甲脱落、每天高烧呕吐，每周还要接受骨髓穿刺治疗。</p>\n<p>　　令他想不通的是，早在2015年他就已得到了日本政府的工伤认定，但时至今日却仍未得到东电的相关赔偿。他说：“在日本的核能相关赔偿法律中，有日本政府和相关电力公司应当进行相应赔偿的制度，但是东电却说，你虽然得了白血病，就算是得到了工伤认定，但这个病也是因为你自身的原因，不进行赔偿。”</p>\n<p>　　2016年，该受访者一纸诉状将东电告上法庭，要求东电承认相关责任，改善核电站工作环境。然而多年已过去，他仍在等待审判结果。</p>\n<p>　　该受访者还提到，可能还存在像他一样因在福岛第一核电站工作而罹患白血病或其他病患的施工人员，他希望日本政府和东电能够负起福岛核事故的责任，妥善解决福岛核事故的各种遗留问题。</p>\n<p>　　事实上，许多日本民众都希望日本政府和东电等方面能够牢记福岛核事故的惨痛教训，以负责的态度妥善进行善后处理。然而，福岛核事故发生后，日本政府和东电一再出现问题。不久前发生的放射性废液溅射事件，让东电的管理能力以及其一直强调的核污染水所谓“安全性”又一次受到日本民众质疑。</p>\n<p>　　有网友评论，“日本根本不具备安全管理核电站风险的管理能力。在日本这个灾害频发的国家，‘下一次核电站事故’肯定会发生”。“东电缺乏危机管理能力，导致自己陷入困境”。</p>\n<p>　　日本茨城大学名誉教授 曾我日出夫：我认为核污染水除了排海，还有其他方式来处理。即便花费更高，历时更长，也应该采取其他方式来处理。此外 ，地下水等仍在渗入核电站，导致核污染水继续增加。现在应该做的是采取有效的措施阻止水的渗入。</p>\n<p>　　茨城当地民众：所谓“处理水”，说白了就是核污染水，这是毫无疑问的。“处理水”的说法只是想从技术和科学角度欺骗人们罢了。</p>\n<p>　　茨城当地民众：在福岛第一核电站厂区外增设储水罐，把核污染水保存起来，随着时间流逝，氚的总量会减少。既然如此，为何要选择将核污染水排海？而且核污染水里并不是没有其他放射性物质。</p>\n<p>　　(央视新闻客户端 总台记者 何欣蕾 报道员 林博翰)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:梁异】 </span></div></div>\n</p></div>', '2023-11-04 16:00:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10216, '新漫评：日本又排“祸水” 再造地球之殇', '<div class=\"left_zw\">\n<p>　　<img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/11/04/c7bbb4b31ab34db09581352895040095.jpg\" style=\"border:0px solid #000000\"/></p>\n<p>　　11月2日，日本正式开始排放第三批福岛核污水，预计将持续17天。此次的排放量与前两次大致相同，仍为7800吨左右。这也意味着，第三批的排放结束后，流入太平洋的核污水累计将超过2.3万吨。</p>\n<p>　　据日本放送协会(NHK)，7800吨相当于10个核污染水储水罐的量，在2011年福岛核事故之后，当地已经修建了1000多个储水罐。有数据显示，在正式排污开始前，福岛核污染水已存到了130万吨，要把这些水全部排完，至少需要30年。</p>\n<p>　　此外，随着排放的继续，排放设备的安全性备受关注。10月25日，东京电力公司称，在福岛第一核电站进行核污水处理工作的4名作业员，被核污水溅射。</p>\n<p>　　中国外交部发言人汪文斌11月1日表示，东京电力公司长期存在的内部管理混乱无序、对公众隐瞒欺骗等痼疾积重难返。福岛核事故发生12年来，东电公司善后处理漏洞百出，多次迟瞒报事故、篡改关键数据，将企业利益而不是环境安全和民众健康放在优先位置。</p>\n<p>　　汪文斌指出，就在放射性废液溅射事故发生次日，东电公司宣布将于近期启动第三批核污染水排海。试问这样劣迹斑斑的企业如何能够确保在长达30年甚至更久的排放管理中做到安全可靠？日方宣称的“安全、透明”的排海计划又如何让人放心？</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:黄钰涵】 </span></div></div>\n</div>', '2023-11-04 09:10:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10217, '国际锐评丨这起事故戳穿了日方关于核污染水的两个谎言', '<div class=\"left_zw\">\n<p>　　不顾国内外强烈反对，日本东京电力公司2日启动了福岛核污染水第三次排海作业。这次排放预计持续到本月20日，排放量约为7800吨。东电公司声称，排放的核污染水“所含放射性物质氚的浓度符合预期”。然而，一周前，这家声名狼藉的企业发生了一起放射性废液溅射污染事故，2名工作人员被紧急送医。这自证了日方所谓核污染水“安全”的说辞绝不可信，核污染水处置过程中的风险不容低估。</p>\n<p>　　据日本共同社报道，10月25日，东电公司5名工作人员在处理核污染水的多核素处理系统(ALPS)管道时，接触到含有放射性物质的废液。在被送医的2人中，1人全身受到污染，1人双臂及下半身受到污染。经过长达几小时的去污处理，他们身体表面辐射量仍未降到安全标准值以下。而对于事故中喷溅的废液总量，东电先是说100毫升左右，之后又推算在数升左右，高出了几十倍。这种前后矛盾的表现，验证了日本《朝日新闻》的评价，日本民众对东电的不信任比其核污染水储存罐还深。</p>\n<p>　　自从12年前福岛核电站事故发生以来，东电公司发生的各类事故以及迟报、瞒报的丑闻太多了。远的不说，据日媒报道，今年6月福岛第一核电站核污染水储罐的围堤积水中，被检出活度高于正常值的放射性物质，但东电压了一段时间才对外宣称，用于输送核污染水的软管上有龟裂，导致核污染水发生外泄。这起最新的溅射事故不过是给东电的黑历史又添了一笔。它再次戳穿了日方精心编织的两大谎言：技术处理过的核污染水是“安全”的；核污染水的处置过程是“安全”、“可靠”的。</p>\n<p>　　多项研究表明，福岛核污染水含有60多种放射性核素。除氚元素之外，很多核素尚无有效处理技术。为了给排污入海“正名”，日本政府和东电方面近年来大力宣传称，经过ALPS处理的核污染水安全性达标。不少日本高官甚至睁眼说瞎话，说什么核污染水“可以喝”。东电还不断运用公关手段，组织利益攸关方、当地居民等到福岛第一核电站进行“视察游”。</p>\n<p>　　但事实怎样呢？日方今年3月发布的数据显示，经过ALPS处理后的核污染水，约有70%未达到排放标准，需要重新净化。据报道，这次喷溅事故发生后，东电检查了2名工作人员佩戴的剂量计，确认事故发生后他们在贝塔(β)射线中暴露的最大剂量为6.6毫西弗(mSv)，高于5毫西弗的警示红线。这从一个侧面说明，福岛核污染水具有较强辐射性，处理过程存在重大风险。</p>\n<p>　　此外，东电对于喷溅废液总量的说法前后矛盾，让外界再次对它安全运营管理能力打上一个大大问号。据日媒报道，这次入院的2名工作人员在作业时，并未被要求在防护服外穿着防水外套。人们不禁质疑：东电公司对工作人员的安全保护如此麻痹大意，又如何确保向大海倾倒的成千上万吨核污染水的安全性呢？</p>\n<p>　　在溅射事故发生后，福岛渔业官员说，他们对东电失去信任。福岛县危机管理部负责人铃木彰表示，“更令人担忧的是，(日本政府)各部委和机构之间也缺乏协调沟通” 。这道出了东电黑料不断却“大而不倒”的深层原因，即东电和日本政府存在特殊关系。据媒体报道，不少日本高官退休后就挂靠在东电公司当顾问，而核电业人士也会进入政府的政策咨询小组。这道“旋转门”决定了日本监管机构对东电的斑斑劣迹睁一只眼闭一只眼。</p>\n<p>　　如今，日本启动排污入海已经有两个多月。最新事故的发生说明，建立长期有效的国际监测安排势在必行。如果日方真的对“安全性”有信心，就应该以负责任方式处置核污染水，支持建立各利益攸关方充分参与的长期监测机制，包括其他国家独立实施的第三方监测。海洋是人类的共同家园，全世界不应该为日方的自私自利埋单。</p>\n<p>　　(国际锐评评论员 来源：央视新闻客户端)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:叶攀】 </span></div></div>\n</p></div>', '2023-11-03 16:03:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10218, '中国驻日使馆发言人就日本启动第三批福岛核污染水排海答记者问', '<div class=\"left_zw\">\n<p>　　中新网东京11月2日电  中国驻日本使馆发言人11月2日就日本启动第三批福岛核污染水排海答记者问。</p>\n<p>　　有记者问，11月2日，东京电力公司启动第三批福岛核污染水排海，请问你对此有何评论？</p>\n<p>　　发言人表示，日方连续倾倒核污染水，给全球海洋环境安全造成重大风险。中方反对日本福岛核污染水排海的立场是明确和坚定的。我们再次敦促日方全面回应国际社会关切，接受利益攸关方充分实质参与、长期有效的国际监测安排，切实以科学、安全、透明方式处置核污染水。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:李岩】 </span></div></div>\n</div>', '2023-11-02 18:41:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10219, '日本启动第三批核污染水排海 民众持续集会反对', '<div class=\"left_zw\">\n<p>　　中新社东京11月2日电 (记者 朱晨曦)据日本广播协会电视台报道，东京电力公司11月2日启动第三批核污染水排海。</p>\n<p>　　据日本《产经新闻》报道，第三批排放的核污染水总量为7800吨左右，与第一批、第二批核污染水的排放量相当。第三批核污染水预计在11月20日完成排放。东京电力公司计划在2023年度排放总计3.12万吨核污染水。</p>\n<p>　　当地时间11月1日晚，日本多个市民团体再度在东京电力公司总部前集会，强烈反对东京电力公司启动第三批核污染水排海。活动组织方代表柳田真在现场表示，日本政府和东京电力公司以推进福岛第一核电站核电机组退役为由强行将核污染水排海，是“彻头彻尾的谎言”。核电机组退役工作至今没有明确的路线图和时间表。</p>\n<p>　　柳田真说，将核电站因核事故而产生的核污染水排入大海的只有日本，国际上没有排海先例。核污染水排海无法容许。柳田真强烈要求立即停止排海计划，呼吁日本政府和东京电力公司探讨修建大型储水罐在陆地上长期保存核污染水。</p>\n<p>　　10月25日，福岛第一核电站发生放射性废液溅射事件，进行核污染水处理工作的5名作业员被放射性废液溅射，其中2人被紧急送医。近日，东京电力公司透露，实际溅射的放射性废液量远非最初公布的100毫升，而是高出几十倍，达到数升之多。</p>\n<p>　　对此，参加集会的渡边善惠在接受中新社记者采访时表示，该事件恰恰证明了核污染水对人体“非常危险”。渡边善惠是福岛人，他对记者表示，自己的家乡福岛深受核事故之苦，将核污染水称之为“处理水”是自欺欺人。他说：“为了将来的世代，绝对不能放弃抗争”。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:魏晨曦】 </span></div></div>\n</p></div>', '2023-11-02 17:16:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10220, '日本启动第三批福岛核污染水排海 中方回应', '<div class=\"left_zw\">\n<p>　　中新网北京11月2日电 (记者 黄钰钦)中国外交部发言人汪文斌11月2日主持例行记者会。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/11/02/99efde8380e74ea4a12a2fe3784cd3dc.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　有记者提问：据报道，11月2日，日本东京电力公司启动第三批福岛核污染水排海，预计持续至11月20日，计划排放约7800吨核污染水。中方对此有何评价？</p>\n<p>　　汪文斌：日本不顾国内外反对，已经向太平洋排放了15600吨核污染水，公然将污染风险转嫁给全世界，极不负责任。最近刚发生的福岛核电站放射性废液溅射事故再次证明，负责核污染水排放的日本东京电力公司内部管理混乱、惯于隐瞒欺骗，日方宣称的“安全、透明”的排海计划根本不能令人信服。日方应正视国际社会普遍关切，同利益攸关方特别是周边邻国进行充分协商，以负责任方式处置核污染水。</p>\n<p>　　随着越来越多的福岛核污染水被排入大海，尽快建立一个有日本周边邻国等利益攸关方切实参与、长期有效的国际监测安排的紧迫性日益凸显。国际原子能机构应就此发挥应有作用，日方应全面配合，严防核污染水排海造成不可挽回的后果。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:田博群】 </span></div></div>\n</div>', '2023-11-02 15:50:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10221, '福岛工作人员遭辐射！日本仍然启动了第三次排污', '<div class=\"left_zw\">\n<p>　　中新网11月2日电(张奥林)11月2日，日本正式开始排放第三批福岛核污水，预计将持续17天。此次的排放量与前两次大致相同，仍为7800吨左右。</p>\n<p>　　这也意味着，第三批排放结束后，流入大海的核污水累计将超过2.3万吨。与此同时，福岛核电站问题不断，包括工作人员可能被核污水辐射等安全问题，持续引发日本国内外广泛担忧。</p>\n<ol class=\"banquan_pic\" style=\"margin: 0;padding: 0;border: 0;outline: 0;list-style:none;vertical-align: baseline;background: transparent;\">\n<div style=\"text-align:center\"><img alt=\"资料图：福岛第一核电站。\" src=\"//image1.chinanews.com.cn/cnsupload/big/2023/09-11/4-426/5c7e9c15590145f69ac2ac97e8d9682a.jpg\" title=\"资料图：福岛第一核电站。\"><input id=\"5c7e9c15590145f69ac2ac97e8d9682a\" name=\"5c7e9c15590145f69ac2ac97e8d9682a\" type=\"hidden\"/></img></div>\n\n</ol>\n<p>　　<strong>仅仅3个月</strong></p>\n<p>　　<strong>超2.3万吨核污水将流入大海</strong></p>\n<p>　　日本在8月24日正式启动福岛核污水排海，并已完成两批次排放。前两批的排放量分别为7788吨和7810吨。</p>\n<p>　　日方公布的第三批核污水排放量仍为7800吨左右。也就是说，不到3个月的时间内，将有超过2.3万吨核污水流入太平洋。</p>\n<p>　　日本放送协会(NHK)介绍称，7800吨相当于10个核污染水储水罐的量，在2011年福岛核事故之后，当地已经修建了1000多个储水罐。</p>\n<p>　　关于今后的排放计划，东京电力公司(东电)原本打算，在2023年内共分4次排出总计3.12万吨核污染水。但最新发布的公告显示，这一期限将延长至2024年3月底。</p>\n<p>　　有数据显示，在正式排污开始前，福岛核污染水已存到了130万吨，要把这些水全部排完，至少需要30年。</p>\n<ol class=\"banquan_pic\" style=\"margin: 0;padding: 0;border: 0;outline: 0;list-style:none;vertical-align: baseline;background: transparent;\">\n<div style=\"text-align:center\"><img alt=\"资料图：污水稀释排放设施中的海水输送管道。图片来源：美联社\" src=\"//image1.chinanews.com.cn/cnsupload/big/2023/08-28/4-426/da13ee4542ca4397aa3bf47128a0b2dd.jpg\" title=\"资料图：污水稀释排放设施中的海水输送管道。图片来源：美联社\"><input id=\"da13ee4542ca4397aa3bf47128a0b2dd\" name=\"da13ee4542ca4397aa3bf47128a0b2dd\" type=\"hidden\"/></img></div>\n\n</ol>\n<p>　　<strong>福岛核电站工作人员遭辐射</strong></p>\n<p>　　<strong>排水设施一度异常</strong></p>\n<p>　　随着排放的继续，排放设备的安全性备受关注。10月25日，东电称，在福岛第一核电站进行核污水处理工作的4名作业员，被核污水溅射。</p>\n<p>　　4人中，有2人情况较为严重，被紧急送医，后确认2人均为外包工人，其中一名20岁男性除脸部外全身被辐射，另一名40岁男性双手和下半身被辐射。医院方面初步判明，放射性物质进入到了2人皮肤缝隙里。</p>\n<p>　　虽然2人已于10月28日出院，但外界仍疑问重重。有日本网友表示：“就算有异常也不可能公开，要处理这个问题，还有很长的路要走”。</p>\n<p>　　无独有偶，东电还曾在第二批核污水排放期间发布消息称，用于输送核污水的水泵压力一度降低，原因是水中含有的锈附着在过滤器上，引发了堵塞。</p>\n<p>　　一连串问题，进一步引发外界对排放设备安全性的担忧。这一担忧的根源不仅在于核污水排放本身，更是源于东电。</p>\n<p>　　2011年福岛核事故发生后，东电因在应对紧急情况、赔偿等问题上的表现，受到严厉批评。特别是在没有事先与当地渔民沟通的情况下，东电曾排放低浓度核污水，导致民众对其信任度大打折扣。</p>\n<p>　　核污水排放开始前后，包括NHK、《福岛民报》在内的多家日媒民调均显示，无论是福岛当地民众还是水产业者，大多数意见都认为，日本政府和东电对核污染水排放的说明不充分。</p>\n<ol class=\"banquan_pic\" style=\"margin: 0;padding: 0;border: 0;outline: 0;list-style:none;vertical-align: baseline;background: transparent;\">\n<div style=\"text-align:center\"><img alt=\"资料图：日本民众反对福岛核污染水排海。&lt;a target=\'_blank\' href=\'/\'&gt;中新社&lt;/a&gt;发 钟欣 摄\" src=\"//image1.chinanews.com.cn/cnsupload/big/2023/08-25/4-426/4a7b2dfae0724ee8943dd03fd894f78d.jpg\" title=\"资料图：日本民众反对福岛核污染水排海。&lt;a target=\'_blank\' href=\'/\'&gt;中新社&lt;/a&gt;发 钟欣 摄\"><input id=\"4a7b2dfae0724ee8943dd03fd894f78d\" name=\"4a7b2dfae0724ee8943dd03fd894f78d\" type=\"hidden\"/></img></div>\n\n</ol>\n<p>　　<strong>日本渔民要求东电赔偿</strong></p>\n<p>　　<strong>国际社会忧虑加剧</strong></p>\n<p>　　在福岛核污水排放引发的问题中，渔民成为受影响最为显著的群体之一。</p>\n<p>　　自福岛核事故以来，福岛以及周边渔民一直在努力恢复当地渔业。但核污水排入太平洋后，再次给当地渔业带来巨大冲击。</p>\n<p>　　面对由此带来的经济损失，多地渔民纷纷向东电提出索赔要求。</p>\n<p>　　铃木美智雄是仙台的一名渔业批发业者，10月27日，他参加了东电在仙台市召开的一场关于赔偿金额的说明会。</p>\n<p>　　因核污水排海遭受巨大经济损失，在东电负责人刚说了一句开场白后，鈴木就将其打断并质问道：“排海导致海产品完全不能出口，现在根本不知道损失额，你要怎么赔偿？”</p>\n<p>　　另一名渔业批发业者山口清一也表示，赔偿并不能解决问题，而是应该想想今后要怎么促进当地渔业良性发展。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/11/02/7e0bbe0660044343b83dea4434911984.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　对于核污水持续入海，国际社会的担忧情绪也在加剧。</p>\n<p>　　10月12日，日本的非营利团体“言论NPO”等发表的调查结果显示，对于福岛核污水排海问题，高达七成的韩国民众明确表示“不应该向海洋排放”。</p>\n<p>　　俄罗斯联邦动植物卫生监督局10月16日宣布，俄方自即日起暂停进口日本海产品。俄联邦渔业署此前就曾发表声明，表示保障国民健康是俄罗斯国内食品市场的首要任务，将持续就福岛核污水对俄专属经济区生态和渔业影响加强监测。</p>\n<p>　　中国外交部发言人汪文斌11月1日表示，东京电力公司长期存在的内部管理混乱无序、对公众隐瞒欺骗等痼疾积重难返。福岛核事故发生12年来，东电公司善后处理漏洞百出，多次迟瞒报事故、篡改关键数据，将企业利益而不是环境安全和民众健康放在优先位置。</p>\n<p>　　汪文斌指出，就在放射性废液溅射事故发生次日，东电公司宣布将于近期启动第三批核污染水排海。试问这样劣迹斑斑的企业如何能够确保在长达30年甚至更久的排放管理中做到安全可靠？日方宣称的“安全、透明”的排海计划又如何让人放心？(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:于晓】 </span></div></div>\n</div>', '2023-11-02 09:34:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10222, '日本开始第三轮核污染水排海', '<div class=\"left_zw\">\n<p>　　据共同社当地时间11月2日报道，日本东京电力公司当天开始福岛第一核电站核污染水第三轮排海。(央视新闻客户端 总台报道员 林博翰)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:曹子健】 </span></div></div>\n</div>', '2023-11-02 09:52:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10223, '“经济胁迫”成专利：G7“为日本出头”实为地缘政治算计', '<div class=\"left_zw\">\n<p>　　<strong>和评理丨“经济胁迫”成专利：G7“为日本出头”实为地缘政治算计</strong></p>\n<p>　　10月28日-29日，七国集团(G7)贸易部长会议在日本大阪举行。会上，G7发表声明，“强烈呼吁立即废除不必要的贸易限制措施，包括新实施的对日本食品的进口限制”。虽未“指名道姓”，但外界却普遍认为，这份声明是在“向中国喊话”。</p>\n<p>　　日本政府执意启动核污染水排海，中国对日本进口食品进行有关限制，尤其是禁止进口产自日本的海产品，正是为了保护14亿民众健康安全。</p>\n<p>　　纵观全球，各大洋水系彼此相连，内陆河湖也均经由地下水系及水蒸发循环系统互相连接。这意味着，伴随着日本启动福岛核电站核污染水排海，全世界都将为其“买单”。</p>\n<p>　　面对如此情势，G7集团其他几国非但不采取措施捍卫80亿人健康安全，反而与日本沆瀣一气，要强化所谓的“联合战线”来针对中国。日本核污染水排海可耻，G7其他六位成员此番操作也难辞其咎。</p>\n<p>　　当地时间上周三，东京电力公司5名工作人员由于接触到了含放射性物质的核污染水而紧急接受治疗。这一事故再次证明，核污染水的危险性绝不应该被G7成员们忽视。</p>\n<p>　　但是，G7集团的西方国家们却一向擅长“假充正义”。本次G7贸易部长会议上的这份“反对经济胁迫”的虚伪声明，正是再明显不过的例子。就如中国驻日本大使馆发言人所言，经济胁迫一直都是G7的“专利”。</p>\n<p>　　日本政府不顾国际社会与各有关专家的关切，执意启动核污染水排海，乃是公然向全世界转嫁核污染风险。为维护公众健康，各国完全有权采取相应防范措施。</p>\n<p>　　事实上，喜欢给进口自发展中国家的产品设置贸易壁垒，又喜欢在出口自身半导体等技术方面设置“重重关卡”，严重威胁全球供应链稳定的，正是G7集团。罔顾自身在温室气体排放方面背负的历史责任，将帮助发展中国家应对气候变化风险的承诺抛诸脑后的，也是G7自己。</p>\n<p>　　G7此次“为日本出头”，其意在继续他们针对中国的博弈。此番行径证明，面对核污染水风险，G7早已将民众安危置后，他们眼中更重要的，是地缘政治的算计。</p>\n<p>　　本文译自《中国日报》10月31日社论</p>\n<p>　　原标题：G7 has patent on hypocrisy and economic coercion</p>\n<p>　　出品：中国日报社论编辑室</p>\n<p>　　编译：涂恬 编辑：李海鹏<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:陈海峰】 </span></div></div>\n</p></div>', '2023-11-01 10:18:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10224, '中国驻日本使馆发言人：经济胁迫是G7“专利”', '<div class=\"left_zw\">\n<p>　　中新社东京10月30日电  当地时间10月30日，中国驻日本使馆发言人就七国集团贸易部长会议消极动向答记者问。</p>\n<p>　　有记者问，七国集团(G7)在日本大阪举行贸易部长会议并发表声明，呼吁撤销对日本食品进口限制，共同应对经济胁迫等，请问你对此有何评论？</p>\n<p>　　发言人表示，日本政府不顾国际社会严重关切，执意启动核污染水排海，公然向全世界转嫁核污染风险。为维护食品安全和公众健康，各国有权采取相应防范措施。作为问题制造者的日本应反躬自省，纠正排海错误行径。</p>\n<p>　　发言人说，经济胁迫是G7“专利”。G7成员破坏公平竞争环境、扰乱全球产供链安全稳定的行为可谓比比皆是。我们敦促他们不要顽固坚持双重标准，以实际行动维护正常国际贸易、投资秩序。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:周驰】 </span></div></div>\n</p></div>', '2023-10-30 01:00:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10225, '中国驻日使馆发言人就福岛第一核电站工作人员遭受放射性废液溅射污染答记者问', '<div class=\"left_zw\">\n<p>　　中新社东京10月27日电 中国驻日本使馆发言人27日就福岛第一核电站工作人员遭受放射性废液溅射污染答记者问。</p>\n<p>　　有记者问，据报道，日前福岛第一核电站发生工作人员遭放射性废液溅射污染事件，中方对此有何评论？</p>\n<p>　　发言人表示，中方对事故造成人员伤害感到遗憾。日方在清洗多核素处理系统(ALPS)管道时发生相关事件，再次表明福岛核污染水带有较强辐射性，处理过程易引发重大风险，外界有充分理由质疑福岛核污染水排海的可靠性。</p>\n<p>　　发言人说，日方处理核污染水接连出现事故，暴露了内部管理的无序和混乱，再次凸显了国际社会开展监督的重要性。中方严肃敦促日方正视周边邻国和国际社会关切，以负责任方式处置核污染水，并接受利益攸关方充分参与、长期有效的国际监测。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:刘欢】 </span></div></div>\n</p></div>', '2023-10-27 22:03:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10226, '第二批福岛核污染水排放完毕 累计排放已超1.5万吨', '<div class=\"left_zw\">\n<p>　　中新网10月23日电 据日本放送协会(NHK)报道，日本东京电力公司称，福岛核电站第二批核污染水已于23日排放完毕。截至目前，已有超1.5万吨核污染水流入海洋。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/10/23/8d7ddd4e989d4026b601190296d1856b.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　据报道，第二批次排放从10月5日开始，共排放约7810吨核污染水。</p>\n<p>　　报道称，在排放过程中，输送核污染水的过滤器附着了类似锈斑的物体，导致水泵压力一度降低，在对过滤器进行清理后恢复原状，未对排放造成影响。</p>\n<p>　　日本在8月24日正式启动福岛核污染水排海，第一批次的核污染水在8月24日至9月11日排完，共计7788吨核污染水排入大海。算上第二次的7810吨，目前累计排放量已超过1.5万吨。</p>\n<p>　　东电计划，在2023年内分四次排放3.12万吨核污染水。而要将现存核污水全部排完，则需要至少30年时间。</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:何路曼】 </span></div></div>\n</div>', '2023-10-23 16:25:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10227, '外交部：中方反对福岛核污染水排海立场一贯明确', '<div class=\"left_zw\">\n<p>　　中新网北京10月19日电(记者 邢翀)中国外交部发言人毛宁10月19日主持例行记者会。</p>\n<p>　　有记者提问：中国专家目前正在日本参加由国际原子能机构(IAEA)组织的对福岛核污染水排海后的水产品调查。中国一直严厉批评国际原子能机构支持日本排海的决定，为何中国专家继续参加国际原子能机构的这些调查？</p>\n<p>　　毛宁：中方反对日本福岛核污染水排海的立场是一贯和明确的。日本启动核污染水排海已经有两个月，国际社会要求尽快建立一个长期有效的国际监测安排，并且确保日本周边邻国等利益攸关方的切实参与。</p>\n<p>　　我们认为国际原子能机构应当为此发挥应有的建设性作用，承担起对日方严格监督的责任。日方也应当全面配合，严防核污染水排海带来不可挽回的危害。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:房家梁】 </span></div></div>\n</p></div>', '2023-10-19 16:33:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10228, '俄罗斯宣布对日本海产品实施临时限制', '<div class=\"left_zw\">\n<p>　　中新社莫斯科10月16日电 俄罗斯联邦动植物卫生监督局16日宣布，俄罗斯自即日起暂停进口日本海产品。</p>\n<p>　　俄联邦动植物卫生监督局官网当日发布消息说，作为预防性措施，俄罗斯自2023年10月16日起对自日本进口鱼类和海产品实行临时限制措施。在日方提供详尽、必要信息以确认海产品安全且符合欧亚经济联盟相关要求，并经俄联邦动植物卫生监督局专家分析之前，将暂停进口日本鱼类和海产品。</p>\n<p>　　俄联邦动植物卫生监督局9月26日曾表示，鉴于福岛第一核电站启动核污染水排海后可能带来的辐射污染风险，俄罗斯考虑针对日本海产品实行限制措施。</p>\n<p>　　俄罗斯消费者权益保护和公益监督局8月24日曾表示，鉴于日方宣布福岛第一核电站核污染水排放计划，俄方已从7月8日起对产地为日本的海产品加强监管。该机构还指出，日本对俄出口的各类食品须提供符合要求的相关证明。</p>\n<p>　　8月24日，日本不顾国际社会强烈反对，开始将福岛第一核电站的核污染水排放至太平洋。10月5日，日本东京电力公司表示，已启动福岛第一核电站第二批核污染水排海计划。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:陈彩霞】 </span></div></div>\n</p></div>', '2023-10-16 18:31:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10229, '俄罗斯将对自日本进口的鱼类等水产品实施临时限制', '<div class=\"left_zw\">\n<p>　　中新网10月16日电 据俄新社报道，当地时间16日，俄罗斯动植物检验检疫局发布消息称，自2023年10月16日起，俄罗斯将对从日本进口的鱼类和海鲜实施临时限制措施。</p>\n<p>　　俄罗斯动植物检验检疫局表示，在提供“确认海产品安全性”等“必要的详细信息”前，将引入这些限制。</p>\n<p>　　据此前报道，日本不顾多方反对和抗议，于8月24日正式开始将福岛核污染水排入大海。有数据显示，在正式排污开始前，核污染水已存到了130万吨，要把核污染水全部排完，至少需要30年。</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:孔庆玲】 </span></div></div>\n</div>', '2023-10-16 15:19:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10230, '中日举行海洋事务高级别磋商机制第十六轮磋商', '<div class=\"left_zw\">\n<p>　　2023年10月13日，外交部边界与海洋事务司司长洪亮和日本外务省亚洲大洋洲局局长鲶博行在扬州共同主持中日海洋事务高级别磋商机制第十六轮磋商，就两国间涉海事务深入交换意见。两国各涉海部门代表参加。</p>\n<p>　　中方阐述了在东海、钓鱼岛、南海、台海等问题上的立场，敦促日方切实尊重中国领土主权和安全关切，停止在上述问题上的一切消极言行。中方对日本向海洋排放核污染水表示强烈不满，要求日方以负责任态度妥善处置。</p>\n<p>　　双方同意，继续坚持把东海建设成为和平、合作、友好之海的目标和宗旨，就涉海事务保持密切沟通，努力管控矛盾分歧，加强互利合作，共同维护海上局势稳定。</p>\n<p>　　双方原则同意，明年上半年在日本举行中日海洋事务高级别磋商机制第十七轮磋商。(外交部网站)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:曹子健】 </span></div></div>\n</p></div>', '2023-10-13 19:36:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10231, '日媒：福岛核污染水排放口附近再次检出氚', '<div class=\"left_zw\">\n<p>　　中新网10月9日电 据日本共同社报道，东京电力公司(东电)当地时间8日发布消息称，在福岛第一核电站核污染水排放口附近采集的海水中，再次检测到了放射性物质氚。</p>\n<p>　　东电称，在7日采集的海水中，检测到了浓度为每升9.4贝克勒尔的放射性物质氚。这是继8月31日采集的样本之后，第2次在常规精度检测中检出了氚。</p>\n<p>　　据东电介绍，检出氚的是核电站方圆3公里范围内10个采集点中，距离排放口最近一处的海水。8月31日的样本检出的浓度为每升10贝克勒尔。</p>\n<p>　　据此前报道，尽管排海决定遭到日本国内外强烈反对，日本政府和东京电力公司仍于8月24日启动了福岛第一核电站核污染水的排海，第一轮排海于9月11日结束。第二轮排海于10月5日启动，计划排出大约7800吨核污染水，预计将持续17天。<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:张乃月】 </span></div></div>\n</p></div>', '2023-10-09 21:05:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10232, '中国驻日本使馆发言人就日本启动第二批福岛核污染水排海答记者问', '<div class=\"left_zw\">\n<p>　　中新社东京10月7日电  中国驻日本使馆发言人6日就日本启动第二批福岛核污染水排海答记者问。</p>\n<p>　　有记者问，10月5日，日本东京电力公司启动第二批福岛核污染水排海，请问使馆发言人对此有何评论？</p>\n<p>　　发言人说，日方不顾国际社会的强烈反对，单方面启动第二批福岛核污染水排海，一意孤行继续向全世界转嫁核污染风险，我们对此表示强烈不满。</p>\n<p>　　发言人说，核污染水排海事关海洋环境和人类健康，决不是日本一家私事，也不能由日本一家说了算。我们再次敦促日本政府正视日本国内和国际社会反对呼声和严正关切，同周边邻国充分协商并进行实质沟通，在确保周边邻国等利益攸关方切实参与前提下建立长期有效的国际监测机制，以负责任方式处置核污染水。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:付子豪】 </span></div></div>\n</p></div>', '2023-10-06 23:49:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10233, '中方：日本政府应全面回应国际社会关切 以负责任方式处置核污染水', '<div class=\"left_zw\">\n<p>　　中新社北京10月5日电 中国外交部发言人5日就日本启动第二批福岛核污染水排海答记者问时表示，日本政府应全面回应国际社会关切，以真诚态度同周边邻国充分协商，以负责任方式处置核污染水。</p>\n<p>　　有记者提问，10月5日，日本东京电力公司宣布，已于当日启动第二批福岛核污染水排海工作，计划17天排放7800吨。请问发言人对此有何评论？</p>\n<p>　　发言人表示，中方在日本福岛核污染水排海问题上的立场是一贯的、明确的，“我们坚决反对日方单方面排海行动”。</p>\n<p>　　“我想再次重申，海洋是全人类的共同财产。”发言人说，日本政府应全面回应国际社会关切，以真诚态度同周边邻国充分协商，以负责任方式处置核污染水。国际社会应推动建立一个长期有效的国际监测安排，并确保日本周边邻国等利益攸关方的切实参与。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:付子豪】 </span></div></div>\n</p></div>', '2023-10-05 23:59:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10234, '外交部发言人就日本启动第二批福岛核污染水排海答记者问', '<div class=\"left_zw\">\n<p>　　问：10月5日，日本东京电力公司宣布，已于当日启动第二批福岛核污染水排海工作，计划17天排放7800吨。请问发言人对此有何评论？</p>\n<p>　　答：中方在日本福岛核污染水排海问题上的立场是一贯的、明确的，我们坚决反对日方单方面排海行动。</p>\n<p>　　我想再次重申，海洋是全人类的共同财产。日本政府应全面回应国际社会关切，以真诚态度同周边邻国充分协商，以负责任方式处置核污染水。国际社会应推动建立一个长期有效的国际监测安排，并确保日本周边邻国等利益攸关方的切实参与。(外交部网站)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:付子豪】 </span></div></div>\n</div>', '2023-10-05 22:50:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10235, '韩国市民团体集会抗议福岛第二轮核污染水排海', '<div class=\"left_zw\">\n<p>　　中新社首尔10月5日电 (刘旭 金琳)5日上午，韩国市民团体在位于首尔钟路区的日本驻韩国大使馆前举行记者招待会和集会，谴责日本福岛第一核电站核污染水第二轮排海，并敦促韩国政府停止进口日本水产品。</p>\n<div><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/ypt/2023/231005/fcb6e99f-3c53-4bd3-9691-5fa8e748e8f5_zsite.jpg\" style=\"display: block; margin: auto; cursor: pointer;\"/></div>\n\n<p>　　当天，由99个市民、劳动、环境团体组成的“阻止日本放射性污染水海洋排放共同行动”团体(以下简称“共同行动”)要求日本政府立即停止向海洋排放核污染水，实行将核污染水保管在日本国内的方法，同时要求韩国政府立即向国际海洋法法庭起诉日本政府。</p>\n<div><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/ypt/2023/231005/8741e014-1d92-4f72-9b18-49dca17ca73e_zsite.jpg\" style=\"display: block; margin: auto; cursor: pointer;\"/></div>\n\n<p>　　10多名“共同行动”成员在日本驻韩国大使馆前高呼“日本政府必须立即撤回海洋排放计划”。他们表示，韩国政府应全面禁止进口日本水产品，同时保护因此受损的渔民利益。</p>\n<div><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/ypt/2023/231005/4e5231ee-621d-4df1-8cf7-16f6cb888b6e_zsite.jpg\" style=\"display: block; margin: auto; cursor: pointer;\"/></div>\n\n<p>　　当地时间10月5日10时30分左右，日本东京电力公司福岛第一核电站核污染水第二轮排海开始。按照东电此前公布的计划，第二轮计划排海的核污染水总量约为7800吨，排放周期预计为17天。</p>\n<p>　　此前，东电于8月24日至9月11日向海中排放了第一轮核污染水，共7788吨。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:房家梁】 </span></div></div>\n</div>', '2023-10-05 20:46:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10236, '日本启动第二轮核污染水排海 民众再度集会抗议', '<div class=\"left_zw\">\n<p>　　中新社东京10月5日电 (记者 朱晨曦)据日本广播协会电视台报道，当地时间10月5日10时18分，日本东京电力公司启动福岛第一核电站核污染水第二轮排海。</p>\n<p>　　据日本富士新闻网报道，东电公司已在本月3日进行了排海准备工作。第二轮排海计划排出大约7800吨核污染水，与第一轮排放量相当，预计本轮排海将持续17天。</p>\n<p>　　东电公司计划在2023年度排放总计3.12万吨核污染水。在8月24日启动的首轮排海中已排放了大约7800吨核污染水。</p>\n<div><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/ypt/2023/231005/2947bf9a-557d-4016-a30e-785a248afc56_zsite.jpg\" style=\"display: block; margin: auto; cursor: pointer;\"/></div>\n\n<p>　　当地时间10月4日晚，日本多个市民团体冒雨聚集在东电公司总部附近，强烈反对日本政府启动第二轮核污染水排海。参加集会的民众手持写有“别把核污染水排入大海”等内容的横幅标语，高喊“大海不是丢弃核废料的垃圾场”“排海违反《伦敦倾废公约》”等，表达坚决反对核污染水排海的立场。</p>\n<p>　　活动组织方代表柳田真在现场表示，福岛核污染水直接同核事故中熔化的核反应堆堆芯接触，国际上没有排海先例。核污染水排海使日本在国际社会中留下极不负责任的形象。</p>\n<div><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/ypt/2023/231005/6a7d74de-3ea2-44c3-85b0-4cb62d252da7_zsite.jpg\" style=\"display: block; margin: auto; cursor: pointer;\"/></div>\n\n<p>　　活动组织方现场向东电公司代表宣读并递交了请愿书，要求立即停止核污染水排海。请愿书指出，“大海不是丢弃核废料的垃圾场”，核污染水排海将污染整个地球，国际社会出现反对之声是理所应当，必须立即停止核污染水排海。</p>\n<p>　　请愿书写道，日本政府和东电公司形成合谋，无视民众的众多反对声音，强行启动核污染水排海，破坏了此前向渔民做出的承诺。日本政府把福岛核污染水同核电站正常运行排水进行类比，毫无道理，只是为了将排海行为正当化。核污染水排海必将给未来“种下祸根”。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/10/05/fce5d38d1f22481288013bf76cd26f0d.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　对于日本启动第二轮核污染水排海，多位参加集会的民众表示，今后将继续强烈抗议、全力斗争。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:曹淼欣】 </span></div></div>\n</div>', '2023-10-05 15:36:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10237, '第二批开始！短短两个月，日本万余吨核污染水入海', '<div class=\"left_zw\">\n<p>　　中新网10月5日电(张奥林)5日上午，日本正式开始排放第二批次的福岛核污染水，预计将持续17天。此次的排放量与第一批次大致相同，仍为7800吨左右。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/10/05/fdf55a9cdc774e69a829167dc8c8ec37.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　大量核污染水持续排入太平洋的同时，又出现了新的问题——因排污产生的垃圾面临“无处安放”的境地。对于愈发严重的核污染危机，日本政府和东京电力公司却装聋作哑，一意孤行，其在日本国内外的信誉度正被严重透支。</p>\n<p>　　<strong>约1.5万吨核污染水流入大海</strong></p>\n<p>　　<strong>这才刚刚开始！</strong></p>\n<p>　　日本在8月24日正式启动福岛核污染水排海，第一批次的核污染水在8月24日至9月11日排完，共计7788吨核污染水排入大海。</p>\n<p>　　第二批次的排放量仍为7800吨左右。也就是说，核污染水排海开始后的短短两个月，约1.5万吨巨量核污染水流入太平洋。</p>\n<p>　　而这才刚刚开始。日本放送协会(NHK)介绍称，7800吨相当于10个核污染水储水罐的量，在2011年福岛核事故之后，当地已经修建了1000多个储水罐。按日方的计划，2023年内共将分4次排出3.12万吨核污染水。有数据显示，在正式排污开始前，核污染水已存到了130万吨，要把核污染水全部排完，至少需要30年。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/10/05/8a5e501f55ef4e62b08820132a197620.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　<strong>新问题出现！</strong></p>\n<p>　　<strong>排污产生的垃圾再次“无处安放”</strong></p>\n<p>　　除了核污染水外，福岛核电站目前又出现了新的棘手问题——拆除空置的储水罐。不过，针对因此产生的废弃物如何处理、在哪堆放等问题，东电却表示“尚无定论”。</p>\n<p>　　同时，日本多核素处理系统在处理核污染水过程中产生了大量含有放射性物质的污泥，堆放这些污泥的设施容量也已告急。虽然东电计划将这些污泥进行脱水固体化处理，但处理设施的建设工作已被推迟到2026年。东电表示，目前能做的只有尽量抑制更多的污泥产生。</p>\n<p>　　对于这些“无处安放”的废弃物和污泥，福岛当地表示担忧，福岛县政府呼吁日本政府和东电“充分说明到底要如何减少储水罐”。</p>\n<p>　　《福岛民报》9月25日发布的民调也显示，61%的福岛民众认为日本政府和东电对核污染水排放的说明不充分。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/10/05/db8ac08e12aa4a23b275df74e8532a43.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　日本《东京新闻》和《每日新闻》在报道中指出，2011年福岛核事故发生后，东电在紧急情况处理、赔偿等问题上的所作所为，让日本民众的信任度持续下跌。特别是2011年东电在没有和当地渔民沟通的情况下，曾排放过低浓度核污染水，更是让其彻底失信于日本民众以及国际社会。</p>\n<p>　　报道还指出，“排海的决定虽然是由日本政府决定，但实际执行方却是东电，这也让人觉得责任不明”。日本北海学园大学教授滨田武士对此表示，“排放时间至少30年，东电在这个过程中会不会出现什么问题，令人担忧”。</p>\n<p>　　信州大学副教授茅野恒秀还指出，“(日本)政府在出现什么情况时会如何负起责任，现在都没有明确”。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/10/05/4dd7c58d93b248a78db3cf4633a022f8.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　<strong>日本一地方议会：立即停止排污！</strong></p>\n<p>　　<strong>国际社会持续谴责</strong></p>\n<p>　　除了质疑，包括多地渔民在内的大量日本民众对核污染水排海持续表示反对。</p>\n<p>　　9月8日，约150名日本民众将日本政府和东电告上法庭，控诉他们正在“实施故意污染环境的行为”，并要求立即停止核污染水排海。</p>\n<p>　　北海道函馆市议会在9月20日也通过了一份意见书，称核污染水排放是日本首相岸田文雄无视渔业人员等群体反对声音的情况下，强行实施的行为，要求日本政府马上停止排污。</p>\n<p>　　意见书还指出，对将核污染水强行排入大海阻碍当地渔业复兴的行为，绝对不能容忍。</p>\n<p>　　国际社会的担忧情绪也在持续蔓延。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/10/05/d6edc4fa794347619369edf535b4bebb.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　9月2日下午，韩国最大在野党共同民主党和基本所得党、进步党等在野党与90余个市民团体在首尔市中心再次举行大规模集会，谴责日本福岛核电站核污染水排放。</p>\n<p>　　9月7日，俄罗斯联邦渔业署发表声明说，保障国民健康是俄罗斯国内食品市场的首要任务，将继续就福岛核污染水对俄专属经济区生态和渔业影响加强监测。</p>\n<p>　　中国常驻联合国日内瓦办事处和瑞士其他国际组织代表陈旭9月14日在联合国人权理事会与享有安全饮用水和卫生设施人权问题特别报告员互动对话时发言，指出日本政府单方面强行启动福岛核污染水排海，严重侵犯太平洋沿岸国家乃至全球人民的健康权、发展权和环境权，其正当性、合法性、安全性一直受到国际社会质疑，并遭到日本、韩国等国内民众强烈反对。</p>\n<p>　　陈旭指出，如果福岛核污染水是安全的，就没有必要排海；如果不安全，就更不应该排海。中方呼吁联合国人权理事会对这一问题加大关注，敦促日方立即停止排海行为。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:张奥林】 </span></div></div>\n</div>', '2023-10-05 09:31:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10238, '日本第二轮核污染水排海将从10月5日开始', '<div class=\"left_zw\">\n<p>　　据日本福岛中央电视台当地时间9月28日消息，福岛第一核电站核污染水第二轮排海将从10月5日开始。(央视新闻客户端 总台记者 李卫兵 柏春洋)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:曹子健】 </span></div></div>\n</div>', '2023-09-28 16:01:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10239, '报道称中国正开展海洋辐射环境监测 中方：有能力、有决心维护民众健康', '<div class=\"left_zw\">\n<p>　　中新网北京9月27日电 (记者 黄钰钦)中国外交部发言人汪文斌27日主持例行记者会。</p>\n<p>　　有记者提问：据报道，中国政府正在开展对中国管辖海域内的海洋辐射环境监测，请问中方何时可以发表相关数据？</p>\n<p>　　汪文斌：开展海洋环境辐射监测，对日本的水产品进口采取紧急措施，加大海洋水产品核污染风险的监测力度，这些都是中国政府为应对日本福岛核污染水排海，维护国家利益和公众权益的正当合理举措。</p>\n<p>　　日本福岛核污染水排海长达数十年，能否真正处理达标都存在极大的不确定性。我要强调的是，中国政府有能力、有决心采取一切必要措施，切实维护国家利益和民众健康，保护海洋渔业健康发展。(完）<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:陈海峰】 </span></div></div>\n</p></div>', '2023-09-27 15:44:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10240, '中国代表在国际原子能机构第67届大会阐述中方立场主张', '<div class=\"left_zw\">\n<p>　　中新社柏林9月26日电 维也纳消息：当地时间25日，国际原子能机构第67届大会在奥地利维也纳国际中心开幕，中国国家原子能机构副主任刘敬率团参会。刘敬在一般性辩论中发言，全面阐述中国积极支持国际原子能机构致力于维护国际和平和安全，促进和平利用核能、核科技，造福广大发展中国家的立场主张。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/09/26/d023ca5a80734adcbf65727b65708240.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　刘敬表示，国际原子能机构作为核领域最重要的政府间国际组织，在防止核武器扩散和促进核能和平利用方面发挥着不可替代的作用。中国是从维护国际和平与安全、促进可持续发展的战略高度看待与机构关系的，支持机构的作用，并与机构积极开展全方位合作。习近平主席提出全球发展倡议和全球安全倡议，与机构“原子用于和平与发展”愿景高度契合，与联合国2030年可持续发展目标同频共振。中方积极向广大发展中国家分享经验，积极帮助广大发展中国家培养专业人才、提供公共产品，积极支持机构技术合作计划，以切实行动推动核能与核技术更好地惠及最广大发展中国家。</p>\n<p>　　刘敬指出，日本不顾国际社会的普遍质疑和有关国家民众的强烈反对，一意孤行启动排海计划，引起国际社会广泛关注。福岛核污染水排海是重大的核安全问题，人为向海洋排放核事故污染水前所未有，大量放射性核素排入大海产生的累积海洋效应存在极大的不确定性，对此，日本并不能给国际社会一个可信的、科学的交代。机构必须建立长期有效的国际监测机制，对日本不负责任的行径进行严格国际监督，坚决防止福岛核污染水排海对海洋环境和人类健康造成长期危害。</p>\n<p>　　会议期间，刘敬会见了国际原子能机构总干事格罗西，重点就日本福岛核污染水排海问题阐述了中方立场主张。格罗西表示高度重视中方有关立场和关切，愿与中方就此保持密切沟通与合作。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:李太源】 </span></div></div>\n</div>', '2023-09-26 15:56:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10241, '多国官员学者共商海洋生态保护 倡导合力推进全球海洋治理', '<div class=\"left_zw\">\n<p>　　中新社北京9月26日电 (尹倩芸)由中国人权发展基金会、中国海洋发展基金会和中国外文局共同主办的“环境、发展与人权：现代化进程中的海洋生态保护”国际研讨会于26日在北京举行。来自20余个国家的官员学者围绕现代化进程中的海洋生态保护展开研讨，聚焦构建海洋命运共同体，倡导合力推进全球海洋治理。</p>\n<p>　　中国自然资源部海洋发展战略研究所研究员罗刚提到，核污染水排海事件使全球海洋生态系统和生物多样性面临严峻挑战。他认为，核污染水的处置，应坚持以包括国际海洋法、国际环境法在内的国际法为准绳，忠实履行国际法相关义务，必须贯彻风险预防原则，不应拿全人类的生存和延续当赌注，应当尊重和保障人权，不得侵害各国人民的健康权、发展权和环境权。</p>\n<p>　　“面对海洋环境的危机与挑战，任何一个国家和地区都不能独善其身。”中国自然资源部国际合作司(海洋权益司)副司长王安涛在致辞中指出，这需要所有人携手合作、守望相助，共同确保海洋的可持续发展。</p>\n<p>　　对此，巴西国家地理与统计局局长马尔西奥·波赫曼表示，在海洋环境保护方面，中国式现代化可以为全球南方提供可贵的经验。巴西希望与中方携手，加强对海洋环境保护和可持续发展道路的探索。</p>\n<p>　　马来西亚皇家海军准将、国防与安全研究所综合国防与安全研究中心高级主任郑业龙指出，合作治理作为应对复杂环境挑战一种很有前途的方法，对于可持续发展以及海洋环境治理至关重要。可通过加强体制框架、促进利益攸关方参与，以及加强透明度和问责制三方面加强合作治理。</p>\n<p>　　当天，与会中外嘉宾代表发布共同倡议“为了世界明天  加强蓝色合作”。倡议指出，全球应在智库交流、舆论传播合作、重点国家联合工作、维护航行权利与自由和环境污染防治等方面，通过双边或地区协议等方式达成共识，携手推动海洋生态的可持续发展。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:张燕玲】 </span></div></div>\n</p></div>', '2023-09-26 15:28:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10242, '美国驻日大使称中方对排海的反应是“经济胁迫” 中方回应', '<div class=\"left_zw\">\n<p>　　中新网北京9月22日电 (记者 黄钰钦)针对美国驻日大使称中方对排海的反应是“经济胁迫”，中国外交部发言人毛宁22日在例行记者会上表示，美方有关人员应该停止偏袒、纵容日本的不负责任行为。</p>\n<p>　　有记者提问，美国驻日本大使称，中方对排海的反应是“经济胁迫”，他还称中方正制造一系列与邻国的冲突。发言人对此有何评论？</p>\n<p>　　毛宁表示，关于日本核污染水排海问题，中方已经多次表明立场。日本强行向海洋排放核污染水，自人类和平利用核能以来没有过先例，国际社会普遍对此感到担忧。中方采取的措施合情、合理、合法。</p>\n<p>　　毛宁强调，美国是太平洋沿岸国家，一向标榜重视核安全和环境保护。美方有关人员应该停止偏袒、纵容日本的不负责任行为，同各方一道，敦促日本停止核污染水排海，以负责任的方式处置核污染水。(完）<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:陈海峰】 </span></div></div>\n</p></div>', '2023-09-22 18:24:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10243, '中方：敦促日方停止渲染炒作，不要试图转移事件焦点掩盖自身排海错误行为', '<div class=\"left_zw\">\n<p>　　中新网北京9月21日电(谢雁冰)中国外交部发言人毛宁9月21日主持例行记者会。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/09/21/6ea4cceba1654e66a51f34aae9385a8a.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　有记者提问：日本福岛核污染水排海后，日本驻华大使馆接到了约40万通骚扰电话，这些电话的地址显示为中国大陆，部分电话含有威胁性内容。中方对此有何评论？</p>\n<p>　　毛宁：中方一贯依法保障各国驻华使领馆的安全和在华外国公民的合法权益。据我所知，中国驻日本的使领馆近日接到大量来自日本国内的骚扰电话，严重干扰使领馆的正常运转。</p>\n<p>　　我们敦促日方切实保障中国驻日使领馆，在日机构、企业、公民和赴日游客的安全，正确引导舆论，停止渲染炒作，不要试图转移事件的焦点，掩盖自身排海的错误行为。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:付子豪】 </span></div></div>\n</div>', '2023-09-21 15:39:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10244, '这地议会通过意见书 要求日本政府中止核污染水排海', '<div class=\"left_zw\">\n<p>　　中新网9月20日电 据日本共同社报道，当地时间19日，日本北海道函馆市议会以首相岸田文雄“无视渔业人士等的反对声音而实施”等为由，表决通过了要求政府立即中止核污染水排海的意见书。同时，该市议会还要求政府采取对策，防止核污水进一步增加。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/09/20/b4f6800013b946d38b14589ebcd54966.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　报道称，该意见书指出，日本政府和东电无视对渔业人士做出的“在未获得相关人士理解之前不会处理”的承诺。意见书称，“绝不允许(因排海)妨碍当地渔业的重振”，政府应优先采取措施应对污染地下水等问题。</p>\n<p>　　据北海道函馆市议会事务局介绍，当天，在全体会议上进行表决时，以14对12的多数赞成票通过了该意见书。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/09/20/9b20b5ac670444ab9382825c55cc9266.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　据此前报道，当地时间8月24日，不顾日本国内外多方强烈反对，日方正式将福岛第一核电站的核污染水排放至太平洋。日本全国渔业联合会会长坂本雅信当时曾称，“坚决反对(日本政府)在没有取得渔业工作者和国民理解的情况下排污入海”，并强调此事难以避免福岛等地的渔业声誉受到影响。</p>\n<p>　　中国外交部发言人汪文斌9月1日曾指出，如何处置核污染水，绝不是日本一家私事，也不仅仅是个别国家之间的事，而是事关污染海洋还是保护海洋、破坏环境还是呵护环境、危害人类健康还是维护人类健康的重大问题。</p>\n<p>　　汪文斌还强调，在这个问题上，日本需要面对的，不是哪一个国家，而是整个国际社会。日方应正视周边邻国和国际社会关切，立即停止向全球转嫁核污染风险，不要站在整个国际社会的对立面，否则必将为此承担长远的道义和法律责任。</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:孔庆玲】 </span></div></div>\n</div>', '2023-09-20 11:28:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10245, '中国驻日本使馆发言人就福岛核污染水排海问题答记者问', '<div class=\"left_zw\">\n<p>　　中新社东京9月18日电 中国驻日本使馆发言人18日就福岛核污染水排海问题答记者问。</p>\n<p>　　有记者问，日前日方围绕福岛核污染水检测发布消息称，选择哪国实验室参与分析和对比检测是国际原子能机构(IAEA)行为，日方并未参与。日方采样和分析得到IAEA认可。请问中方对此有何评论？</p>\n<p>　　发言人表示，此前有媒体报称“中方拒绝加入IAEA的国际监测机制”，日方发布的信息再次印证这一报道是假消息，中方并未受邀参加核污染水的分析和对比检测。</p>\n<p>　　发言人说，中方多次强调，应尽快建立一个邻国等利益攸关方充分参与、长期有效的国际监测安排。如果日方对核污染水的处理真有信心，就应拿出严肃、负责任的态度对此做出回应。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:刘欢】 </span></div></div>\n</p></div>', '2023-09-18 13:50:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10246, '中国大使在联合国人权理事会谴责日本向海洋排放核污染水侵犯人权', '<div class=\"left_zw\">\n<p>　　中新社日内瓦9月14日电 中国常驻联合国日内瓦办事处和瑞士其他国际组织代表陈旭14日在联合国人权理事会与享有安全饮用水和卫生设施人权问题特别报告员互动对话时发言，指出日本政府单方面强行启动福岛核污染水排海，严重侵犯太平洋沿岸国家乃至全球人民的健康权、发展权和环境权，其正当性、合法性、安全性一直受到国际社会质疑，并遭到日本、韩国等国内民众强烈反对。</p>\n<p>　　陈旭指出，如果福岛核污染水是安全的，就没有必要排海；如果不安全，就更不应该排海。中方呼吁联合国人权理事会对这一问题加大关注，敦促日方立即停止排海行为。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:于晓】 </span></div></div>\n</div>', '2023-09-15 06:36:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10247, '中国代表：缺乏诚信的东电、一意孤行的日本， 必须受到严格国际监督', '<div class=\"left_zw\">\n<p>　　中新社柏林9月12日电 维也纳消息：当地时间11日，国际原子能机构九月理事会在维也纳国际中心开幕。中国常驻维也纳联合国和其他国际组织代表李松在会上严厉抨击日本单方面启动福岛核污染水排海，严正敦促日方接受严格国际监督。针对日方代表狡辩，李松行使答辩权，予以严辞驳斥。</p>\n<p>　　李松指出，福岛核污染水排海是重大核安全问题，具有跨国界、长期深远的影响，绝不是日本一家的私事。12年前发生的福岛核事故已经造成严重灾难。日本有责任、有义务以最负责任、最安全、最稳妥的方式处置福岛核污染水，避免给海洋环境和世界各国人民造成二次伤害。排海并非处置福岛核污染水的唯一选项，更不是最安全、最负责任的选项。</p>\n<div><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/ypt/2023/230912/7935902d-c957-4518-80cf-7fe8da2d1c56_zsite.jpeg\" style=\"display: block; margin: auto; cursor: pointer;\"/></div>\n\n<p>　　李松强调，国际原子能机构应日方要求对福岛核污染水排海活动进行安全评估属于技术援助和咨询评估性质，不具有国际法效力。机构评估报告的内容和结论未经技术工作组协商一致。机构总干事在评估报告中明确指出，这个评估报告既不是对日方排海政策的推荐，也不是为其背书。日方大肆利用机构评估报告，强行启动排海行动，严重损害机构权威和公信力，严重损害日本周边国家人民健康和海洋环境权益，严重损害全球核能事业安全与发展利益。</p>\n<p>　　李松进一步指出，在日方单方面启动排海情况下，国际原子能机构非常有必要建立长期有效、不受日方控制的国际监测机制。缺乏诚信的东电，一意孤行的日本，必须受到严格国际监督。机构在日方排海阶段进行公正、独立和客观的安全评估，应该建立在机构成员国主导、参与和定期审议基础上。</p>\n<p>　　日本代表狡辩称，中方发表的上述言论是政治化、情绪化的；日方经过“多核素处理系统”(ALPS)净化的“处理水”安全无害，与核电站正常运行排水并无不同；日方排海方案科学合理，处理过程向国际社会保持公开、透明。</p>\n<p>　　李松行使答辩权，对日方予以严厉驳斥。他指出，日方启动排海前后，本国及周边邻国民众群情激奋。日方对此充耳不闻，一味将排海决定强加给国际社会，并想方设法为自己开脱洗白，这才是彻头彻尾的政治化。日方将核事故产生的核污染水与世界各国核电站正常运行中产生的核废水混为一谈，完全背离核安全科学常识。</p>\n<p>　　李松援引美国《科学》杂志9月1日发表的最新文章，批驳日方关于“稀释是解决污染的有效方法”论调，指出无论日方如何辩白，都改变不了福岛核污染水中大量有害核素被排入大海、可能给海洋环境和人类健康造成不可预测危害的事实。日本如果真的在福岛核污染水处置问题上采取最透明、最科学态度，就应该以最开放、最合作的态度，与利益攸关国家进行充分、有意义的协商，高度重视各方关切和意见，作出有诚意、真正基于科学取信国际社会的交代，而不是继续淡化、掩盖核污染水排海的危害。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:陈彩霞】 </span></div></div>\n</div>', '2023-09-12 08:19:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10248, '日本7800吨核污水全部排入海洋 第二批已在路上！', '<div class=\"left_zw\">\n<p>　　中新网9月11日电(张奥林) 当地时间11日下午，日本福岛核电站第一批次的核污染水全部排出，意味着约7800吨的核污染水已经流入太平洋。</p>\n<p>　　排污开始后，核污染水储存系统曾一度响起警报，设备安全性再度引发担忧；对于福岛渔民来说，身处“至暗时刻”的他们，看不到一丝希望。而这幕后的始作俑者——日本政府和东京电力公司，正在错误的道路上越走越远。</p>\n<div style=\"text-align:center\"><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/cmshd/2023/09/11/7458eb8ac99f45a58bb87f463a1c7781.jpg\" style=\"border:0px solid #000000\"/></div>\n\n<p>　　<strong>下一个“7800吨”，已在路上</strong></p>\n<p>　　东京电力公司的消息称，从8月24日开始的第一批次排放，共排出经处理的核污染水7800吨。</p>\n<p>　　由于排污管道内会残留少量核污染水，东电在9月11日使用工业用水对排污管道进行了全面清洗，随后开始着手第二批次排污。</p>\n<p>　　据目前的消息，第二批次排污最早可能在9月底开始，排污量与第一次相同，仍为7800吨左右。</p>\n<p>　　按计划，2023年内，日本总共将分4次排出3.12万吨核污染水。有数据显示，在正式排污开始前，核污染水已存到了130万吨，要把核污染水全部排完，上述操作还将循环无数次，整个排污过程至少需要30年。</p>\n<div style=\"text-align:center\"><img alt=\"8月24日，远眺因海啸受损的福岛第一核电站。\" src=\"//image1.chinanews.com.cn/cnsupload/big/2023/08-24/4-426/75d1b803a1294478ad1b434f7203c26e.jpg\" title=\"8月24日，远眺因海啸受损的福岛第一核电站。\"><input id=\"75d1b803a1294478ad1b434f7203c26e\" name=\"75d1b803a1294478ad1b434f7203c26e\" type=\"hidden\"/></img></div>\n\n<p>　　<strong>核污水泄漏？一度响起警报</strong></p>\n<p>　　9月6日，就在核污染水排海过程中，核污染水储存设备的泄漏感应器报警，显示可能出现泄漏。东电随后进行紧急检查，最终确认没有出现漏水，判断可能是因雨水或露水导致感应器报警。</p>\n<p>　　尽管虚惊一场，但从日方宣布将进行核污染水排海开始，整个排污系统的安全问题就一直令人担忧。</p>\n<p>　　2023年6月，东电在福岛第一核电站核污染水储罐附近的雨水中，检测出浓度较平常更高的放射性物质，显示储水罐可能出现泄漏。</p>\n<div style=\"text-align:center\"><img alt=\"资料图：福岛第一核电站内的海水输送泵。图片来源：美联社\" src=\"//image1.chinanews.com.cn/cnsupload/big/2023/08-28/4-426/ab7caaae6e374d4681d8fcdb380f43c7.jpg\" title=\"资料图：福岛第一核电站内的海水输送泵。图片来源：美联社\"><input id=\"ab7caaae6e374d4681d8fcdb380f43c7\" name=\"ab7caaae6e374d4681d8fcdb380f43c7\" type=\"hidden\"/></img></div>\n\n<p>　　东电进行详细调查后发现，福岛核电站曾在6月将核污染水转移到其他储水罐，在作业中使用的软管出现4厘米左右裂缝，据此判断，核污染水在转移过程中确实发生了泄漏。</p>\n<p>　　不仅如此，韩国政府福岛核污水处理设施考察团在5月赴日实地考察时，更是获知福岛核电站的多核素处理系统(ALPS)在2013年至2022年间，共发生过8次故障，包括设备腐蚀、设备过滤器故障等。</p>\n<div style=\"text-align:center\"><img alt=\"8月24日，日本民众在位于东京千代田区的东京电力公司总部附近举行集会，强烈反对日本政府当天启动福岛核污染水排海作业。&lt;a target=\'_blank\' href=\'/\'&gt;中新社&lt;/a&gt;发 钟欣 摄\" src=\"//image1.chinanews.com.cn/cnsupload/big/2023/08-25/4-426/7215bf3066824ca6b445b6d7c840c7fb.jpg\" title=\"8月24日，日本民众在位于东京千代田区的东京电力公司总部附近举行集会，强烈反对日本政府当天启动福岛核污染水排海作业。&lt;a target=\'_blank\' href=\'/\'&gt;中新社&lt;/a&gt;发 钟欣 摄\"><input id=\"7215bf3066824ca6b445b6d7c840c7fb\" name=\"7215bf3066824ca6b445b6d7c840c7fb\" type=\"hidden\"/></img></div>\n\n<p>　　<strong>日本国内外反对声浪持续</strong></p>\n<p>　　核污染水开始排放后，福岛县磐城市的渔民志贺金三郎难掩失望，他表示，“我大半辈子都在捕鱼，从没像现在这样不甘心，真的很担心年轻人能否继续从事渔业。”</p>\n<p>　　日本全国渔业协会联合会(全渔联)也多次重申表示：“反对核污染水排海的立场，没有丝毫改变”。</p>\n<p>　　日本一个名为“反对核电站核污染水排海全国联络会”市民团体还在9月1日向东京地检提交检举信，指控日本首相岸田文雄和东电总裁小早川智明。</p>\n<p>　　该市民团体主张，即便用多核素处理系统净化后，核污染水内仍含有多种放射性物质，会对食用水产品的大量人群造成健康危害。该组织共同代表岩田薫表示，日本“采取的排海行为极为严重”。</p>\n<div style=\"text-align:center\"><img alt=\"资料图：韩国多个民间团体集会抗议日本核污染水排海决定。&lt;a target=\'_blank\' href=\'/\'&gt;中新社&lt;/a&gt;记者 刘旭 摄\" src=\"//image1.chinanews.com.cn/cnsupload/big/2023/08-23/4-426/a6700f912bee4d3e9cf090df70c8ff16.jpg\" title=\"资料图：韩国多个民间团体集会抗议日本核污染水排海决定。&lt;a target=\'_blank\' href=\'/\'&gt;中新社&lt;/a&gt;记者 刘旭 摄\"><input id=\"a6700f912bee4d3e9cf090df70c8ff16\" name=\"a6700f912bee4d3e9cf090df70c8ff16\" type=\"hidden\"/></img></div>\n\n<p>　　对于日方强行排污，国际社会的反对声浪同样在持续。</p>\n<p>　　9月2日下午，包括韩国最大在野党共同民主党在内的多个在野党，与90余个市民团体在首尔市中心再次举行大规模集会，参加人数约有5万人。抗议人群高举标语谴责日本，并敦促尹锡悦政府采取措施，阻止福岛核污染水排海。</p>\n<p>　　俄罗斯外交部发言人扎哈罗娃8月30日表示，日方声称福岛第一核电站排放的水可以安全饮用，但自己却出于某种原因拒绝这样做，她呼吁日方在这一敏感问题上，“最大限度地展现透明度”。</p>\n<p>　　中国外交部发言人汪文斌9月1日也指出，如何处置核污染水，绝不是日本一家私事，也不仅仅是个别国家之间的事，而是事关污染海洋还是保护海洋、破坏环境还是呵护环境、危害人类健康还是维护人类健康的重大问题。</p>\n<p>　　汪文斌还强调，在这个问题上，日本需要面对的，不是哪一个国家，而是整个国际社会。日方应正视周边邻国和国际社会关切，立即停止向全球转嫁核污染风险，不要站在整个国际社会的对立面，否则必将为此承担长远的道义和法律责任。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:孔庆玲】 </span></div></div>\n</div>', '2023-09-11 13:43:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10249, '日本民众提起诉讼要求停止核污染水排海', '<div class=\"left_zw\">\n<p>　　中新社东京9月8日电 据日本时事通信社报道，约150名日本民众8日向福岛地方法院提起诉讼，要求日本政府和东京电力公司停止核污染水排海。</p>\n<p>　　据报道，福岛、宫城、岩手、茨城、千叶、东京、新潟等地居民及渔业从业者约150人，当日起诉日本政府和东电公司，要求停止核污染水排海。报道称，这是日本首起有关叫停核污染水排海的集体诉讼。</p>\n<p>　　据日本共同社报道，提起诉讼的日本民众在起诉书中称，核污染水排海侵犯了民众平稳生活的权利，渔业从业者维系生计面临困难。要求日本原子能规制委员会取消排海许可，禁止东电公司继续将核污染水排放入海。据福岛中央电视台报道，起诉书称，“实施故意污染环境的行为是违法行为，不能容许”。</p>\n<p>　　据日本时事通信社报道，东电公司7日表示，第一轮排放的核污染水总计约7800吨，截至6日已排放约6100吨，预计首批核污染水将于10日下午全部排放。报道称，第二轮排放的核污染水预计总量同样为7800吨，东电公司将于本月下旬公布具体排放计划。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:张乃月】 </span></div></div>\n</p></div>', '2023-09-08 20:35:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10250, '中国驻日本使馆发言人就福岛核污染水排海有关报道答记者问', '<div class=\"left_zw\">\n<p>　　中新社东京9月7日电  中国驻日本使馆发言人7日就福岛核污染水排海有关报道答记者问。</p>\n<p>　　有记者问，日前有媒体报称，中方拒绝加入国际原子能机构(IAEA)关于福岛核污染水排海的国际监测机制，请问中方对此有何评论？</p>\n<p>　　发言人表示，这是虚假信息。事实是，日方委托IAEA秘书处对日方自己采集的核污染水样本进行过一次分析和实验室对比，但中方并未受邀参加。</p>\n<p>　　发言人指出，迄今福岛核污染水数据都是日方自行采样、检测和发布的，作为被监督者的日方充当起检测者，这样的数据当然无法获得国际社会信任。这种基于日方提供样本的实验室间对比活动，不能充分证明日方检测结果的真实可靠性，不能等同于利益攸关方实质参与、长期有效的国际监测机制。</p>\n<p>　　发言人说，中方并不拒绝对话，已明确提出应建立长期有效的国际监测机制。日方应首先展现解决邻国合理关切的诚意，而不将自身监测结果强加于人。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:田博群】 </span></div></div>\n</p></div>', '2023-09-08 00:52:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10251, '中国商务部回应日本向WTO提交书面文件：应反躬自省', '<div class=\"left_zw\">\n<p>　　中新社北京9月7日电 (记者 李晓喻)针对日本向世贸组织(WTO)提交书面文件，中国商务部新闻发言人何亚东7日称，日方应反躬自省，立即停止向全球转嫁核污染风险。</p>\n<p>　　日本政府无视国际社会的强烈质疑和反对，于8月24日单方面强行启动福岛核污染水排海。依据中国法律法规和世界贸易组织相关规定，中国海关总署决定自2023年8月24日(含)起全面暂停进口原产地为日本的水产品(含食用水生动物)。</p>\n<p>　　随后，日本外务省宣布，向WTO提交书面文件，称中方的进口管制措施“完全不可接受”。</p>\n<p>　　对此，何亚东在当天举行的新闻发布会上表示，中方已多次就日本福岛核污染水排海问题表明严正立场，并在WTO相关会议上和对日贸易政策审议中多次提出严重关切和质疑，但日本政府仍一意孤行，单方面强行启动核污染水排海。中方依据中国法律法规以及WTO相关规定采取紧急贸易措施，完全正当、合理、必要。日方应立即纠正错误行径，切实回应国际社会关切。</p>\n<p>　　何亚东称，该书面文件是日方向WTO下属的卫生与植物卫生措施委员会提交的一份工作文件。该文件重复了日方在委员会上的一贯论调。</p>\n<p>　　他表示，中方始终支持以WTO为核心的多边贸易体制，按照WTO规则行事。日方应反躬自省，立即停止向全球转嫁核污染风险。(完)<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:刘阳禾】 </span></div></div>\n</p></div>', '2023-09-07 21:20:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10252, '商务部：中方采取紧急贸易措施，完全正当、合理、必要', '<div class=\"left_zw\">\n<p>　　中新网9月7日电 日本外务省4日宣布，已向世界贸易组织(WTO)提交书面文件，称中方在日本启动处理水排海后宣布的进口管制措施“完全不可接受”。对此，商务部新闻发言人何亚东在7日的例行新闻发布会上进行了回应。</p>\n<p>　　何亚东称，中方已多次就日本福岛核污染水排海问题表明严正立场，并在世贸组织相关会议上和对日贸易政策审议中多次提出严重关切和质疑，但日本政府仍一意孤行，单方面强行启动核污染水排海。中方依据中国法律法规以及世贸组织相关规定采取紧急贸易措施，完全正当、合理、必要。日方应立即纠正错误行径，切实回应国际社会关切。</p>\n<p>　　何亚东表示，中方注意到该书面文件，这是日方向世贸组织下属的卫生与植物卫生委员会提交的一份工作文件。该文件重复了日方在委员会上的一贯论调。中方始终支持以世贸组织为核心的多边贸易体制，按照世贸组织规则行事。日方应反躬自省，立即停止向全球转嫁核污染风险。<div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:李太源】 </span></div></div>\n</p></div>', '2023-09-07 17:05:00','中国新闻网');
INSERT INTO `cov_news` (id,title,summary,pubDate,infoSource) VALUES (10253, '台民间团体集会 抗议日本执意将核污染水排放入海', '<div class=\"left_zw\">\n<p>　　中新网台北9月6日电  台湾数十个政党和团体组成的反“台独”反介入联合行动9月6日在台北集会，抗议日本将核污染水排入海洋，要求民进党当局严禁从日本核污染地区进口食物。</p>\n<p>　　主办方在抗议声明中指出，日本政府和东京电力公司不顾全世界的强烈反对，8月24日开始执意将核污染水排放入海，污染全球海洋生态，严重危及人类的生存权及食品健康安全。这一核污染水排海计划，是漠视世界人权的反文明蛮横作为。民进党政府未曾做出抗议，还为日本恶劣行径辩护、对日本核污染地区食物敞开进口大门。</p>\n<p>　　面对长期的风险及危害，主办方呼吁台湾民众联合起来，以行动抗议日本政府罔顾人权的核污染水排海劣行，反对民进党当局的错误行径，严禁日本核污染地区食物进口。</p>\n<div><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/ypt/2023/230906/f9afcfd2-3a9a-4624-96b4-cacbe1c6af9b_zsite.jpg\" style=\"display: block; margin: auto; cursor: pointer;\"/></div>\n\n<p>　　台湾《观察》杂志发行人纪欣在致词时表示，这次日本不顾其国内民众的反对，不顾亚洲邻居的反对，不顾对于人类健康的义务，执意排放核污染水，让人感到不可思议。</p>\n<p>　　夏潮联合会秘书长林声洲表示，福岛核泄漏事故发生十余年来，日本政府从来没有决心和能力处理这一危机，将核污染水直接排海体现其一贯的不负责任态度、把风险丢给全世界人民承担。我们提出严正抗议，并将联合台湾社会各界一起反对。</p>\n<p>　　台湾劳动党主席吴荣元代表各政党、团体向民进党当局食品安全办公室官员递交抗议信，并表示将跟踪当局“食品安全会报”相关工作进度，如果没有就禁止从日本核污染地区进口食物作出政策性规划，将继续采取抗议行动。</p>\n<div><img alt=\"\" src=\"//i2.chinanews.com.cn/simg/ypt/2023/230906/1430d083-0a9f-4a6a-aff0-e114d9085d05_zsite.jpg\" style=\"display: block; margin: auto; cursor: pointer;\"/></div>\n\n<p>　　当天还有若干反核团体在台北举行另一场抗议活动，有团体代表指出，核灾事故后受污染的水稀释后排放入海是便宜行事的做法，将其后遗症转移到太平洋更是不负责任的行为，近期还将举办活动、继续表达反对诉求。(完)</p><div class=\"adEditor\"><div class=\"left_name right\"> <span>【编辑:刘欢】 </span></div></div>\n</div>', '2023-09-06 18:42:00','中国新闻网');

-- ----------------------------
-- Table structure for `covid_map`
-- ----------------------------
DROP TABLE IF EXISTS `covid_map`;
CREATE TABLE `covid_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `date` date NOT NULL,
  `placename` varchar(255) NOT NULL,
  `confirm` int(11) DEFAULT '0',
  `cured` int(11) DEFAULT '0',
  `death` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5157 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of covid_map
-- ----------------------------
INSERT INTO `covid_map` VALUES ('4978', '1', '2020-06-13', '阿富汗\n', '0', '0', '0');
INSERT INTO `covid_map` VALUES ('4979', '2', '2020-06-13', '安哥拉\n', '0', '0', '5');
INSERT INTO `covid_map` VALUES ('4980', '3', '2020-06-13', '阿尔巴尼亚\n', '1385', '0', '35');
INSERT INTO `covid_map` VALUES ('4981', '4', '2020-06-13', '阿拉伯联合酋长国\n', '40986', '0', '286');
INSERT INTO `covid_map` VALUES ('4982', '5', '2020-06-13', '阿根廷\n', '27373', '0', '765');
INSERT INTO `covid_map` VALUES ('4983', '6', '2020-06-13', '亚美尼亚\n', '14669', '0', '245');
INSERT INTO `covid_map` VALUES ('4984', '7', '2020-06-13', '法属南部群岛\n', '1', '0', '0');
INSERT INTO `covid_map` VALUES ('4985', '8', '2020-06-13', '澳大利亚\n', '7289', '0', '102');
INSERT INTO `covid_map` VALUES ('4986', '9', '2020-06-13', '奥地利\n', '17034', '0', '674');
INSERT INTO `covid_map` VALUES ('4987', '10', '2020-06-13', '阿塞拜疆\n', '8882', '0', '108');
INSERT INTO `covid_map` VALUES ('4988', '11', '2020-06-13', '布隆迪\n', '85', '0', '1');
INSERT INTO `covid_map` VALUES ('4989', '12', '2020-06-13', '比利时\n', '59711', '0', '9636');
INSERT INTO `covid_map` VALUES ('4990', '13', '2020-06-13', '贝宁\n', '305', '0', '4');
INSERT INTO `covid_map` VALUES ('4991', '14', '2020-06-13', '布吉纳法索\n', '892', '0', '53');
INSERT INTO `covid_map` VALUES ('4992', '15', '2020-06-13', '孟加拉国\n', '78052', '0', '1049');
INSERT INTO `covid_map` VALUES ('4993', '16', '2020-06-13', '保加利亚\n', '3086', '0', '168');
INSERT INTO `covid_map` VALUES ('4994', '17', '2020-06-13', '巴哈马群岛\n', '103', '0', '11');
INSERT INTO `covid_map` VALUES ('4995', '18', '2020-06-13', '波斯尼亚和黑塞哥维那\n', '2832', '0', '161');
INSERT INTO `covid_map` VALUES ('4996', '19', '2020-06-13', '白俄罗斯\n', '51816', '0', '293');
INSERT INTO `covid_map` VALUES ('4997', '20', '2020-06-13', '伯利兹\n', '20', '0', '2');
INSERT INTO `covid_map` VALUES ('4998', '21', '2020-06-13', '百慕大\n', '141', '0', '9');
INSERT INTO `covid_map` VALUES ('4999', '22', '2020-06-13', '玻利维亚\n', '16165', '0', '533');
INSERT INTO `covid_map` VALUES ('5000', '23', '2020-06-13', '巴西\n', '802828', '0', '40919');
INSERT INTO `covid_map` VALUES ('5001', '24', '2020-06-13', '文莱\n', '141', '0', '2');
INSERT INTO `covid_map` VALUES ('5002', '25', '2020-06-13', '不丹\n', '62', '0', '0');
INSERT INTO `covid_map` VALUES ('5003', '26', '2020-06-13', '博茨瓦纳\n', '48', '0', '1');
INSERT INTO `covid_map` VALUES ('5004', '27', '2020-06-13', '中非共和国\n', '1952', '0', '5');
INSERT INTO `covid_map` VALUES ('5005', '28', '2020-06-13', '加拿大\n', '99159', '0', '8071');
INSERT INTO `covid_map` VALUES ('5006', '29', '2020-06-13', '瑞士\n', '31044', '0', '1937');
INSERT INTO `covid_map` VALUES ('5007', '30', '2020-06-13', '智利\n', '154092', '0', '2648');
INSERT INTO `covid_map` VALUES ('5008', '31', '2020-06-13', '中国\n', '84216', '0', '4638');
INSERT INTO `covid_map` VALUES ('5009', '32', '2020-06-13', '科特迪瓦\n', '4404', '0', '41');
INSERT INTO `covid_map` VALUES ('5010', '33', '2020-06-13', '喀麦隆\n', '8681', '0', '212');
INSERT INTO `covid_map` VALUES ('5011', '34', '2020-06-13', '刚果民主共和国\n', '4515', '0', '98');
INSERT INTO `covid_map` VALUES ('5012', '35', '2020-06-13', '刚果共和国\n', '728', '0', '24');
INSERT INTO `covid_map` VALUES ('5013', '36', '2020-06-13', '哥伦比亚\n', '43810', '0', '1505');
INSERT INTO `covid_map` VALUES ('5014', '37', '2020-06-13', '哥斯达黎加\n', '1538', '0', '12');
INSERT INTO `covid_map` VALUES ('5015', '38', '2020-06-13', '古巴\n', '2219', '0', '84');
INSERT INTO `covid_map` VALUES ('5016', '39', '2020-06-13', '北塞浦路斯\n', '0', '0', '0');
INSERT INTO `covid_map` VALUES ('5017', '40', '2020-06-13', '塞浦路斯\n', '975', '0', '18');
INSERT INTO `covid_map` VALUES ('5018', '41', '2020-06-13', '捷克共和国\n', '9855', '0', '328');
INSERT INTO `covid_map` VALUES ('5019', '42', '2020-06-13', '德国\n', '186691', '0', '8772');
INSERT INTO `covid_map` VALUES ('5020', '43', '2020-06-13', '吉布提\n', '4398', '0', '37');
INSERT INTO `covid_map` VALUES ('5021', '44', '2020-06-13', '丹麦\n', '12222', '0', '593');
INSERT INTO `covid_map` VALUES ('5022', '45', '2020-06-13', '多米尼加共和国\n', '21455', '0', '561');
INSERT INTO `covid_map` VALUES ('5023', '46', '2020-06-13', '阿尔及利亚\n', '10589', '0', '741');
INSERT INTO `covid_map` VALUES ('5024', '47', '2020-06-13', '厄瓜多尔\n', '44440', '0', '3720');
INSERT INTO `covid_map` VALUES ('5025', '48', '2020-06-13', '埃及\n', '39726', '0', '1377');
INSERT INTO `covid_map` VALUES ('5026', '49', '2020-06-13', '厄立特里亚\n', '41', '0', '0');
INSERT INTO `covid_map` VALUES ('5027', '50', '2020-06-13', '西班牙\n', '242707', '0', '27136');
INSERT INTO `covid_map` VALUES ('5028', '51', '2020-06-13', '爱沙尼亚\n', '1965', '0', '69');
INSERT INTO `covid_map` VALUES ('5029', '52', '2020-06-13', '埃塞俄比亚\n', '2670', '0', '40');
INSERT INTO `covid_map` VALUES ('5030', '53', '2020-06-13', '芬兰\n', '7064', '0', '325');
INSERT INTO `covid_map` VALUES ('5031', '54', '2020-06-13', '斐济\n', '18', '0', '0');
INSERT INTO `covid_map` VALUES ('5032', '55', '2020-06-13', '福克兰群岛\n', '13', '0', '0');
INSERT INTO `covid_map` VALUES ('5033', '56', '2020-06-13', '法国\n', '191554', '0', '29347');
INSERT INTO `covid_map` VALUES ('5034', '57', '2020-06-13', '加蓬\n', '3463', '0', '23');
INSERT INTO `covid_map` VALUES ('5035', '58', '2020-06-13', '英国\n', '292706', '0', '41355');
INSERT INTO `covid_map` VALUES ('5036', '59', '2020-06-13', '乔治亚州\n', '831', '0', '13');
INSERT INTO `covid_map` VALUES ('5037', '60', '2020-06-13', '加纳\n', '10358', '0', '48');
INSERT INTO `covid_map` VALUES ('5038', '61', '2020-06-13', '几内亚\n', '4372', '0', '23');
INSERT INTO `covid_map` VALUES ('5039', '62', '2020-06-13', '冈比亚\n', '28', '0', '1');
INSERT INTO `covid_map` VALUES ('5040', '63', '2020-06-13', '几内亚比绍\n', '1389', '0', '12');
INSERT INTO `covid_map` VALUES ('5041', '64', '2020-06-13', '赤道几内亚\n', '1306', '0', '12');
INSERT INTO `covid_map` VALUES ('5042', '65', '2020-06-13', '希腊\n', '3088', '0', '183');
INSERT INTO `covid_map` VALUES ('5043', '66', '2020-06-13', '格陵兰岛\n', '13', '0', '0');
INSERT INTO `covid_map` VALUES ('5044', '67', '2020-06-13', '危地马拉\n', '8561', '0', '334');
INSERT INTO `covid_map` VALUES ('5045', '68', '2020-06-13', '法属圭亚那\n', '917', '0', '2');
INSERT INTO `covid_map` VALUES ('5046', '69', '2020-06-13', '圭亚那\n', '158', '0', '12');
INSERT INTO `covid_map` VALUES ('5047', '70', '2020-06-13', '洪都拉斯\n', '7669', '0', '294');
INSERT INTO `covid_map` VALUES ('5048', '71', '2020-06-13', '克罗地亚\n', '2249', '0', '106');
INSERT INTO `covid_map` VALUES ('5049', '72', '2020-06-13', '海地\n', '3941', '0', '64');
INSERT INTO `covid_map` VALUES ('5050', '73', '2020-06-13', '匈牙利\n', '4039', '0', '553');
INSERT INTO `covid_map` VALUES ('5051', '74', '2020-06-13', '印尼\n', '35295', '0', '2000');
INSERT INTO `covid_map` VALUES ('5052', '75', '2020-06-13', '印度\n', '297535', '0', '8498');
INSERT INTO `covid_map` VALUES ('5053', '76', '2020-06-13', '爱尔兰\n', '25238', '0', '1703');
INSERT INTO `covid_map` VALUES ('5054', '77', '2020-06-13', '伊朗\n', '180156', '0', '8584');
INSERT INTO `covid_map` VALUES ('5055', '78', '2020-06-13', '伊拉克\n', '16675', '0', '457');
INSERT INTO `covid_map` VALUES ('5056', '79', '2020-06-13', '冰岛\n', '1807', '0', '10');
INSERT INTO `covid_map` VALUES ('5057', '80', '2020-06-13', '以色列\n', '18569', '0', '300');
INSERT INTO `covid_map` VALUES ('5058', '81', '2020-06-13', '意大利\n', '236142', '0', '34167');
INSERT INTO `covid_map` VALUES ('5059', '82', '2020-06-13', '牙买加\n', '611', '0', '10');
INSERT INTO `covid_map` VALUES ('5060', '83', '2020-06-13', '约旦\n', '890', '0', '9');
INSERT INTO `covid_map` VALUES ('5061', '84', '2020-06-13', '日本\n', '17187', '0', '922');
INSERT INTO `covid_map` VALUES ('5062', '85', '2020-06-13', '哈萨克斯坦\n', '13872', '0', '67');
INSERT INTO `covid_map` VALUES ('5063', '86', '2020-06-13', '肯尼亚\n', '3215', '0', '92');
INSERT INTO `covid_map` VALUES ('5064', '87', '2020-06-13', '吉尔吉斯斯坦\n', '2166', '0', '26');
INSERT INTO `covid_map` VALUES ('5065', '88', '2020-06-13', '柬埔寨\n', '126', '0', '0');
INSERT INTO `covid_map` VALUES ('5066', '89', '2020-06-13', '韩国\n', '12003', '0', '277');
INSERT INTO `covid_map` VALUES ('5067', '90', '2020-06-13', '科索沃\n', '1326', '0', '31');
INSERT INTO `covid_map` VALUES ('5068', '91', '2020-06-13', '科威特\n', '34432', '0', '279');
INSERT INTO `covid_map` VALUES ('5069', '92', '2020-06-13', '老挝\n', '19', '0', '0');
INSERT INTO `covid_map` VALUES ('5070', '93', '2020-06-13', '黎巴嫩\n', '1402', '0', '31');
INSERT INTO `covid_map` VALUES ('5071', '94', '2020-06-13', '利比里亚\n', '410', '0', '31');
INSERT INTO `covid_map` VALUES ('5072', '95', '2020-06-13', '利比亚\n', '393', '0', '5');
INSERT INTO `covid_map` VALUES ('5073', '96', '2020-06-13', '斯里兰卡\n', '1877', '0', '11');
INSERT INTO `covid_map` VALUES ('5074', '97', '2020-06-13', '莱索托\n', '4', '0', '0');
INSERT INTO `covid_map` VALUES ('5075', '98', '2020-06-13', '立陶宛\n', '1752', '0', '74');
INSERT INTO `covid_map` VALUES ('5076', '99', '2020-06-13', '卢森堡\n', '4052', '0', '110');
INSERT INTO `covid_map` VALUES ('5077', '100', '2020-06-13', '拉脱维亚\n', '1094', '0', '26');
INSERT INTO `covid_map` VALUES ('5078', '101', '2020-06-13', '摩洛哥\n', '8537', '0', '211');
INSERT INTO `covid_map` VALUES ('5079', '102', '2020-06-13', '摩尔多瓦\n', '10727', '0', '375');
INSERT INTO `covid_map` VALUES ('5080', '103', '2020-06-13', '马达加斯加\n', '1203', '0', '10');
INSERT INTO `covid_map` VALUES ('5081', '104', '2020-06-13', '墨西哥\n', '133974', '0', '15944');
INSERT INTO `covid_map` VALUES ('5082', '105', '2020-06-13', '马其顿\n', '3538', '0', '169');
INSERT INTO `covid_map` VALUES ('5083', '106', '2020-06-13', '马里\n', '1722', '0', '97');
INSERT INTO `covid_map` VALUES ('5084', '107', '2020-06-13', '马耳他\n', '640', '0', '9');
INSERT INTO `covid_map` VALUES ('5085', '108', '2020-06-13', '缅甸\n', '260', '0', '6');
INSERT INTO `covid_map` VALUES ('5086', '109', '2020-06-13', '黑山共和国\n', '324', '0', '9');
INSERT INTO `covid_map` VALUES ('5087', '110', '2020-06-13', '蒙古\n', '197', '0', '0');
INSERT INTO `covid_map` VALUES ('5088', '111', '2020-06-13', '莫桑比克\n', '489', '0', '2');
INSERT INTO `covid_map` VALUES ('5089', '112', '2020-06-13', '毛利塔尼亚\n', '1439', '0', '74');
INSERT INTO `covid_map` VALUES ('5090', '113', '2020-06-13', '马拉维\n', '481', '0', '4');
INSERT INTO `covid_map` VALUES ('5091', '114', '2020-06-13', '马来西亚\n', '8369', '0', '118');
INSERT INTO `covid_map` VALUES ('5092', '115', '2020-06-13', '纳米比亚\n', '31', '0', '0');
INSERT INTO `covid_map` VALUES ('5093', '116', '2020-06-13', '新喀里多尼亚\n', '21', '0', '0');
INSERT INTO `covid_map` VALUES ('5094', '117', '2020-06-13', '尼日尔\n', '974', '0', '65');
INSERT INTO `covid_map` VALUES ('5095', '118', '2020-06-13', '尼日利亚\n', '14554', '0', '387');
INSERT INTO `covid_map` VALUES ('5096', '119', '2020-06-13', '尼加拉瓜\n', '1464', '0', '55');
INSERT INTO `covid_map` VALUES ('5097', '120', '2020-06-13', '荷兰\n', '48458', '0', '6063');
INSERT INTO `covid_map` VALUES ('5098', '121', '2020-06-13', '挪威\n', '8608', '0', '242');
INSERT INTO `covid_map` VALUES ('5099', '122', '2020-06-13', '尼泊尔\n', '4614', '0', '15');
INSERT INTO `covid_map` VALUES ('5100', '123', '2020-06-13', '新西兰\n', '1504', '0', '22');
INSERT INTO `covid_map` VALUES ('5101', '124', '2020-06-13', '阿曼\n', '19954', '0', '89');
INSERT INTO `covid_map` VALUES ('5102', '125', '2020-06-13', '巴基斯坦\n', '125933', '0', '2463');
INSERT INTO `covid_map` VALUES ('5103', '126', '2020-06-13', '巴拿马\n', '18586', '0', '418');
INSERT INTO `covid_map` VALUES ('5104', '127', '2020-06-13', '秘鲁\n', '214788', '0', '6088');
INSERT INTO `covid_map` VALUES ('5105', '128', '2020-06-13', '菲律宾\n', '24175', '0', '1036');
INSERT INTO `covid_map` VALUES ('5106', '129', '2020-06-13', '巴布新几内亚\n', '8', '0', '0');
INSERT INTO `covid_map` VALUES ('5107', '130', '2020-06-13', '波兰\n', '28201', '0', '1215');
INSERT INTO `covid_map` VALUES ('5108', '131', '2020-06-13', '波多黎各\n', '0', '0', '0');
INSERT INTO `covid_map` VALUES ('5109', '132', '2020-06-13', '朝鲜\n', '0', '0', '0');
INSERT INTO `covid_map` VALUES ('5110', '133', '2020-06-13', '葡萄牙\n', '35910', '0', '1504');
INSERT INTO `covid_map` VALUES ('5111', '134', '2020-06-13', '巴拉圭\n', '1230', '0', '11');
INSERT INTO `covid_map` VALUES ('5112', '135', '2020-06-13', '卡塔尔\n', '75071', '0', '69');
INSERT INTO `covid_map` VALUES ('5113', '136', '2020-06-13', '罗马尼亚\n', '21182', '0', '1369');
INSERT INTO `covid_map` VALUES ('5114', '137', '2020-06-13', '俄罗斯\n', '501800', '0', '6522');
INSERT INTO `covid_map` VALUES ('5115', '138', '2020-06-13', '卢旺达\n', '494', '0', '2');
INSERT INTO `covid_map` VALUES ('5116', '139', '2020-06-13', '西撒哈拉\n', '9', '0', '1');
INSERT INTO `covid_map` VALUES ('5117', '140', '2020-06-13', '沙特阿拉伯\n', '116021', '0', '857');
INSERT INTO `covid_map` VALUES ('5118', '141', '2020-06-13', '苏丹\n', '6730', '0', '413');
INSERT INTO `covid_map` VALUES ('5119', '142', '2020-06-13', '南苏丹\n', '1670', '0', '24');
INSERT INTO `covid_map` VALUES ('5120', '143', '2020-06-13', '塞内加尔\n', '4759', '0', '55');
INSERT INTO `covid_map` VALUES ('5121', '144', '2020-06-13', '所罗门群岛\n', '0', '0', '0');
INSERT INTO `covid_map` VALUES ('5122', '145', '2020-06-13', '塞拉利昂\n', '1085', '0', '50');
INSERT INTO `covid_map` VALUES ('5123', '146', '2020-06-13', '萨尔瓦多\n', '3373', '0', '68');
INSERT INTO `covid_map` VALUES ('5124', '147', '2020-06-13', '索马里兰\n', '2513', '0', '85');
INSERT INTO `covid_map` VALUES ('5125', '148', '2020-06-13', '索马里\n', '0', '0', '0');
INSERT INTO `covid_map` VALUES ('5126', '149', '2020-06-13', '塞尔维亚共和国\n', '12102', '0', '252');
INSERT INTO `covid_map` VALUES ('5127', '150', '2020-06-13', '苏里南\n', '168', '0', '2');
INSERT INTO `covid_map` VALUES ('5128', '151', '2020-06-13', '斯洛伐克\n', '1541', '0', '28');
INSERT INTO `covid_map` VALUES ('5129', '152', '2020-06-13', '斯洛文尼亚\n', '1488', '0', '109');
INSERT INTO `covid_map` VALUES ('5130', '153', '2020-06-13', '瑞典\n', '48288', '0', '4814');
INSERT INTO `covid_map` VALUES ('5131', '154', '2020-06-13', '斯威士兰\n', '0', '0', '0');
INSERT INTO `covid_map` VALUES ('5132', '155', '2020-06-13', '叙利亚\n', '164', '0', '6');
INSERT INTO `covid_map` VALUES ('5133', '156', '2020-06-13', '乍得\n', '848', '0', '72');
INSERT INTO `covid_map` VALUES ('5134', '157', '2020-06-13', '多哥\n', '524', '0', '13');
INSERT INTO `covid_map` VALUES ('5135', '158', '2020-06-13', '泰国\n', '3125', '0', '58');
INSERT INTO `covid_map` VALUES ('5136', '159', '2020-06-13', '塔吉克斯坦\n', '4834', '0', '49');
INSERT INTO `covid_map` VALUES ('5137', '160', '2020-06-13', '土库曼斯坦\n', '0', '0', '0');
INSERT INTO `covid_map` VALUES ('5138', '161', '2020-06-13', '东帝汶\n', '24', '0', '0');
INSERT INTO `covid_map` VALUES ('5139', '162', '2020-06-13', '特立尼达和多巴哥\n', '117', '0', '8');
INSERT INTO `covid_map` VALUES ('5140', '163', '2020-06-13', '突尼斯\n', '1087', '0', '49');
INSERT INTO `covid_map` VALUES ('5141', '164', '2020-06-13', '土耳其\n', '174023', '0', '4763');
INSERT INTO `covid_map` VALUES ('5142', '165', '2020-06-13', '中国台湾\n', '443', '0', '7');
INSERT INTO `covid_map` VALUES ('5143', '166', '2020-06-13', '坦桑尼亚联合共和国\n', '509', '0', '21');
INSERT INTO `covid_map` VALUES ('5144', '167', '2020-06-13', '乌干达\n', '679', '0', '0');
INSERT INTO `covid_map` VALUES ('5145', '168', '2020-06-13', '乌克兰\n', '29706', '0', '864');
INSERT INTO `covid_map` VALUES ('5146', '169', '2020-06-13', '乌拉圭\n', '847', '0', '23');
INSERT INTO `covid_map` VALUES ('5147', '170', '2020-06-13', '美国\n', '2023590', '0', '113823');
INSERT INTO `covid_map` VALUES ('5148', '171', '2020-06-13', '乌兹别克斯坦\n', '4741', '0', '19');
INSERT INTO `covid_map` VALUES ('5149', '172', '2020-06-13', '委内瑞拉\n', '2814', '0', '23');
INSERT INTO `covid_map` VALUES ('5150', '173', '2020-06-13', '越南\n', '332', '0', '0');
INSERT INTO `covid_map` VALUES ('5151', '174', '2020-06-13', '瓦努阿图\n', '0', '0', '0');
INSERT INTO `covid_map` VALUES ('5152', '175', '2020-06-13', '约旦河西岸与加沙地区\n', '487', '0', '3');
INSERT INTO `covid_map` VALUES ('5153', '176', '2020-06-13', '也门\n', '591', '0', '136');
INSERT INTO `covid_map` VALUES ('5154', '177', '2020-06-13', '南非\n', '58568', '0', '1284');
INSERT INTO `covid_map` VALUES ('5155', '178', '2020-06-13', '赞比亚\n', '63429', '0', '220');
INSERT INTO `covid_map` VALUES ('5156', '179', '2020-06-13', '津巴布韦\n', '1044', '0', '17');

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1587561487');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1587561498');
INSERT INTO `migration` VALUES ('m180628_144021_create_table_visitor', '1590677975');
INSERT INTO `migration` VALUES ('m180628_144042_create_table_visitor_log', '1590678493');
INSERT INTO `migration` VALUES ('m180628_144113_create_table_visitor_agent', '1590678728');
INSERT INTO `migration` VALUES ('m180628_144130_create_table_country', '1590678729');
INSERT INTO `migration` VALUES ('m180630_142222_create_table_visitor_service_error', '1590678729');
INSERT INTO `migration` VALUES ('m190124_110200_add_verification_token_column_to_user_table', '1587561499');
INSERT INTO `migration` VALUES ('m200424_120117_create_article_table', '1588648352');
INSERT INTO `migration` VALUES ('m200424_120247_create_category_table', '1588648352');
INSERT INTO `migration` VALUES ('m200424_120310_create_tag_table', '1588648352');
INSERT INTO `migration` VALUES ('m200424_120410_create_comment_table', '1588648353');
INSERT INTO `migration` VALUES ('m200424_120432_create_article_tag_table', '1588648354');
INSERT INTO `migration` VALUES ('m200502_141910_create_video_table', '1588648354');
INSERT INTO `migration` VALUES ('m200504_035720_create_video_view_table', '1588648355');
INSERT INTO `migration` VALUES ('m200504_041125_create_video_like_table', '1588648356');
INSERT INTO `migration` VALUES ('m200504_065820_create_subscriber_table', '1588648357');
INSERT INTO `migration` VALUES ('m200504_092524_create_fulltext_index_on_video', '1588648357');
INSERT INTO `migration` VALUES ('m200509_083851_add_date_to_comment', '1589013653');
INSERT INTO `migration` VALUES ('m200514_152015_covid_map', '1589470243');

-- ----------------------------
-- Table structure for `pcounter_save`
-- ----------------------------
DROP TABLE IF EXISTS `pcounter_save`;
CREATE TABLE `pcounter_save` (
  `save_name` varchar(10) NOT NULL,
  `save_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`save_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pcounter_save
-- ----------------------------
INSERT INTO `pcounter_save` VALUES ('counter', '12');
INSERT INTO `pcounter_save` VALUES ('day_time', '2459014');
INSERT INTO `pcounter_save` VALUES ('max_count', '5');
INSERT INTO `pcounter_save` VALUES ('max_time', '1591437600');
INSERT INTO `pcounter_save` VALUES ('yesterday', '1');

-- ----------------------------
-- Table structure for `pcounter_users`
-- ----------------------------
DROP TABLE IF EXISTS `pcounter_users`;
CREATE TABLE `pcounter_users` (
  `user_ip` varchar(32) NOT NULL,
  `user_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pcounter_users
-- ----------------------------
INSERT INTO `pcounter_users` VALUES ('111.74.54.135', '1592036408');
INSERT INTO `pcounter_users` VALUES ('127.0.0.1', '1592054027');
INSERT INTO `pcounter_users` VALUES ('::1', '1592018755');

-- ----------------------------
-- Table structure for `subscriber`
-- ----------------------------
DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-subscriber-channel_id` (`channel_id`),
  KEY `idx-subscriber-user_id` (`user_id`),
  CONSTRAINT `fk-subscriber-channel_id` FOREIGN KEY (`channel_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-subscriber-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of subscriber
-- ----------------------------

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tag
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(256) NOT NULL,
  `password_reset_token` varchar(256) DEFAULT NULL,
  `email` varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `video_id` int(16) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `tags` varchar(512) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `has_thumbnail` tinyint(1) DEFAULT NULL,
  `video_name` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  KEY `idx-video-created_by` (`created_by`),
  FULLTEXT KEY `title` (`title`,`description`,`tags`),
  CONSTRAINT `fk-video-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of video
-- ----------------------------

-- ----------------------------
-- Table structure for `video_like`
-- ----------------------------
DROP TABLE IF EXISTS `video_like`;
CREATE TABLE `video_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-video_like-video_id` (`video_id`),
  KEY `idx-video_like-user_id` (`user_id`),
  CONSTRAINT `fk-video_like-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-video_like-video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of video_like
-- ----------------------------

-- ----------------------------
-- Table structure for `video_view`
-- ----------------------------
DROP TABLE IF EXISTS `video_view`;
CREATE TABLE `video_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` varchar(16) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-video_view-video_id` (`video_id`),
  KEY `idx-video_view-user_id` (`user_id`),
  CONSTRAINT `fk-video_view-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-video_view-video_id` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of video_view
-- ----------------------------
INSERT INTO `video_view` VALUES ('90', 'PAnKGl9G', '2', '1591498574');
INSERT INTO `video_view` VALUES ('91', 'PAnKGl9G', '2', '1591498617');
INSERT INTO `video_view` VALUES ('92', 'PAnKGl9G', '2', '1591498634');
INSERT INTO `video_view` VALUES ('93', 'PAnKGl9G', '2', '1591498719');
INSERT INTO `video_view` VALUES ('94', 'PAnKGl9G', '2', '1591498738');
INSERT INTO `video_view` VALUES ('95', 'PAnKGl9G', null, '1591499455');
INSERT INTO `video_view` VALUES ('96', 'PAnKGl9G', '11', '1591499555');
INSERT INTO `video_view` VALUES ('97', 'PAnKGl9G', '11', '1591521725');
INSERT INTO `video_view` VALUES ('98', 'PAnKGl9G', '2', '1591585218');
INSERT INTO `video_view` VALUES ('99', 'PAnKGl9G', '2', '1591872749');
INSERT INTO `video_view` VALUES ('100', 'PAnKGl9G', null, '1592017355');