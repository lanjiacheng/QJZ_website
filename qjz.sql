-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2019-03-10 11:47:27
-- 服务器版本： 5.5.57-log
-- PHP Version: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qjz`
--

-- --------------------------------------------------------

--
-- 表的结构 `lecture`
--

CREATE TABLE IF NOT EXISTS `lecture` (
  `appid` varchar(10) NOT NULL,
  `title` varchar(40) NOT NULL,
  `detail` text NOT NULL,
  `max_peoples` int(11) NOT NULL DEFAULT '20',
  `current_peoples` int(11) NOT NULL DEFAULT '0',
  `grade` varchar(10) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `last_enroll_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lecture`
--

INSERT INTO `lecture` (`appid`, `title`, `detail`, `max_peoples`, `current_peoples`, `grade`, `create_time`, `update_time`, `last_enroll_time`, `delete_time`) VALUES
('111111', '【2016级讲座】【6号晚抢，7号晚听】标题标题', '地点：学术报告厅,时间xxxx，备注：xxxxx', 5, 5, '2016', '2018-12-06 00:00:00', '2018-12-11 05:39:36', '2018-12-09 20:30:00', '2018-12-11 05:39:36'),
('222222', '【2017级讲座】', '时间地点', 5, 1, '2017', '2018-12-06 21:47:55', '2018-12-11 05:39:20', '2018-12-07 18:41:00', '2018-12-11 05:39:20'),
('333333', '【2018级讲座】', '时间地点', 5, 0, '2018', '2018-12-06 21:49:16', '2018-12-11 05:39:16', '2018-12-07 00:00:00', '2018-12-11 05:39:16'),
('123457', '大标题7', '详细信息7', 3, 3, '2016', '2018-12-09 15:34:24', '2018-12-11 05:39:24', '2018-12-09 19:07:00', '2018-12-11 05:39:24'),
('234567', '【2017级讲座】【啥时候抢，啥时候听】', '在哪听，什么时候听？', 20, 1, '2017', '2018-12-09 19:09:31', '2018-12-11 05:39:33', '2018-12-10 18:20:00', '2018-12-11 05:39:33'),
('370768', '【2017级讲座】【12月11日（周二）12:10抢】', '《台湾的流行音乐和民歌音乐》<br/>\n时间：12月12日（周三）19:20—21:40<br/>\n地点：东区学术报告厅', 20, 1, '2017', '2018-12-11 05:50:56', '2018-12-12 08:49:52', '2018-12-11 11:55:00', '2018-12-12 08:49:52'),
('372536', '【2018级】12月12日（周三）18：20抢', '时间：12月13日（周四）晚上19:20-21:30<br/>\n地点：图书馆一楼视听室', 20, 11, '2018', '2018-12-12 08:47:14', '2018-12-13 07:58:55', '2018-12-12 18:05:00', '2018-12-13 07:58:55'),
('372514', '【2016级讲座】12月13日（周四）18:30开抢', '讲座时间：12月14日（周五）19:20-21：30<br/>\n地点：东区学术报告厅', 35, 31, '2016', '2018-12-13 07:56:23', '2018-12-17 17:41:13', '2018-12-13 18:15:00', '2018-12-17 17:41:13'),
('378160', '2016级', '时间：2018年12月18日（周二）19:20—21:30\n地点：东区学术报告厅', 30, 29, '2016', '2018-12-17 17:40:56', '2018-12-20 14:18:38', '2018-12-17 18:30:00', '2018-12-20 14:18:38'),
('380972', '【2016级】《秘书学专业的现状和发展》', '讲座时间：12月21日（周五）9:20-11：30<br/>\n地点：东区学术报告厅', 30, 16, '2016', '2018-12-20 14:18:26', '2018-12-24 03:58:56', '2018-12-20 18:20:00', NULL),
('399236', '【2015级】《重温毛泽东的战略战术思想》', '讲座时间：3月11日（周一）19:20—21:30\n讲座地点：东区学术报告厅\n报名时间：3月10日（周日）12：30\n抢座人数：528人', 10, 1, '2015', '2019-03-10 08:24:35', '2019-03-10 08:37:42', '2019-03-10 12:10:00', NULL),
('382686', '【2016级】《如何“写”论文到“写好”论文》', '开抢时间：12月24日（周一）18:30<br/>\n讲座时间：12月25日（周二）19:20-21:30<br/>\n地点：图书馆一楼视听室', 30, 27, '2016', '2018-12-24 04:04:55', '2019-02-24 20:52:20', '2019-02-25 18:20:00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `name` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `manager`
--

INSERT INTO `manager` (`name`, `password`, `create_time`, `update_time`, `delete_time`) VALUES
('ljc', 'ljc19980217.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `student_num` varchar(20) NOT NULL,
  `name` varchar(10) NOT NULL,
  `institute` varchar(20) NOT NULL,
  `class` varchar(10) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `account` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `appid` varchar(10) NOT NULL DEFAULT '暂无',
  `contact` varchar(20) NOT NULL DEFAULT '暂无',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`student_num`, `name`, `institute`, `class`, `sex`, `phone_num`, `account`, `password`, `grade`, `appid`, `contact`, `create_time`, `update_time`, `delete_time`) VALUES
('201712404129', '郑旭彤', '美术与设计学院', '环境171班', '女', '15577510217', '12732124', '707398zxt', '2017', '暂无', 'QQ1360192339', NULL, NULL, NULL),
('201714406201', '谭堃灏', '教育科学学院', '小教文17班', '男', '18877577216', '18877577216', 'q164530187', '2017', '暂无', 'QQ1558055105', NULL, '2018-12-11 05:57:00', NULL),
('201703402149', '刘露', '商学院', '经济17班', '女', '18878101830', '18878101830', 'll529425', '2017', '暂无', 'QQ1710829107', NULL, '2018-12-11 06:19:33', NULL),
('201707401251', '张庭锶', '物理与电信工程学院', '物本172班', '女', '17758521749', '14777622562', 'sr092855', '2017', '370768', 'QQ1432791919', NULL, '2018-12-11 11:18:00', NULL),
('201704406147', '邓美华', '外国语学院', '应英171班', '女', '18778518792', '18778518792', '1706112dmh', '2017', '暂无', 'QQ2302477166', NULL, NULL, NULL),
('201721401132', '劳思', '历史文化旅游学院', '历史2017班', '女', '13507776845', '13507776845', 'LS1790322984', '2017', '暂无', 'QQ1790322984', NULL, NULL, NULL),
('201721401150', '叶明红', '历史文化旅游学院', '历史2017班', '女', '18877578940', '18897705284', '705284a', '2017', '暂无', 'QQ1938443175', NULL, NULL, NULL),
('201709403146', '覃丽琳', '化食学院', '材化17班', '女', '18877533257', '18176107314', 'qwertyuiop755', '2017', '暂无', 'QQ2902395737', NULL, '2018-12-11 06:18:19', NULL),
('201714406216', '莫炜杰', '教育科学学院', '小教文17班', '女', '18249973105', '18249973105', 'aa123456', '2017', '暂无', 'QQ1558055105', NULL, NULL, NULL),
('201713404137', '黎书胜', '体育健康学院', '社体17班', '男', '13132769757', '13132769757', 'LSS577996', '2017', '暂无', 'QQ1904808952', NULL, NULL, NULL),
('201714410113', '莫伯荣', '教科院', '教技17班', '男', '13481547543', '13481547543', 'a13481564819', '2017', '暂无', 'QQ1329937230', NULL, NULL, NULL),
('201721401123', '黄冬梅', '历史文化旅游学院', '历史17班', '女', '18877740096', '18877740096', 'h18877740096', '2017', '暂无', 'QQ1872481296', NULL, NULL, NULL),
('201709401122', '覃静瑶', '化食院', '化本171班', '女', '13457986542', '13457986542', 'CXK13457986542', '2017', '暂无', 'QQ1667882757', NULL, '2018-12-11 06:20:14', NULL),
('201609401205', '黄丽娜同学', '化食院', '化本162班', '女', '17878190453', '17878190453', 'shmily123', '2016', '暂无', '微信p2833307353', NULL, NULL, NULL),
('201603402146', '陈丽同学2', '商学院', '经济2016班', '女', '17377084761', '17878192057', '10241314a', '2016', '382686', 'QQ2022156184', NULL, '2018-12-24 18:17:22', NULL),
('201613404129', '覃家益', '体育健康学院', '社体16班', '男', '15977299484', '15977299484', 'qinjiayi', '2016', '378160', 'QQ1778599428', NULL, '2018-12-17 17:46:29', NULL),
('201604404121', '钟建梅', '外国语学院', '应英164班', '女', '17878193621', '17878193621', '444827', '2016', '382686', 'QQ994291558', NULL, '2018-12-24 09:26:48', NULL),
('201613401342', '周宏祥', '体育健康学院', '体教163班', '男', '18577547550', '18577547550', 'z130191', '2016', '382686', 'QQ1805225501', NULL, '2018-12-24 10:22:24', NULL),
('201604404145', '罗娜', '外国语学院', '应英164班', '女', '19914977549', '13457515773', '13457515773lr', '2016', '382686', 'QQ2099342423', NULL, '2018-12-24 07:28:22', NULL),
('201612406103', '向睿', '美术与设计学院', '绘画16班', '女', '18677540816', '18677540816', 'bianhua,nhq', '2016', '382686', 'QQ929702557', NULL, '2018-12-24 10:14:35', NULL),
('201606401128', '黄卫正', '计算机科学与工程学院', '计161班', '男', '18888484056', '18888484056', '10987654321', '2016', '372514', 'NULL', NULL, '2018-12-13 13:51:59', NULL),
('201606401145', '刘洋', '计算机学院', '计161班', '男', '15078058164', '15078058164', '1136101706', '2016', '372514', 'NULL', NULL, '2018-12-13 13:50:41', NULL),
('201606401143', '陈章广', '计算机学院', '计算机161班', '男', '15077707972', '15077707972', 'qq15077511886', '2016', '372514', 'NULL', NULL, '2018-12-13 13:50:12', NULL),
('201606401127', '蓝佳铖', '计算机学院', '计算机161班', '男', '15723811766', '15723811766', 'ljc19980217.', '2016', '382686', 'NULL', NULL, '2019-02-24 20:51:48', NULL),
('201606401140', '李永森', '计算机学院', '计算机161班', '男', '18878146007', '18878146007', '13532563929', '2016', '378160', 'NULL', NULL, '2018-12-17 18:12:57', NULL),
('201606401144', '黄子然', '计算机学院', '计算机161班', '男', '18269235836', '18269235836', '7523688hzr', '2016', '378160', 'NULL', NULL, '2018-12-17 18:12:12', NULL),
('201606401107', '梁雯翔', '计算机学院', '计161班', '男', '18978599858', '18978599858', '1127jackson!', '2016', '382686', 'NULL', NULL, '2018-12-24 12:31:01', NULL),
('201604404130', '梁妃', '外国语学院', '应英164班', '女', '18894601058', '18894601058', '625136', '2016', '382686', 'QQ1962515136', NULL, '2018-12-24 04:21:14', NULL),
('201612401212', '龚婧', '美术与设计学院', '美本162班', '女', '15577097407', '15577097407', 'eyeyey2121', '2016', '378160', 'QQ767905945', NULL, '2018-12-17 17:48:59', NULL),
('201612401209', '覃镜蓉', '美术与设计学院', '美本162班', '女', '15678638748', '17878191674', 'klzs52519970308', '2016', '378160', 'QQ767905945', NULL, '2018-12-17 17:48:48', NULL),
('201612401214', '刘宣', '美术与设计学院', '美术学162班', '女', '15678677136', '17878191680', 'liuxuan123456', '2016', '378160', 'QQ767905945', NULL, '2018-12-17 17:49:21', NULL),
('201612401213', '刘袁溪', '美术与设计学院', '美本162班', '女', '15678693230', '15678693230', 'liuyuanxi7', '2016', '378160', 'QQ767905945', NULL, '2018-12-17 17:49:10', NULL),
('201607404120', '廖晓兰', '物理与电信工程学院', '光电16班', '女', '17878194206', '17878194206', 'liao000000', '2016', '380972', 'QQ1193415192', NULL, '2018-12-20 15:13:09', NULL),
('201604404102', '赵春兰', '外国语学院', '应英164班', '女', '13471108142', '13471108142', '627627', '2016', '382686', 'QQ1500442038', NULL, '2018-12-24 07:47:58', NULL),
('201413404125', '李受迎', '体育健康学院', '社体16班', '男', '13377426223', '13377426223', '957275600+li', '2016', '382686', 'QQ957275600', NULL, '2019-02-24 20:52:20', NULL),
('201621401132', '温敏杰', '历史文化旅游学院', '历史16班', '男', '18277241384', '18277241384', 'wmj123456', '2016', '382686', 'QQ1805225501', NULL, '2018-12-24 10:20:21', NULL),
('201604401211', '梁婷', '外国语学院', '英本162班', '女', '17878193352', '17878193352', '123456l', '2016', '暂无', 'QQ1805225501', NULL, NULL, NULL),
('201603402147', '陈丽', '商学院', '经济16班', '女', '15347887394', '15347887394', '15347887394cl', '2016', '382686', 'QQ2022156184', NULL, '2018-12-24 15:36:46', NULL),
('201614401203', '杨宗艳', '教育科学学院', '学前162班', '女', '17878191174', '17878191174', 'yzy980214', '2016', '372514', 'QQ1875655438', NULL, '2018-12-13 10:05:35', NULL),
('201604405126', '刘梅兰', '文学与传媒学院', '汉语言文学163班', '女', '15077579626', '15077579626', 'liumeilan1994', '2016', '382686', 'QQ2959981068', NULL, '2018-12-24 07:47:29', NULL),
('201614401235', '黄丽娜', '教育科学学院', '学前162班', '女', '15677174715', '15677174715', '13978608731', '2016', '暂无', '微信p2833307353', NULL, NULL, NULL),
('201609403152', '赵兴平', '化食院', '材化16班', '男', '18352850723', '18352850723', 'zxp83360486', '2016', '372514', 'QQ1048192866', NULL, '2018-12-13 08:13:32', NULL),
('201612401203', '王沁', '美术与设计学院', '美本162班', '女', '15677045228', '17878191667', 'yjwq9795', '2016', '暂无', 'QQ442383088', NULL, NULL, NULL),
('201613404135', '苏兴', '体育健康学院', '社体16班', '男', '18587788570', '18587788570', 'su123456', '2016', '372514', 'QQ1805225501', NULL, '2018-12-13 10:43:05', NULL),
('201614401205', '黄红丽', '教育科学学院', '学前162班', '女', '17878191176', '17878191176', 'hhl17878191176', '2016', '暂无', 'QQ1450422634', NULL, NULL, NULL),
('201614401228', '覃广林', '教育科学学院', '学前162班', '女', '18934766791', '13471221503', '13471221503', '2016', '暂无', 'QQ1356236453', NULL, NULL, NULL),
('201612405116', '周慧敏', '美术与设计学院', '服装16班', '女', '15850253058', '15850253058', 'zhm199810112044t', '2016', '382686', 'QQ442383088', NULL, '2018-12-24 08:15:46', NULL),
('201512404206', '许浩', '美设学院', '环境152', '男', '18877549540', '18877549540', 'xh18877549540', '2015', '399236', 'QQ740698626', NULL, '2019-03-10 08:37:22', NULL),
('201812401153', '张心悦', '美术与设计学院', '美术学2018班', '女', '18993044642', '18993044642', '0072911Y.', '2018', '暂无', 'QQ1185067494', NULL, NULL, NULL),
('201812401120', '陶嘉玲', '美术设计学院', '美术学2018班', '女', '13770410863', '13770410863', 'wktjl999', '2018', '暂无', 'QQ1023622073', NULL, NULL, NULL),
('201812401127', '姚秧秧', '美术与设计学院', '美术学2018班', '女', '13299442276', '13299442276', 'yyy112399', '2018', '暂无', 'QQ1171319618', NULL, NULL, NULL),
('201814401124', '李钰洪', '教育科学学院', '学前181班', '女', '18778934943', '18778934943', 'lyhlyh990710', '2018', '372536', 'QQ2992520426', NULL, '2018-12-12 13:17:25', NULL),
('201812401151', '贾慧波', '美术与设计学院', '美术学2018班', '女', '18235072823', '18235072823', 'jhb19990116', '2018', '372536', 'QQ1098438839', NULL, '2018-12-12 09:12:29', NULL),
('201812401119', '于颖睿', '美术与设计学院', '美本2018班', '女', '19914977729', '19914977729', '19990731crzx.', '2018', '372536', 'QQ1798965030', NULL, '2018-12-12 09:01:38', NULL),
('201812401163', '张夏添', '美术与设计学院', '美术学2018班', '女', '15297988518', '15297988518', '201812401163zxt', '2018', '372536', 'QQ944699292', NULL, '2018-12-12 09:01:03', NULL),
('201812401160', '何丹鹏', '美术与设计学院', '美术学2018班', '男', '18707082262', '18707082262', 'hedanpeng666', '2018', '暂无', 'QQ741953984', NULL, NULL, NULL),
('201814410141', '熊涵祺', '教育科学学院', '教技18班', '男', '18806854789', '18806854789', '1391180429xhq', '2018', '372536', 'QQ1391180429', NULL, '2018-12-12 09:28:49', NULL),
('201812401107', '石光璇', '美术与设计学院', '美术学2018班', '女', '18993574826', '18993574826', 'sgx0528112107', '2018', '372536', 'QQ1246039866', NULL, '2018-12-12 09:03:32', NULL),
('201812401159', '倪千越', '美术与设计学院', '美术学2018班', '女', '13906112054', '13906112054', '201812401159nqy', '2018', '372536', 'QQ1843485825', NULL, '2018-12-12 09:03:37', NULL),
('201802401120', '李晓晴', '政法学院', '思政181班', '女', '15177925545', '15177925545', '191215abc', '2018', '暂无', 'QQ826377657', NULL, NULL, NULL),
('201812401122', '吴尚耘', '美术与设计学院', '美术学2018班', '男', '16670253149', '16670253149', 'wsy991121', '2018', '372536', 'QQ1347858136', NULL, '2018-12-12 08:58:00', NULL),
('201812401108', '唐梓倩', '美术与设计学院', '美术学2018班', '女', '17677036648', '17677036648', 'tzq.555666', '2018', '暂无', 'QQ1090814631', NULL, NULL, NULL),
('222222222222', '蓝2', '学院2', '班级2', '男', '22222222222', '2', '2', '2016', '暂无', '2', '2018-12-10 11:27:32', '2018-12-10 11:28:13', '2018-12-10 11:28:13'),
('201812401109', '王立强', '美术与设计学院', '美术学2018班', '男', '18677878429', '18677878429', 'wang1999', '2018', '372536', 'QQ1347858136', '2018-12-12 09:47:35', '2018-12-12 09:51:08', NULL),
('201814410137', '郭志伟', '教育科学院', '教技18班', '男', '13299449318', '13299449318', 'gzw200033', '2018', '372536', 'QQ1973249916', '2018-12-12 17:30:19', '2018-12-12 17:32:53', NULL),
('201812401131', '张诗苒', '美术与设计学院', '美术学2018', '女', '13133488013', '21081372', '7608697', '2018', '372536', 'QQ1367940276', '2018-12-12 18:03:48', '2018-12-12 18:04:34', NULL),
('201604405121', '2016_018', '文学与传媒学院', '中文162班', '女', '18277445783', '18277445783', 'xxt2933049', '2016', '372514', 'QQ1575771671', '2018-12-13 07:29:01', '2018-12-13 11:33:24', NULL),
('201613401305', '马绍生', '体育健康学院', '体教163班', '男', '17377084677', '17377084677', 'm123456', '2016', '378160', 'QQ1805225501', '2018-12-13 10:57:39', '2018-12-17 17:50:44', NULL),
('201613401315', '苏明坡', '体育健康学院', '体教163班', '男', '15977318967', '15977318967', 'su199709', '2016', '382686', 'QQ1805225501', '2018-12-13 11:01:55', '2018-12-24 10:21:54', NULL),
('201603402101', '陈丽同学1', '商学院', '经济16', '女', '18877942507', '18877942507', '7270106', '2016', '372514', 'QQ2022156184', '2018-12-13 14:21:59', '2018-12-13 14:43:32', NULL),
('201613401244', '陈敏迎', '体育健康学院', '体教162班', '女', '13677758672', '13677758672', 'Cmy13677758672', '2016', '378160', 'QQ1643522548', '2018-12-13 15:14:21', '2018-12-17 18:00:29', NULL),
('201613401339', '陈继崎', '体育健康学院', '体教163班', '男', '18775410209', '18775410209', 'a125803.', '2016', '382686', 'QQ1805225501', '2018-12-13 16:14:52', '2018-12-24 10:21:20', NULL),
('201613401245', '吕晓盈', '体育健康学院', '体教162班', '女', '13084967258', '13523932655', '19971014lxy', '2016', '380972', 'QQ962309243', '2018-12-13 16:30:34', '2018-12-20 15:37:55', NULL),
('201614401226', '莫照丽', '教科院', '学前162班', '女', '15717742861', '15717742861', '130199', '2016', '382686', 'QQ3440058312', '2018-12-13 16:40:14', '2018-12-24 14:38:11', NULL),
('201604402112', '2016_020', '外国语学院', '应英161班', '女', '17878193326', '17878193326', 'yt123456..', '2016', '380972', 'QQ3227909279', '2018-12-13 18:42:21', '2018-12-20 17:03:49', NULL),
('201604404117', '韦敏霞', '外国语学院', '应英164班', '女', '18176129981', '18176129981', 'w19980405', '2016', '378160', 'QQ2515785410', '2018-12-13 18:48:02', '2018-12-17 18:09:41', NULL),
('201614401201', '凌桂锦', '教科院', '学前162班', '女', '17878191172', '17878191172', '18377648730lgj', '2016', '382686', 'QQ1875655438', '2018-12-13 19:47:13', '2018-12-24 08:47:38', NULL),
('201612401225', '路焯然', '美术与设计学院', '美术学162班', '女', '17776706410', '17776706410', '890301.lzr', '2016', '378160', 'QQ1175041621', '2018-12-15 13:26:58', '2018-12-17 18:10:01', NULL),
('201612401216', '范梦雨', '美术与设计学院', '美本162班', '女', '18176942660', '15751378856', 'end1314..', '2016', '382686', 'QQ1430947281', '2018-12-15 13:31:32', '2018-12-24 09:35:59', NULL),
('201612403222', '张英杰', '美术与设计学院', '视觉传达162班', '女', '17687455081', '17878191773', 'a123456', '2016', '382686', 'QQ1052804422', '2018-12-15 13:36:20', '2018-12-24 12:36:07', NULL),
('201604405140', '林子健', '政法学院', '思政162班', '男', '18078549416', '13358608501', 'asd250', '2016', '382686', 'QQ294622534', '2018-12-16 14:21:47', '2018-12-24 04:16:32', NULL),
('201604402135', '2016_020_1', '外国语学院', '应英161班', '女', '17878193484', '17878193484', '123321..', '2016', '380972', 'QQ3227909279', '2018-12-17 16:31:40', '2018-12-20 17:03:01', NULL),
('201612401211', '刘婷婷', '美术与设计学院', '美本162班', '女', '18377776102', '17878191676', '970826', '2016', '378160', 'QQ767905945', '2018-12-17 17:57:59', '2018-12-17 18:56:32', NULL),
('201603404136', '徐梦北', '商学院', '财管16', '男', '18176436650', '18776926547', '986364234', '2016', '378160', 'QQ1805225501', '2018-12-17 18:07:35', '2018-12-17 18:07:51', NULL),
('201606401119', '莫咸海', '计算机科学与工程学院', '计算机161班', '男', '15177435329', '15177435329', 'g473231181g', '2016', '暂无', '暂无', '2018-12-17 18:34:53', '2018-12-17 18:34:53', NULL),
('201612403217', '朱兰兰', '美术与设计学院', '视觉传达162', '女', '17878191767', '17878191767', '967488zhu', '2016', '382686', 'QQ1052804422', '2018-12-20 14:35:39', '2018-12-24 12:37:01', NULL),
('201612401204', '高华年', '美术与设计学院', '美本162班', '男', '17878191669', '18293534633', '520520', '2016', '382686', 'QQ2761564438', '2018-12-20 17:43:25', '2018-12-24 12:05:39', NULL),
('201604401103', '黄凤转', '外国语学院', '挂榜16', '女', '18777663787', '18777663787', '946480026', '2016', '382686', 'QQ946480026', '2018-12-20 18:28:38', '2018-12-24 08:48:16', NULL),
('201607401121', '苏明坡介绍', '物理科学与工程技术学院', '物理161班', '女', '17776369349', '15777282252', 'SCQ1121', '2016', '382686', 'QQ1805225501', '2018-12-24 10:19:33', '2018-12-24 12:14:53', NULL),
('201607404125', '莫素榕', '物理与电信工程学院', '光电16班', '女', '13457445265', '13457445265', 'me661226', '2016', '暂无', 'QQ1193415192', '2018-12-24 12:11:34', '2018-12-24 14:39:52', NULL),
('201612406126', '乔晨晨', '美术与设计学院', '绘画16', '女', '15110450374', '15110450374', 'qc7890', '2016', '382686', 'QQ1052804422', '2018-12-24 12:42:28', '2018-12-24 12:42:53', NULL),
('201612405118', '王智敏', '美术与设计学院', '服装16', '男', '13397751742', '17878191511', 'a123456', '2016', '382686', 'QQ1127757184', '2018-12-24 14:43:57', '2018-12-24 14:44:09', NULL),
('201612405117', '王浩', '美术与设计学院', '服装16', '男', '13317752917', '17878191510', 'a123456', '2016', '暂无', 'QQ3128266199', '2018-12-24 22:52:21', '2018-12-24 23:03:40', NULL),
('201612405115', '陈旭鹏', '美术与设计学院', '服装16', '男', '15152833680', '15152833680', 'asdasd1230.', '2016', '暂无', 'QQ854967334', '2018-12-24 23:01:37', '2018-12-24 23:01:37', NULL),
('201712405127', '秦蕊', '美设学院', '服装17', '女', '15678614820', '15678614820', '1239338616qq', '2016', '暂无', 'QQ1239338616', '2018-12-24 23:25:22', '2018-12-24 23:25:22', NULL),
('201613404132', '黎以岳', '体育健康学院', '社体16班', '男', '14795606001', '14795606001', '76524977..', '2016', '暂无', 'QQ1138887468', '2019-02-25 12:30:37', '2019-02-25 12:30:37', NULL),
('201712405116', '姚小敏', '美术与设计学院', '服装17班', '女', '15678623427', '15678623427', '073529yxm', '2017', '暂无', 'QQ2815955880', '2019-03-01 13:03:50', '2019-03-01 13:03:50', NULL),
('201712405128', '高萌', '美术与设计学院', '服装17班', '女', '17377087830', '17377087830', '990425gm', '2017', '暂无', 'QQ1404817687', '2019-03-01 13:11:06', '2019-03-01 13:11:06', NULL),
('201712405126', '李晓宇', '美术与设计学院', '服装与服饰设计201', '女', '17377071548', '17377071548', 'bwsezdg1', '2017', '暂无', 'QQ1309114169', '2019-03-01 15:55:34', '2019-03-01 15:55:34', NULL),
('201612401221', '程琳', '美术与设计学院', '美术学162班', '女', '13081612770', '13081612770', '201221cl', '2016', '暂无', 'QQ2499196467', '2019-03-08 11:48:23', '2019-03-08 11:48:23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lecture`
--
ALTER TABLE `lecture`
  ADD PRIMARY KEY (`appid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_num`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
