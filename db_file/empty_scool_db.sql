-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2017 at 06:32 PM
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
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` int(11) NOT NULL,
  `assessment_name` varchar(250) NOT NULL,
  `max_score` int(250) NOT NULL,
  `group_name` varchar(250) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'non-default',
  `delete_status` int(2) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `level` varchar(11) NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `session` varchar(250) NOT NULL,
  `term` varchar(250) NOT NULL,
  `class` int(11) NOT NULL,
  `amount` varchar(250) NOT NULL,
  `delete_status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `item` varchar(250) NOT NULL,
  `cate` varchar(250) NOT NULL,
  `quantity` varchar(250) NOT NULL,
  `delete_status` int(2) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `levies`
--

CREATE TABLE `levies` (
  `id` int(11) NOT NULL,
  `session` varchar(250) NOT NULL,
  `term` varchar(250) NOT NULL,
  `classes` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `amount` varchar(250) NOT NULL,
  `publish_status` int(11) NOT NULL DEFAULT '0',
  `delete_status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `logo`
--

CREATE TABLE `logo` (
  `id` int(11) NOT NULL,
  `logo_pic` varchar(250) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `otherinformationaboutstudent`
--

CREATE TABLE `otherinformationaboutstudent` (
  `other_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `health` varchar(100) NOT NULL,
  `spokenLanguages` varchar(100) NOT NULL,
  `lastClass` varchar(100) NOT NULL,
  `lastScool` varchar(100) NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `pob` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `AboutBust` varchar(100) NOT NULL,
  `ApexOfBust` varchar(100) NOT NULL,
  `BelowBust` varchar(100) NOT NULL,
  `Bust` varchar(100) NOT NULL,
  `FullLength` varchar(100) NOT NULL,
  `HalfLength` varchar(100) NOT NULL,
  `Height` varchar(100) NOT NULL,
  `Hips` varchar(100) NOT NULL,
  `KneeLength` varchar(100) NOT NULL,
  `ResponsibleFee` varchar(100) NOT NULL,
  `ShoulderLength` varchar(100) NOT NULL,
  `SkirtLength` varchar(100) NOT NULL,
  `SponsorRel` varchar(100) NOT NULL,
  `Waist` varchar(100) NOT NULL,
  `Weight` varchar(100) NOT NULL,
  `religion` varchar(200) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-
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
-- Table structure for table `regnumber`
--

CREATE TABLE `regnumber` (
  `id` int(11) NOT NULL,
  `reg_number` varchar(250) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `year` int(50) NOT NULL,
  `slash1` varchar(5) NOT NULL,
  `slash2` varchar(5) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `website` varchar(250) NOT NULL,
  `term` varchar(100) NOT NULL,
  `session` varchar(100) NOT NULL,
  `slogan` varchar(250) NOT NULL,
  `system` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `year` int(50) NOT NULL,
  `numb` int(50) NOT NULL,
  `reg_num` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `parents_id` int(255) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `gender` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `get_pwd` varchar(100) NOT NULL,
  `dormitory_id` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `delete_status` int(11) NOT NULL DEFAULT '0',
  `admission_status` int(11) DEFAULT '0',
  `phone` varchar(100) DEFAULT NULL,
  `hdyau` varchar(255) DEFAULT NULL COMMENT 'how did you hear about us',
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@scool.com', NULL, 0, ''),

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
-- Indexes for table `otherinformationaboutstudent`
--
ALTER TABLE `otherinformationaboutstudent`
  ADD PRIMARY KEY (`other_id`);

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
  ADD PRIMARY KEY (`staff_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admission_process_token`
--
ALTER TABLE `admission_process_token`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitory`
--
ALTER TABLE `dormitory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_comments`
--
ALTER TABLE `forum_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_post`
--
ALTER TABLE `forum_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum_sub`
--
ALTER TABLE `forum_sub`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `levies`
--
ALTER TABLE `levies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logo`
--
ALTER TABLE `logo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `otherinformationaboutstudent`
--
ALTER TABLE `otherinformationaboutstudent`
  MODIFY `other_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proxy`
--
ALTER TABLE `proxy`
  MODIFY `proxy_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `regnumber`
--
ALTER TABLE `regnumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students_results`
--
ALTER TABLE `students_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_admission_bio`
--
ALTER TABLE `student_admission_bio`
  MODIFY `bio_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timetable_content`
--
ALTER TABLE `timetable_content`
  MODIFY `timetable_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
