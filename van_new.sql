-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2017 at 05:38 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

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
(29, '', '2017-08-31 12:08:53', 0),
(30, '', '2017-08-31 12:08:57', 0),
(31, '234000', '2017-08-31 12:37:17', 4);

-- --------------------------------------------------------

--
-- Table structure for table `admission_process_token`
--

CREATE TABLE `admission_process_token` (
  `token_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `student_id` int(11) NOT NULL,
  `active_status` int(11) NOT NULL DEFAULT '1',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission_process_token`
--

INSERT INTO `admission_process_token` (`token_id`, `token`, `ref`, `student_id`, `active_status`, `time`) VALUES
(1, '7ffe36d6945dcdbac55bd788e82300e4', 'DD8-K33-JJW-12G', 258, 1, '2017-06-13 15:48:28'),
(2, '01367bf4ac8486028b635e3a692fe776', '', 267, 0, '2017-06-05 12:13:39'),
(3, 'fccc1d72ba9fe0f11b09344a2675fda9', 'ADM-FEE-TRA-31819', 267, 0, '2017-06-13 15:46:43'),
(4, '1b4ee4110c0ecba59eb9ad7cee8d1982', 'ADM-FEE-TRA-42309', 279, 0, '2017-06-13 15:46:43'),
(5, '14442cb65c7ec77e7bef65aec2fa4342', 'ADM-FEE-TRA-73290', 280, 1, '2017-06-19 12:04:08'),
(6, 'adfa3f1f9e0ef4d3b923838ffdf7fb0f', '', 268, 1, '2017-06-19 13:39:53'),
(7, '550790224ff7a9ff19cde5fac7c32640', 'ADM-FEE-TRA-89157', 318, 1, '2017-08-30 17:47:03'),
(8, 'f8d9a351c1c35fc34114d3d94a3cb411', 'ADM-FEE-TRA-10129', 318, 1, '2017-08-31 12:07:12'),
(9, '62d65e6ba0f02234679603010c80edde', 'ADM-FEE-TRA-5265', 318, 1, '2017-08-31 13:13:04');

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
  `school_id` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`id`, `assessment_name`, `max_score`, `group_name`, `type`, `delete_status`, `time`, `school_id`) VALUES
(1, 'Exam', 60, 'Terminal Exam', 'non-default', 0, '2017-06-20 15:38:43', 0),
(2, '1st Assignment', 6, 'Mid-Term Total', 'non-default', 0, '2017-06-20 15:38:43', 0),
(3, 'bdhgr', 3, '2nd CA', 'non-default', 0, '2017-06-20 15:38:43', 0),
(4, 'xfgfdg', 4, '2nd CA', 'non-default', 0, '2017-06-20 15:38:43', 0),
(5, 'sge', 5, '2nd CA', 'non-default', 0, '2017-06-20 15:38:43', 0),
(6, 'wowowowo', 123, 'Yeahh', 'non-default', 0, '2017-06-20 15:38:43', 0);

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
  `subject_id` int(11) NOT NULL,
  `answer` varchar(10) DEFAULT NULL,
  `batch_id` int(11) NOT NULL,
  `due_date` varchar(255) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `publish_status` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assessments_questions`
--

INSERT INTO `assessments_questions` (`id`, `question`, `type`, `class_id`, `subject_id`, `answer`, `batch_id`, `due_date`, `assessment_id`, `publish_status`, `time`) VALUES
(1, 'Hello', 'non-option', 1, 1, 'null', 311462, '1494505680', 1, 1, '2017-06-20 15:40:35'),
(2, 'Hello', 'non-option', 1, 1, 'null', 311462, '1494505680', 1, 1, '2017-06-20 15:40:35');

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
(13, '', '', '13729128', 1, 6, '', 1);

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
(1, 'SS 1 B', 'SS', 'B', '1', 0, '2017-06-30 16:42:09', 4),
(4, 'JSS 1 A', 'JSS', 'A', '1', 0, '2017-06-30 17:00:56', 4),
(8, 'SS 1 A', 'SS', 'A', '1', 0, '2017-06-30 17:31:51', 4),
(10, 'JSS 2 B', 'JSS', 'B', '2', 0, '2017-07-01 10:24:18', 4),
(11, 'SS 2 B', 'SS', 'B', '2', 0, '2017-07-01 21:56:24', 4),
(13, 'JSS 2 C', 'JSS', 'C', '2', 0, '2017-07-10 14:18:31', 4),
(14, 'SS 1 C', 'SS', 'C', '1', 0, '2017-07-10 14:19:04', 4),
(15, 'JSS 1 B', 'JSS', 'B', '1', 0, '2017-07-10 14:20:12', 4),
(16, 'JSS 2 C', 'JSS', 'C', '2', 0, '2017-07-28 17:48:32', 4),
(17, 'JSS 1 A', 'JSS', 'A', '1', 0, '2017-08-23 13:51:45', 0),
(18, 'JSS 2 B', 'JSS', 'B', '2', 0, '2017-08-29 16:09:11', 3);

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
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` int(11) NOT NULL,
  `school_session` varchar(250) NOT NULL,
  `term` varchar(250) NOT NULL,
  `class` int(11) NOT NULL,
  `amount` varchar(250) NOT NULL,
  `delete_status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `school_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `school_session`, `term`, `class`, `amount`, `delete_status`, `time`, `school_id`) VALUES
