-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2017 at 04:51 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scool`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admission_amount`
--

CREATE TABLE `admission_amount` (
  `id` int(11) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission_amount`
--

INSERT INTO `admission_amount` (`id`, `amount`, `time`, `school_id`) VALUES
(1, '1000', '2017-07-04 17:12:35', 4),
(12, '30,000', '2017-07-04 17:12:37', 4),
(13, '49,000', '2017-07-04 17:12:39', 4),
(14, '10,000', '2017-07-01 17:10:23', 0),
(15, '90,000', '2017-07-01 17:10:48', 0),
(24, '50,000', '2017-07-04 17:12:53', 4),
(25, '90,000', '2017-07-04 17:13:05', 4),
(26, '30,000', '2017-07-04 17:18:32', 3),
(27, '', '2017-07-28 17:48:50', 4),
(28, '20,000', '2017-07-28 17:49:02', 4),
(29, '5000', '2017-09-19 18:04:58', 4),
(30, '5000', '2017-09-19 18:05:59', 4),
(31, '564565', '2017-09-19 18:07:08', 4),
(32, '10000', '2017-09-19 18:07:41', 4);

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` int(11) NOT NULL,
  `assessment_name` varchar(250) NOT NULL,
  `max_score` int(250) NOT NULL,
  `group_name` varchar(250) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'non-default',
  `delete_status` int(2) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(14) NOT NULL,
  `class_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`id`, `assessment_name`, `max_score`, `group_name`, `type`, `delete_status`, `time`, `school_id`, `class_id`) VALUES
(7, 'first assesment', 12, 'Mid term test', 'non-default', 0, '2017-08-26 05:00:28', 4, 1),
(8, 'second assessment', 12, 'Mid term test', 'non-default', 0, '2017-08-26 05:00:33', 4, 1),
(9, 'third assessment', 6, 'Mid term test', 'non-default', 0, '2017-08-26 05:00:37', 4, 1),
(12, 'Exam 1', 20, 'Exam', 'non-default', 0, '2017-08-30 18:42:00', 4, 4),
(13, 'Exam 2', 20, 'Exam', 'non-default', 0, '2017-08-30 18:42:05', 4, 4),
(14, 'Exam 3', 20, 'Exam', 'non-default', 0, '2017-08-30 18:42:10', 4, 4),
(15, 'Work 1', 3, 'Home work', 'non-default', 0, '2017-08-31 12:03:53', 4, 0),
(16, 'Work 2', 3, 'Home work', 'non-default', 0, '2017-08-31 12:03:53', 4, 0),
(17, 'Work 3', 4, 'Home work', 'non-default', 0, '2017-08-31 12:03:53', 4, 0),
(18, 'intense 1', 5, 'intense', 'non-default', 0, '2017-09-07 18:20:58', 4, 0),
(19, 'intense 2', 5, 'intense', 'non-default', 0, '2017-09-07 18:20:58', 4, 0),
(20, 'intense 3', 5, 'intense', 'non-default', 0, '2017-09-07 18:20:58', 4, 0),
(21, 'intense 4', 5, 'intense', 'non-default', 0, '2017-09-07 18:20:58', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `assessments_answers`
--

CREATE TABLE `assessments_answers` (
  `id` int(11) NOT NULL,
  `reg_num` varchar(255) NOT NULL,
  `question_id` int(11) NOT NULL,
  `written_content` longtext NOT NULL COMMENT 'This is for tests and assignments whose answers are text and not selectable options',
  `selected_content` varchar(10) NOT NULL COMMENT 'This is for exams or other assessments whose answers have to be selected and not typed.',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assessments_options`
--

CREATE TABLE `assessments_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_content` varchar(255) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assessments_questions`
--

CREATE TABLE `assessments_questions` (
  `id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `school_id` int(70) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `answer` varchar(10) DEFAULT NULL,
  `option_1` varchar(500) NOT NULL,
  `option_2` varchar(500) NOT NULL,
  `option_3` varchar(500) NOT NULL,
  `option_4` varchar(500) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `due_date` varchar(255) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `publish_status` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assessments_questions`
--

INSERT INTO `assessments_questions` (`id`, `question`, `type`, `class_id`, `school_id`, `subject_id`, `answer`, `option_1`, `option_2`, `option_3`, `option_4`, `batch_id`, `due_date`, `assessment_id`, `publish_status`, `time`) VALUES
(38, 'Who is the all time leading goal scorer in la liga?', 'Objective', 1, 4, 71, 'Ronaldo', 'Ronaldo', 'Messi', 'Suarez', 'Neymar', 0, '14/12/12', 7, 1, '2017-09-20 20:02:07'),
(39, 'ghbjn', 'Objective', 1, 4, 71, 'hgjvbk', 'fghjbk', 'ythjbkn', 'jhbklk', 'chgjvbk', 0, '12/12/12', 7, 1, '2017-09-20 20:02:07'),
(40, 'rwteteuy ruyru iutiuyi iyhiy hihi ', 'Objective', 1, 4, 73, 'eyruukiu', 'tyiug uk', 'truyuyg', 'ryrurtiu', 'yuktkut', 0, '12/34/12', 8, 0, '2017-09-05 11:39:31'),
(41, 'tewywgu', 'Objective', 1, 4, 71, 'ijho', 'hidhij', 'hihfih', 'hiifh', 'ihihfwil', 0, '12/12/12', 8, 0, '2017-09-05 11:39:36'),
(42, 'What is today\'s date', 'Essay', 1, 4, 75, '2nd septem', '', '', '', '', 0, '21/09/2017', 7, 0, '2017-09-09 21:36:43'),
(43, 'What is Portugal\'s European world cup qualification standing', 'Objective', 1, 4, 75, 'First', 'First', 'Second', 'Third', 'Eliminated', 0, '13/10/17', 7, 0, '2017-09-09 21:36:43'),
(44, 'How many goals have Zlatan Ibrahimovic scored for Manchester United?', 'Objective', 1, 4, 75, '26', '18', '26', '30', '10', 0, '13/10/17', 7, 0, '2017-09-09 21:36:43'),
(45, 'What is today\'s date?', 'Objective', 1, 4, 71, '1st of jan', '1st of january', '2nd of december', 'none of them', '21st of January', 0, '13-04-2018', 8, 0, '2017-09-05 11:39:55'),
(46, 'Is this thing really working?', 'Objective', 1, 4, 71, 'Yes', 'Yes', 'Maybe', 'Never', 'One day', 0, '', 7, 1, '2017-09-20 20:02:07'),
(47, 'What did Manchester United play in the UEFA champions league match against FC Basel?', 'Objective', 1, 4, 71, '3-0', '3-0', '4-3', '0-2', '0-0', 0, '14/12/12', 7, 1, '2017-09-20 20:02:07'),
(48, 'ruyrytry', 'Objective', 1, 4, 71, 'tr', 'tr', 'ety', 'eryre', 'etyr', 0, '', 7, 1, '2017-09-20 20:02:07'),
(49, '6uryrtey', 'Objective', 1, 4, 71, 'ert', 'ert', 'ert', 'ert', 'ert', 0, '', 7, 0, '2017-09-20 20:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `reg_num` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(5) NOT NULL,
  `school_id` int(20) NOT NULL,
  `email` varchar(120) NOT NULL,
  `priv` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `reg_num`, `username`, `password`, `status`, `school_id`, `email`, `priv`) VALUES
(8, '', '', '11111', 0, 1, 'eddy1@gmail.com', 1),
(9, '', '', '11111', 0, 2, 'clever@gmail.com', 1),
(10, '', '', '11111', 1, 3, 'royal@gmail.com', 1),
(11, '', '', '11111', 1, 4, 'zen@gmail.com', 1),
(12, '', '', '1737209', 1, 5, 'we@mail.com', 1),
(13, '', '', 'SCPAJ', 1, 4, 'lisa@gmail.com', 2),
(15, '', '', '558IK', 1, 4, 'email_er', 3),
(16, '', '', 'W79HY', 1, 4, 'chinaza@gmail.com', 3),
(17, '', '', '50LO0', 1, 4, 'mikeme@gmail.com', 3),
(18, '', '', 'TYL0D', 1, 4, 'dybala@gmail.com', 3),
(19, '', '', 'V5QUA', 1, 4, 'awesome@gmail.com', 2),
(20, '', '', 'KIC01', 1, 4, 'neymar@gmail.com', 3),
(21, '', '', '2XB65', 1, 4, 'tadashimelo@gmail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `validity_from` varchar(255) NOT NULL,
  `validity_to` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book_orders`
--

CREATE TABLE `book_orders` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(250) NOT NULL,
  `class_cate` varchar(250) NOT NULL,
  `class` varchar(250) NOT NULL,
  `class_level` varchar(11) NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`, `class_cate`, `class`, `class_level`, `delete_status`, `time`, `school_id`) VALUES
(20, 'JSS 1 A', 'JSS', 'A', '1', 0, '2017-09-21 13:04:26', 4),
(21, 'JSS 1 B', 'JSS', 'B', '1', 0, '2017-09-21 13:04:39', 4),
(22, 'JSS 1 C', 'JSS', 'C', '1', 0, '2017-09-21 13:04:47', 4),
(23, 'JSS 2 A', 'JSS', 'A', '2', 0, '2017-09-21 13:04:58', 4),
(24, 'JSS 2 B', 'JSS', 'B', '2', 0, '2017-09-21 15:39:51', 4),
(25, 'JSS 2 C', 'JSS', 'C', '2', 0, '2017-09-21 15:40:03', 4),
(26, 'JSS 3 A', 'JSS', 'A', '3', 0, '2017-09-21 18:16:57', 4),
(27, 'JSS 3 B', 'JSS', 'B', '3', 0, '2017-09-21 18:17:02', 4),
(28, 'JSS 3 C', 'JSS', 'C', '3', 0, '2017-09-21 18:17:06', 4);

-- --------------------------------------------------------

--
-- Table structure for table `dormitory`
--

CREATE TABLE `dormitory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE `feature` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `admission_automation` int(11) NOT NULL,
  `testing_grading` int(11) NOT NULL,
  `finance_mgt` int(11) NOT NULL,
  `result_checker` int(11) NOT NULL,
  `analytics` int(11) NOT NULL,
  `inventory` int(11) NOT NULL,
  `timetable_manual` int(11) NOT NULL,
  `timetable_auto` int(11) NOT NULL,
  `calendar` int(11) NOT NULL,
  `scheduler` int(11) NOT NULL,
  `bevahiour_tracking` int(11) NOT NULL,
  `parent_portal` int(11) NOT NULL,
  `student_portal` int(11) NOT NULL,
  `staff_portal` int(11) NOT NULL,
  `bookstore` int(11) NOT NULL,
  `elibrary` int(11) NOT NULL,
  `pickup_proxy` int(11) NOT NULL,
  `notification` int(11) NOT NULL,
  `messaging` int(11) NOT NULL,
  `sms_integration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`id`, `school_id`, `admission_automation`, `testing_grading`, `finance_mgt`, `result_checker`, `analytics`, `inventory`, `timetable_manual`, `timetable_auto`, `calendar`, `scheduler`, `bevahiour_tracking`, `parent_portal`, `student_portal`, `staff_portal`, `bookstore`, `elibrary`, `pickup_proxy`, `notification`, `messaging`, `sms_integration`) VALUES
(1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `feature_price`
--

CREATE TABLE `feature_price` (
  `id` int(11) NOT NULL,
  `feature` varchar(100) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feature_price`
--

INSERT INTO `feature_price` (`id`, `feature`, `price`) VALUES
(1, 'admission_automation', 0),
(2, 'testing_grading', 0),
(3, 'finance_mgt', 0),
(4, 'result_checker', 0),
(5, 'analytics', 0),
(6, 'inventory', 0),
(7, 'timetable_manual', 0),
(8, 'timetable_auto', 0),
(9, 'calendar', 0),
(10, 'scheduler', 0),
(11, 'bevahiour_tracking', 0),
(12, 'parent_portal', 0),
(13, 'student_portal', 0),
(14, 'staff_portal', 0),
(15, 'bookstore', 0),
(16, 'elibrary', 0),
(17, 'pickup_proxy', 0),
(18, 'notification', 0),
(19, 'messaging', 0),
(20, 'sms_integration', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feature_sub`
--

CREATE TABLE `feature_sub` (
  `id` int(11) NOT NULL,
  `school_id` int(70) NOT NULL,
  `feature_name` varchar(100) NOT NULL,
  `start_date` varchar(20) NOT NULL,
  `end_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(11) NOT NULL,
  `school_session` varchar(250) NOT NULL,
  `term` varchar(250) NOT NULL,
  `class` int(11) NOT NULL,
  `amount` varchar(250) NOT NULL,
  `publish_status` int(1) NOT NULL,
  `delete_status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `school_session`, `term`, `class`, `amount`, `publish_status`, `delete_status`, `time`, `school_id`) VALUES
(8, '2017-2018', '1st', 1, ' 50,000', 0, 0, '2017-07-01 10:48:03', 4),
(9, '2017-2018', '1st', 4, ' 50,000', 0, 0, '2017-07-01 10:48:03', 4),
(20, '2017-2018', '2nd', 4, ' 100,000', 0, 0, '2017-07-01 11:12:40', 4),
(26, '2016-2017', '2nd', 1, ' 40,000', 0, 0, '2017-07-01 11:14:31', 4),
(27, '2016-2017', '2nd', 1, ' 50,000', 0, 0, '2017-07-01 11:14:40', 4),
(28, '2018-2019', '2nd', 10, ' 50,000', 0, 0, '2017-07-01 11:18:31', 4),
(29, '2018-2019', '2nd', 5, ' 30,000', 0, 0, '2017-07-01 15:55:06', 4),
(30, '2018-2019', '2nd', 5, ' 50,000', 0, 0, '2017-07-01 15:55:20', 4),
(31, '2018-2019', '2nd', 5, ' 102,000', 0, 0, '2017-07-01 17:15:07', 4),
(32, '2016-2017', '1st', 1, ' 1,000', 0, 0, '2017-08-23 13:52:26', 0),
(33, '2016-2017', '1st', 4, ' 1,000', 0, 0, '2017-08-23 13:52:26', 0),
(34, '2016-2017', '1st', 8, ' 1,000', 0, 0, '2017-08-23 13:52:26', 0),
(35, '2016-2017', '1st', 11, ' 1,000', 0, 0, '2017-08-23 13:52:26', 0),
(36, '2016-2017', '1st', 14, ' 1,000', 0, 0, '2017-08-23 13:52:26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_comments`
--

CREATE TABLE `forum_comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `comment` varchar(2000) NOT NULL,
  `student_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_comments`
--

INSERT INTO `forum_comments` (`comment_id`, `post_id`, `sub_id`, `comment`, `student_id`, `time`, `delete_status`) VALUES
(1, 1, 1, 'Hey broo', 9, '2017-05-24 12:12:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_post`
--

CREATE TABLE `forum_post` (
  `post_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `post` varchar(2000) NOT NULL,
  `student_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `post_title` varchar(100) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_post`
--

INSERT INTO `forum_post` (`post_id`, `sub_id`, `post`, `student_id`, `time`, `post_title`, `delete_status`) VALUES
(1, 1, 'Just want to say hello', 1, '2017-05-24 11:01:08', 'Hello', 0),
(2, 3, 'Lets talk', 2, '2017-05-24 11:01:27', 'What\'s up?', 0),
(3, 1, 'function makeForumPost(user_id, forum_id) {\n    var post_title = $(\"#post_title\").val().trim();\n    var post_text = $(\"#post_text\").val().trim();\n    if (post_text !== \"\"){\n        $.ajax({\n            method: \"POST\",\n            url: \"php/doAddNewForumPost.php\",\n            data: {\n                post_title: post_title,\n                post_text: post_text,\n                user_id: user_id,\n                forum_id: forum_id\n            }\n        })\n            .done(function (response) {\n                if (response) {\n                    alert(\"Post is saved\");\n                    $(\".post_div\").prepend(response)\n                } else {\n                    alert(\"Sorry, post is not saved\")\n                }\n            });\n    }\n        }', 1, '2017-05-24 12:50:15', 'Some code', 1),
(4, 1, 'In humans it is the ability of individuals or communities to adapt and self-manage when facing physical, mental, psychological and social changes.[1] The World Health Organization (WHO) defined health in its broader sense in its 1948 constitution as \"a state of complete physical, mental, and social well-being and not merely the absence of disease or infirmity.\"[2][3] This definition has been subject to controversy, in particular as lacking operational value, the ambiguity in developing cohesive health strategies, and because of the problem created by use of the word \"complete\".[4][5][6] Other definitions have been proposed, among which a recent definition that correlates health and personal satisfaction.[7] [8] Classification systems such as the WHO Family of International Classifications, including the International Classification of Functioning, Disability and Health (ICF) and the International Classification of Diseases (ICD), are commonly used to define and measure the components of health.', 1, '2017-05-24 12:53:10', 'Health is the level of functional and metabolic efficiency of a living organism.', 0),
(5, 1, 'qweqweqw', 9, '2017-05-24 11:17:15', 'ibsfuobweo', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_sub`
--

CREATE TABLE `forum_sub` (
  `sub_id` int(11) NOT NULL,
  `sub_name` varchar(250) NOT NULL,
  `sub_desc` varchar(250) NOT NULL,
  `icon` varchar(250) NOT NULL,
  `delete_status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_sub`
--

INSERT INTO `forum_sub` (`sub_id`, `sub_name`, `sub_desc`, `icon`, `delete_status`, `time`) VALUES
(1, 'Introductions', 'New to the community? Please stop by, say hi and tell us a bit about yourself.', 'fa fa-bullseye', 0, '2017-06-20 15:50:27'),
(2, 'rwqe', 'ewqqweqw', '', 1, '2017-06-20 15:50:27'),
(3, 'Hello', 'How are you today?', 'fa fa-bell', 0, '2017-06-20 15:50:27'),
(4, 'Vanessa', 'Hellllosdewuorqwoeyqwye', 'fa fa-comment-o activefa', 0, '2017-06-20 15:50:27');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `item` varchar(250) NOT NULL,
  `cate` varchar(250) NOT NULL,
  `quantity` varchar(250) NOT NULL,
  `delete_status` int(2) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `item`, `cate`, `quantity`, `delete_status`, `time`, `school_id`) VALUES
(2, 'rice', 'CAFETERIA', '230', 0, '2017-07-03 11:55:51', 0),
(4, 'rice', 'CAFETERIA', '23', 0, '2017-07-03 12:02:49', 0),
(5, 'beans', 'CAFETERIA', '200', 0, '2017-07-03 12:55:35', 0),
(8, 'Thin', 'NON-MOVABLE ASSET', '124', 0, '2017-07-03 15:21:42', 0),
(9, '4', 'MOVABLE ASSET', '45', 0, '2017-08-30 18:21:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `levies`
--

CREATE TABLE `levies` (
  `id` int(11) NOT NULL,
  `levies_session` varchar(250) NOT NULL,
  `term` varchar(250) NOT NULL,
  `classes` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `amount` varchar(250) NOT NULL,
  `publish_status` int(11) NOT NULL DEFAULT '0',
  `delete_status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `levies`
--

INSERT INTO `levies` (`id`, `levies_session`, `term`, `classes`, `description`, `amount`, `publish_status`, `delete_status`, `time`, `school_id`) VALUES
(11, '2019-2020', ' 3rd', '5', ' hello world!', '40,000', 0, 0, '2017-07-01 14:49:00', 4),
(12, '2019-2020', ' 3rd', '6', ' hello world!', '40,000', 0, 0, '2017-07-01 14:49:00', 4),
(13, '2019-2020', ' 3rd', '8', ' hello world!', '40,000', 0, 0, '2017-07-01 14:49:00', 4),
(14, '2019-2020', ' 2nd', '5', ' welcome to ....', '50,000', 0, 0, '2017-07-01 15:19:00', 4),
(15, '2017-2018', ' 2nd', '4', ' hello', '50,000', 0, 0, '2017-07-01 15:54:39', 4),
(16, '2018-2019', ' 2nd', '4', ' ', '101,000', 0, 0, '2017-07-01 17:14:14', 4),
(17, '2018-2019', ' 2nd', '4', ' for better things', '109,000', 0, 0, '2017-07-01 17:14:40', 4),
(18, '2017-2018', ' 1st', '4', ' pay rate', '20,000', 0, 0, '2017-07-04 17:14:44', 4),
(19, '2017-2018', ' 1st', '5', ' pay rate', '20,000', 0, 0, '2017-07-04 17:14:44', 4),
(20, '2017-2018', ' 1st', '6', ' pay rate', '20,000', 0, 0, '2017-07-04 17:14:44', 4),
(21, '2017-2018', ' 1st', '10', ' pay rate', '20,000', 0, 0, '2017-07-04 17:14:44', 4),
(22, '2017-2018', ' 2nd', '1', ' inuibf afa', '30900', 0, 0, '2017-08-23 13:53:00', 0),
(23, '2017-2018', ' 1st', '1', ' tyhrfhrhrt', '3400', 0, 0, '2017-09-19 18:06:54', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `school_id` int(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(250) NOT NULL,
  `link` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `content`, `school_id`, `type`, `status`, `created_at`, `link`, `time`) VALUES
(1, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(2, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(3, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(4, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(5, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(6, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(7, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(8, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(9, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(10, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(11, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(12, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(13, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(14, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(15, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(16, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(17, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(18, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(19, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(20, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(21, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(22, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(23, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(24, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(25, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(26, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35'),
(27, 'Exam questions in English Language', 0, 'assessment', 0, '2017-05-11 15:44:56', 'take-assessment?batch=311462', '2017-06-20 15:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `token_id` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `school_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_for` text NOT NULL,
  `payment_method` text NOT NULL,
  `student_id` int(11) NOT NULL,
  `active_status` int(11) NOT NULL DEFAULT '1',
  `time_of_transaction` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `revenue`
--

INSERT INTO `revenue` (`token_id`, `ref`, `school_id`, `amount`, `payment_for`, `payment_method`, `student_id`, `active_status`, `time_of_transaction`) VALUES
(1, 'DD8-K33-JJW-12G', 4, 15000, 'Admission', 'Online', 258, 1, '2017-09-20 12:22:05'),
(2, '', 4, 5100, 'Admission', 'Online', 267, 0, '2017-09-20 12:22:09'),
(3, 'ADM-FEE-TRA-31819', 4, 5100, 'Admission', 'Online', 267, 0, '2017-09-20 12:22:12'),
(4, 'ADM-FEE-TRA-42309', 4, 5100, 'Admission', 'Online', 279, 0, '2017-09-20 12:22:16'),
(5, 'ADM-FEE-TRA-73290', 4, 2500, 'Admission', 'Online', 280, 1, '2017-09-20 12:22:19'),
(6, '', 4, 25000, 'Admission', 'Online', 268, 1, '2017-09-20 12:22:24'),
(7, 'ADM-FEE-TRA-66598', 4, 50000, 'Admission', 'Online', 339, 1, '2017-09-20 12:22:28'),
(8, 'ESL-EWU3CLGZ', 0, 10000, 'Admission', 'Bank Payment', 339, 1, '2017-09-20 14:13:30'),
(9, 'ESL-9L0DKEPG', 4, 10000, 'Admission', 'Bank Payment', 339, 1, '2017-09-20 14:15:10'),
(10, 'ESL-YIG2SQIT', 0, 10000, 'Admission', 'Bank Payment', 341, 1, '2017-09-20 14:20:47'),
(11, 'ESL-8QSDT5HJ', 4, 10000, 'Admission', 'Bank Payment', 341, 1, '2017-09-20 14:22:41');

-- --------------------------------------------------------

--
-- Table structure for table `sales_agents`
--

CREATE TABLE `sales_agents` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ref_link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_agents`
--

INSERT INTO `sales_agents` (`id`, `email`, `ref_link`) VALUES
(1, 'tadashimelo@gmail.com', '286308756'),
(2, 'tadashimelo@gmail.com', '824835499');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session_name` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `school_id` int(20) NOT NULL,
  `school_name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `country` varchar(40) NOT NULL,
  `city` varchar(49) NOT NULL,
  `state` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `website` varchar(250) NOT NULL,
  `slogan` varchar(250) NOT NULL,
  `system` varchar(100) NOT NULL,
  `logo` varchar(40) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `prefix` varchar(8) NOT NULL,
  `slash1` varchar(3) NOT NULL,
  `slash2` varchar(3) NOT NULL,
  `theme` varchar(50) NOT NULL,
  `wallet` varchar(100) NOT NULL,
  `acc_name` text NOT NULL,
  `acc_number` varchar(30) NOT NULL,
  `bank_name` varchar(70) NOT NULL,
  `ref` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `school_id`, `school_name`, `address`, `country`, `city`, `state`, `password`, `email`, `phone`, `website`, `slogan`, `system`, `logo`, `time`, `prefix`, `slash1`, `slash2`, `theme`, `wallet`, `acc_name`, `acc_number`, `bank_name`, `ref`) VALUES
(41, 2, 'Priase Academy School', '3270 Merwin Rd, Lapeer, MI, 48446', 'nigeria', 'Port Hacourt', 'River State', '', 'eddy1@gmail.com', '07036283244', 'www.piriaseacademy.com', 'A community of lifelong learners, responsible global citizens, and champions of our own success.', 'Boys only', '../logo/2937688180986.jpg', '2017-08-01 12:15:45', 'SON', '/', '/', 'p-pink', '', '', '0', '', ''),
(42, 1, 'clever Academy School', 'No9 Newclose Romuola road', 'Nigeria', 'Port Hacourt', 'River State', '', 'clever@gmail.com', '09047236723', 'www.cleverLand.com', 'Free edu is the best', 'Mixed', '../logo/4297686305366.jpg', '2017-06-30 20:14:01', '', '', '', '', '', '', '0', '', ''),
(43, 4, 'Chison Academy School', 'No1 Newclose Romuola road', 'Nigeria', 'Port Hacourt', 'River State', '', 'royal@gmail.com', '092634521', 'www.royalgirls.com', 'For me and you...', 'Girls only', '', '2017-09-30 11:56:43', 'SON', '/', '/', 'p-pink', '4988', 'Tadashimelo', '35463547364872', 'First Bank Of  Nigeria', ''),
(44, 3, 'Zen girls Academy School', 'Off new  Newclose Rumudara road', 'Nigeria', 'Port Hacourt', 'River State', '', 'zenscool@gmail.com', '08036255712', 'www.royalgirlacademy.com', 'A Building With Four Walls And Tomorrow Inside.', 'Girls only', '../logo/9562296571906.jpg', '2017-08-29 16:07:25', 'COS', '/', '/', 'p-pink', '', '', '0', '', ''),
(45, 5, 'Free School', 'g', 'fgiufu', 'ug', 'gi', '', 'we@mail.com', 'uig', 'ug', 'iu', 'Mixed', '../logo/1989958204984.jpg', '2017-08-25 11:54:15', '', '', '', 'p-teal-2', '', '', '0', '', ''),
(46, 6, 'Insurmountable', 'No Market road Rumuomasi', 'Nigeria', 'Portharcourt', 'Rivers', '', 'tadashimelo@gmail.com', '08108846812', 'tadashimelo.com', 'You will never walk alone', 'Mixed', '../logo/1207752965.jpg', '2017-09-21 14:52:28', '', '', '', '', '', '', '', '', '824835499');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `school_id` int(70) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `title` varchar(8) NOT NULL DEFAULT 'MR.',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `b_day` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `staff_type` varchar(25) NOT NULL,
  `role_1` varchar(50) NOT NULL,
  `role_2` varchar(50) NOT NULL,
  `marital_status` varchar(15) DEFAULT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `employment_status` int(11) NOT NULL DEFAULT '0',
  `employment_date` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `emergency` varchar(12) DEFAULT NULL,
  `staff_wallet` int(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`school_id`, `staff_id`, `title`, `first_name`, `last_name`, `middle_name`, `gender`, `address`, `email`, `password`, `b_day`, `photo`, `staff_type`, `role_1`, `role_2`, `marital_status`, `delete_status`, `employment_status`, `employment_date`, `phone`, `emergency`, `staff_wallet`, `time`, `role`) VALUES
(4, 1, 'Mr', 'Sunny', 'Okonjo', 'Adeyemi', 'Male', 'No 1 Obeleagu street ', 'sunnyadeyemi@gmail.com', '12345', '12/12/12/', '12256626_1658933927721897_435733455_n.jpg', 'Academic', 'Class master', 'Chaplain', 'Single', 0, 2, '12/23/12', '09054632526', '08035462536', 0, '2017-10-11 13:17:42', 'sports master'),
(4, 5, 'Mr', 'john', 'oz', 'Mic', 'Female', NULL, 'michaelozoemena2@gmail.com', '12345', NULL, 'assassins_creed_desmond_miles_face_hood_eyes_look_mustache_19674_1920x1080.jpg', 'Academic', '', '', NULL, 0, 2, '', '999', NULL, 0, '2017-09-21 11:52:39', ''),
(4, 6, 'MRS.', 'Vanessa', 'ossi', 'Bang', 'Female', NULL, 'vanessa@gmail.com', '12345', NULL, 'Patty-Cuts-Modern-Haircuts-for-Curly-Hair-Men-X-Ray-Part.jpg', 'Non Academic', '', '', NULL, 0, 2, '', '', NULL, 0, '2017-09-20 15:25:50', ''),
(4, 21, 'Chief', 'Emmanuel', 'Ingolsdat', 'Okala', 'Male', 'No oginigba street', '090536253762', '12345', '12/09/1975', NULL, 'Non Academic', 'Security', '', 'Maried', 0, 4, '08/09/2017', '09087576646', '090536253762', 0, '2017-09-20 19:00:55', 'Security'),
(4, 93, 'Dr', 'Ozo', 'Okoro', 'Ibuza', 'Male', 'no 12', '07868687496895', '12345', '12/12/12', NULL, 'Academic', 'bjn jxnbk', 'bj m ', 'Maried', 0, 2, '12/12/12', '978607978687', '078686874968', 0, '2017-09-20 15:26:07', 'jbn kjcnm '),
(4, 113, 'Mr', 'Ronaldo', 'de santos', 'Cristiano', 'Male', 'No 1 madrid', '0904378784889', '12345', '18/04/1987', NULL, 'Non Academic', 'physical and health education director', 'Gym instructor', 'Maried', 0, 2, '10/09/17', '09087654678', '090437878488', 0, '2017-09-20 15:26:29', 'sports master'),
(0, 117, 'wdewd', '33ew', 'edwe', 'wededwed', 'Male', '', '', '', '', NULL, 'Non Academic', '', '', 'Maried', 0, 2, '', '', '', 0, '2017-09-20 19:01:46', ''),
(4, 123, 'Mr', 'James', 'Muddock', 'M', 'Male', '22, Hala', '43534', '', '12/12/2000', NULL, 'Academic', '', '', 'Single', 0, 2, '12/12/2015', '09838928', '43534', 0, '2017-09-20 19:50:15', ''),
(4, 124, 'Miss', 'Ete', 'Mbok', 'M', 'Female', '3243 yibun', '245436', '', '12/12/2000', NULL, 'Academic', '', '', 'Single', 0, 2, '12/12/2017', '234543', '245436', 0, '2017-09-20 19:59:00', 'Teacher'),
(4, 127, 'dr', 'Indifene', 'Okonhyu', 'baracuda', 'Male', 'no 1 umunna ', '4253254145', '', '12/12/12', NULL, 'Academic', 'Game master', 'physical and health master', 'Maried', 0, 2, '12/12/12', '245675645346', '4253254145', 0, '2017-09-21 12:00:49', 'Sports master'),
(4, 128, 'Mr', 'Daniel', 'Kingsley', 'Ojukwu', 'Male', 'no 10 Ukino', '6623727576', '', '12/13/12', '12256626_1658933927721897_435733455_n.jpg', 'Academic', 'Theatre', 'Boss', 'Divorced', 0, 2, '12/12/12', '124356789090', '6623727576', 0, '2017-09-21 18:19:40', 'Bomber'),
(4, 129, 'Dr', 'Lisa', 'Whyte', 'Smith', 'Female', 'No 12 Manchester', 'lisa@gmail.com', '', '12/12/12', NULL, 'Academic', 'Vocational studies mistress', '', 'Single', 0, 2, '12/12/12', '345678908765', '534735472354', 0, '2017-09-21 12:31:31', 'Hair stylist'),
(4, 130, 'mrs', 'Uzochukwu', 'Awesome', 'Mirable', 'Female', 'no 12 dtgbh', 'awesome@gmail.com', '', '12/12/12', NULL, 'Non Academic', '', '', 'Maried', 0, 2, '12/12/12', '6575656565', '3754375463', 0, '2017-09-21 19:20:01', ''),
(4, 131, 'Mr', 'Azubuike', 'Chibuzor', 'Elochukwu', 'Male', 'no 23', 'tadashimelo@gmail.com', '', '12/12/12', NULL, 'Academic', '', '', 'Single', 0, 2, '12/12/12', '827358723452', '62345654632', 0, '2017-09-27 16:06:44', '');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `school_id` int(10) NOT NULL,
  `reg_num` varchar(255) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `gender` varchar(100) NOT NULL,
  `dormitory_id` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `admission_status` int(11) DEFAULT '0',
  `student_email` varchar(70) NOT NULL,
  `password` varchar(100) NOT NULL,
  `student_photo` varchar(70) NOT NULL,
  `student_surname` varchar(70) NOT NULL,
  `student_middle_name` varchar(70) NOT NULL,
  `student_first_name` varchar(70) NOT NULL,
  `date_of_birth` varchar(70) NOT NULL,
  `place_of_birth` varchar(70) NOT NULL,
  `nationality` varchar(70) NOT NULL,
  `last_school` varchar(70) NOT NULL,
  `present_class` varchar(70) NOT NULL,
  `intended_class` varchar(70) NOT NULL,
  `student_address` varchar(70) NOT NULL,
  `student_city` varchar(70) NOT NULL,
  `student_state` varchar(70) NOT NULL,
  `student_mobile_phone` varchar(70) NOT NULL,
  `language_spoken` varchar(70) NOT NULL,
  `health_epilepsy` varchar(70) NOT NULL,
  `health_sickle_cell` varchar(70) NOT NULL,
  `health_asthma` varchar(70) NOT NULL,
  `health_allergy` varchar(70) NOT NULL,
  `health_ulcer` varchar(70) NOT NULL,
  `health_disability` varchar(70) NOT NULL,
  `father_guardian` varchar(20) NOT NULL,
  `father_surname` varchar(70) NOT NULL,
  `father_other_names` varchar(70) NOT NULL,
  `father_address` varchar(70) NOT NULL,
  `father_city` varchar(70) NOT NULL,
  `father_state` varchar(70) NOT NULL,
  `father_mobile_phone` varchar(70) NOT NULL,
  `father_office_phone` varchar(70) NOT NULL,
  `father_office_address` varchar(70) NOT NULL,
  `father_office_city` varchar(70) NOT NULL,
  `father_office_state` varchar(70) NOT NULL,
  `father_email` varchar(70) NOT NULL,
  `father_occupation` varchar(70) NOT NULL,
  `father_photo` varchar(250) NOT NULL,
  `mother_guardian` varchar(20) NOT NULL,
  `mother_surname` varchar(70) NOT NULL,
  `mother__other_names` varchar(70) NOT NULL,
  `mother_address` varchar(70) NOT NULL,
  `mother_city` varchar(70) NOT NULL,
  `mother_state` varchar(70) NOT NULL,
  `mother_mobile_phone` varchar(70) NOT NULL,
  `mother_office_phone` varchar(70) NOT NULL,
  `mother_office_address` varchar(70) NOT NULL,
  `mother_office_city` varchar(70) NOT NULL,
  `mother_office_state` varchar(70) NOT NULL,
  `mother_email` varchar(70) NOT NULL,
  `mother_occupation` varchar(70) NOT NULL,
  `mother_photo` varchar(250) NOT NULL,
  `student_sponsor` varchar(70) NOT NULL,
  `student_sponsor_relationship` varchar(70) NOT NULL,
  `religion_christian` varchar(70) NOT NULL,
  `religion_muslim` varchar(70) NOT NULL,
  `religion_others` varchar(70) NOT NULL,
  `sch_uniform_type` int(1) NOT NULL,
  `sch_uniform_bust` varchar(70) NOT NULL,
  `sch_uniform_waist` varchar(70) NOT NULL,
  `sch_uniform_full_length` varchar(70) NOT NULL,
  `sch_uniform_half_length` varchar(70) NOT NULL,
  `sch_uniform_above_bust` varchar(70) NOT NULL,
  `sch_uniform_skirt_length` varchar(70) NOT NULL,
  `student_height` varchar(70) NOT NULL,
  `sch_uniform_shoulder_length` varchar(70) NOT NULL,
  `sch_uniform_knee_length` varchar(70) NOT NULL,
  `sch_uniform_hips` varchar(70) NOT NULL,
  `sch_uniform_apex_bust` varchar(70) NOT NULL,
  `sch_uniform_below_bust` varchar(70) NOT NULL,
  `student_weight` varchar(70) NOT NULL,
  `proxy1_surname` varchar(70) NOT NULL,
  `proxy1_middle_name` varchar(70) NOT NULL,
  `proxy1_first_name` varchar(70) NOT NULL,
  `proxy1_address` varchar(70) NOT NULL,
  `proxy1_city` varchar(70) NOT NULL,
  `proxy1_state` varchar(70) NOT NULL,
  `proxy1_country` varchar(70) NOT NULL,
  `proxy1_mobile_number` varchar(70) NOT NULL,
  `proxy1_email` varchar(70) NOT NULL,
  `proxy1_gender` varchar(70) NOT NULL,
  `proxy1_relationship_to_parent` varchar(70) NOT NULL,
  `proxy1_photo` varchar(70) NOT NULL,
  `proxy2_surname` varchar(70) NOT NULL,
  `proxy2_middle_name` varchar(70) NOT NULL,
  `proxy2_first_name` varchar(70) NOT NULL,
  `proxy2_address` varchar(70) NOT NULL,
  `proxy2_city` varchar(70) NOT NULL,
  `proxy2_state` varchar(70) NOT NULL,
  `proxy2_country` varchar(70) NOT NULL,
  `proxy2_mobile_phone` varchar(70) NOT NULL,
  `proxy2_email` varchar(70) NOT NULL,
  `proxy2_gender` varchar(70) NOT NULL,
  `proxy2_relationship_with_parent` varchar(70) NOT NULL,
  `proxy2_photo` varchar(70) NOT NULL,
  `student_wallet` int(11) NOT NULL,
  `referer` varchar(100) NOT NULL COMMENT 'how did you hear about us?',
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `school_id`, `reg_num`, `class_id`, `gender`, `dormitory_id`, `role`, `delete_status`, `admission_status`, `student_email`, `password`, `student_photo`, `student_surname`, `student_middle_name`, `student_first_name`, `date_of_birth`, `place_of_birth`, `nationality`, `last_school`, `present_class`, `intended_class`, `student_address`, `student_city`, `student_state`, `student_mobile_phone`, `language_spoken`, `health_epilepsy`, `health_sickle_cell`, `health_asthma`, `health_allergy`, `health_ulcer`, `health_disability`, `father_guardian`, `father_surname`, `father_other_names`, `father_address`, `father_city`, `father_state`, `father_mobile_phone`, `father_office_phone`, `father_office_address`, `father_office_city`, `father_office_state`, `father_email`, `father_occupation`, `father_photo`, `mother_guardian`, `mother_surname`, `mother__other_names`, `mother_address`, `mother_city`, `mother_state`, `mother_mobile_phone`, `mother_office_phone`, `mother_office_address`, `mother_office_city`, `mother_office_state`, `mother_email`, `mother_occupation`, `mother_photo`, `student_sponsor`, `student_sponsor_relationship`, `religion_christian`, `religion_muslim`, `religion_others`, `sch_uniform_type`, `sch_uniform_bust`, `sch_uniform_waist`, `sch_uniform_full_length`, `sch_uniform_half_length`, `sch_uniform_above_bust`, `sch_uniform_skirt_length`, `student_height`, `sch_uniform_shoulder_length`, `sch_uniform_knee_length`, `sch_uniform_hips`, `sch_uniform_apex_bust`, `sch_uniform_below_bust`, `student_weight`, `proxy1_surname`, `proxy1_middle_name`, `proxy1_first_name`, `proxy1_address`, `proxy1_city`, `proxy1_state`, `proxy1_country`, `proxy1_mobile_number`, `proxy1_email`, `proxy1_gender`, `proxy1_relationship_to_parent`, `proxy1_photo`, `proxy2_surname`, `proxy2_middle_name`, `proxy2_first_name`, `proxy2_address`, `proxy2_city`, `proxy2_state`, `proxy2_country`, `proxy2_mobile_phone`, `proxy2_email`, `proxy2_gender`, `proxy2_relationship_with_parent`, `proxy2_photo`, `student_wallet`, `referer`, `added_date`) VALUES
(315, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-08-30 13:09:55'),
(316, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-08-30 13:09:55'),
(317, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-08-30 13:09:55'),
(318, 4, NULL, NULL, '', NULL, NULL, 0, 1, 'vanessaosaji@gmail.com', '', '', 'Vanessa', 'Teresa', 'Osaji', '2017-08-31', 'Ukraine', 'ukrainian', 'Gymnasium', 'SS2', '', '', 'Earth', 'Earth', '+666 666 666 6666', 'Russian, English', 'No', 'No', 'No', 'No', 'No', 'No', 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'WEQWE', 'QWEWQE', 'Yes', 'Yes', 'FUUUUUCK', 0, '76', '767', '67', '676', '767', '67', '76', '76', '76', '76', '7', '67', '6', 'rtr', '', 'tr', 'tr', 'tr', 'e', '', '+222 ', 'van@gmai.com', 'Male', 'wqeqwe', '4593012678.png', 'qeqwe', '', 'qweqwe', 'qwe', 'qwe', 'qwe', '', '+444 44', 'ddj@h.com', 'Male', '3234324', '3697841205.png', 0, 'qweqweqweqwe', '2017-08-31 13:45:17'),
(319, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-08-30 13:13:00'),
(320, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-08-30 13:46:31'),
(321, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-08-30 13:47:52'),
(322, 4, NULL, NULL, '', NULL, NULL, 0, 0, 'vanessaosaji', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-08-30 13:55:34'),
(323, 4, NULL, NULL, '', NULL, NULL, 0, 0, 'chuqd@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-04 16:52:18'),
(324, 4, NULL, 20, 'Male', NULL, NULL, 3, 0, '', '', '', 'tfyvtyut ', '', 'ChuQ', '', '', '', '', '', '4', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-30 11:59:42'),
(325, 4, NULL, 20, '', NULL, NULL, 0, 1, 'jfdbf@Kbkjhb.co', '', '', 'rgtf', 'fgdfg', 'fgfg', '2000-03-04', 'fgfd', 'barbudans', 'fgf', '345', '', '', 'fdgf', 'dfgfd', '+435 678 957 4546', 'bnbvfcnfjg', 'No', 'No', 'No', 'Allergy', 'No', 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-21 13:05:45'),
(326, 4, NULL, 20, 'Male', NULL, NULL, 0, 3, '', '', '', 'hrgfbuyefgruye', 'eke', 'edwin', '', '', '', '', '', '11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-21 13:09:45'),
(328, 4, NULL, 20, 'Female', NULL, NULL, 0, 3, '', '', '', 'ruuyebgfue', 'rita', 'rita', '', '', '', '', '', '11', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-21 13:09:54'),
(340, 4, NULL, 20, '', NULL, NULL, 0, 7, 'theresa@gmail.com', '', '', 'Theresa', 'Message', 'grtgrtgrt', '0033-02-04', 'gfs uyciu', 'barbudans', 'tyhrtyhrthyr', 'JSS 1', '', '', 'Portharcourt', 'Rivers', '+443 546 543 54', 'jvu hgviu', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'tgctgrttghrt', 'tfghrtgrt', 'jhghjhgj', 'rtgrtg', 'rgtrtg', '+343 432 4', '+234 234 223 4434', 'ghnghnghng', 'ghnghntnh', 'gntynytng', 'rtgrtgrgt@gmail.com', 'rt5ct65yg6chg6hg6', '1976428503.jpeg', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'efg yeguyeg', 'trgbrtvrt', 'No', 'No', '', 0, '12', '212', '4', '231', '23123', '34', '121', '122', '12', '121', '131', '21', '1321', 'etf 6t6ytu y', '', 'yruy ruy ', 'uyr ruy ', 'y rtr', 'r ruyry', '', '+365 323 453 ', 'fuycvyruyt@yahoo.com', 'Male', 'ytc78 y78y', '9152463087.jpeg', 'grfe6t6cr6yr', '', '6cr 67r76', 'r67r67 r', '7r76r7', '6r7', '', '+676 7', '6r6r6@gmail.com', 'Male', 'jcewv7tc e7u', '8057329461.jpeg', 0, '', '2017-09-21 13:06:12'),
(341, 4, NULL, NULL, '', NULL, NULL, 0, 7, 'opecs@gmail.com', '', '', 'Azubuike', '', 'Elochukwu', '14322-02-14', 'gfs uyciu', 'andorran', 'tyhrtyhrthyr', 'JSS 3', '', '', 'Portharcourt', 'Rivers', '+345 534 345 54', 'jvu hgviu', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'tgctgrttghrt', 'tfghrtgrt', 'rgrtgrt', 'rtgrtg', 'rgtrtg', '+444 4', '+444 4', 'ghnghnghng', 'ghnghntnh', 'gntynytng', 'rtgrtgrgt@gmail.com', 'rt5ct65yg6chg6hg6', '9645327180.jpeg', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'rcrgrgr', 'rgerger', 'Yes', 'Yes', '', 0, '12', '212', '4', '231', '23123', '12', '121', '122', '12', '121', '131', '21', '1321', 'trvysutuy', '', 'yv y ug', 'ygyu guguy', 'yugy ugu', 'yguygyugfu', '', '+646 746 465 ', 'sytcytsf@gmail.com', 'Male', 'ygbvusybus i', '9875106432.jpeg', 'fy tg7utfuyt', '', 'y7btcytvryte ', 'yty dtt sddtuy ty ', 'yfvysfyus', 'ygyu gcyvug', '', '+353 535 4', 'fgbuy@gmail.com', 'Male', 'ytvf7 t7tu', '2374895016.jpeg', 0, '', '2017-09-20 13:20:43'),
(342, 4, NULL, 13, '', NULL, NULL, 1, 0, 'madiso@gmail.com', '', '', 'Mmadu', 'Okeke', 'Chimezie', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-21 12:57:59'),
(343, 4, NULL, 23, '', NULL, NULL, 0, 3, 'elo@gmail.com', '', '', 'Okwuchukwu', 'Message', 'Akunna', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-21 18:20:11'),
(344, 4, NULL, 28, 'Male', NULL, NULL, 1, 0, 'chinaza@gmail.com', '', '', 'Prosper', 'Okonkwo', 'Chinaza', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-21 19:12:33'),
(345, 4, NULL, 24, 'Male', NULL, NULL, 0, 0, 'mikeme@gmail.com', '', '', 'Osagi', 'Adenuga', 'Mike', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-21 19:12:37'),
(346, 4, NULL, 25, 'Male', NULL, NULL, 0, 0, 'dybala@gmail.com', '', '', 'Paulo', 'Dybala', 'Sandro', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-21 19:15:12'),
(347, 4, NULL, 25, 'Male', NULL, NULL, 0, 0, 'neymar@gmail.com', '', '', 'Santos', 'Junior', 'Neymar', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '2017-09-21 19:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `students_results`
--

CREATE TABLE `students_results` (
  `id` int(11) NOT NULL,
  `school_id` int(70) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `batch_id` varchar(255) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `score` float NOT NULL,
  `session` varchar(100) DEFAULT NULL,
  `term` varchar(100) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students_results`
--

INSERT INTO `students_results` (`id`, `school_id`, `student_id`, `class_id`, `subject_id`, `batch_id`, `assessment_id`, `score`, `session`, `term`, `time`) VALUES
(20, 0, 1, 1, 1, '', 1, 9, '2017/2018', 'First Term', '2017-06-20 15:59:47'),
(37, 0, 2, 1, 1, '', 1, 10, '2017/2018', 'First Term', '2017-06-20 15:59:47'),
(38, 0, 1, 1, 3, '', 1, 9, '2017/2018', 'First Term', '2017-06-20 15:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `student_admission_bio`
--

CREATE TABLE `student_admission_bio` (
  `student_id` int(11) NOT NULL,
  `bio_id` int(11) NOT NULL,
  `passport` varchar(191) NOT NULL,
  `mathematics_score` varchar(191) NOT NULL,
  `englishlang_score` varchar(191) NOT NULL,
  `socialstudies_score` varchar(191) NOT NULL,
  `sciences_score` varchar(191) NOT NULL,
  `birth_cert` varchar(191) NOT NULL,
  `prev_score` varchar(191) NOT NULL,
  `med_issue` varchar(255) NOT NULL,
  `accompanied` varchar(255) NOT NULL,
  `yes_name` varchar(255) NOT NULL,
  `yes_phone` varchar(255) NOT NULL,
  `yes_email` varchar(255) NOT NULL,
  `yes_address` varchar(255) NOT NULL,
  `no_name` varchar(255) NOT NULL,
  `no_address` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_admission_bio`
--

INSERT INTO `student_admission_bio` (`student_id`, `bio_id`, `passport`, `mathematics_score`, `englishlang_score`, `socialstudies_score`, `sciences_score`, `birth_cert`, `prev_score`, `med_issue`, `accompanied`, `yes_name`, `yes_phone`, `yes_email`, `yes_address`, `no_name`, `no_address`, `time`) VALUES
(0, 2, '1426530978.jpeg', 'a', 'a', 'a', 'a', '7105632849.jpeg', '8930645271.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 3, '2657348109.jpeg', 'b', 'b', 'b', 'b', '2694351078.jpeg', '4830125679.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 4, '2487061395.jpeg', '23', '44', '60', '70', '7120465938.jpeg', '4970613852.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 5, '1032756894.jpeg', '79', '58', '77', '80', '3019768245.jpeg', '7028963145.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 6, '6124938075.jpeg', '79', '58', '77', '80', '8156739042.jpeg', '9125463078.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 7, '1928047536.jpeg', '99', '99', '77', '88', '1928645073.jpeg', '3076281594.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 8, '1734965082.jpeg', '58', '87', '90', '099', '9432806517.jpeg', '4792508613.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 9, '7541689203.jpeg', '89', '89', '89', '89', '8324056971.jpeg', '3658140279.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 10, '3627459801.jpeg', '89', '89', '89', '89', '8931246057.jpeg', '5238179604.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 11, '2173956048.jpeg', '96', '87', '77', '69', '5618439702.jpeg', '7235069814.jpeg', '', '', '', '', '', '', '', '', '2017-06-20 16:00:02'),
(258, 12, '1732680549.jpeg', '90', '78', '56', '90', '2403678591.jpeg', '5384921670.jpeg', 'No', 'No', '', '', '', '', 'Vanessa', '+123 456 789', '2017-06-20 16:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `hod_id` int(11) DEFAULT NULL,
  `is_lab` tinyint(1) NOT NULL DEFAULT '0',
  `linked_subject_id` int(11) DEFAULT NULL,
  `short_name` varchar(10) NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `class_id`, `staff_id`, `hod_id`, `is_lab`, `linked_subject_id`, `short_name`, `delete_status`, `time`, `school_id`) VALUES
(1, 'CRK', 5, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:45:58', 4),
(69, 'CRK', 6, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:03:33', 4),
(70, 'CRK', 8, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:45:58', 4),
(71, 'Social Studies', 1, 0, NULL, 0, NULL, ' SOS', 0, '2017-09-20 19:03:33', 4),
(72, 'Social Studies', 8, 0, NULL, 0, NULL, ' SOS', 0, '2017-09-20 19:45:58', 4),
(73, 'Biology', 1, 0, NULL, 0, NULL, ' BIO', 0, '2017-09-20 19:03:33', 4),
(74, 'Biology', 8, 0, NULL, 0, NULL, ' BIO', 0, '2017-09-20 19:45:58', 4),
(75, 'Geology', 1, 0, NULL, 0, NULL, ' GEO', 0, '2017-09-20 19:03:33', 4),
(76, 'Geology', 8, 0, NULL, 0, NULL, ' GEO', 0, '2017-09-20 19:45:58', 4),
(77, 'CRK', 1, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:03:33', 4),
(78, 'CRK', 4, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:45:58', 4),
(79, 'CRK', 5, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:03:33', 4),
(80, 'CRK', 6, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:45:58', 4),
(81, 'CRK', 8, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:03:33', 4),
(82, 'CRK', 10, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:45:58', 4),
(83, 'CRK', 11, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-20 19:03:33', 4),
(84, 'CRK', 12, 0, NULL, 0, NULL, ' CRK', 0, '2017-09-07 16:49:50', 4),
(85, 'Mathematics', 1, 0, NULL, 0, NULL, ' MTH', 0, '2017-09-07 14:51:02', 3),
(86, 'Mathematics', 4, 0, NULL, 0, NULL, ' MTH', 0, '2017-09-07 14:51:02', 3),
(87, 'Mathematics', 8, 0, NULL, 0, NULL, ' MTH', 0, '2017-09-07 14:51:02', 3),
(88, 'Mathematics', 10, 0, NULL, 0, NULL, ' MTH', 0, '2017-09-07 14:51:02', 3),
(89, 'Mathematics', 13, 0, NULL, 0, NULL, ' MTH', 0, '2017-09-07 14:51:02', 3),
(90, 'Mathematics', 14, 0, NULL, 0, NULL, ' MTH', 0, '2017-09-07 14:51:02', 3),
(91, 'Computer Science', 1, 0, NULL, 0, NULL, ' CMS', 0, '2017-09-20 19:03:33', 4),
(92, 'Computer Science', 8, 0, NULL, 0, NULL, ' CMS', 0, '2017-09-20 19:03:33', 4),
(93, 'Computer Science', 11, 0, NULL, 0, NULL, ' CMS', 0, '2017-09-20 19:03:33', 4),
(94, 'Computer Science', 14, 0, NULL, 0, NULL, ' CMS', 0, '2017-09-20 19:03:33', 4),
(95, 'Geography', 26, 128, NULL, 0, NULL, ' Geo', 0, '2017-09-21 18:18:51', 4),
(96, 'Geography', 27, 128, NULL, 0, NULL, ' Geo', 0, '2017-09-21 18:18:51', 4),
(97, 'Geography', 28, 128, NULL, 0, NULL, ' Geo', 0, '2017-09-21 18:18:51', 4);

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `session` varchar(9) NOT NULL,
  `timetable_id` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_content`
--

CREATE TABLE `timetable_content` (
  `timetable_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `time_start` varchar(100) NOT NULL,
  `day` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_content`
--

INSERT INTO `timetable_content` (`timetable_id`, `school_id`, `subject_id`, `class_id`, `time_start`, `day`) VALUES
(1, 4, 0, 0, '08:00', 'Monday'),
(2, 0, 0, 0, '08:00', 'Tuesday'),
(3, 0, 0, 0, '08:00', 'Wednesday'),
(4, 0, 0, 0, '08:00', 'Thursday'),
(5, 0, 0, 0, '08:00', 'Friday');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `password`, `email`, `student_id`, `delete_status`, `time`) VALUES
(1, 'admin', '3821779ba02d4a7d69337610ee7d649d', 'admin@scool.com', NULL, 0, '2017-06-20 16:01:03'),
(8, 'staff', '3821779ba02d4a7d69337610ee7d649d', 'staff@scool.com', NULL, 0, '2017-06-20 16:01:03'),
(9, 'student', '3821779ba02d4a7d69337610ee7d649d', 'student@scool.com', 0, 0, '2017-06-20 16:01:03'),
(14, 'student', '202cb962ac59075b964b07152d234b70', 'fuck@fuck.com', 277, 0, '2017-06-20 16:01:03'),
(20, 'student', 'dSKVXbL94lAn80u631eQ', ' ', 257, 0, '2017-06-20 16:01:03'),
(21, 'parent', '3821779ba02d4a7d69337610ee7d649d', 'parent@scool.com', NULL, 0, '2017-06-20 16:01:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admission_amount`
--
ALTER TABLE `admission_amount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessments_answers`
--
ALTER TABLE `assessments_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessments_options`
--
ALTER TABLE `assessments_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessments_questions`
--
ALTER TABLE `assessments_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_orders`
--
ALTER TABLE `book_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `dormitory`
--
ALTER TABLE `dormitory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_comments`
--
ALTER TABLE `forum_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `forum_post`
--
ALTER TABLE `forum_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `forum_sub`
--
ALTER TABLE `forum_sub`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levies`
--
ALTER TABLE `levies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`token_id`);

--
-- Indexes for table `sales_agents`
--
ALTER TABLE `sales_agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `students_results`
--
ALTER TABLE `students_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_admission_bio`
--
ALTER TABLE `student_admission_bio`
  ADD PRIMARY KEY (`bio_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`session`);

--
-- Indexes for table `timetable_content`
--
ALTER TABLE `timetable_content`
  ADD PRIMARY KEY (`timetable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admission_amount`
--
ALTER TABLE `admission_amount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `assessments_answers`
--
ALTER TABLE `assessments_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assessments_options`
--
ALTER TABLE `assessments_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assessments_questions`
--
ALTER TABLE `assessments_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `book_orders`
--
ALTER TABLE `book_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `dormitory`
--
ALTER TABLE `dormitory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `forum_comments`
--
ALTER TABLE `forum_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `forum_post`
--
ALTER TABLE `forum_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `forum_sub`
--
ALTER TABLE `forum_sub`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `levies`
--
ALTER TABLE `levies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `revenue`
--
ALTER TABLE `revenue`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sales_agents`
--
ALTER TABLE `sales_agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;
--
-- AUTO_INCREMENT for table `students_results`
--
ALTER TABLE `students_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `student_admission_bio`
--
ALTER TABLE `student_admission_bio`
  MODIFY `bio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timetable_content`
--
ALTER TABLE `timetable_content`
  MODIFY `timetable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