(8, '2017-2018', '1st', 1, ' 50,000', 0, '2017-07-01 10:48:03', 4),
(9, '2017-2018', '1st', 4, ' 50,000', 0, '2017-07-01 10:48:03', 4),
(20, '2017-2018', '2nd', 4, ' 100,000', 0, '2017-07-01 11:12:40', 4),
(26, '2016-2017', '2nd', 1, ' 40,000', 0, '2017-07-01 11:14:31', 4),
(27, '2016-2017', '2nd', 1, ' 50,000', 0, '2017-07-01 11:14:40', 4),
(28, '2018-2019', '2nd', 10, ' 50,000', 0, '2017-07-01 11:18:31', 4),
(29, '2018-2019', '2nd', 5, ' 30,000', 0, '2017-07-01 15:55:06', 4),
(30, '2018-2019', '2nd', 5, ' 50,000', 0, '2017-07-01 15:55:20', 4),
(31, '2018-2019', '2nd', 5, ' 102,000', 0, '2017-07-01 17:15:07', 4),
(32, '2016-2017', '1st', 1, ' 1,000', 0, '2017-08-23 13:52:26', 0),
(33, '2016-2017', '1st', 4, ' 1,000', 0, '2017-08-23 13:52:26', 0),
(34, '2016-2017', '1st', 8, ' 1,000', 0, '2017-08-23 13:52:26', 0),
(35, '2016-2017', '1st', 11, ' 1,000', 0, '2017-08-23 13:52:26', 0),
(36, '2016-2017', '1st', 14, ' 1,000', 0, '2017-08-23 13:52:26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_comments`
--

CREATE TABLE `forum_comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `comment` varchar(2000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_comments`
--

INSERT INTO `forum_comments` (`comment_id`, `post_id`, `sub_id`, `comment`, `user_id`, `time`, `delete_status`) VALUES
(1, 1, 1, 'Hey broo', 9, '2017-05-24 12:12:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_post`
--

CREATE TABLE `forum_post` (
  `post_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `post` varchar(2000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `post_title` varchar(100) NOT NULL,
  `delete_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_post`
--

INSERT INTO `forum_post` (`post_id`, `sub_id`, `post`, `user_id`, `time`, `post_title`, `delete_status`) VALUES
(1, 1, 'Just want to say hello', 1, '2017-05-24 11:01:08', 'Hello', 0),
(2, 3, 'Lets talk', 2, '2017-05-24 11:01:27', 'What''s up?', 0),
(3, 1, 'function makeForumPost(user_id, forum_id) {\n    var post_title = $("#post_title").val().trim();\n    var post_text = $("#post_text").val().trim();\n    if (post_text !== ""){\n        $.ajax({\n            method: "POST",\n            url: "php/doAddNewForumPost.php",\n            data: {\n                post_title: post_title,\n                post_text: post_text,\n                user_id: user_id,\n                forum_id: forum_id\n            }\n        })\n            .done(function (response) {\n                if (response) {\n                    alert("Post is saved");\n                    $(".post_div").prepend(response)\n                } else {\n                    alert("Sorry, post is not saved")\n                }\n            });\n    }\n        }', 1, '2017-05-24 12:50:15', 'Some code', 1),
(4, 1, 'In humans it is the ability of individuals or communities to adapt and self-manage when facing physical, mental, psychological and social changes.[1] The World Health Organization (WHO) defined health in its broader sense in its 1948 constitution as "a state of complete physical, mental, and social well-being and not merely the absence of disease or infirmity."[2][3] This definition has been subject to controversy, in particular as lacking operational value, the ambiguity in developing cohesive health strategies, and because of the problem created by use of the word "complete".[4][5][6] Other definitions have been proposed, among which a recent definition that correlates health and personal satisfaction.[7] [8] Classification systems such as the WHO Family of International Classifications, including the International Classification of Functioning, Disability and Health (ICF) and the International Classification of Diseases (ICD), are commonly used to define and measure the components of health.', 1, '2017-05-24 12:53:10', 'Health is the level of functional and metabolic efficiency of a living organism.', 0),
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
(8, 'Thin', 'NON-MOVABLE ASSET', '124', 0, '2017-07-03 15:21:42', 0);

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
(22, '2017-2018', ' 2nd', '1', ' inuibf afa', '30900', 0, 0, '2017-08-23 13:53:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `logo`
--

CREATE TABLE `logo` (
  `id` int(11) NOT NULL,
  `logo_pic` varchar(250) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logo`
--

INSERT INTO `logo` (`id`, `logo_pic`, `time`) VALUES
(1, 'uploads/Droitwich_Spa_High_School_logo.png', 0),
(2, 'uploadsdashboard4_2.jpg', 0),
(3, '../logo/Droitwich_Spa_High_School_logo.png', 0),
(4, '../logo/html_logo.png', 0),
(5, '../logo/html_logo.png', 0),
(6, '../logo/html_logo.png', 0),
(7, '../logo/Droitwich_Spa_High_School_logo.png', 0),
(8, '../logo/angular_logo.png', 0),
(9, '../logo/Droitwich_Spa_High_School_logo.png', 0),
(10, '../logo/CLA-Logo.png', 0),
(11, '../logo/CLA.Logo-White-Text.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(250) NOT NULL,
  `link` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `content`, `user_id`, `type`, `status`, `created_at`, `link`, `time`) VALUES
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
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `parent_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(220) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `prof` varchar(150) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `photo` varchar(220) NOT NULL,
  `role` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `profAddress` varchar(200) NOT NULL,
  `profCity` varchar(200) NOT NULL,
  `profPhone` varchar(200) NOT NULL,
  `profState` varchar(200) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`parent_id`, `student_id`, `first_name`, `middle_name`, `last_name`, `email`, `address`, `phone`, `prof`, `gender`, `photo`, `role`, `user_id`, `city`, `state`, `profAddress`, `profCity`, `profPhone`, `profState`, `time`) VALUES
(1, 0, 'Yeah', 'Yeah', 'Yeah', 'Yeah@Yeah.com', 'Yeah streeet', '123 456 789', 'Time spender', 'female', '', '', 21, '', '', '', '', '', '', '2017-06-20 15:55:42'),
(2, 268, 'Bye', ' ', 'Bye', 'vanessa@gmail.com', 'Bye', '+111 111 111 1111', 'Bye', 'Male', '8326549701.jpeg ', 'Guard', 0, 'Bye', 'Bye', 'Bye', 'Bye', '+111 111 111 1111', 'Bye', '2017-06-20 15:55:42'),
(3, 268, 'Tea', '', 'Tea', 'Tea@Tea.com', 'Tea', '+222 222 222 2222', 'Tea', 'Female', '4651739028.jpeg ', 'Guard', 0, 'Tea', 'Tea', 'Tea', 'Tea', '+333 333 333 3333', 'Bye', '2017-06-20 15:55:42');

-- --------------------------------------------------------

--
-- Table structure for table `proxy`
--

CREATE TABLE `proxy` (
  `proxy_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `RelateToParent` varchar(300) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proxy`
--

INSERT INTO `proxy` (`proxy_id`, `student_id`, `first_name`, `middle_name`, `last_name`, `address`, `city`, `state`, `email`, `gender`, `photo`, `phone`, `RelateToParent`, `time`) VALUES
(1, 0, 'ere', '', '', '', '', '', '', '', '', '', '', '2017-06-20 15:55:06'),
(2, 268, 'sos', 'sos', 'sos', 'sos', 'sos', 'sos', '23123', 'Female', '3967148520.jpeg', '11111', 'sos', '2017-06-20 15:55:06'),
(3, 268, 'sos', 'sos', 'sos', 'sos sos', 'sos', 'sos', '2321321', 'Remale', '3098214756.jpeg', '2132321312', 'sosfsdf', '2017-06-20 15:55:06');

-- --------------------------------------------------------

--
-- Table structure for table `regnumber`
--

CREATE TABLE `regnumber` (
  `id` int(11) NOT NULL,
  `reg_number` varchar(250) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `year` int(50) NOT NULL,
  `slash1` varchar(5) NOT NULL,
  `slash2` varchar(5) NOT NULL,
  `school_id` int(10) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regnumber`
--

INSERT INTO `regnumber` (`id`, `reg_number`, `prefix`, `year`, `slash1`, `slash2`, `school_id`, `time`) VALUES
(1, 'QWE/2017/12345678', 'QWE', 2017, '/', '/', 0, '0000-00-00 00:00:00'),
(2, 'RGA/2017/00001', 'RGA', 2017, '/', '/', 0, '0000-00-00 00:00:00'),
(3, 'RGA/2017/130', 'RGA', 2017, '/', '/', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `report_name` varchar(255) NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports_made`
--

CREATE TABLE `reports_made` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `report_content` longtext NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `payment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `school_id`, `school_name`, `address`, `country`, `city`, `state`, `email`, `phone`, `website`, `slogan`, `system`, `logo`, `time`, `prefix`, `slash1`, `slash2`, `theme`, `payment`) VALUES
(41, 2, 'Priase Academy School', '3270 Merwin Rd, Lapeer, MI, 48446', 'nigeria', 'Port Hacourt', 'River State', 'eddy1@gmail.com', '07036283244', 'www.piriaseacademy.com', 'A community of lifelong learners, responsible global citizens, and champions of our own success.', 'Boys only', '../logo/2937688180986.jpg', '2017-08-01 12:15:45', 'SON', '/', '/', 'p-pink', ''),
(42, 1, 'clever Academy School', 'No9 Newclose Romuola road', 'Nigeria', 'Port Hacourt', 'River State', 'clever@gmail.com', '09047236723', 'www.cleverLand.com', 'Free edu is the best', 'Mixed', '../logo/4297686305366.jpg', '2017-06-30 20:14:01', '', '', '', '', ''),
(43, 4, 'Chison Academy School', 'No1 Newclose Romuola road', 'Nigeria', 'Port Hacourt', 'River State', 'royal@gmail.com', '092634521', 'www.royalgirls.com', 'For me and you...', 'Girls only', '../logo/4260028085139.jpg', '2017-08-18 15:33:03', 'SON', '/', '/', 'p-brown', ''),
(44, 3, 'Zen girls Academy School', 'Off new  Newclose Rumudara road', 'Nigeria', 'Port Hacourt', 'River State', 'zenscool@gmail.com', '08036255712', 'www.royalgirlacademy.com', 'A Building With Four Walls And Tomorrow Inside.', 'Girls only', '../logo/9562296571906.jpg', '2017-08-29 16:07:25', 'COS', '/', '/', 'p-pink', ''),
(45, 5, 'Free School', 'g', 'fgiufu', 'ug', 'gi', 'we@mail.com', 'uig', 'ug', 'iu', 'Mixed', '../logo/1989958204984.jpg', '2017-08-25 11:54:15', '', '', '', 'p-teal-2', ''),
(46, 6, '', '', '', '', '', '', '', '', '', '', '', '2017-09-01 15:35:19', '', '', '', '', 'eSchoolLife329231250');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `title` varchar(8) NOT NULL DEFAULT 'MR.',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `b_day` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` varchar(10) NOT NULL,
  `marital_status` varchar(15) DEFAULT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `employment_status` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(12) NOT NULL,
  `emergency` varchar(12) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `title`, `first_name`, `last_name`, `middle_name`, `gender`, `address`, `email`, `b_day`, `photo`, `role`, `marital_status`, `delete_status`, `employment_status`, `phone`, `emergency`, `user_id`, `time`) VALUES
(1, 'MR.', 'sunny', 'admami', 'flexa', 'Male', NULL, 'admin@royalgirlsacademy.com', NULL, NULL, 'admin', NULL, 0, 1, '', NULL, 1, '2017-06-29 16:15:14'),
(5, 'MR.', 'john', 'oz', 'Mic', 'Female', NULL, 'michaelozoemena2@gmail.com', NULL, NULL, 'teacher', NULL, 0, 1, '999', NULL, 8, '2017-06-29 16:14:20'),
(6, 'MRS.', 'Vanessa', 'ossi', 'Bang', 'Female', NULL, 'vanessa@gmail.com', NULL, NULL, 'teacher', NULL, 0, 1, '', NULL, 0, '2017-06-29 16:14:25');

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
  `referer` varchar(100) NOT NULL COMMENT 'how did you hear about us?',
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `school_id`, `reg_num`, `class_id`, `gender`, `dormitory_id`, `role`, `delete_status`, `admission_status`, `student_email`, `student_surname`, `student_middle_name`, `student_first_name`, `date_of_birth`, `place_of_birth`, `nationality`, `last_school`, `present_class`, `intended_class`, `student_address`, `student_city`, `student_state`, `student_mobile_phone`, `language_spoken`, `health_epilepsy`, `health_sickle_cell`, `health_asthma`, `health_allergy`, `health_ulcer`, `health_disability`, `father_guardian`, `father_surname`, `father_other_names`, `father_address`, `father_city`, `father_state`, `father_mobile_phone`, `father_office_phone`, `father_office_address`, `father_office_city`, `father_office_state`, `father_email`, `father_occupation`, `father_photo`, `mother_guardian`, `mother_surname`, `mother__other_names`, `mother_address`, `mother_city`, `mother_state`, `mother_mobile_phone`, `mother_office_phone`, `mother_office_address`, `mother_office_city`, `mother_office_state`, `mother_email`, `mother_occupation`, `mother_photo`, `student_sponsor`, `student_sponsor_relationship`, `religion_christian`, `religion_muslim`, `religion_others`, `sch_uniform_bust`, `sch_uniform_waist`, `sch_uniform_full_length`, `sch_uniform_half_length`, `sch_uniform_above_bust`, `sch_uniform_skirt_length`, `student_height`, `sch_uniform_shoulder_length`, `sch_uniform_knee_length`, `sch_uniform_hips`, `sch_uniform_apex_bust`, `sch_uniform_below_bust`, `student_weight`, `proxy1_surname`, `proxy1_middle_name`, `proxy1_first_name`, `proxy1_address`, `proxy1_city`, `proxy1_state`, `proxy1_country`, `proxy1_mobile_number`, `proxy1_email`, `proxy1_gender`, `proxy1_relationship_to_parent`, `proxy1_photo`, `proxy2_surname`, `proxy2_middle_name`, `proxy2_first_name`, `proxy2_address`, `proxy2_city`, `proxy2_state`, `proxy2_country`, `proxy2_mobile_phone`, `proxy2_email`, `proxy2_gender`, `proxy2_relationship_with_parent`, `proxy2_photo`, `referer`, `added_date`) VALUES
(315, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-08-30 13:09:55'),
(316, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-08-30 13:09:55'),
(317, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-08-30 13:09:55'),
(318, 4, NULL, NULL, '', NULL, NULL, 0, 1, 'vanessaosaji@gmail.com', 'Vanessa', 'Teresa', 'Osaji', '2017-08-31', 'Ukraine', 'ukrainian', 'Gymnasium', 'SS2', '', '', 'Earth', 'Earth', '+666 666 666 6666', 'Russian, English', 'No', 'No', 'No', 'No', 'No', 'No', 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'WEQWE', 'QWEWQE', 'Yes', 'Yes', 'FUUUUUCK', '76', '767', '67', '676', '767', '67', '76', '76', '76', '76', '7', '67', '6', 'rtr', '', 'tr', 'tr', 'tr', 'e', '', '+222 ', 'van@gmai.com', 'Male', 'wqeqwe', '4593012678.png', 'qeqwe', '', 'qweqwe', 'qwe', 'qwe', 'qwe', '', '+444 44', 'ddj@h.com', 'Male', '3234324', '3697841205.png', 'qweqweqweqwe', '2017-08-31 13:45:17'),
(319, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-08-30 13:13:00'),
(320, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-08-30 13:46:31'),
(321, 4, NULL, NULL, '', NULL, NULL, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-08-30 13:47:52'),
(322, 4, NULL, NULL, '', NULL, NULL, 0, 0, 'vanessaosaji', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-08-30 13:55:34');

-- --------------------------------------------------------

--
-- Table structure for table `students_results`
--

CREATE TABLE `students_results` (
  `id` int(11) NOT NULL,
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

INSERT INTO `students_results` (`id`, `student_id`, `class_id`, `subject_id`, `batch_id`, `assessment_id`, `score`, `session`, `term`, `time`) VALUES
(20, 1, 1, 1, '', 1, 9, '2017/2018', 'First Term', '2017-06-20 15:59:47'),
(37, 2, 1, 1, '', 1, 10, '2017/2018', 'First Term', '2017-06-20 15:59:47'),
(38, 1, 1, 3, '', 1, 9, '2017/2018', 'First Term', '2017-06-20 15:59:47');

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
(68, 'CRK', 5, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-01 21:57:04', 4),
(69, 'CRK', 6, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-01 21:57:04', 4),
(70, 'CRK', 8, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-01 21:57:04', 4),
(71, 'Social Studies', 1, 6, NULL, 0, NULL, ' SOS', 0, '2017-07-10 11:59:26', 4),
(72, 'Social Studies', 8, 6, NULL, 0, NULL, ' SOS', 0, '2017-07-10 11:59:26', 4),
(73, 'Biology', 1, 6, NULL, 0, NULL, ' BIO', 0, '2017-07-10 12:00:06', 4),
(74, 'Biology', 8, 6, NULL, 0, NULL, ' BIO', 0, '2017-07-10 12:00:06', 4),
(75, 'Geology', 1, 5, NULL, 0, NULL, ' GEO', 0, '2017-07-10 12:01:47', 4),
(76, 'Geology', 8, 5, NULL, 0, NULL, ' GEO', 0, '2017-07-10 12:01:47', 4),
(77, 'CRK', 1, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-10 12:05:40', 4),
(78, 'CRK', 4, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-10 12:05:40', 4),
(79, 'CRK', 5, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-10 12:05:40', 4),
(80, 'CRK', 6, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-10 12:05:40', 4),
(81, 'CRK', 8, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-10 12:05:40', 4),
(82, 'CRK', 10, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-10 12:05:40', 4),
(83, 'CRK', 11, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-10 12:05:40', 4),
(84, 'CRK', 12, 5, NULL, 0, NULL, ' CRK', 0, '2017-07-10 12:05:40', 4),
(85, 'Mathematics', 1, 1, NULL, 0, NULL, ' MTH', 0, '2017-08-29 16:11:34', 3),
(86, 'Mathematics', 4, 1, NULL, 0, NULL, ' MTH', 0, '2017-08-29 16:11:34', 3),
(87, 'Mathematics', 8, 1, NULL, 0, NULL, ' MTH', 0, '2017-08-29 16:11:34', 3),
(88, 'Mathematics', 10, 1, NULL, 0, NULL, ' MTH', 0, '2017-08-29 16:11:34', 3),
(89, 'Mathematics', 13, 1, NULL, 0, NULL, ' MTH', 0, '2017-08-29 16:11:34', 3),
(90, 'Mathematics', 14, 1, NULL, 0, NULL, ' MTH', 0, '2017-08-29 16:11:34', 3);

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
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `time_start` varchar(100) NOT NULL,
  `day` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_content`
--

INSERT INTO `timetable_content` (`timetable_id`, `subject_id`, `class_id`, `time_start`, `day`) VALUES
(1, 0, 0, '08:00', 'Monday'),
(2, 0, 0, '08:00', 'Tuesday'),
(3, 0, 0, '08:00', 'Wednesday'),
(4, 0, 0, '08:00', 'Thursday'),
(5, 0, 0, '08:00', 'Friday');

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
-- Indexes for table `admission_process_token`
--
ALTER TABLE `admission_process_token`
  ADD PRIMARY KEY (`token_id`);

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
-- Indexes for table `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`parent_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `proxy`
--
ALTER TABLE `proxy`
  ADD PRIMARY KEY (`proxy_id`);

--
-- Indexes for table `regnumber`
--
ALTER TABLE `regnumber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `admission_process_token`
--
ALTER TABLE `admission_process_token`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `levies`
--
ALTER TABLE `levies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `logo`
--
ALTER TABLE `logo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `proxy`
--
ALTER TABLE `proxy`
  MODIFY `proxy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `regnumber`
--
ALTER TABLE `regnumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;
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
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
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
