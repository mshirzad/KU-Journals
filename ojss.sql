-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 08:26 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ojss`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_keys`
--

CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_settings`
--

CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_types`
--

CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_type_settings`
--

CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `user_group_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `email`, `include_in_browse`, `publication_id`, `seq`, `user_group_id`) VALUES
(2, 'shirzad.mati@gmail.com', 1, 2, 0.00, 14);

-- --------------------------------------------------------

--
-- Table structure for table `author_settings`
--

CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author_settings`
--

INSERT INTO `author_settings` (`author_id`, `locale`, `setting_name`, `setting_value`) VALUES
(2, '', 'country', 'AF'),
(2, 'en_US', 'affiliation', 'ku'),
(2, 'en_US', 'familyName', 'Shirzad'),
(2, 'en_US', 'givenName', 'Matiullah');

-- --------------------------------------------------------

--
-- Table structure for table `auth_sources`
--

CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` smallint(6) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_settings`
--

CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `citations`
--

CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL,
  `publication_id` bigint(20) NOT NULL DEFAULT 0,
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `citation_settings`
--

CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `completed_payments`
--

CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocabs`
--

CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `controlled_vocabs`
--

INSERT INTO `controlled_vocabs` (`controlled_vocab_id`, `symbolic`, `assoc_type`, `assoc_id`) VALUES
(6, 'interest', 0, 0),
(5, 'submissionAgency', 1048588, 1),
(11, 'submissionAgency', 1048588, 2),
(3, 'submissionDiscipline', 1048588, 1),
(9, 'submissionDiscipline', 1048588, 2),
(1, 'submissionKeyword', 1048588, 1),
(7, 'submissionKeyword', 1048588, 2),
(4, 'submissionLanguage', 1048588, 1),
(10, 'submissionLanguage', 1048588, 2),
(2, 'submissionSubject', 1048588, 1),
(8, 'submissionSubject', 1048588, 2);

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entries`
--

CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entry_settings`
--

CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_issue_orders`
--

CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_section_orders`
--

CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstones`
--

CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_settings`
--

CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `edit_decisions`
--

CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_log_users`
--

CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default`
--

CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `can_disable` smallint(6) NOT NULL DEFAULT 0,
  `can_edit` smallint(6) NOT NULL DEFAULT 0,
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates_default`
--

INSERT INTO `email_templates_default` (`email_id`, `email_key`, `can_disable`, `can_edit`, `from_role_id`, `to_role_id`, `stage_id`) VALUES
(1, 'NOTIFICATION', 0, 1, NULL, NULL, NULL),
(2, 'NOTIFICATION_CENTER_DEFAULT', 0, 1, NULL, NULL, NULL),
(3, 'PASSWORD_RESET_CONFIRM', 0, 1, NULL, NULL, NULL),
(4, 'PASSWORD_RESET', 0, 1, NULL, NULL, NULL),
(5, 'USER_REGISTER', 0, 1, NULL, NULL, NULL),
(6, 'USER_VALIDATE', 0, 1, NULL, NULL, NULL),
(7, 'REVIEWER_REGISTER', 0, 1, NULL, NULL, NULL),
(8, 'PUBLISH_NOTIFY', 0, 1, NULL, NULL, NULL),
(9, 'LOCKSS_EXISTING_ARCHIVE', 0, 1, NULL, NULL, NULL),
(10, 'LOCKSS_NEW_ARCHIVE', 0, 1, NULL, NULL, NULL),
(11, 'SUBMISSION_ACK', 1, 1, NULL, 65536, 1),
(12, 'SUBMISSION_ACK_NOT_USER', 1, 1, NULL, 65536, 1),
(13, 'EDITOR_ASSIGN', 1, 1, 16, 16, 1),
(14, 'REVIEW_CANCEL', 1, 1, 16, 4096, 3),
(15, 'REVIEW_REINSTATE', 1, 1, 16, 4096, 3),
(16, 'REVIEW_REQUEST', 1, 1, 16, 4096, 3),
(17, 'REVIEW_REQUEST_SUBSEQUENT', 1, 1, 16, 4096, 3),
(18, 'REVIEW_REQUEST_ONECLICK', 1, 1, 16, 4096, 3),
(19, 'REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 1, 1, 16, 4096, 3),
(20, 'REVIEW_REQUEST_ATTACHED', 0, 1, 16, 4096, 3),
(21, 'REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 0, 1, 16, 4096, 3),
(22, 'REVIEW_REQUEST_REMIND_AUTO', 0, 1, NULL, 4096, 3),
(23, 'REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096, 3),
(24, 'REVIEW_CONFIRM', 1, 1, 4096, 16, 3),
(25, 'REVIEW_DECLINE', 1, 1, 4096, 16, 3),
(26, 'REVIEW_ACK', 1, 1, 16, 4096, 3),
(27, 'REVIEW_REMIND', 0, 1, 16, 4096, 3),
(28, 'REVIEW_REMIND_AUTO', 0, 1, NULL, 4096, 3),
(29, 'REVIEW_REMIND_ONECLICK', 0, 1, 16, 4096, 3),
(30, 'REVIEW_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096, 3),
(31, 'EDITOR_DECISION_ACCEPT', 0, 1, 16, 65536, 3),
(32, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 0, 1, 16, 65536, 3),
(33, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 0, 1, 16, 65536, 5),
(34, 'EDITOR_DECISION_REVISIONS', 0, 1, 16, 65536, 3),
(35, 'EDITOR_DECISION_RESUBMIT', 0, 1, 16, 65536, 3),
(36, 'EDITOR_DECISION_DECLINE', 0, 1, 16, 65536, 3),
(37, 'EDITOR_DECISION_INITIAL_DECLINE', 0, 1, 16, 65536, 1),
(38, 'EDITOR_RECOMMENDATION', 0, 1, 16, 16, 3),
(39, 'COPYEDIT_REQUEST', 1, 1, 16, 4097, 4),
(40, 'LAYOUT_REQUEST', 1, 1, 16, 4097, 5),
(41, 'LAYOUT_COMPLETE', 1, 1, 4097, 16, 5),
(42, 'EMAIL_LINK', 0, 1, 1048576, NULL, NULL),
(43, 'SUBSCRIPTION_NOTIFY', 0, 1, NULL, 1048576, NULL),
(44, 'OPEN_ACCESS_NOTIFY', 0, 1, NULL, 1048576, NULL),
(45, 'SUBSCRIPTION_BEFORE_EXPIRY', 0, 1, NULL, 1048576, NULL),
(46, 'SUBSCRIPTION_AFTER_EXPIRY', 0, 1, NULL, 1048576, NULL),
(47, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 0, 1, NULL, 1048576, NULL),
(48, 'SUBSCRIPTION_PURCHASE_INDL', 0, 1, NULL, 2097152, NULL),
(49, 'SUBSCRIPTION_PURCHASE_INSTL', 0, 1, NULL, 2097152, NULL),
(50, 'SUBSCRIPTION_RENEW_INDL', 0, 1, NULL, 2097152, NULL),
(51, 'SUBSCRIPTION_RENEW_INSTL', 0, 1, NULL, 2097152, NULL),
(52, 'CITATION_EDITOR_AUTHOR_QUERY', 0, 1, NULL, NULL, 4),
(53, 'REVISED_VERSION_NOTIFY', 0, 1, NULL, 16, 3),
(54, 'STATISTICS_REPORT_NOTIFICATION', 1, 1, 16, 17, NULL),
(55, 'ANNOUNCEMENT', 0, 1, 16, 1048576, NULL),
(56, 'ORCID_COLLECT_AUTHOR_ID', 0, 1, NULL, NULL, NULL),
(57, 'ORCID_REQUEST_AUTHOR_AUTHORIZATION', 0, 1, NULL, NULL, NULL),
(58, 'MANUAL_PAYMENT_NOTIFICATION', 0, 1, NULL, NULL, NULL),
(59, 'PAYPAL_INVESTIGATE_PAYMENT', 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default_data`
--

CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates_default_data`
--

INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('ANNOUNCEMENT', 'en_US', '{$title}', '<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.', 'This email is sent when a new announcement is created.'),
('CITATION_EDITOR_AUTHOR_QUERY', 'en_US', 'Citation Editing', '{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n', 'This email allows copyeditors to request additional information about references from authors.'),
('CITATION_EDITOR_AUTHOR_QUERY', 'fa_IR', 'ویرایش ارجاع', '{$authorFirstName},<br />\n<br />\nلطفا ارجاع صحیح برای رفرانس زیر از مقاله شما {$submissionTitle} را مشخص کنید و یا تایید نمائید:<br />\n<br />\n{$rawCitation}<br />\n<br />\nبت تشکر!<br />\n<br />\n{$userFirstName}<br />\nویراستار, {$contextName}', ''),
('COPYEDIT_REQUEST', 'en_US', 'Copyediting Request', '{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}', 'This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),
('COPYEDIT_REQUEST', 'fa_IR', 'درخواست انجام امور ویراستاری', '{$participantName}:<br />\n<br />\nاز شما درخواست می شود که امور ویراستاری مقاله &quot;{$submissionTitle}&quot; مربوط به {$contextName} را برعهده بگیرید. شما می توانید فایل مربوطه به همراه مجموعه ای از دستورالعمل های نحوه ویراستاری مقاله را در وب سایت مجله دریافت کنید.<br />\n<br />\nچنانچه در حال حاضر قادر به انجام امور مذکور نیستید و یا سوالی در این زمینه دارید، لطفا با من تماس بگیرید. پیشاپیش از قبول انجام امور ویراستاری برای این مجله سپاسگزارم.', 'This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),
('EDITOR_ASSIGN', 'en_US', 'Editorial Assignment', '{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.', 'This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),
('EDITOR_ASSIGN', 'fa_IR', 'تعیین کارشناس مسئول', '{$editorialContactName}:<br />\n<br />\nشما به عنوان کارشناس مسئول مقاله ضضض مربوط به {$contextName} انتخاب شده اید تا بر مراحل ویرایش آن نظارت داشته باشید.<br />\n<br />\nآدرس مقاله: {$submissionUrl}<br />\nنام کاربری: {$editorUsername}<br />\n<br />\nمتشکرم', 'This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),
('EDITOR_DECISION_ACCEPT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission', 'This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),
('EDITOR_DECISION_ACCEPT', 'fa_IR', 'تصمیم دبیر', '{$authorName}:<br />\n<br />\nدر مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />\n<br />\nتصمیم نهایی: پذیرش مقاله ارسالی', 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از پذیرش مقاله'),
('EDITOR_DECISION_DECLINE', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission', 'This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),
('EDITOR_DECISION_DECLINE', 'fa_IR', 'تصمیم دبیر', '{$authorName}:<br />\n<br />\nدر مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />\n<br />\nتصمیم نهایی: عدم پذیرش مقاله ارسالی', 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از عدم پدیرش پذیرش مقاله'),
('EDITOR_DECISION_INITIAL_DECLINE', 'en_US', 'Editor Decision', '\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission', 'This email is sent to the author if the editor declines their submission initially, before the review stage'),
('EDITOR_DECISION_INITIAL_DECLINE', 'fa_IR', 'تصمیم دبیر', '{$authorName}:<br />\n<br />\nدر مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />\n<br />\nتصمیم نهایی: عدم پذیرش', 'این پیام زمان یارسال می شود که دبیر مقاله ارسالی را در اغاز رد می کند، بدون انکه وارد مرحله داوری شود'),
('EDITOR_DECISION_RESUBMIT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review', 'This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),
('EDITOR_DECISION_RESUBMIT', 'fa_IR', 'تصمیم دبیر', '{$authorName}:<br />\n<br />\nدر مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />\n<br />\nتصمیم نهایی: ارسال دوباره برای داوری', 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از ارسال دوباره مقاله برای داوری'),
('EDITOR_DECISION_REVISIONS', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required', 'This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),
('EDITOR_DECISION_REVISIONS', 'fa_IR', 'تصمیم دبیر', '{$authorName}:<br />\n<br />\nدر مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />\n<br />\nتصمیم : مقاله ارسالی نیاز به انجام اصلاحات دارد', 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع ازنیازمندی مقاله به اعمال مجموعه ای از اصلاحات'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'fa_IR', 'تصمیم دبیر', '{$authorName}:<br />\n<br />\nدر مورد مقاله ارسالی شما (&quot;{$submissionTitle}&quot;) در {$contextName} تصمصم نهایی اتخاذ شده است.<br />\n<br />\nتصمیم : ارسال به داور خارجی<br />\n<br />\nمشاهده وضعیت مقاله ارسالی: {$submissionUrl}', 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از ارسال مقاله برای داوری توسط یک داور خارجی'),
('EDITOR_DECISION_SEND_TO_PRODUCTION', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION', 'fa_IR', 'تصمیم دبیر', '{$authorName}:<br />\n<br />\n روند داوری مقاله ارسالی شما (&quot;{$submissionTitle}&quot;)  تکمیل شده و به واحد انتشار ارسال شده است.<br />\n<br />\nمشاهده وضعیت مقاله ارسالی: {$submissionUrl}', 'ایمیلی از طرف سردبیر یا دبیر بخش به نویسنده برای اطلاع از ارسال مقاله برای چاپ'),
('EDITOR_RECOMMENDATION', 'en_US', 'Editor Recommendation', '{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}', 'This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),
('EDITOR_RECOMMENDATION', 'fa_IR', 'توصیه دبیر', '{$editors}:<br />\n<br />\nتوصیه اینجانب در مورد مقاله ارسالی (&quot;{$submissionTitle}&quot;) در {$contextName} ، {$recommendation} می باشد.', 'ایمیلی از طرف دبیر یا دبیر بخش به دبیر نهایی تصمیم گیرنده برای اطلاع از توصیه برای مقاله ارسالی'),
('EMAIL_LINK', 'en_US', 'Article of Possible Interest', 'Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.', 'This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),
('EMAIL_LINK', 'fa_IR', 'شاید مایل به دیدن این مقاله باشید', 'به نظر می رسد که شما مایل به ملاحظه مقاله {$authorName}تحت عنوان &quot;{$submissionTitle}&quot; باشید. این مقاله در شماره &amp;lt;{$volume}&amp;gt; جلد &amp;lt;$number&amp;gt; سال &amp;lt;{$year}&amp;gt; {$contextName} به چاپ رسیده است.<br />\n<br />\nآدرس مقاله:<br />\n<a href=\"{$articleUrl}\">{$articleUrl}</a>', 'This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),
('LAYOUT_COMPLETE', 'en_US', 'Galleys Complete', '{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}', 'This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),
('LAYOUT_COMPLETE', 'fa_IR', 'نسخه های پیش از چاپ کامل شده است', '{$editorialContactName}:<br />\n<br />\nنسخه های پیش از چاپ مقاله ضضض مربوط به {$contextName} حاضر شده و آماده بررسی نهایی می باشد.<br />\nلطفا چنانچه سوالی دارید، با من تماس بگیرید.<br />\n<br />\n<br />\n{$participantName}', 'This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),
('LAYOUT_REQUEST', 'en_US', 'Request Galleys', '{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.', 'This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),
('LAYOUT_REQUEST', 'fa_IR', 'نسخه های پیش از چاپ مورد نیاز است', '{$participantName}:<br />\n<br />\nاز شما درخواست می شود که نسخه های پیش از چاپ مقاله &quot;{$submissionTitle}&quot; مربوط به {$contextName} را آماده نمایید.<br />\n<br />\nآدرس مقاله: <a href=\"{$submissionUrl}\">{$submissionUrl}</a><br />\nنام کاربری: {$participantUsername}<br />\n<br />\nچنانچه در حال حاضر قادر به انجام این امور نیستید و یا سوالی در این رابطه دارید با من تماس بگیرید. پیشاپیش از همکاری شما با این مجله سپاسگزارم.', 'This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),
('LOCKSS_EXISTING_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),
('LOCKSS_EXISTING_ARCHIVE', 'fa_IR', 'تقاضای آزشیو برای {$contextName}', 'مسئول محترم کتابخانه<br />\n<br />\nمجله {$contextName} &amp;lt;<a href=\"{$contextUrl}\">{$contextUrl}</a>&amp;gt;, مجله ای است که یکی از اعضای آن مؤسسه  (بنام فلان) در آن عضو میباشد. این مجله متقاضی آرشیو شدن محتوایش در یک سایت LOCKSS میباشد. خواهشمند است مساعدت فرموده و این مجله را در سیستم خود آرشیو کنید.rsity libraries.<br />\n<br />\n[توضیح مختصری از مجله]<br />\n<br />\nآدرس وبی برای مانیفست ناشری LOCKSS مجله ما بقرار زیر است:<br />\n<a href=\"{$contextUrl}\">{$contextUrl}</a>/gateway/lockss<br />\n<br />\nاز آنجائیکه شما عضو شبکه LOCKSS هستید خواهشمند است مساعدت فرموده و ما را در آرشیو خود ذخیره فرمائید.<br />\nبا تشکر<br />\n{$principalContactSignature}', 'This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),
('LOCKSS_NEW_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),
('LOCKSS_NEW_ARCHIVE', 'fa_IR', 'درخواست بایگانی کردن {$contextName}:', 'مسئول محترم کتابخانه دانشگاه:<br />\n{$contextName} &amp;lt;<a href=\"{$contextUrl}\">{$contextUrl}</a>&amp;gt; ، عضو دانشکده شما می باشد &amp;lt;[name of member]&amp;gt;. این مجله خواستار ایجاد سیستم بایگانی LOCKSS با آن کتابخانه و کتابخانه های دیگر دانشگاهها می باشد.<br />\n<br /><br />\n<br />\nبرنامه LOCKSS تحت آدرس http://lockss.org که یک ابتکار بین المللی مربوط به ناشر/کتابخانه می باشد. این نرم افزار رایگان، حتی توسط یک رایانه شخصی نیز اجرا می گردد. کل سامانه آن لاین شده است و به نگهداری مختصری نیازمند است.<br />\nجهت کمک در بایگانی مجله ما، از شما دعوت می کنیم که عضو انجمن LOCKSS شوید تا به شما در جمع آوری و نگهداری عناوین تهیه شده توسط سازمان خود و دیگر پژوهشگران جهان، کمک کند. برای این کار، لطفا از وب سایت LOCKSS بازدید کنید تا اطلاعاتی درباره نحوه عملکرد این سامانه دراختیار شما قرار گیرد. منتظر اعلام خبر از شما راجع به امکان تهیه چنین سامانه ای برای این مجله هستم.<br />\n<br />\n<br />\nباتشکر<br />\n{$principalContactSignature}', 'This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),
('MANUAL_PAYMENT_NOTIFICATION', 'en_US', 'Manual Payment Notification', 'A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.', 'This email template is used to notify a journal manager contact that a manual payment was requested.'),
('MANUAL_PAYMENT_NOTIFICATION', 'fa_IR', 'اطلاع رسانی پرداخت دستی', 'یک پرداخت دستی قرار است برای مجله {$contextName} از طرف کاربر {$userFullName} (username &quot;{$userName}&quot;) صورت گیرد.<br />\n<br />\nمورد خرید &quot;{$itemName}&quot;.<br />\nقیمت {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nاین ایمیل توسط افزونه پرداخت دستی سیستم های مجله آزاد ایجاد شده است.', ''),
('NOTIFICATION', 'en_US', 'New notification from {$siteTitle}', 'You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}', 'The email is sent to registered users that have selected to have this type of notification emailed to them.'),
('NOTIFICATION', 'fa_IR', 'فرم اطلاع رسانی جدید {$siteTitle}', 'شما یک فرم اطلاع رسانی جدید از {$siteTitle} دارید<br />\n<br />\nلینک: {$url}<br />\n<br />\n{$principalContactSignature}', ''),
('NOTIFICATION_CENTER_DEFAULT', 'en_US', 'A message regarding {$contextName}', 'Please enter your message.', 'The default (blank) message used in the Notification Center Message Listbuilder.'),
('NOTIFICATION_CENTER_DEFAULT', 'fa_IR', 'پیامی برای {$contextName}', 'لطفاً پیام خود را وارد کنید', 'پیام خالی که در قسمت اطلاع رسانی استفاده می شود'),
('OPEN_ACCESS_NOTIFY', 'en_US', 'Issue Now Open Access', 'Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),
('OPEN_ACCESS_NOTIFY', 'fa_IR', 'اکنون مجله قابل دسترس است', 'خوانندگان گرامی:<br />\n<br />\n{$contextName}، شماره جاری خود را بصورت دسترسی آزاد (Open Access) در اختیار خوانندگان قرار داده است. از شما دعوت میگردد که پس از ملاحظه فهرست مقالات در ذیل این نامه، به منظور بررسی مقالات و موضوع های مورد علاقه، از وب سایت مجله دیدن فرمایید.<br />\n<br />\nاز توجه همیشگی شما نسبت به این مجله متشکریم.<br />\n<br />\nآدرس وب سایت مجله: <a href=\"{$contextUrl}\">{$contextUrl}</a><br />\n<br />\n{$editorialContactSignature}', 'This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),
('ORCID_COLLECT_AUTHOR_ID', 'en_US', 'Submission ORCID', 'Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n', 'This email template is used to collect the ORCID id\'s from authors.'),
('ORCID_REQUEST_AUTHOR_AUTHORIZATION', 'en_US', 'Requesting ORCID record access', 'Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n', 'This email template is used to request ORCID record access from authors.'),
('PASSWORD_RESET', 'en_US', 'Password Reset', 'Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),
('PASSWORD_RESET', 'fa_IR', 'رمز عبور دوباره تنظیم شد', 'رمزعبور شما برای استفاده از وب سایت {$siteTitle}، دوباره تنظیم شد. لطفا این کلمه کاربری و رمز عبور را محفوظ نگاه دارید، زیرا برای کارکردن با وب سایت مجله لازم است.<br />\n<br />\nنام کاربری شما: {$username}<br />\nرمز ورود شما: {$password}<br />\n<br />\n{$principalContactSignature}', 'ایمیلی برای کاربرانی که رمز خود را رست نموده اند'),
('PASSWORD_RESET_CONFIRM', 'en_US', 'Password Reset Confirmation', 'We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),
('PASSWORD_RESET_CONFIRM', 'fa_IR', 'تائیدیه دوباره تنظیم کردن رمزعبور', 'درخواستی مبنی بر تنظیم دوباره رمزعبور شما مربوط به وب سایت &amp;lt;$siteTitle&amp;gt; به ما رسیده است.<br />\n<br />\nلطفا چنانچه شما این درخواست را نفرستاده اید، به این ایمیل توجهی نکنید، در این صورت رمز عبور شما تغییری نخواهد کرد. اگر مایل به تنظیم دوباره رمزعبور خود هستید، برروی پیوند زیر کلیک نمائید.<br />\n<br />\nتنظیم مجدد رمز عبور: {$url}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'en_US', 'Unusual PayPal Activity', 'Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n', 'This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'fa_IR', 'فعالیت غیر عدی PayPal', 'سیستم های مجله آزاد فعالیتی غیر عادی مربوط به قسمت پرداخت PayPal برای {$contextName} را کشف کرده است.<br />\nاین فعالیت ممکن است بررسی بیشتر شما را ایجاب کند.<br />\n					   <br />\nاین ایمیل توسط افزونه PayPal سیستم های مجله آزاد تولید شده است.<br />\n<br />\nاطلاعات کامل پست برای درخواست:<br />\n{$postInfo}<br />\n<br />\nاطلاعات اضافی در صورت وجود:<br />\n{$additionalInfo}<br />\n<br />\nمتغییرهای سرور<br />\n{$serverVars}', ''),
('PUBLISH_NOTIFY', 'en_US', 'New Issue Published', 'Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),
('PUBLISH_NOTIFY', 'fa_IR', 'شماره جدید چاپ شد', 'خوانندگان گرامی:<br />\n<br />\n{$contextName}، آخرین شماره خود را به نشانی &amp;lt;<a href=\"{$contextUrl}\">{$contextUrl}</a>&amp;gt; چاپ کرده است. از شما دعوت میشود که پس از ملاحظه فهرست عناوین از وب سایت مجله حاوی مقاله ها و موضوع های مورد علاقه بازدید کنید.<br />\n<br />\nاز توجه همیشگی مستمر شما نسبت به این مجله متشکریم.<br />\n{$editorialContactSignature}', 'This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),
('REVIEWER_REGISTER', 'en_US', 'Registration as Reviewer with {$contextName}', 'In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),
('REVIEWER_REGISTER', 'fa_IR', 'ثبت نام به عنوان کارشناس {$contextName}', 'با توجه با تجارب جنابعالی, {$contextName} فرصت را مغتنم شمرده و نام شما را در زمره کارشناسان مجله ثبت کرده است. لازم به تذکر است که صرف این عمل هیچگونه مسئولیت و تعهدی را متوجه جنابعالی نمی سازد و فقط ما را قادر می سازد تا جهت ارسال مقاله برای کارشناسی احتمالی توسط جنابعالی براحتی با شما تماس بگیریم. هنگامی که از شما برای انجام کارشناسی یک مقاله دعوت به عمل می آید شما مختار خواهید بود که پس از دیدن عنوان و چکیده مقاله دعوت را بپذیرید یا از انجام کارشناسی خودداری کنید. بعلاوه در هر زمان که اراده کنید میتوانید از ما بخواهید تا نام شما را از لیست کارشناسان مجله حذف کنیم.<br />\n<br />\nنام کاربری و رمز عبور شما برای سایت مجله که جهت انجام تمام امورات آنلاین با این مجله لازم است در زیر آمده است.<br />\n<br />\nنام کاربری: {$username}<br />\nرمز عبور: {$password}<br />\n<br />\nبا تشکر,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),
('REVIEW_ACK', 'en_US', 'Article Review Acknowledgement', '{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.', 'This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),
('REVIEW_ACK', 'fa_IR', 'قدردانی بخاطر بررسی مقاله', '{$reviewerName}:<br />\n<br />\nبرای بررسی مقاله ارسالی &quot;{$submissionTitle}&quot;مربوط به {$contextName}، از شما سپاسگزاریم. مساعدت شما را که باعث ارتقاء سطح کیفی مقاله ای که چاپ شد، ارج می نهیم.', 'This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),
('REVIEW_CANCEL', 'en_US', 'Request for Review Cancelled', '{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_CANCEL', 'fa_IR', 'درخواست لغو کارشناسی', '{$reviewerName}:<br />\n<br />\nدر این مرحله تصمیم بر آن شده که درخواست کارشناسی مقاله ضضض مربوط به {$contextName} که به شما محول شده بود، لغو گردد. پیشاپیش از بابت ایجاد هرگونه مشکلی از شما عذرخواهی کرده و امیدواریم که در آینده بتوانیم طی مرحله کارشناسی با شما همکاری داشته باشیم.<br />\n<br />\nلطفا چنانچه در این رابطه سوالی دارید، با من تماس بگیرید.', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_CONFIRM', 'en_US', 'Able to Review', 'Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),
('REVIEW_CONFIRM', 'fa_IR', 'داوری را قبول می کنم', 'دبیر محترم:<br />\n<br />\nاینجانب داوری مقاله ارسالی &quot;{$submissionTitle}&quot;مربوط به {$contextName} را قبول می نمایم. از توجه شما متشکرم و بررسی آنرا در موعد مقرر ( {$reviewDueDate}) انجام خواهد داد.<br />\n<br />\n{$reviewerName}', 'ایمیلی از طرف داور به سردبیر یا دبیر بخشبرای اطلاع از پذیرش انجام داوری'),
('REVIEW_DECLINE', 'en_US', 'Unable to Review', 'Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),
('REVIEW_DECLINE', 'fa_IR', 'قادر به داوری نمی باشم', 'دبیر محترم:<br />\n<br />\nمتاسفانه در حال حاضر قادر به داوری مقاله ارسالی &quot;{$submissionTitle}&quot;مربوط به {$contextName} نیستم.<br />\nاز توجه شما متشکرم . در دفعات بعدی آماده همکاری با این مجله هستم.<br />\n<br />\n{$reviewerName}', 'ایمیلی از طرف داور به سردبیر یا دبیر بخش برای اطلاع از عدم پذیرش انجام داوری'),
('REVIEW_REINSTATE', 'en_US', 'Request for Review Reinstated', '{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that a cancelled review has been reinstated.'),
('REVIEW_REMIND', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND', 'fa_IR', 'یادآوری داوری مقاله ارسالی', '{$reviewerName}:<br />\n<br />\nاین فقط یک یادآوری درخواست {$contextName} از شما جهت بررسی مقاله ارسالی &quot;{$submissionTitle}&quot;است. امیدوار بودیم که متن داوری شما تا تاریخ &amp;lt;{$reviewDueDate}&amp;gt; به مجله ارسال شده باشد و بسیار خوشحال خواهیم شد اگر هرچه زودتر بتوانید آنرا آماده کرده و نسبت به ارسال آن اقدام کنید.<br />\n<br />\nچنانچه نام کاربری و رمز عبور خود مربوط به وب سایت این مجله را در دسترس ندارید، می توانید از پیوند زیر جهت دوباره تنظیم کردن رمزعبور خود استفاده کنید (که به همراه نام کاربری برایتان ارسال می گردد).<br />\n<br />\n<a href=\"{$passwordResetUrl}\">{$passwordResetUrl}</a><br />\nآدرس مقاله: <a href=\"{$submissionReviewUrl}\">{$submissionReviewUrl}</a><br />\n<br />\nلطفا آمادگی خودرا نسبت به انجام این کمک مهم به مجله اعلام نمائید. منتظر پاسخ شما هستیم.<br />\n<br />\n{$editorialContactSignature}', 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای یادآوری انجام داوری'),
('REVIEW_REMIND_AUTO', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO', 'fa_IR', 'یادآوری اتوماتیک برای کارشناسی مقاله ارسالی', '{$reviewerName}:<br />\n<br />\nاین فقط یک یادآوری درخواست ما از شما جهت بررسی مقاله ارسالی &quot;{$submissionTitle}&quot;مربوط به {$contextName} است. امیدوار بودیم که متن کارشناسی شما تا تاریخ &amp;lt;{$reviewDueDate}&amp;gt; دریافت نماییم و به دلیل اتمام فرصت مقرر، این ایمیل به صورت اتوماتیک برای شما فرستاده می شود. بسیار خوشحال خواهیم شد اگر هرچه زودتر بتوانید نتیجه کارشناسی خود را برایمان ارسال کنید.<br />\n<br />\nچنانچه نام کاربری و رمز عبور خود مربوط به وب سایت این مجله را در دسترس ندارید می توانید از پیوند زیر جهت تنظیم دوباره رمزعبور خود استفاده کنید (که به همراه نام کاربری برایتان ارسال می گردد).<br />\n<br />\n<a href=\"{$passwordResetUrl}\">{$passwordResetUrl}</a><br />\nآدرس مقاله: <a href=\"{$submissionReviewUrl}\">{$submissionReviewUrl}</a><br />\n<br />\nلطفا آمادگی خودرا نسبت به انجام این کمک مهم به مجله اعلام نمائید. منتظر پاسخ شما هستم.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'fa_IR', 'یادآوری برای کارشناسی مقاله (اتوماتیک)', '{$reviewerName}:<br />\n<br />\nبا عرض پوزش بدین وسیله یادآوری مینمایم که متعاقب ارسال درخواست اولیه مبنی بر انجام کارشناسی مقاله &quot;{$submissionTitle},&quot; برای {$contextName}<br />\nمنتظر دریافت نظرات کارشناسی جنابعالی میباشیم. امیدواریم که نتیجه کارشناسی جنابعالی تا تاریخ {$reviewDueDate} به دست ما برسد.<br />\n<br />\nآدزس مقاله: <a href=\"{$submissionReviewUrl}\">{$submissionReviewUrl}</a><br />\n<br />\nدر صورت امکان با ایمیل اطلاع دهید که آیا مایلید این کارسناسی را انجام دهید.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_ONECLICK', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND_ONECLICK', 'fa_IR', 'یادآوری برای کارشناسی مقاله', '{$reviewerName}:<br />\n<br />\nبا عرض پوزش بدین وسیله یادآوری مینمایم که متعاقب ارسال درخواست اولیه مبنی بر انجام کارشناسی مقاله &quot;{$submissionTitle},&quot; برای {$contextName}<br />\nمنتظر دریافت نظرات کارشناسی جنابعالی میباشیم. امیدواریم که نتیجه کارشناسی جنابعالی تا تاریخ {$reviewDueDate} به دست ما برسد.<br />\n<br />\nآدزس مقاله: <a href=\"{$submissionReviewUrl}\">{$submissionReviewUrl}</a><br />\n<br />\nدر صورت امکان با ایمیل اطلاع دهید که آیا مایلید این کارسناسی را انجام دهید.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REQUEST', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST', 'fa_IR', 'درخواست کارشناسی مقاله', '{$reviewerName}:<br />\n<br />\nشما به عنوان یک کارشناس ممتاز برای بررسی مقاله &quot;{$submissionTitle}&quot;که برای {$contextName} ارسال شده است انتخاب شده اید. در ذیل، چکیده مقاله ارسالی برای شما گنجانده شده است و امیدوارم که در این زمینه مایل به همکاری با این مجله باشید<br />\n<br />\nلطفا قبل از تاریخ &quot;{$responseDueDate}&quot; وارد وب سایت مجله شده و مشخص کنید که آیا مایل به قبول کارشناسی مقاله هستید یا خیر. همچنین به طور همزمان می توانید به مقاله ارسالی دسترسی پیدا کرده و متن کارشناسی و توصیه های خودرا ذخیره کنید. آدرس وب سایت مجله <a href=\"{$contextUrl}\">{$contextUrl}</a> است.<br />\n<br />\nضمنا آخرین مهلت بررسی این مقاله تا تاریخ &quot;{$reviewDueDate}&quot; می باشد<br />\n<br />\nچنانچه نام کاربری و رمز عبور خود مربوط به وب سایت این مجله را در دسترس ندارید می توانید از پیوند زیر جهت تنظیم دوباره رمزعبور خود استفاده کنید (که به همراه نام کاربری برایتان ارسال می گردد).<br />\n<br />\n<a href=\"{$passwordResetUrl}\">{$passwordResetUrl}</a><br />\nآدرس مقاله : <a href=\"{$submissionReviewUrl}\">{$submissionReviewUrl}</a><br />\n<br />\nاز توجه شما به این درخواست سپاسگزاری می کنم.<br />\n<br />\n{$editorialContactSignature}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_ATTACHED', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),
('REVIEW_REQUEST_ATTACHED', 'fa_IR', 'درخواست داوری مقاله', '{$reviewerName}:<br />\n<br />\nشما به عنوان یک داور برای بررسی مقاله &quot;{$submissionTitle}&quot; انتخاب شده اید. در ذیل، چکیده مقاله ارسالی برای شما گنجانده شده است و امیدوارم که در این زمینه مایل به همکاری با این مجله باشید.<br />\nدر ذیل متن راهنمای کارشناسی برای این مجله آمده است و مقاله ارسالی به این ایمیل پیوست شده است. توجه داشته باشید که باید متن کارشناسی و توصیه خود را تا تاریخ {$reviewDueDate} از طریق ایمیل ارسال کنید.<br />\n<br />\nلطفا با پاسخ دادن به این ایمیل قبل از تاریخ &amp;lt;{$reviewDueDate}&amp;gt; مشخص سازید که آیا قادر به انجام کارشناسی هستید یا خیر؟<br />\nاز توجه شما به این درخواست سپاسگزارم.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\nراهنمای داوری<br />\n<br />\n{$reviewGuidelines}', 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'fa_IR', 'درخواست داوری مقاله', '{$reviewerName}:<br />\n<br />\nاین ایمیل در مورد مقاله &quot;{$submissionTitle},&quot; که به مجله {$contextName} ارسال شده است، می باشد.<br />\n<br />\nدر ادامه داوری های قبلی  این مقاله نمایش داده شده است و اکنون نویسنده نسخه اصلاحی خود را ارسال کرده است. در صورت امکان در ارزیابی این اصلاحات به ما کمک کنید.<br />\n<br />\nراهنمای داوری و همچنین مقاله به این ایمیل ضمیمه شده است. نتیجه داوری و همچنین توصیه شما در موذد این مقاله باید تا تاریخ {$reviewDueDate} ارسال شود.<br />\n<br />\nلطفاً تا تاریخ {$responseDueDate} برای ما با ایمیل پاسخ دهید که این داوری را می پذیرید یا نه.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nراهنمای داوری<br />\n<br />\n{$reviewGuidelines}<br />', 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری'),
('REVIEW_REQUEST_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.');
INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('REVIEW_REQUEST_ONECLICK', 'fa_IR', 'درخواست داوری مقاله', '{$reviewerName}:<br />\n<br />\nشما به عنوان یک کارشناس ممتاز برای بررسی مقاله &quot;{$submissionTitle}&quot; که برای {$contextName} ارسال شده است انتخاب شده اید. در ذیل، چکیده مقاله ارسالی برای شما گنجانده شده است و امیدوارم که در این زمینه مایل به همکاری با این مجله باشید.<br />\n<br />\nلطفا قبل از تاریخ {$reviewDueDate} وارد وب سایت مجله شده و مشخص سازید که آیا مایل به قبول کارشناسی هستید یا خیر؟ همچنین به طور همزمان می توانید به مقاله ارسالی دسترسی پیدا کرده و متن کارشناسی و توصیه های خودرا ذخیره کنید.<br />\n<br />\nضمنا آخرین مهلت بررسی این مقاله تا تاریخ {$reviewDueDate} می باشد.<br />\n<br />\nآدرس مقاله: <a href=\"{$submissionReviewUrl}\">{$submissionReviewUrl}</a><br />\n<br />\nاز توجه شما به این درخواست متشکرم.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n--------------------------------<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\nچکیده:<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'fa_IR', 'درخواست داوری مقاله', '{$reviewerName}:<br />\n<br />\nاین ایمیل در مورد مقاله &quot;{$submissionTitle},&quot; که به مجله {$contextName} ارسال شده است، می باشد.<br />\n<br />\nدر ادامه داوری های قبلی  این مقاله نمایش داده شده است و اکنون نویسنده نسخه اصلاحی خود را ارسال کرده است. در صورت امکان در ارزیابی این اصلاحات به ما کمک کنید.<br />\n<br />\nلطفاً تا تاریخ {$responseDueDate} به سامانه وارد شده و پذیرش یا عدم پذیرش انجام این داوری را به اطلاع برسانید<br />\n<br />\nمهلت انجام داوری: {$reviewDueDate}.<br />\n<br />\nلینک مقاله: {$submissionReviewUrl}<br />\n<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری'),
('REVIEW_REQUEST_REMIND_AUTO', 'en_US', 'Article Review Request Reminder', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO', 'fa_IR', 'یادآوری درخواست داوری مقاله', '{$reviewerName}:<br />\n\nاین ایمیل که به صورت خودکار ارسال شده است، جهت یادآوری درخواست انجام داوری مقاله &quot;{$submissionTitle},&quot; برای مجله {$contextName}. است.\n<br />\nلطفاً به سامانه {$contextUrl} وارد شده و پذیرش یا عدم پذیرش انجام این داوری را به اطلاع برسانید<br />\n<br />\nمهلت انجام داوری: {$reviewDueDate}.<br />\n<br />\nچنانچه رمز ورود خود را فراموش کرده اید م یتوانید از لینک زیر برای بازیابی رمز ورود خود استفاده کنید:\n{$passwordResetUrl}<br />\n<br />\nلینک مقاله: {$submissionReviewUrl}<br />\n<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'fa_IR', 'یادآوری درخواست داوری مقاله', '{$reviewerName}:<br />\n\nاین ایمیل که به صورت خودکار ارسال شده است، جهت یادآوری درخواست انجام داوری مقاله &quot;{$submissionTitle},&quot; برای مجله {$contextName}. است. امیدواریم که تا تاریخ {$responseDueDate} نسبت به پذیرش یا عدم پذیرش این درخواست داوری به ما اطلاع رسانی نمایید\n<br />\nلطفاً به سامانه وارد شده و پذیرش یا عدم پذیرش انجام این داوری را به اطلاع برسانید<br />\n<br />\nمهلت انجام داوری: {$reviewDueDate}.<br />\n\n<br />\nلینک مقاله: {$submissionReviewUrl}<br />\n<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری'),
('REVIEW_REQUEST_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVIEW_REQUEST_SUBSEQUENT', 'fa_IR', 'درخواست داوری مقاله', '{$reviewerName}:<br />\n<br />\nشما به عنوان یک کارشناس ممتاز برای بررسی مقاله &quot;{$submissionTitle}&quot; که برای {$contextName} ارسال شده است انتخاب شده اید. در ذیل، چکیده مقاله ارسالی برای شما گنجانده شده است و امیدوارم که در این زمینه مایل به همکاری با این مجله باشید.<br />\n<br />\nلطفا قبل از تاریخ {$responseDueDate} وارد وب سایت مجله شده و مشخص سازید که آیا مایل به قبول کارشناسی هستید یا خیر؟ همچنین به طور همزمان می توانید به مقاله ارسالی دسترسی پیدا کرده و متن کارشناسی و توصیه های خودرا ذخیره کنید.<br />\n<br />\nچنانچه رمز عبور خود را فراموش کرده اید می توانید از لینک زیر به بازیابی رمز خود بپردازید: {$passwordResetUrl}\n<br/>\nضمنا آخرین مهلت بررسی این مقاله تا تاریخ {$reviewDueDate} می باشد.<br />\n<br />\nآدرس مقاله: <a href=\"{$submissionReviewUrl}\">{$submissionReviewUrl}</a><br />\n<br />\nاز توجه شما به این درخواست متشکرم.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n--------------------------------<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\nچکیده:<br />\n{$submissionAbstract}', 'ایمیلی از طرف دبیر یا دبیر بخش به داور برای درخواست انجام داوری'),
('REVISED_VERSION_NOTIFY', 'en_US', 'Revised Version Uploaded', 'Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),
('REVISED_VERSION_NOTIFY', 'fa_IR', 'آپلود نسخه اصلاح شده', 'دبیر محترم:<br />\n<br />\nنسخه اصلاح شده مقاله &quot;{$submissionTitle}&quot; توسط {$authorName} در سامانه آپلود شد..<br />\n<br />\nلینک مقاله: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'ایمیلی که خودکار پس از آپلود نسخه اصلاحی توسط نویسنده  برای دبیر ارسال می شود'),
('STATISTICS_REPORT_NOTIFICATION', 'en_US', 'Editorial activity for {$month}, {$year}', '\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}', 'This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),
('SUBMISSION_ACK', 'en_US', 'Submission Acknowledgement', '{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to an author when they complete the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),
('SUBMISSION_ACK', 'fa_IR', 'قدردانی برای ارسال مقاله', '{$authorName}:<br />\n<br />\nاز ارسال مقاله &quot;{$submissionTitle}&quot; به {$contextName} متشکرم. با استفاده از سامانه الکترونیکی مدیریت مجله، که هم اکنون استفاده می شود، قادر خواهید بود ازطریق وارد شدن به وب سایت مجله، روند پیشرفت بررسی مقاله خود را پیگیری نمائید.<br />\n<br />\nآدرس مقاله : {$submissionUrl}<br />\nنام کاربری: {$authorUsername}<br />\n<br />\nلطفا چنانچه سوالی دارید، با من تماس بگیرید.<br />\n<br />\n{$editorialContactSignature}', 'در صورت فعال سازی. این ایمیل به صورت خودکار به نوسنده مقاله پس از تکمیل عملیات ارسال مقاله، فرستاده خواهد شد.'),
('SUBMISSION_ACK_NOT_USER', 'en_US', 'Submission Acknowledgement', 'Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),
('SUBMISSION_ACK_NOT_USER', 'fa_IR', 'قدردانی برای ارسال مقاله', 'با سلام,<br />\n<br />\nمقاله {$submitterName} مقاله &quot;{$submissionTitle}&quot; را به مجله {$contextName} ارسال نمودند <br />\n<br />\nدر صورت داشتن هر گونه سوالی با من تماس حاصل فرمایید. از اینکه نتیجه پژوهش خود را برای این مجله ارسال نمودید، سپاسگذاریم<br />\n<br />\n{$editorialContactSignature}', 'در صورت فعال سازی. این ایمیل به صورت خودکار به نوسنده مقاله پس از تکمیل عملیات ارسال مقاله، فرستاده خواهد شد.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'en_US', 'Subscription Expired', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'fa_IR', 'مدت اشتراک شما پایان یافته است', '{$subscriberName}:<br />\n<br />\nاشتراک {$contextName} برای شما به پایان رسیده است.<br />\n<br />\n{$subscriptionType}<br />\nتاریخ انقضاء: {$expiryDate}<br />\n<br />\nبه منظور تجدید اشتراک خود، لطفا به وب سایت مجله مراجعه نمائید. شما قادر خواهید بود که با استفاده از نام کاربری خود &amp;lt;نام کاربری&amp;gt; وارد این سامانه شوید.<br />\n<br />\nلطفا در صورت وجود سوال در این زمینه، با من تماس بگیرید.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'en_US', 'Subscription Expired - Final Reminder', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'fa_IR', 'اشتراک شما پایان یافت-آخرین یادآوری', '{$subscriberName}:<br />\n<br />\nاشتراک {$contextName} برای شما به پایان رسیده است.لطفا توجه کنید که این آخرین یادآوری است که برای شما ارسال خواهد شد.<br />\n<br />\n{$subscriptionType}<br />\nتاریخ انقضاء: {$expiryDate}<br />\n<br />\nبه منظور تجدید اشتراک خود، لطفا به وب سایت مجله مراجعه نمائید. شما قادر خواهید بود که با استفاده از نام کاربری خود &amp;lt;نام کاربری&amp;gt; وارد شوید.<br />\n<br />\nلطفا در صورت وجود سوال در این زمینه، با من تماس بگیرید.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'en_US', 'Notice of Subscription Expiry', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'fa_IR', 'یادآوری پایان یافتن مدت اشتراک', '{$subscriberName}:<br />\n<br />\nاشتراک {$contextName} برای شما درحال اتمام می باشد.<br />\n<br />\n{$subscriptionType}<br />\njhvdo hkrqh: {$expiryDate}<br />\n<br />\nبه منظور اطمینان از دسترسی تان به این مجله، لطفا به وب سایت مجله مراجعه کرده و اشتراک خود را تمدید کنید. شما می توانید که با نام کاربری خود &amp;lt;نام کاربری&amp;gt; وارد این سامانه شوید.<br />\n<br />\nلطفا در صورت وجود سوال در این زمینه، با من تماس بگیرید.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_NOTIFY', 'en_US', 'Subscription Notification', '{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_NOTIFY', 'fa_IR', 'اعلام اشتراک مجله', '{$subscriberName}:<br />\n<br />\nدرحال حاضر شما به عنوان مشترک {$contextName}، با ویژگی های اشتراکی زیر در سامانه الکترونیکی مدیریت مجله ی ما ثبت نام شده اید:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nبه منظور دستیابی به محتویات که فقط برای مشترکان در دسترس می باشد، براحتی با استفاده از نام کاربری تان &amp;lt;{$username}&amp;gt; در این سامانه واردشوید.<br />\n<br />\nبلافاصله پس از ورود به این سامانه، می توانید جزئیات اشتراک خود و رمز عبورتان را تغییر بدهید.<br />\nلطفا توجه کنید درصورتی که دارای اشتراک سازمانی باشید، نیازی به ورود به سیستم ندارید، زیرا این سامانه بصورت اتوماتیک درخواست های اشتراک را تایید می کند.<br />\nلطفا در صورت وجود سوال در این زمینه، با من تماس بگیرید.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_PURCHASE_INDL', 'en_US', 'Subscription Purchase: Individual', 'An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INDL', 'fa_IR', 'خرید اشتراک شخصی', 'An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nکاربر:<br />\n{$userDetails}<br />\n<br />\nاطلاعات عضویت در صورت موجود بودن:<br />\n{$membership}<br />\n<br />\nبرای دیدن یا ویرایش این اشتراک لطفا به آدرس زیر بروید.<br />\n<br />\nSubscription URL: <a href=\"{$subscriptionUrl}\">{$subscriptionUrl}</a>', ''),
('SUBSCRIPTION_PURCHASE_INSTL', 'en_US', 'Subscription Purchase: Institutional', 'An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'fa_IR', 'خرید اشتراک سازمانی', 'An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nمسئول تماس:<br />\n{$userDetails}<br />\n<br />\nاطلاعات عضویت در صورت وجود:<br />\n{$membership}<br />\n<br />\nبرای مشاهده یا ویرایش این اشتراک به آدرس زیر بروید.<br />\n<br />\nآدرس اشتراک: <a href=\"{$subscriptionUrl}\">{$subscriptionUrl}</a>', ''),
('SUBSCRIPTION_RENEW_INDL', 'en_US', 'Subscription Renewal: Individual', 'An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INDL', 'fa_IR', 'تمدید اشتراک شخصی', 'An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nکاربر:<br />\n{$userDetails}<br />\n<br />\nاطلاعات عضویت در صورت وجود:<br />\n{$membership}<br />\n<br />\nبرای مشاهده یا ویرایش این اشتراک به آدرس زیر بروید.<br />\n<br />\nآدرس اشتراک: <a href=\"{$subscriptionUrl}\">{$subscriptionUrl}</a>', ''),
('SUBSCRIPTION_RENEW_INSTL', 'en_US', 'Subscription Renewal: Institutional', 'An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INSTL', 'fa_IR', 'تمدید اشتراک سازمانی', 'یک اشتراک سازمانی بصورت آن لاین برای {$contextName} با اطلاعات زیر تمدید شد.<br />\n<br />\nنوع اشتراک:<br />\n{$subscriptionType}<br />\n<br />\nمؤسسه:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nدامنه در صورت وجود:<br />\n{$domain}<br />\n<br />\nبازه IP در صورت وجود:<br />\n{$ipRanges}<br />\n<br />\nمسؤل تماس:<br />\n{$userDetails}<br />\n<br />\nاطلاعات عضویت در صورت وجود:<br />\n{$membership}<br />\n<br />\nبرای مشاهده و ویرایش این اشتراک، لطفا به آدرس زیر بروید.<br />\n<br />\nآدرس اشتراک: <a href=\"{$subscriptionUrl}\">{$subscriptionUrl}</a>', ''),
('USER_REGISTER', 'en_US', 'Journal Registration', '{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),
('USER_REGISTER', 'fa_IR', 'ثبت نام کاربر جدید', 'برای ثبت نام در {$contextName} از شما سپاسگزارم. لطفا نام کاربری و رمز عبور خود را که برای ورود به وب سایت این مجله مورد نیاز می باشد به خاطر بسپارید.<br />\n<br />\nنام کاربری: {$username}<br />\nرمز عبور: {$password}<br />\n<br />\n<br />\nباتشکر<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),
('USER_VALIDATE', 'en_US', 'Validate Your Account', '{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to validate their email account.'),
('USER_VALIDATE', 'fa_IR', 'حساب کاربری خود را تایید کنید', '{$userFullName}<br />\n<br />\nحساب کاربری شما برای مجله {$contextName}, ایجاد شد. قبل از استفاده می بایست آن را تایید کنید. برای انجام این کار فقط کافی است که بر روی لینک زیر کلیک کنید:<br />\n<br />\n<a href=\"{$activateUrl}\">{$activateUrl}</a><br />\n<br />\nبا تشکر<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_settings`
--

CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_log`
--

CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_log`
--

INSERT INTO `event_log` (`log_id`, `assoc_type`, `assoc_id`, `user_id`, `date_logged`, `event_type`, `message`, `is_translated`) VALUES
(2, 515, 1, 1, '2022-11-09 09:43:47', 1342177281, 'submission.event.fileUploaded', 0),
(4, 515, 1, 1, '2022-11-09 09:43:55', 1342177296, 'submission.event.fileEdited', 0),
(6, 515, 1, 1, '2022-11-09 11:19:31', 1342177282, 'submission.event.fileDeleted', 0),
(7, 1048585, 2, 2, '2022-11-15 09:49:15', 268435458, 'submission.event.general.metadataUpdated', 0),
(8, 515, 2, 2, '2022-11-15 09:49:41', 1342177281, 'submission.event.fileUploaded', 0),
(9, 1048585, 2, 2, '2022-11-15 09:49:42', 1342177288, 'submission.event.fileRevised', 0),
(10, 515, 2, 2, '2022-11-15 09:49:57', 1342177296, 'submission.event.fileEdited', 0),
(11, 1048585, 2, 2, '2022-11-15 09:49:58', 1342177296, 'submission.event.fileEdited', 0),
(12, 1048585, 2, 2, '2022-11-15 09:50:32', 268435458, 'submission.event.general.metadataUpdated', 0),
(13, 1048585, 2, 2, '2022-11-15 09:50:54', 268435457, 'submission.event.submissionSubmitted', 0),
(14, 1048585, 2, 1, '2022-11-15 10:18:10', 268435458, 'submission.event.general.metadataUpdated', 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_log_settings`
--

CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_log_settings`
--

INSERT INTO `event_log_settings` (`log_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
(2, 'fileId', '1', 'int'),
(2, 'fileStage', '2', 'int'),
(2, 'originalFileName', 'example journal submission.docx', 'string'),
(2, 'sourceSubmissionFileId', NULL, 'string'),
(2, 'submissionFileId', '1', 'int'),
(2, 'submissionId', '1', 'int'),
(2, 'username', 'admin', 'string'),
(4, 'fileId', '1', 'int'),
(4, 'fileStage', '2', 'int'),
(4, 'originalFileName', 'example journal submission.docx', 'string'),
(4, 'sourceSubmissionFileId', NULL, 'string'),
(4, 'submissionFileId', '1', 'int'),
(4, 'submissionId', '1', 'int'),
(4, 'username', 'admin', 'string'),
(6, 'fileStage', '2', 'int'),
(6, 'sourceSubmissionFileId', NULL, 'string'),
(6, 'submissionFileId', '1', 'int'),
(6, 'submissionId', '1', 'int'),
(6, 'username', 'admin', 'string'),
(8, 'fileId', '2', 'int'),
(8, 'fileStage', '2', 'int'),
(8, 'originalFileName', 'چارت جریان دوره مقاله.docx', 'string'),
(8, 'sourceSubmissionFileId', NULL, 'string'),
(8, 'submissionFileId', '2', 'int'),
(8, 'submissionId', '2', 'int'),
(8, 'username', 'mshirzad', 'string'),
(9, 'fileId', '2', 'int'),
(9, 'fileStage', '2', 'int'),
(9, 'name', 'چارت جریان دوره مقاله.docx', 'string'),
(9, 'submissionFileId', '2', 'int'),
(9, 'submissionId', '2', 'int'),
(9, 'username', 'mshirzad', 'string'),
(10, 'fileId', '2', 'int'),
(10, 'fileStage', '2', 'int'),
(10, 'originalFileName', 'چارت جریان دوره مقاله.docx', 'string'),
(10, 'sourceSubmissionFileId', NULL, 'string'),
(10, 'submissionFileId', '2', 'int'),
(10, 'submissionId', '2', 'int'),
(10, 'username', 'mshirzad', 'string'),
(11, 'fileId', '2', 'int'),
(11, 'fileStage', '2', 'int'),
(11, 'name', 'چارت جریان دوره مقاله.docx', 'string'),
(11, 'originalFileName', 'چارت جریان دوره مقاله.docx', 'string'),
(11, 'sourceSubmissionFileId', NULL, 'string'),
(11, 'submissionFileId', '2', 'int'),
(11, 'submissionId', '2', 'int'),
(11, 'username', 'mshirzad', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`file_id`, `path`, `mimetype`) VALUES
(2, 'journals/1/articles/2/637352a42b336.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`filter_id`, `filter_group_id`, `context_id`, `display_name`, `class_name`, `is_template`, `parent_filter_id`, `seq`) VALUES
(1, 1, 0, 'Extract metadata from a(n) Submission', 'plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter', 0, 0, 0),
(2, 2, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.IssueCrossrefXmlFilter', 0, 0, 0),
(3, 3, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter', 0, 0, 0),
(4, 4, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(5, 5, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(6, 6, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(7, 7, 0, 'DOAJ XML export', 'plugins.importexport.doaj.filter.DOAJXmlFilter', 0, 0, 0),
(8, 8, 0, 'DOAJ JSON export', 'plugins.importexport.doaj.filter.DOAJJsonFilter', 0, 0, 0),
(9, 9, 0, 'Native XML submission export', 'plugins.importexport.native.filter.ArticleNativeXmlFilter', 0, 0, 0),
(10, 10, 0, 'Native XML submission import', 'plugins.importexport.native.filter.NativeXmlArticleFilter', 0, 0, 0),
(11, 11, 0, 'Native XML issue export', 'plugins.importexport.native.filter.IssueNativeXmlFilter', 0, 0, 0),
(12, 12, 0, 'Native XML issue import', 'plugins.importexport.native.filter.NativeXmlIssueFilter', 0, 0, 0),
(13, 13, 0, 'Native XML issue galley export', 'plugins.importexport.native.filter.IssueGalleyNativeXmlFilter', 0, 0, 0),
(14, 14, 0, 'Native XML issue galley import', 'plugins.importexport.native.filter.NativeXmlIssueGalleyFilter', 0, 0, 0),
(15, 15, 0, 'Native XML author export', 'plugins.importexport.native.filter.AuthorNativeXmlFilter', 0, 0, 0),
(16, 16, 0, 'Native XML author import', 'plugins.importexport.native.filter.NativeXmlAuthorFilter', 0, 0, 0),
(17, 18, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArticleFileFilter', 0, 0, 0),
(18, 17, 0, 'Native XML submission file export', 'lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter', 0, 0, 0),
(19, 19, 0, 'Native XML representation export', 'plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter', 0, 0, 0),
(20, 20, 0, 'Native XML representation import', 'plugins.importexport.native.filter.NativeXmlArticleGalleyFilter', 0, 0, 0),
(21, 21, 0, 'Native XML Publication export', 'plugins.importexport.native.filter.PublicationNativeXmlFilter', 0, 0, 0),
(22, 22, 0, 'Native XML publication import', 'plugins.importexport.native.filter.NativeXmlPublicationFilter', 0, 0, 0),
(23, 23, 0, 'ArticlePubMedXmlFilter', 'plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter', 0, 0, 0),
(24, 24, 0, 'User XML user export', 'lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter', 0, 0, 0),
(25, 25, 0, 'User XML user import', 'lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter', 0, 0, 0),
(26, 26, 0, 'Native XML user group export', 'lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter', 0, 0, 0),
(27, 27, 0, 'Native XML user group import', 'lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `filter_groups`
--

CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_groups`
--

INSERT INTO `filter_groups` (`filter_group_id`, `symbolic`, `display_name`, `description`, `input_type`, `output_type`) VALUES
(1, 'article=>dc11', 'plugins.metadata.dc11.articleAdapter.displayName', 'plugins.metadata.dc11.articleAdapter.description', 'class::classes.submission.Submission', 'metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),
(2, 'issue=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.issue.Issue[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(3, 'article=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.submission.Submission[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(4, 'issue=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.issue.Issue', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(5, 'article=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.submission.Submission', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(6, 'galley=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.article.ArticleGalley', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(7, 'article=>doaj-xml', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
(8, 'article=>doaj-json', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.submission.Submission', 'primitive::string'),
(9, 'article=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.submission.Submission[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(10, 'native-xml=>article', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.submission.Submission[]'),
(11, 'issue=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.Issue[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(12, 'native-xml=>issue', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.Issue[]'),
(13, 'issuegalley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.IssueGalley[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(14, 'native-xml=>issuegalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.IssueGalley[]'),
(15, 'author=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.Author[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(16, 'native-xml=>author', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.Author[]'),
(17, 'SubmissionFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(18, 'native-xml=>SubmissionFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionFile'),
(19, 'article-galley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.ArticleGalley', 'xml::schema(plugins/importexport/native/native.xsd)'),
(20, 'native-xml=>ArticleGalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.ArticleGalley[]'),
(21, 'publication=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.publication.Publication', 'xml::schema(plugins/importexport/native/native.xsd)'),
(22, 'native-xml=>Publication', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.publication.Publication'),
(23, 'article=>pubmed-xml', 'plugins.importexport.pubmed.displayName', 'plugins.importexport.pubmed.description', 'class::classes.submission.Submission[]', 'xml::dtd'),
(24, 'user=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.user.User[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(25, 'user-xml=>user', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::classes.users.User[]'),
(26, 'usergroup=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.security.UserGroup[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(27, 'user-xml=>usergroup', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::lib.pkp.classes.security.UserGroup[]');

-- --------------------------------------------------------

--
-- Table structure for table `filter_settings`
--

CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` smallint(6) NOT NULL DEFAULT 0,
  `supplementary` smallint(6) NOT NULL DEFAULT 0,
  `entry_key` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `context_id`, `seq`, `enabled`, `category`, `dependent`, `supplementary`, `entry_key`) VALUES
(1, 1, 0, 1, 1, 0, 0, 'SUBMISSION'),
(2, 1, 1, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
(3, 1, 2, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
(4, 1, 3, 1, 3, 0, 1, 'RESEARCHRESULTS'),
(5, 1, 4, 1, 3, 0, 1, 'TRANSCRIPTS'),
(6, 1, 5, 1, 3, 0, 1, 'DATAANALYSIS'),
(7, 1, 6, 1, 3, 0, 1, 'DATASET'),
(8, 1, 7, 1, 3, 0, 1, 'SOURCETEXTS'),
(9, 1, 8, 1, 1, 1, 1, 'MULTIMEDIA'),
(10, 1, 9, 1, 2, 1, 0, 'IMAGE'),
(11, 1, 10, 1, 1, 1, 0, 'STYLE'),
(12, 1, 11, 1, 3, 0, 1, 'OTHER');

-- --------------------------------------------------------

--
-- Table structure for table `genre_settings`
--

CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre_settings`
--

INSERT INTO `genre_settings` (`genre_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Article Text', 'string'),
(2, 'en_US', 'name', 'Research Instrument', 'string'),
(3, 'en_US', 'name', 'Research Materials', 'string'),
(4, 'en_US', 'name', 'Research Results', 'string'),
(5, 'en_US', 'name', 'Transcripts', 'string'),
(6, 'en_US', 'name', 'Data Analysis', 'string'),
(7, 'en_US', 'name', 'Data Set', 'string'),
(8, 'en_US', 'name', 'Source Texts', 'string'),
(9, 'en_US', 'name', 'Multimedia', 'string'),
(10, 'en_US', 'name', 'Image', 'string'),
(11, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(12, 'en_US', 'name', 'Other', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscriptions`
--

CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscription_ip`
--

CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` smallint(6) NOT NULL DEFAULT 0,
  `current` smallint(6) NOT NULL DEFAULT 0,
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` smallint(6) NOT NULL DEFAULT 1,
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` smallint(6) NOT NULL DEFAULT 0,
  `show_number` smallint(6) NOT NULL DEFAULT 0,
  `show_year` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 0,
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_files`
--

CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galleys`
--

CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galley_settings`
--

CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_settings`
--

CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_views`
--

CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Used to order lists of journals',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`journal_id`, `path`, `seq`, `primary_locale`, `enabled`) VALUES
(1, 'test-journal', 1.00, 'en_US', 1);

-- --------------------------------------------------------

--
-- Table structure for table `journal_settings`
--

CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journal_settings`
--

INSERT INTO `journal_settings` (`journal_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'contactEmail', 'saalary@ku.af', NULL),
(1, '', 'contactName', 'Mohammad Wali Salari, PhD', NULL),
(1, '', 'contactPhone', '+93 78 16 36 112', NULL),
(1, '', 'copyrightYearBasis', 'issue', NULL),
(1, '', 'defaultReviewMode', '2', NULL),
(1, '', 'disableSubmissions', '0', NULL),
(1, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost/ojs-system/index.php/test-journal\">Testing </a>', NULL),
(1, '', 'enableAnnouncements', '1', NULL),
(1, '', 'enableOai', '1', NULL),
(1, '', 'itemsPerPage', '25', NULL),
(1, '', 'keywords', 'request', NULL),
(1, '', 'mailingAddress', 'KU Post Office, Kabul, Afg', NULL),
(1, '', 'membershipFee', '0', NULL),
(1, '', 'numAnnouncementsHomepage', '3', NULL),
(1, '', 'numPageLinks', '10', NULL),
(1, '', 'numWeeksPerResponse', '4', NULL),
(1, '', 'numWeeksPerReview', '4', NULL),
(1, '', 'publicationFee', '0', NULL),
(1, '', 'publisherInstitution', 'Kabul University Academic Research Center & Scientific Journals', NULL),
(1, '', 'purchaseArticleFee', '0', NULL),
(1, '', 'sidebar', '[]', NULL),
(1, '', 'supportedFormLocales', '[\"en_US\"]', NULL),
(1, '', 'supportedLocales', '[\"en_US\"]', NULL),
(1, '', 'supportedSubmissionLocales', '[\"en_US\"]', NULL),
(1, '', 'supportEmail', 'shirzad.mati@gmail.com', NULL),
(1, '', 'supportName', 'Matiullah Shirzad', NULL),
(1, '', 'supportPhone', '+93 796 895 822', NULL),
(1, '', 'themePluginPath', 'default', NULL),
(1, 'en_US', 'abbreviation', 'JNSR', NULL),
(1, 'en_US', 'about', '<div>\n<p style=\"float: left; margin: 10px;\"><img src=\"http://localhost/ojs-system/public/site/images/admin/natural-science.png\" alt=\"\" width=\"200\" height=\"300\" /></p>\n<p style=\"padding: 10px;\">Journal of Natural Science Review (JNSR) is an international double peer reviewed and open access for academic and practitioners published by Department of Scientific Journals of Kabul University. JNSR aims to promote and advance high-quality research in all areas of mathematics, chemistry, physics, nuclear physics, biology and applied mathematics, animal sciences, Vet. Sciences, agricultural economics and extension, horticulture, plant protection, forestry and natural resource, biotechnology, soil science and irrigation, water resource management, environmental economics, disaster management, mineral, hydrometeorology, geo-economics and geology fields. The journal is quarterly published and is available both in online and printed versions.</p>\n<p>Authors are encouraged to submit original manuscript, research papers, review papers and working papers that are not under review and or not published elsewhere</p>\n</div>', NULL),
(1, 'en_US', 'acronym', 'JNSR', NULL),
(1, 'en_US', 'announcementsIntroduction', '<p>You can find all the announcements made by KU here</p>', NULL),
(1, 'en_US', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/ojs-system/index.php/test-journal/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/ojs-system/index.php/test-journal/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/ojs-system/index.php/test-journal/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/ojs-system/index.php/index/login\">log in</a> and begin the five-step process.', NULL),
(1, 'en_US', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>', NULL),
(1, 'en_US', 'description', '<p>Journal of Natural Science Review (JNSR) is an international double peer reviewed and open access for academic and practitioners published by Department of Scientific Journals of Kabul University. JNSR aims to promote and advance high-quality research in all areas of mathematics, chemistry, physics, nuclear physics, biology and applied mathematics, animal sciences, Vet. Sciences, agricultural economics and extension, horticulture, plant protection, forestry and natural resource, biotechnology, soil science and irrigation, water resource management, environmental economics, disaster management, mineral, hydrometeorology, geo-economics and geology fields. The journal is quarterly published and is available both in online and printed versions.</p>\n<p>Authors are encouraged to submit original manuscript, research papers, review papers and working papers that are not under review and or not published elsewhere.</p>', NULL),
(1, 'en_US', 'editorialTeam', '<p><strong>Editorial Board for Journal of Natural Science Review     </strong></p>\n<table width=\"945\">\n<tbody>\n<tr>\n<td width=\"945\">\n<p><strong>Editor in-Chief</strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Associate Prof. Assadullah Samadi, PhD.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\"> </td>\n</tr>\n<tr>\n<td width=\"945\"> </td>\n</tr>\n<tr>\n<td width=\"945\">\n<p><strong>Editorial Board</strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Asstt. Prof. M. Wali Salari, Bio Technology, Pudue University, USA.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Asstt. Prof. Karima Mohibi PhD, Complex Analysis,  Nara University, Japan</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\"> </td>\n</tr>\n<tr>\n<td width=\"945\">\n<p><strong>Editorial Assistant </strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Asstt. Prof. M. Wali Salari, Bio Technology, Pudue University, USA.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\"> </td>\n</tr>\n<tr>\n<td width=\"945\"> </td>\n</tr>\n<tr>\n<td width=\"945\">\n<p><strong>Reviewer Board</strong></p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Professor M.Anwar Ghury PhD, Function Analysis, Belarus State University, Minsk. </p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Asstt. Prof. Hanif Khan Researcher, Zoology, Kasans Islamabad University, Pakistan. </p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Associate prof. Wahida Yousofzai PhD, Organic chemistry, Ochanomizu University, Japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Professor Ghiyas Safi, MA, Meteorology, Odessa University, Ukraine </p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Professor Habibullah Habib PhD, Environmental Engineering and management (EEM),</p>\n<p>Asian Institute of Technology, Thailand</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Professor Wakil Ahmad Sarhadi, PhD, Agronomy, Tokyo of Agriculture and Technology University, japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Professor M. Zarif Sharifi, PhD, Agronomy, Tokyo of Agriculture and Technology University, japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Professor Amirjan Saidi PhD, Agronomy, Tokyo of Agriculture and Technology University, japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Associate Professor Mir Aqa hussainkhel, Economic and Extension,</p>\n<p>Tokyo of Agriculture and Technology University, japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Associate Professor Khal Muhammad Ahmadzai, Economic and Extension,</p>\n<p>Tokyo of Agriculture and Technology University, japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Asstt. Prof. Najibullah Hasan Zoie, Economic and Extension, Kyushu University, Japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Professor Sakhi dad Salim, Plant Protection, Bangalore University, Japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Asstt. Prof. M. Salim Jamili, Plant Protection, Tokyo of Agriculture and Technology University, japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Professor Ahmad Jawid Zamani, Horticulture, Konkuk University, Korea.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Associate Professor Said Ali Askar Musavi, Animal Science, Tokyo of Agriculture and Technology University, japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Asstt. Prof. M. Dawood Haidari, Soil Science and Irrigation, Tokyo of Agriculture and Technology University, japan.</p>\n</td>\n</tr>\n<tr>\n<td width=\"945\">\n<p>Asstt. Prof. M. Sakhi Pamiri, Bio Technology, Alaha Bat University, India.</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p> </p>', NULL),
(1, 'en_US', 'favicon', '{\"name\":\"LOGO 2.png\",\"uploadName\":\"favicon_en_US.png\",\"width\":1002,\"height\":1020,\"dateUploaded\":\"2022-11-09 10:32:47\",\"altText\":\"\"}', NULL),
(1, 'en_US', 'homepageImage', '{\"name\":\"homepage-v2.jpg\",\"uploadName\":\"homepageImage_en_US.jpg\",\"width\":3811,\"height\":1724,\"dateUploaded\":\"2022-11-16 11:17:03\",\"altText\":\"\"}', NULL),
(1, 'en_US', 'journalThumbnail', '{\"name\":\"Natural Science.png\",\"uploadName\":\"journalThumbnail_en_US.png\",\"width\":2482,\"height\":3513,\"dateUploaded\":\"2022-11-09 10:06:33\",\"altText\":\"JNSR\"}', NULL),
(1, 'en_US', 'librarianInformation', 'We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', NULL),
(1, 'en_US', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>', NULL),
(1, 'en_US', 'name', 'Kabul University  |  Journal of Natural Science Review', NULL),
(1, 'en_US', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', NULL),
(1, 'en_US', 'pageFooter', '<hr />\n<p><strong>About Us</strong></p>\n<p>Journal of Natural Science Review (JNSR) is an international double peer reviewed and open access for academic and practitioners published by Department of Scientific Journals of Kabul University.</p>\n<p> Address: Kabul University, Jamal Mina, Fifth Districts, Kabul Afghanistan - 1001</p>\n<p> Phone (Kabul) : <a class=\"fields\" title=\"Contact KPU\" href=\"tel:+93 7778899\">+93 020000000</a></p>\n<p> E-mail : <a class=\"fields\" title=\"KPU Offic\" href=\"mailto:ijet@kpu.edu.af\">kudsj@ku.edu.af</a></p>\n<p> Work Days: SUN, TUE, THU</p>\n<p> Opening time: 08:00 AM  Closing time: 04:00 PM</p>', NULL),
(1, 'en_US', 'pageHeaderLogoImage', '{\"name\":\"banner.png\",\"uploadName\":\"pageHeaderLogoImage_en_US.png\",\"width\":3618,\"height\":458,\"dateUploaded\":\"2022-11-16 11:06:52\",\"altText\":\"banner\"}', NULL),
(1, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/ojs-system/index.php/test-journal/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/ojs-system/index.php/test-journal/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.', NULL),
(1, 'en_US', 'submissionChecklist', '[{\"order\":1,\"content\":\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\"},{\"order\":2,\"content\":\"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.\"},{\"order\":3,\"content\":\"Where available, URLs for the references have been provided.\"},{\"order\":4,\"content\":\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\"},{\"order\":5,\"content\":\"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.\"}]', NULL),
(1, 'fa_IR', 'abbreviation', NULL, NULL),
(1, 'fa_IR', 'acronym', NULL, NULL),
(1, 'fa_IR', 'description', NULL, NULL),
(1, 'fa_IR', 'name', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `library_files`
--

CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `library_file_settings`
--

CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_descriptions`
--

CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_description_settings`
--

CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menus`
--

CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menus`
--

INSERT INTO `navigation_menus` (`navigation_menu_id`, `context_id`, `area_name`, `title`) VALUES
(1, 0, 'user', 'User Navigation Menu'),
(2, 1, 'user', 'User Navigation Menu'),
(3, 1, 'primary', 'Primary Navigation Menu');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_items`
--

CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_items`
--

INSERT INTO `navigation_menu_items` (`navigation_menu_item_id`, `context_id`, `path`, `type`) VALUES
(1, 0, NULL, 'NMI_TYPE_USER_REGISTER'),
(2, 0, NULL, 'NMI_TYPE_USER_LOGIN'),
(3, 0, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(4, 0, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(5, 0, NULL, 'NMI_TYPE_USER_PROFILE'),
(6, 0, NULL, 'NMI_TYPE_ADMINISTRATION'),
(7, 0, NULL, 'NMI_TYPE_USER_LOGOUT'),
(8, 1, NULL, 'NMI_TYPE_USER_REGISTER'),
(9, 1, NULL, 'NMI_TYPE_USER_LOGIN'),
(10, 1, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(11, 1, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(12, 1, NULL, 'NMI_TYPE_USER_PROFILE'),
(13, 1, NULL, 'NMI_TYPE_ADMINISTRATION'),
(14, 1, NULL, 'NMI_TYPE_USER_LOGOUT'),
(15, 1, NULL, 'NMI_TYPE_CURRENT'),
(16, 1, NULL, 'NMI_TYPE_ARCHIVES'),
(17, 1, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(18, 1, NULL, 'NMI_TYPE_ABOUT'),
(19, 1, NULL, 'NMI_TYPE_ABOUT'),
(20, 1, '', 'NMI_TYPE_SUBMISSIONS'),
(21, 1, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(22, 1, '', 'NMI_TYPE_PRIVACY'),
(23, 1, NULL, 'NMI_TYPE_CONTACT'),
(24, 1, NULL, 'NMI_TYPE_SEARCH'),
(25, 1, 'guidelines', 'NMI_TYPE_CUSTOM'),
(26, 1, 'scope', 'NMI_TYPE_CUSTOM'),
(28, 1, 'authors-guidelines', 'NMI_TYPE_CUSTOM'),
(29, 1, 'publishing-ethics', 'NMI_TYPE_CUSTOM'),
(30, 1, 'ap-charges', 'NMI_TYPE_CUSTOM'),
(31, 1, 'article-format-guidlines', 'NMI_TYPE_CUSTOM'),
(32, 1, 'ep-review', 'NMI_TYPE_CUSTOM'),
(33, 1, 'indexing', 'NMI_TYPE_CUSTOM'),
(34, 1, 'plagiarism-policy', 'NMI_TYPE_CUSTOM'),
(35, 1, 'faqs', 'NMI_TYPE_CUSTOM'),
(36, 1, 'publication-policy', 'NMI_TYPE_CUSTOM');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_assignments`
--

CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

INSERT INTO `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`, `navigation_menu_id`, `navigation_menu_item_id`, `parent_id`, `seq`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 0, 1),
(3, 1, 3, 0, 2),
(4, 1, 4, 3, 0),
(5, 1, 5, 3, 1),
(6, 1, 6, 3, 2),
(7, 1, 7, 3, 3),
(8, 2, 8, 0, 0),
(9, 2, 9, 0, 1),
(10, 2, 10, 0, 2),
(11, 2, 11, 10, 0),
(12, 2, 12, 10, 1),
(13, 2, 13, 10, 2),
(14, 2, 14, 10, 3),
(224, 3, 18, 0, 0),
(225, 3, 19, 18, 1),
(226, 3, 17, 18, 2),
(227, 3, 21, 18, 3),
(228, 3, 35, 18, 4),
(229, 3, 23, 18, 5),
(230, 3, 26, 0, 6),
(231, 3, 25, 0, 7),
(232, 3, 28, 25, 8),
(233, 3, 31, 25, 9),
(234, 3, 29, 25, 10),
(235, 3, 30, 25, 11),
(236, 3, 32, 25, 12),
(237, 3, 34, 0, 13),
(238, 3, 20, 0, 14),
(239, 3, 15, 0, 15),
(240, 3, 16, 0, 16),
(241, 3, 33, 0, 17);

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

INSERT INTO `navigation_menu_item_assignment_settings` (`navigation_menu_item_assignment_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(0, 'en_US', 'title', 'Index', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_settings`
--

CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_item_settings`
--

INSERT INTO `navigation_menu_item_settings` (`navigation_menu_item_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'titleLocaleKey', 'navigation.register', 'string'),
(2, '', 'titleLocaleKey', 'navigation.login', 'string'),
(3, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(4, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(5, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(6, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(7, '', 'titleLocaleKey', 'user.logOut', 'string'),
(8, '', 'titleLocaleKey', 'navigation.register', 'string'),
(9, '', 'titleLocaleKey', 'navigation.login', 'string'),
(10, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(11, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(12, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(13, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(14, '', 'titleLocaleKey', 'user.logOut', 'string'),
(15, '', 'titleLocaleKey', 'navigation.current', 'string'),
(16, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(17, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(18, '', 'titleLocaleKey', 'navigation.about', 'string'),
(19, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(20, '', 'titleLocaleKey', 'about.submissions', 'string'),
(20, 'en_US', 'content', '', 'string'),
(20, 'en_US', 'remoteUrl', '', 'string'),
(20, 'en_US', 'title', 'Submit an Articale', 'string'),
(21, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(22, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(22, 'en_US', 'content', '', 'string'),
(22, 'en_US', 'remoteUrl', '', 'string'),
(22, 'en_US', 'title', 'Privacy Statement', 'string'),
(23, '', 'titleLocaleKey', 'about.contact', 'string'),
(24, '', 'titleLocaleKey', 'common.search', 'string'),
(25, 'en_US', 'content', '<p><strong>Articles Review Process </strong></p>\r\n<p>Step 1: Basic Check</p>\r\n<p>The editor or editorial assistant checks a received manuscript to determine whether it fits the journal’s aim and scope. Manuscripts out of the journal’s scope are rejected. Articles published fully or partly in other publications/websites are not reviewed or accepted.</p>\r\n<p>&nbsp;</p>\r\n<p>Step 2: Similarity Check</p>\r\n<p>Please be aware that we check all submitted manuscripts for plagiarism. We use Turnitin, the leading plagiarism-detection system to check for similarity to previously published documents. All manuscripts containing plagiarism, including self-plagiarism, and dishonesty are rejected.</p>\r\n<p>&nbsp;</p>\r\n<p>Step 3: Peer Review</p>\r\n<p>We use a double-blind system for peer review; both reviewers’ and authors\' identities remain anonymous. The submitted manuscript will be reviewed by Editorial Board and Reviewer Board members. The review process may take four to ten weeks. In some rare cases, according to the recommendations from editors and reviewers, a second round of peer review may be initiated.</p>\r\n<p>&nbsp;</p>\r\n<p>Step 4: Acceptance/Rejection Decision</p>\r\n<p>The decision to accept an article is based on the average score given by reviewers. The reviewers grade a submitted manuscript on a scale of 1 to 5. To be accepted for publication, the manuscript must obtain an average score not less than 2.5 (some journals require a higher score). However, we may reject a manuscript with a score higher than 2.5 when an editor or reviewer thinks it is not suitable for publication.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Journal Publishing Workflow</strong></p>\r\n<p>Please see the workflow for the article publication:</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://localhost/ojs-system/public/site/images/admin/workflow-diagram.jpg\" alt=\"\" width=\"1425\" height=\"832\"></p>', 'string'),
(25, 'en_US', 'remoteUrl', '', 'string'),
(25, 'en_US', 'title', 'Manuscript Preparation', 'string'),
(26, 'en_US', 'content', '<p>scope content here</p>', 'string'),
(26, 'en_US', 'remoteUrl', '', 'string'),
(26, 'en_US', 'title', 'Scope', 'string'),
(28, 'en_US', 'content', '<p>Article Title: Times New Roman; Size-16; Line Spacing: Fixed-20pt; Paragraph Spacing: Above Paragraph-10pt, Below Paragraph-10pt</p>\r\n<p>Anne Smith<sup>1</sup>, Mary A. Meade<sup>1,2</sup>, David Wolf II<sup>1</sup> &amp; Charles Rockefeller Jr.<sup>2</sup></p>\r\n<p><sup>1</sup> Faculty of Economics, Kabul University, Kabul, Afghansitan</p>\r\n<p><sup>2</sup> School of Economics, Peking University, Beijing, China</p>\r\n<p>Correspondence: David Wolf II, School of Management, Northern Canada University, Toronto, ON., M3A 2K7, Canada. Tel: 1-613-947-3592 E-mail: davidwolf@ncu.ca</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>----------------------------------------------------------------------------------------------------------------------------------------------------</p>\r\n<p><strong>Suggested Reviewers</strong> (Optional)</p>\r\n<p>&nbsp;</p>\r\n<p>Please suggest 3-5 reviewers for this article. We may select reviewers from the list below in case we have no appropriate reviewers for this topic.</p>\r\n<p>&nbsp;</p>\r\n<table style=\"height: 89px;\" width=\"700\">\r\n<tbody>\r\n<tr>\r\n<td width=\"293\">\r\n<p>Name:</p>\r\n</td>\r\n<td width=\"319\">\r\n<p>E-mail:</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan=\"2\" width=\"612\">\r\n<p>Affiliation:</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<table style=\"height: 88px;\" width=\"700\">\r\n<tbody>\r\n<tr>\r\n<td width=\"293\">\r\n<p>Name:</p>\r\n</td>\r\n<td width=\"319\">\r\n<p>E-mail:</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan=\"2\" width=\"612\">\r\n<p>Affiliation:</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<table style=\"height: 91px;\" width=\"696\">\r\n<tbody>\r\n<tr>\r\n<td width=\"293\">\r\n<p>Name:</p>\r\n</td>\r\n<td width=\"319\">\r\n<p>E-mail:</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan=\"2\" width=\"612\">\r\n<p>Affiliation:</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<table style=\"height: 88px;\" width=\"697\">\r\n<tbody>\r\n<tr>\r\n<td width=\"293\">\r\n<p>Name:</p>\r\n</td>\r\n<td width=\"319\">\r\n<p>E-mail:</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan=\"2\" width=\"612\">\r\n<p>Affiliation:</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<table style=\"height: 57px;\" width=\"699\">\r\n<tbody>\r\n<tr>\r\n<td width=\"293\">\r\n<p>Name:</p>\r\n</td>\r\n<td width=\"319\">\r\n<p>E-mail:</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td colspan=\"2\" width=\"612\">\r\n<p>Affiliation:</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p>Article Title; Times New Roman; Size-16; Line Spacing: Fixed-20pt; Paragraph Spacing: Above Paragraph-10pt, Below Paragraph-10pt</p>\r\n<p><em>Because of the double-blind review, the authors’ information should not be included in this part. Please put authors’ information in the first page only.</em></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Abstract</strong></p>\r\n<p>An abstract is a brief, comprehensive summary of the contents of the article; it allows readers to survey the contents of an article quickly and, like a title, it enables persons interested in the document to retrieve it from abstracting and indexing databases. Most scholarly journals require an abstract. Consult the instructions to authors or web page of the journal to which you plan to submit your article for any journal-specific instructions. A well-prepared abstract can be the most important single paragraph in an article. Most people have their first contact with an article by seeing just the abstract, usually in comparison with several other abstracts, as they are doing a literature search. Readers frequently decide on the basis of the abstract whether to read the entire article. The abstract needs to be dense with information. By embedding key words in your abstract, you enhance the user’s ability to find it. Do not exceed the abstract word limit of the journal to which you are submitting your article. Word limits vary from journal to journal and typically range from 150 to 250 words. For information on how abstracts are used to retrieve articles, consult Record Structure for APA Databases (Sick, 2009).</p>\r\n<p><strong>Keywords:</strong> low case, comma, paper template, abstract, keywords, introduction</p>\r\n<ol>\r\n<li><strong> Introduction</strong></li>\r\n</ol>\r\n<p><em>1.1 Introduce the Problem</em></p>\r\n<p>The body of a manuscript opens with an introduction that presents the specific problem under study and describes the research strategy. Because the introduction is clearly identified by its position in the manuscript, it does not carry a heading labeling it the introduction. Before writing the introduction, consider the following questions (Beck &amp; Sales, 2001, p. 100):</p>\r\n<ul>\r\n<li>Why is this problem important?</li>\r\n<li>How does the study relate to previous work in the area? If other aspects of this study have been reported previously, how does this report differ from, and build on, the earlier report?</li>\r\n<li>What are the primary and secondary hypotheses and objectives of the study, and what, if any, are the links to theory?</li>\r\n<li>How do the hypotheses and research design relate to one another?</li>\r\n<li>What are the theoretical and practical implications of the study?</li>\r\n</ul>\r\n<p>A good introduction answers these questions in just a few pages and, by summarizing the relevant arguments and the past evidence, gives the reader a firm sense of What was done and why (Beck &amp; Sales, 2001, pp. 100-102).</p>\r\n<p><em>1.2 Explore Importance of the Problem</em></p>\r\n<p>State why the problem deserves new research. For basic research, the statement about importance might involve the need to resolve any inconsistency in results of past work and/or extend the reach of a theoretical formulation. For applied research, this might involve the need to solve a social problem or treat a psychological disorder. When research is driven by the desire to resolve controversial issues, all sides in the debate should be represented in balanced measure in the introduction. Avoid animosity and ad hominem arguments in presenting the controversy. Conclude the statement of the problem in the introduction with a brief but formal statement of the purpose of the research that summarizes the material preceding it. For literature reviews as well as theoretical and methodological articles, also clearly state the reasons that the reported content is important and how the article fits into the cumulative understanding of the field.</p>\r\n<p><em>1.3 Describe Relevant Scholarship</em></p>\r\n<p>Discuss the relevant related literature, but do not feel compelled to include an exhaustive historical account. Assume that the reader is knowledgeable about the basic problem and does not require a complete accounting of its history. A scholarly description of earlier work in the introduction provides a summary of the most recent directly related work and recognizes the priority of the work of others. Citation of and specific credit to relevant earlier works are signs of scientific and scholarly responsibility and are essential for the growth of a cumulative science. In the description of relevant scholarship, also inform readers whether other aspects of this study have been reported on previously and how the current use of the evidence differs from earlier uses. At the same time, cite and reference only works pertinent to the specific issue and not those that are of only tangential or general significance. When summarizing earlier works, avoid nonessential details; instead, emphasize pertinent findings, relevant methodological issues, and major conclusions. Refer the reader to general surveys or research syntheses of the topic if they are available. Demonstrate the logical continuity between previous and present work. Develop the problem with enough breadth and clarity to make it generally understood by as wide a professional audience as possible (Beck &amp; Sales, 2001). Do not let the goal of brevity lead you to write a statement intelligible only to the specialist.</p>\r\n<p><em>1.4 State Hypotheses and Their Correspondence to Research Design</em></p>\r\n<p>After you have introduced the problem and have developed the background material, explain your approach to solving the problem. In empirical studies, this usually involves stating your hypotheses or specific question and describing how these were derived from theory or are logically connected to previous data and argumentation. Clearly develop the rationale for each. Also, if you have some hypotheses or questions that are central to your purpose and others that are secondary or exploratory, state this prioritization. Explain how the research design permits the inferences needed to examine the hypothesis or provide estimates in answer to the question.</p>\r\n<ol start=\"2\">\r\n<li><strong> Method</strong></li>\r\n</ol>\r\n<p>The Method section describes in detail how the study was conducted, including conceptual and operational definitions of the variables used in the study, Different types of studies will rely on different methodologies; however, a complete description of the methods used enables the reader to evaluate the appropriateness of your methods and the reliability and the validity of your results, It also permits experienced investigators to replicate the study, If your manuscript is an update of an ongoing or earlier study and the method has been published in detail elsewhere, you may refer the reader to that source and simply give a brief synopsis of the method in this section.</p>\r\n<p><em>2.1 Identify Subsections</em></p>\r\n<p>It is both conventional and expedient to divide the Method section into labeled subsections. These usually include a section with descriptions of the participants or subjects and a section describing the procedures used in the study. The latter section often includes description of (a) any experimental manipulations or interventions used and how they were delivered-for example, any mechanical apparatus used to deliver them; (b) sampling procedures and sample size and precision; (c) measurement approaches (including the psychometric properties of the instruments used); and (d) the research design. If the design of the study is complex or the stimuli require detailed description, additional subsections or subheadings to divide the subsections may be warranted to help readers find specific information.</p>\r\n<p>Include in these subsections the information essential to comprehend and replicate the study. Insufficient detail leaves the reader with questions; too much detail burdens the reader with irrelevant information. Consider using appendices and/or a supplemental website for more detailed information.</p>\r\n<p><em>2.2 Participant (Subject) Characteristics</em></p>\r\n<p>Appropriate identification of research participants is critical to the science and practice of psychology, particularly for generalizing the findings, making comparisons across replications, and using the evidence in research syntheses and secondary data analyses. If humans participated in the study, report the eligibility and exclusion criteria, including any restrictions based on demographic characteristics.</p>\r\n<p><em>2.3 Sampling Procedures</em></p>\r\n<p>Describe the procedures for selecting participants, including (a) the sampling method, if a systematic sampling plan was used; (b) the percentage of the sample approached that participated; and (c) the number of participants who selected themselves into the sample. Describe the settings and locations in which the data were collected as well as any agreements and payments made to participants, agreements with the institutional review board, ethical standards met, and safety monitoring procedures.</p>\r\n<p>2.3.1 Sample Size, Power, and Precision</p>\r\n<p>Along with the description of subjects, give the mended size of the sample and number of individuals meant to be in each condition if separate conditions were used. State whether the achieved sample differed in known ways from the target population. Conclusions and interpretations should not go beyond what the sample would warrant.</p>\r\n<p>2.3.2 Measures and Covariates</p>\r\n<p>Include in the Method section information that provides definitions of all primary and secondary outcome measures and covariates, including measures collected but not included in this report. Describe the methods used to collect data (e.g., written questionnaires, interviews, observations) as well as methods used to enhance the quality of the measurements (e.g., the training and reliability of assessors or the use of multiple observations). Provide information on instruments used, including their psychometric and biometric properties and evidence of cultural validity.</p>\r\n<p>2.3.3 Research Design</p>\r\n<p>Specify the research design in the Method section. Were subjects placed into conditions that were manipulated, or were they observed naturalistically? If multiple conditions were created, how were participants assigned to conditions, through random assignment or some other selection mechanism? Was the study conducted as a between-subjects or a within-subject design?</p>\r\n<p>2.3.4 Experimental Manipulations or Interventions</p>\r\n<p>If interventions or experimental manipulations were used in the study, describe their specific content. Include the details of the interventions or manipulations intended for each study condition, including control groups (if any), and describe how and when interventions (experimental manipulations) were actually administered.</p>\r\n<p>The text size of formula should be similar with normal text size. The formula should be placed in the middle and serial number on the right. For example:</p>\r\n<p><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a<sup>2</sup>+b<sup>2</sup>=c<sup>2</sup></em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1)</p>\r\n<ol start=\"3\">\r\n<li><strong> Results</strong></li>\r\n</ol>\r\n<p>In the Results section, summarize the collected data and the analysis performed on those data relevant to the discourse that is to follow. Report the data in sufficient detail to justify your conclusions. Mention all relevant results, including those that run counter to expectation; be sure to include small effect sizes (or statistically nonsignificant findings) when theory predicts large (or statistically significant) ones. Do not hide uncomfortable results by omission. Do not include individual scores or raw data with the exception, for example, of single-case designs or illustrative examples. In the spirit of data sharing (encouraged by APA and other professional associations and sometimes required by funding agencies), raw data, including study characteristics and indivldual effect sizes used in a meta -analysis, can be made available on supplemental online archives.</p>\r\n<p><em>3.1</em> <em>Recruitment</em></p>\r\n<p>Provide dates defining the periods of recruitment and follow-up and the pnmary sources of the potential subjects, where appropriate. If these dates differ by group, provide the values for each group.</p>\r\n<p><em>3.2</em> <em>Statistics and Data Analysis</em></p>\r\n<p>Analysis of data and the reporting of the results of those analyses are fundamental aspects of the conduct of research. Accurate, unbiased, complete, and insightful reporting of the analytic treatment of data (be it quantitative or qualitative) must be a component of all research reports. Researchers in the field of psychology use numerous approaches to the analysis of data, and no one approach is uniformly preferred as long as the method is appropriate to the research questions being asked and the nature of the data collected. The methods used must support their analytic burdens, including robustness to violations of the assumptions that underlie them, and they must provide clear, unequivocal insights into the data.</p>\r\n<p><em>3.3 Ancillary Analyses</em></p>\r\n<p>Report any other analyses performed, including subgroup analyses and adjusted analyses, indicating those that were pre-specified and those that were exploratory (though not necessarily in the level of detail of primary analyses). Consider putting the detailed results of these analyses on the supplemental online archive. Discuss the implications, if any, of the ancillary analyses for statistical error rates.</p>\r\n<p><em>3.4</em> <em>Participant Flow</em></p>\r\n<p>For experimental and quasi-experimental designs, there must be a description of the flow of participants (human, animal, or units such as classrooms or hospital wards) through the study. Present the total number of units recruited into the study and the number of participants assigned to each group. Provide the number of participants who did not complete the experiment or crossed over to other conditions and explain why. Note the number of participants used in the primary analyses. (This number might differ from the number who completed the study because participants might not show up for or complete the final measurement.)</p>\r\n<p><em>3.5 Intervention or Manipulation Fidelity </em></p>\r\n<p>If interventions or experimental manipulations were used, provide evidence on whether they were delivered as intended. In basic experimental research, this might be the results of checks on the manipulation. In applied research, this might be, for example, records and observations of intervention delivery sessions and attendance records.</p>\r\n<p><em>3.6</em> <em>Baseline Data</em></p>\r\n<p>Be sure that baseline demographic and/or clinical characteristics of each group are provided.</p>\r\n<p>3.6.1 Statistics and Data Analysis</p>\r\n<p>In studies reporting the results of experimental manipulations or interventions, clarify whether the analysis was by intent-ta-treat. That is, were all participants assigned to conditions included in the data analysis regardless of whether they actually received the intervention, or were only participants who completed the intervention satisfactorily included? Give a rationale for the choice.</p>\r\n<p>3.6.2 Adverse Events</p>\r\n<p>If interventions were studied, detail all important adverse events (events with serious consequences) and/or side effects in each intervention group.</p>\r\n<p>&nbsp;</p>\r\n<p>Table 1. Table title (this is an example of table 1)</p>\r\n<table style=\"height: 139px;\" width=\"704\">\r\n<tbody>\r\n<tr>\r\n<td width=\"142\">\r\n<p>&nbsp;</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>&nbsp;</p>\r\n</td>\r\n<td colspan=\"2\" width=\"284\">\r\n<p>95%CI</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"142\">\r\n<p>Condition</p>\r\n</td>\r\n<td width=\"142\">\r\n<p><em>M</em>(<em>SD</em>)</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>LL</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>UL</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"142\">\r\n<p>Letters</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>14.5(28.6)</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>5.4</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>23.6</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"142\">\r\n<p>Digits</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>31.8(33.2)</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>21.2</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>42.4</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><em>Note.</em> Place table caption in front of table body and description below the table body. Avoid vertical rules. Be sparing in the use of tables and ensure that the data presented in tables do not duplicate results described elsewhere in the article. You may resize the tables to fit the page size.</p>\r\n<p>&nbsp;</p>\r\n<ol start=\"4\">\r\n<li><strong> Discussion</strong></li>\r\n</ol>\r\n<p>After presenting the results, you are in a position to evaluate and interpret their implications, especially with respect to your original hypotheses. Here you will examine, interpret, and qualify the results and draw inferences and conclusions from them. Emphasize any theoretical or practical consequences of the results. (When the discussion is relatively brief and straightforward, some authors prefer to combine it with the Results section, creating a section called Results and Discussion.)</p>\r\n<p>Open the Discussion section with a clear statement of the support or nonsupport for your original hypotheses, distinguished by primary and secondary hypotheses. If hypotheses were not supported, offer post hoc explanations. Similarities and differences between your results and the work of others should be used to contextualize, confirm, and clarify your conclusions. Do not simply reformulate and repeat points already made; each new statement should contribute to your interpretation and to the reader’s understanding of the problem.</p>\r\n<p>Your interpretation of the results should take into account (a) sources of potential bias and other threats to internal validity, (b) the imprecision of measures, (c) the overall number of tests or overlap among tests, (d) the effect sizes observed, and (e) other limitations or weaknesses of the study. If an intervention is involved, discuss whether it was successful and the mechanism by which it was intended to work (causal pathways) and/or alternative mechanisms. Also, discuss barriers to implementing the intervention or manipulation as well as the fidelity with which the intervention or manip ulation was implemented in the study, that is, any differences between the manipulation as planned and as implemented.</p>\r\n<p>Acknowledge the limitations of your research, and address alternative explanations of the results. Discuss the generalizability, or external validity, of the findings. This critical analysis should take into account differences between the target population and the accessed sample. For interventions, discuss characteristics that make them more or less applicable to circumstances not included in the study, how and what outcomes were measured (relative to other measures that might have been used), the length of time to measurement (between the end of the intervention and the measurement of outcomes), incentives, compliance rates, and specific settings involved in the study as well as other contextual issues.</p>\r\n<p>End the Discussion section with a reasoned and justifiable commentary on the importance of your findings. This concluding section may be brief or extensive provided that it is tightly reasoned, self-contained, and not overstated. In this section, you might briefly return to a discussion of why the problem is important (as stated in the introduction); what larger issues, those that transcend the particulars of the subfield, might hinge on the findings; and what propositions are confirmed or disconfirmed by the extrapolation of these findings to such overarching issues.</p>\r\n<p>&nbsp;</p>\r\n<p>You may also consider the following issues:</p>\r\n<ul>\r\n<li>What is the theoretical, clinical, or practical significance of the outcomes, and what is the basis for these interpretations? If the findings are valid and replicable, what real-life psychological phenomena might be explained or modeled by the results? Are applications warranted on the basis of this research? (Note 1)</li>\r\n<li>What problems remain unresolved or arise anew because of these findings? The responses to these questions are the core of the contribution of your study and justify why readers both inside and outside your own specialty should attend to the findings. Your readers should receive clear, unambiguous, and direct answers. (Note 2)</li>\r\n</ul>\r\n<p><img src=\"http://localhost/ojs-system/public/site/images/admin/f1.jpg\" alt=\"\" width=\"475\" height=\"285\"></p>\r\n<p>Figure 1. Figure title (This is an example of figure 1)</p>\r\n<p><em>Note.</em> Number figures consecutively in accordance with their appearance in the text. Place figures caption and description below the figure body. (Resolution: 300 dpi). You may resize the figures or schemes to fit the page size.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Acknowledgments</strong></p>\r\n<p>Identify grants or other financial support (and the source, if appropriate) for your study; do not precede grant numbers by No. or #. Next, acknowledge colleagues who assisted in conducting the study or critiquing the manuscript. Do not acknowledge the persons routinely involved in the review and acceptance of manuscripts  peer reviewers or editors, associate editors, and consulting editors of the journal in which the article is to appear. In this paragraph, also explain any special agreements concerning authorship, such as if authors contributed equally to the study. End this paragraph with thanks for personal assistance, such as in manuscript preparation.</p>\r\n<p><strong>References</strong></p>\r\n<p>American Psychological Association. (1972). <em>Ethical standards of psychologists</em>. Washington, DC: American Psychological Association.</p>\r\n<p>Anderson, C. A., Gentile, D. A., &amp; Buckley, K. E. (2007). <em>Violent video game effects on children and adolescents: Theory, research and public policy.</em> https://doi.org/10.1093/acprof:oso/9780195309836.001.0001</p>\r\n<p>Beck, C. A. J., &amp; Sales, B. D. (2001). <em>Family mediation: Facts, myths, and future prospects</em> (pp. 100-102). Washington, DC: American Psychological Association. https://doi.org/10.1037/10401-000</p>\r\n<p>Bernstein, T. M. (1965). <em>The careful writer: A modern guide to English usage</em> (2nd ed.). New York, NY: Atheneum.</p>\r\n<p>Bjork, R. A. (1989). Retrieval inhibition as an adaptive mechanism in human memory. In H. L. Roediger III, &amp; F. I. M. Craik (Eds.), <em>Varieties of memory &amp; consciousness</em> (pp. 309-330). Hillsdale, NJ: Erlbaum.</p>\r\n<p>Cress, C. M. (2009). <em>Curricular strategies for student success and engaged learning</em> [PowerPoint slides]. Retrieved from <a href=\"http://www.vtcampuscompact.org/2009/TCL_post/presenter_powerpoints /Christine%20Cress%20-%20Curricular%20Strategies.ppt\" target=\"_blank\" rel=\"noopener\">http://www.vtcampuscompact.org/2009 /ChristineCressCurricularStrategies.ppt</a></p>\r\n<p>Driedger, S. D. (1998, April 20). After divorce. <em>Maclean’s</em>,<em> 111</em>(16), 38-43.</p>\r\n<p>Gibbs, J. T., &amp; Huang, L. N. (Eds.). (1991). <em>Children of color: Psychological interventions with minority youth</em>. San Francisco, CA: Jossey-Bass.</p>\r\n<p>Gilbert, D. G., McClernon, J. F., Rabinovich, N. E., Sugai, C., Plath, L. C., Asgaard, G., ... Botros, N. (2004). Effects of quitting smoking on EEG activation and attention last for more than 31 days and are more severe with stress, dependence, DRD2 A 1 allele, and depressive traits. <em>Nicotine and Tobacco Research</em>, <em>6</em>, 249-267. https://doi.org/10.1 080/1462220041 0001676305</p>\r\n<p>Goleman, D. (2009). What makes a leader? In D. Demers (Ed.), <em>AHSC 230: Interpersonal communication and relationships</em> (pp. 47-56). Montreal, Canada: Concordia University Bookstore. (Reprinted from <em>Harvard Business Review</em>, <em>76</em>(6), pp. 93-102, 1998).</p>\r\n<p>Guignon, C. B. (1998). Existentialism. In E. Craig (Ed.), <em>Routledge encyclopedia of philosophy</em> (Vol. 3, pp. 493-502). London, England: Routledge.</p>\r\n<p>Healey, D. (2005). <em>Attention deficit/hyperactivity disorder and creativity: An investigation into their relationship</em> (Unpublished doctoral dissertation). University of Canterbury, Christchurch, New Zealand.</p>\r\n<p>Herculano-Houzel, S., Collins, C. E., Wong, P., Kaas, J. H., &amp; Lent, R. (2008). The basic nonuniformity of the cerebral cortex. <em>Proceedings of the National Academy of Sciences</em>, <em>105</em>, 12593-12598. https://doi.org/10.1073/pnas.0805417105</p>\r\n<p>Klimoski, R., &amp; Palmer, S. (1993). The ADA and the hiring process in organizations. <em>Consulting Psychology Journal: Practice and Research</em>, <em>45</em>(2), 10-36. https://doi.org/10.1037/1061-4087.45.2.10</p>\r\n<p>Kubrick, S. (Director). (1980). <em>The Shining</em> [Motion picture]. United States: Warner Brothers.</p>\r\n<p>Liu, S. (2005, May). <em>Defending against business crises with the help of intelligent agent based early warning solutions</em>. Paper presented at the Seventh International Conference on Enterprise Information Systems, Miami, FL. Abstract retrieved from <a href=\"http://www.iceis.org/iceis2005/abstracts_2005.htm\">http://www.iceis.org/iceis2005/abstracts_2005.htm</a></p>\r\n<p>MacIntyre, L. (Reporter). (2002, January 23). Scandal of the Century [Television series episode]. In H. Cashore (Producer), <em>The fifth estate</em>. Toronto, Canada: Canadian Broadcasting Corporation.</p>\r\n<p>McLuhan, M. (1970a). <em>Culture is our business</em>. New York, NY: McGraw-Hill.</p>\r\n<p>McLuhan, M. (1970b). <em>From cliche to archetype</em>. New York, NY: Viking Press.</p>\r\n<p>Mellers, B. A. (2000). Choice and the relative pleasure of consequences. <em>Psychological Bulletin</em>,<em> 126</em>, 910-924. https://doi.org/10.1037/0033-2909.126.6.910</p>\r\n<p>Postman, N. (1979). <em>Teaching as a conserving activity</em>. New York, NY: Delacorte Press.</p>\r\n<p>Postman, N. (1985). <em>Amusing ourselves to death: Public discourse in the age of show business</em>. New York, NY: Viking.</p>\r\n<p>Semenak, S. (1995, December 28). Feeling right at home: Government residence eschews traditional rules. <em>Montreal Gazette</em>, p. A4.</p>\r\n<p>Strong, E. K. Jr., &amp; Uhrbrock, R. S. (1923). Bibliography on job analysis. In L. Outhwaite (Series Ed.), <em>Personnel Research Series: Vol. 1. Job analysis and the curriculum</em> (pp. 140-146). https://doi.org/10.1037/10762-000</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>Notes</strong></p>\r\n<p>Note 1. This is an example.</p>\r\n<p>Note 2. This is an example for note 2.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Appendix A </strong></p>\r\n<p><strong>The Heading to Appendix A</strong></p>\r\n<p>In general, an appendix is appropriate for materials that are relatively brief and that are easily presented in print format. Some examples of material suitable for an appendix are (a) a list of stimulus materials (e.g., those used in psycholinguistic research), (b) a detailed description of a complex piece of equipment, (c) a list of articles that provided the source data for a meta-analysis but are not directly referred to in any other way in an article, and (d) a detailed demographic description of subpopulations in the study and other detailed and/or complex reporting items suggested in the reporting standards section of this chapter.</p>\r\n<p>If your manuscript has only one appendix, label it Appendix; if your manuscript has more than one appendix, label each one with a capital letter (Appendix A, Appendix B, etc.) in the order in which it is mentioned in the main text. Each appendix must have a title. In the text, refer to appendices by their labels: produced the same results for both studies (see Appendices A and B for complete proofs).</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Appendix B </strong></p>\r\n<p><strong>The Heading to Appendix B</strong></p>\r\n<p>Like the main text, an appendix may include headings and subheadings as well as tables, figures, and displayed equations. Number each appendix table and figure, and number displayed equations if necessary for later reference; precede the number with the letter of the appendix in which it is included (e.g., Table A1). In a sole appendix, which is not labeled with a letter, precede all tables, figures, and equation numbers with the letter A to distinguish them from those of the main text.</p>\r\n<p>&nbsp;</p>\r\n<p>Table B1. Table title (this is an example of table B1)</p>\r\n<table style=\"height: 117px;\" width=\"709\">\r\n<tbody>\r\n<tr>\r\n<td width=\"168\">\r\n<p>&nbsp;</p>\r\n</td>\r\n<td width=\"120\">\r\n<p>Total capital stock</p>\r\n</td>\r\n<td width=\"155\">\r\n<p>Income of main business</p>\r\n</td>\r\n<td width=\"85\">\r\n<p>Total assets</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"168\">\r\n<p>Pudong Development Bank</p>\r\n</td>\r\n<td width=\"120\">\r\n<p>39.2</p>\r\n</td>\r\n<td width=\"155\">\r\n<p>214.7</p>\r\n</td>\r\n<td width=\"85\">\r\n<p>5730.7</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"168\">\r\n<p>Bank of China</p>\r\n</td>\r\n<td width=\"120\">\r\n<p>459.4</p>\r\n</td>\r\n<td width=\"155\">\r\n<p>3345.7</p>\r\n</td>\r\n<td width=\"85\">\r\n<p>59876.9</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p>Table B2. Table title (this is an example of table B2)</p>\r\n<table style=\"height: 106px;\" width=\"706\">\r\n<tbody>\r\n<tr>\r\n<td width=\"168\">\r\n<p>&nbsp;</p>\r\n</td>\r\n<td width=\"120\">\r\n<p>Total capital stock</p>\r\n</td>\r\n<td width=\"155\">\r\n<p>Income of main business</p>\r\n</td>\r\n<td width=\"85\">\r\n<p>Total assets</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"168\">\r\n<p>Pudong Development Bank</p>\r\n</td>\r\n<td width=\"120\">\r\n<p>39.2</p>\r\n</td>\r\n<td width=\"155\">\r\n<p>214.7</p>\r\n</td>\r\n<td width=\"85\">\r\n<p>5730.7</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"168\">\r\n<p>Bank of China</p>\r\n</td>\r\n<td width=\"120\">\r\n<p>459.4</p>\r\n</td>\r\n<td width=\"155\">\r\n<p>3345.7</p>\r\n</td>\r\n<td width=\"85\">\r\n<p>59876.9</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://localhost/ojs-system/public/site/images/admin/fb1.jpg\" alt=\"\" width=\"475\" height=\"285\"></p>\r\n<p>Figure B1. Figure title (This is an example of figure B1)</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>Appendix C</strong></p>\r\n<p><strong>The Heading to Appendix C</strong> (If one table constitutes an entire appendix, the appendix label and title serve in lieu of a table number and title.)</p>\r\n<table style=\"height: 135px;\" width=\"715\">\r\n<tbody>\r\n<tr>\r\n<td width=\"142\">\r\n<p>&nbsp;</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>&nbsp;</p>\r\n</td>\r\n<td colspan=\"2\" width=\"284\">\r\n<p>95%CI</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"142\">\r\n<p>Condition</p>\r\n</td>\r\n<td width=\"142\">\r\n<p><em>M</em>(<em>SD</em>)</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>LL</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>UL</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"142\">\r\n<p>Letters</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>14.5(28.6)</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>5.4</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>23.6</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"142\">\r\n<p>Digits</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>31.8(33.2)</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>21.2</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>42.4</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>Copyrights</strong></p>\r\n<p>Copyright for this article is retained by the author(s), with first publication rights granted to the journal.</p>\r\n<p>This is an open-access article distributed under the terms and conditions of the Creative Commons Attribution license (http://creativecommons.org/licenses/by/3.0/).</p>\r\n<p>&nbsp;</p>', 'string'),
(28, 'en_US', 'remoteUrl', '', 'string'),
(28, 'en_US', 'title', 'Authors Guidelines', 'string'),
(29, 'en_US', 'content', '<h3>Ethics Statement</h3>\r\n<h3>Publisher\'s Responsibilities</h3>\r\n<p>The Publisher is dedicated to supporting the vast efforts of the editors, the academic contributions of authors, and the respected volunteer work undertaken by reviewers. The publisher is also responsible for ensuring that the publication system works smoothly, and that ethical guidelines are applied to assist the editor, author, and reviewer in performing their ethical duties.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Editor\'s Responsibilities</strong></p>\r\n<p>The editor should acknowledge receipt of submitted manuscripts within two working days of receipt and ensure an efficient, fair, and timely review process.</p>\r\n<p>The editor should ensure that submitted manuscripts are processed in a confidential manner, and that no content of the manuscripts will be disclosed to anyone other than the corresponding author, reviewers, and the publisher, as appropriate.</p>\r\n<p>The editor should recuse himself or herself from processing manuscripts if he or she has any conflict of interest with any of the authors or institutions related to the manuscripts.</p>\r\n<p>The editor should not disclose the names and other details of the reviewers to a third party without the permission of the reviewers.</p>\r\n<p>The editor has the right to make the final decision on whether to accept or reject a manuscript with reference to the significance, originality, and clarity of the manuscript and its relevance to the journal.</p>\r\n<p>The editor should by no means make any effort to oblige the authors to cite his or her journal either as an implied or explicit condition of accepting their manuscripts for publication.</p>\r\n<p>The editor should not use for his or her own research any part of any data or work reported in submitted and as yet unpublished articles.</p>\r\n<p>The editor should respond promptly and take reasonable measures when an ethical complaint occurs concerning a submitted manuscript or a published paper, and the editor should immediately contact and consult with the author. In this case, a written formal retraction or correction may also be required.</p>\r\n<p>&nbsp;</p>\r\n<h3>Reviewer\'s Responsibilities</h3>\r\n<p>The reviewer who feels unqualified to review the assigned manuscript or affirms that he or she cannot meet the deadline for completion of the review should immediately notify the editor and excuse himself or herself from the process of reviewing this manuscript.</p>\r\n<p>The reviewer should inform the editor and recuse himself or herself from reviewing the manuscript if there is a conflict of interest. Specifically, the reviewer should recuse himself or herself from reviewing any manuscript authored or coauthored by a person with whom the reviewer has an obvious personal or academic relationship, if the relationship could introduce bias or the reasonable perception of bias.</p>\r\n<p>The reviewer should treat the manuscript in a confidential manner. The manuscript should not be disclosed to or discussed with others except as authorized by the editor.</p>\r\n<p>The reviewer should approach the peer-review job objectively. Personal criticism of the author is unacceptable.</p>\r\n<p>The reviewer should not use for his or her own research any part of any data or work reported in submitted and as yet unpublished articles.</p>\r\n<p>The reviewer should immediately notify the editor of any similarities between the manuscript under review and another paper either published or under consideration by another journal. The reviewer should immediately call to the editor’s attention a manuscript containing plagiarized material or falsified data.</p>\r\n<h3>Author\'s Responsibilities</h3>\r\n<p>The author should not submit concurrent manuscripts (or manuscripts essentially describing the same subject matter) to multiple journals. Likewise, an author should not submit any paper previously published anywhere to the journals for consideration. The publication of articles on specific subject matter, such as clinical guidelines and translations, in more than one journal is acceptable if certain conditions are met.</p>\r\n<p>The author should present a precise and brief report of his or her research and an impartial description of its significance.</p>\r\n<p>The author should honestly gather and interpret his or her research data. Publishers, editors, reviewers, and readers are entitled to request the author to provide the raw data for his or her research for convenience of editorial review and public access. If practicable, the author should retain such data for any possible use after publication.</p>\r\n<p>The author should guarantee that the works he or she has submitted are original. If the author has used work and/or words by others, appropriate citations are required. Plagiarism in all its forms constitutes unethical publishing behavior and is unacceptable.</p>\r\n<p>The author should indicate explicitly all sources that have supported the research and also declare any conflict(s) of interest.</p>\r\n<p>The author should give due acknowledgement to all of those who have made contributions to the research. Those who have contributed significantly to the research should be listed as coauthors. The author should ensure that all coauthors have affirmed the final version of the paper and have agreed on its final publication.</p>\r\n<p>The author should promptly inform the journal editor of any obvious error(s) in his or her published paper and cooperate earnestly with the editor in retraction or correction of the paper. If the editor is notified by any party other than the author that the published paper contains an obvious error, the author should write a retraction or make the correction based on the medium of publication.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'string'),
(29, 'en_US', 'remoteUrl', '', 'string'),
(29, 'en_US', 'title', 'Publishing Ethics', 'string'),
(30, 'en_US', 'content', '<h3 style=\"margin: 0in; margin-bottom: .0001pt;\">Publication Fee</h3>\r\n<p style=\"margin-top: 0in; text-align: justify;\">The journal does not charge any publication fee. The submission and the publication of the original manuscripts are charge free.</p>\r\n<h3 style=\"margin: 0in; margin-bottom: .0001pt;\">Publication Fee</h3>\r\n<p><span style=\"color: red;\">The publication processing fee for a research paper is 200 USD. The author/corresponding author will get one print copy. However, the author may order for additional print copy. The charge for each additional print copy is 30 USD. The publication fee is charged only for accepted paper. The author/corresponding author has to pay the publication as per the method determined by the executive editor. The author will get official receipt of publication fee with proper seal and signature.</span></p>', 'string'),
(30, 'en_US', 'remoteUrl', '', 'string'),
(30, 'en_US', 'title', 'Article Processing Charges', 'string');
INSERT INTO `navigation_menu_item_settings` (`navigation_menu_item_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(31, 'en_US', 'content', '<p>Submission of an article implies that the work described has not been published previously (except in the form of an abstract or as part of a published lecture or academic thesis), that it is not under consideration for publication elsewhere, that its publication is approved by all authors and tacitly or explicitly by the authorities responsible where the work was carried out. However, we accept submissions that have previously appeared on preprint servers (for example: arXiv, bioRxiv, Nature Precedings, Philica, Social Science Research Network, and Vixra); have previously been presented at conferences; or have previously appeared in other “non-journal” venues (for example: blogs or posters). Authors are responsible for updating the archived preprint with the journal reference (including DOI) and a link to the published articles on the appropriate journal website upon publication.</p>\r\n<p>Copyrights for articles are retained by the authors, with first publication rights granted to the journal. Authors have rights to reuse, republish, archive, and distribute their own articles after publication. The journal/publisher is not responsible for subsequent uses of the work. Authors shall permit the publisher to apply a DOI to their articles and to archive them in databases and indexes.</p>\r\n<p>The publisher and journals have a zero-tolerance plagiarism policy. We check the issue using two methods: a plagiarism prevention tool (Turnitin) and a reviewer check. All submissions will be checked by Turnitin before being sent to reviewers.</p>\r\n<p>Manuscripts should be prepared in Microsoft Word format (based on the requirement of different journals) and submitted online. The editors reserve the right to edit or otherwise alter all contributions, but authors will receive proofs for approval before publication. If you have any questions, please contact the editor of the journal.</p>\r\n<h2>Paper Selection and Publication Process</h2>\r\n<ol>\r\n<li>a) Upon receipt of a submission, the editor sends an e-mail of confirmation to the submission’s author within one to three working days. If you fail to receive this confirmation, your submission e-mail may have been missed.</li>\r\n<li>b) Peer review. We use a double-blind system for peer review; both reviewers’ and authors’ identities remain anonymous. The paper will be reviewed by at least two experts: one editorial staff member and one to three external reviewers. The review process may take four to ten weeks.</li>\r\n<li>c) Notification of the result of review by e-mail.</li>\r\n<li>d) If the submission is accepted, the authors revise accordingly and pay the Article Processing Fee (for formatting and hosting).</li>\r\n<li>e) A PDF version of the article is available for download on the journal’s webpage free of charge.</li>\r\n<li>f) From July 1, 2018, we will not automatically provide authors free print journals. We will provide free print copies for authors who really need them. Authors are requested to kindly fill a application form to request free print copies. Additionally, we are happy to provide the journal’s eBook in PDF format for authors, free of charge. This is the same as the printed version.</li>\r\n</ol>\r\n<h2>1. General Requirements</h2>\r\n<h3>1.1 Language and Numbers</h3>\r\n<p>Please write your text in proper English; American or British usage is accepted, but not a mixture of both. When writing numbers, use a period, not a comma, to represent the decimal point and a space to separate numbers of more than five digits into groups of three, whether on the left or the right of the decimal point (i.e., 10 000.471 85, but 1000.4718). We only accept manuscripts written in English.</p>\r\n<p>&nbsp;</p>\r\n<h3>1.2 Length of Paper</h3>\r\n<p>Papers between 6 000 and 10 000 words are preferred.</p>\r\n<h2>2. Title Page</h2>\r\n<p>To ensure the integrity of the peer review process, every effort should be made to prevent the identities of the authors and reviewers from being known to each other.</p>\r\n<p>When you upload a submission file, author identities should be removed from it. You should upload the title page as a supplementary file for the editor to review.</p>\r\n<h3>2.1 Title</h3>\r\n<p>Be concise and informative. The title is often used in information-retrieval systems and should be no more than 12 words in length and not contain abbreviations or words that serve no purpose. If you choose to have a subtitle, it should be italicized and centered directly below the main title.</p>\r\n<h3>2.2 Authors’ Names and Affiliations</h3>\r\n<p>The preferred form of an author’s name is first name, middle initial(s), and last name; this form reduces the likelihood of mistaken identity. To assist researchers as well as librarians, use the same form for publication throughout your career; that is, do not use initials on one manuscript and your full name on a later one. Determining whether Juanita A. Smith is the same person as J. A. Smith, J. Smith, or A. Smith can be difficult, particularly when citations span several years and institutional affiliations. Omit all titles (e.g., Dr., Professor) and degrees (e.g., PhD, PsyD, EdD).</p>\r\n<p>The authors’ affiliation identifies the location of the author(s) at the time the research was conducted, which is usually an institution. Include a dual affiliation only if two institutions contributed substantial support to the study. Include no more than two affiliations per author. If an author has no institutional affiliation, list the city and state of his/her residence. The names of the authors should appear in the order of their contributions, centered between the side margins. For names with suffixes (e,g., Jr. and II), separate the suffix from the rest of the name with a space instead of a comma. Only provide a complete mailing address of the corresponding author for correspondence.</p>\r\n<p><em>Example:</em></p>\r\n<p>Anne Smith<sup>1</sup>, Mary A. Meade<sup>1,2</sup>, David Wolf II<sup>1</sup> &amp; Charles Rockefeller Jr.<sup>2</sup></p>\r\n<p><sup>1</sup> Faculty of Economics, Kabul University, Kabul, Afghanistan</p>\r\n<p><sup>2</sup> School of Economics, Peking University, Beijing, China</p>\r\n<p>Correspondence: David Wolf II, School of Management, Northern Canada University, Toronto, Ontario, M3A 2K7, Canada. Tel: 1-613-947-3592. E-mail: davidwolf@gc.ca</p>\r\n<h2>3. Preparation of Text</h2>\r\n<p>Manuscripts should be organized in the following order:</p>\r\n<p>Title; abstract; keywords (indexing terms, normally three-to-six items); introduction; material studied, area descriptions, methods and/or techniques; results; discussion; conclusion; acknowledgements; references.</p>\r\n<h3>3.1 General Rules for Text</h3>\r\n<p>Please use the following rules for the entire text, including abstract, keywords, headings, and references.</p>\r\n<p>Font: Times New Roman; Size: 10 pt.</p>\r\n<p>Paragraph Spacing: Above paragraph — 0 pt.; below paragraph — 4 pt.</p>\r\n<p>Line Spacing: fixed, 12 pt.</p>\r\n<p>Heading 1: Times New Roman; 10 pt.; Bold; for example, 1. First-level Heading</p>\r\n<p>Heading 2: Times New Roman; 10 pt.; Italic; for example, <em>1.1 Second-level Heading</em></p>\r\n<p>Heading 3: Times New Roman; 10 pt.; for example, 1.1.1 Third-level Heading</p>\r\n<h3>3.2 Abstract</h3>\r\n<p>A concise and factual abstract is required. It should be between 150 and 250 words. The abstract should state briefly the purpose of the research, the principal results, and major conclusions. An abstract is often presented separately from the article, so it must be able to stand alone. References should therefore be avoided, but, if essential, they must be cited in full in the abstract without relying on the reference list.</p>\r\n<h3>3.3 Keywords</h3>\r\n<p>Immediately after the abstract, provide 3-10 keywords in alphabetical order, avoiding general and plural terms and multiple concepts (e.g., “and,” “of”). Be sparing with abbreviations: only abbreviations firmly established in the field may be eligible. Listing your keywords will help researchers find your work in databases.</p>\r\n<h3>3.4 Subdivision of the Article</h3>\r\n<p>Divide your article into clearly defined and numbered sections (e.g., 1., 2., 3., etc.). Subsections should be numbered 1.1, 1.2, etc., and sub-subsections should be numbered 1.1.1, 1.1.2, etc. Note that the abstract is not included in section numbering. Use this numbering also for internal cross-referencing: do not just refer to “the text.” Any subsection, ideally, should not be more than 600 words. Authors are urged to write as concisely as possible but not at the expense of clarity.</p>\r\n<h3>3.5 Equations</h3>\r\n<p>The text size of equations should be similar to normal text size. The formula should be placed center justified with serial number on the right. For example:</p>\r\n<p><em>a=[(1+b)/x]<sup>1/2</sup></em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1)</p>\r\n<h3>3.6 Tables</h3>\r\n<p>Number tables consecutively in accordance with their appearance in the text. Place a table’s caption above the table’s body and its description below the body. Avoid vertical rules. Be sparing in the use of tables and ensure that the data presented in tables do not duplicate results described elsewhere in the article.</p>\r\n<p>For example:</p>\r\n<p>Table 1. Estimated Distance (cm) for Letter and Digit Stimuli</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width=\"142\">\r\n<p>&nbsp;</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>&nbsp;</p>\r\n</td>\r\n<td colspan=\"2\" width=\"284\">\r\n<p>95%CI</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"142\">\r\n<p>Condition</p>\r\n</td>\r\n<td width=\"142\">\r\n<p><em>M</em>(<em>SD</em>)</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>LL</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>UL</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"142\">\r\n<p>Letters</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>14.5(28.6)</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>5.4</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>23.6</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"142\">\r\n<p>Digits</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>31.8(33.2)</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>21.2</p>\r\n</td>\r\n<td width=\"142\">\r\n<p>42.4</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><em>Note</em>. CI=confidence; LL=lower limit, UL=upper limit.</p>\r\n<p>&nbsp;</p>\r\n<p>You may resize the tables to fit the page size.</p>\r\n<h3>3.7 Figures and Schemes</h3>\r\n<p>Number figures consecutively in accordance with their appearance in the text. Place a figure’s caption and description below the figure body. A minimum resolution of 300 DPI is required. You may resize the figures or schemes to fit the page size.</p>\r\n<p>&nbsp;</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width=\"85\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<p>Figure 1. Figure Title</p>\r\n<p><em>Note.</em> Avoid abbreviating the titles of tables, figures, and equations (i.e., Tab. 1, Fig. 2, Eq. 3) in the caption or in running text. Do not write “the table above/below” or “the figure on page 32,” because the position and page number of a table or figure cannot be determined until the pages are typeset.</p>\r\n<h2>4. References</h2>\r\n<p>Cite the work of those individuals whose ideas, theories, or research have directly influenced your work. They may provide key background information, support or dispute your thesis, or offer critical definitions and data. Citation of an article implies that you have personally read the cited work. In addition to crediting the ideas of others that you used to build your thesis, provide documentation for all facts and figures that are not considered common knowledge.</p>\r\n<h3>4.1 Citations in the Text</h3>\r\n<p>Each reference cited in the text must appear in the reference list, and each entry in the reference list must be cited in the text. However, two kinds of material are cited only in the text: references to classical works such as the Bible and the Qur’an, whose sections are standardized across editions, and references to personal communication. References in a meta-analysis are not cited in-text unless they are also mentioned in the text.</p>\r\n<p>When formatting an in-text citation, give, in parentheses, the last name of the author of the cited work and the year it was published. For unpublished or informally published works, give the year the work was produced. Write “in press” in parentheses for articles that have been accepted for publication but that have not yet been published. Do not give a date until the article has actually been published.</p>\r\n<p>In all other instances, citations in the text should follow the referencing style used by the American Psychological Association.</p>\r\n<p><em>Examples:</em></p>\r\n<ul>\r\n<li><em>A Work by Two Authors</em></li>\r\n</ul>\r\n<p>Name both authors in the signal phrase or in the parentheses each time you cite the work. Use the word “and” between the authors’ names within the text; use the ampersand in the parentheses.</p>\r\n<p>Research by Wegener and Petty (1994) supports...</p>\r\n<p>(Wegener &amp; Petty, 1994)</p>\r\n<ul>\r\n<li><em>A Work by Three to Five Authors</em></li>\r\n</ul>\r\n<p>List all the authors in the signal phrase or in parentheses the first time you cite the source.</p>\r\n<p>(Kernis, Cornell, Sun, Berry, &amp; Harlow, 1993)</p>\r\n<p>In subsequent citations, only use the first author’s last name followed by “et al.” in the signal phrase or in parentheses.</p>\r\n<p>(Kernis et al., 1993)</p>\r\n<ul>\r\n<li><em>Six or More Authors</em></li>\r\n</ul>\r\n<p>Use the first author’s last name followed by et al. in the signal phrase or in parentheses.</p>\r\n<p>Harris et al. (2001) argued...</p>\r\n<p>(Harris et al., 2001)</p>\r\n<ul>\r\n<li><em>Authors with the Same Last Name</em></li>\r\n</ul>\r\n<p>To prevent confusion, use first initials when citing two or more authors with the same last name.</p>\r\n<p>(E. Johnson, 2001; L. Johnson, 1998)</p>\r\n<ul>\r\n<li><em>Unknown Author</em></li>\r\n</ul>\r\n<p>If the work does not have an author, cite the source by its title in the signal phrase or use the first word or two in the parentheses. Titles of books and reports are italicized; titles of articles, chapters, and Web pages are put in quotation marks.</p>\r\n<p>A similar study was done of students learning to format research papers.</p>\r\n<p>Note: In the rare case that “Anonymous” is used for the author, treat it as the author’s name in parentheses and the reference page.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Anonymous, 2001)</p>\r\n<ul>\r\n<li><em>Organization as an Author</em></li>\r\n</ul>\r\n<p>If the author is an organization or a government agency, mention the organization in the signal phrase or in the parenthetical citation the first time you cite the source.</p>\r\n<p>According to the American Psychological Association (2000), ...</p>\r\n<p>If the organization has a well-known abbreviation, include the abbreviation in brackets behind the full name of the organization the first time the source is cited and then use only the abbreviation in later citations.</p>\r\n<p>First citation: (Mothers Against Drunk Driving [MADD], 2000)</p>\r\n<p>Second citation: (MADD, 2000)</p>\r\n<h3>4.2 Citing and Listing of Web References</h3>\r\n<p>As a minimum, the full URL should be given. Any further information (author names, dates, reference to a source publication, etc.), if known, should also be given. Web references can be listed separately (e.g., after the reference list) under a different heading if desired, or they can be included in the reference list.</p>\r\n<h3>4.3 Reference List</h3>\r\n<p>Please find the below information for basic rules in a reference list.</p>\r\n<ul>\r\n<li>Each entry in your reference list should be defined by a hanging indent of two characters.</li>\r\n<li>Authors’ names are inverted (last name first); give the last name and initials for all authors of a particular work if it has three to seven authors. If the work has more than seven authors, list the first six authors and then use ellipses after the sixth author’s name. After the ellipses, list the last author’s name of the work. Use “&amp;” instead of “and” when listing multiple authors of a single work.</li>\r\n<li>Reference list entries should be alphabetized by the last name of the first author of each work.</li>\r\n<li>If you have more than one article by the same author, single-author references or multiple-author references with the exact same authors in the exact same order are listed in order by the year of publication, starting with the earliest.</li>\r\n<li>Capitalize all major words in journal titles.</li>\r\n<li>When referring to any work that is not a journal, such as a book, article, or Web page, capitalize only the first letter of the first word of a title and subtitle, the first word after a colon or a dash in the title, and proper nouns. Do not capitalize the first letter of the second word in a hyphenated compound word.</li>\r\n</ul>\r\n<h3>4.4 DOIs in References</h3>\r\n<p>The journal/publisher encourages authors to cite those items (journal articles, conference proceedings, book chapters, technical reports, working papers, dissertations, etc.) that have DOIs. When the cited items have DOIs, the authors should add DOI persistent links to the regular references. The DOI persistent links should be the last elements in the references. The persistent links should be active.</p>\r\n<p>Format of persistent link: https://doi.org/+DOI</p>\r\n<p>Example of persistent link: https://doi.org/10.1109/2.901164</p>\r\n<p>The authors or editors may retrieve articles’ DOIs at http://www.crossref.org/SimpleTextQuery/.</p>\r\n<p>You can register a free account to start retrieving articles’ DOIs. CrossRef allows you to check multiple references. Please read this webpage very carefully. Only articles with assigned DOIs can be retrieved through this webpage.</p>\r\n<h3>4.5 References Examples</h3>\r\n<p><strong>Books</strong></p>\r\n<ul>\r\n<li><em>Book with one author</em></li>\r\n</ul>\r\n<p>Bernstein, T. M. (1965). <em>The careful writer: A modern guide to English usage</em> (2nd ed.). New York, NY: Atheneum.</p>\r\n<ul>\r\n<li><em>Electronic book </em></li>\r\n</ul>\r\n<p><em>Replace place-of-publication and publisher information with the DOI.</em></p>\r\n<p>Anderson, C. A., Gentile, D. A., &amp; Buckley, K. E. (2007). <em>Violent video game effects on children and adolescents: Theory, research and public policy. </em>https://doi.org/10.1093/acprof:oso /9780195309836.001.0001</p>\r\n<p><em>Note: Insert a blank space if you need to break a URL across lines before most punctuation. Do not add a period after the URL.</em></p>\r\n<ul>\r\n<li><em>Work with two authors</em></li>\r\n</ul>\r\n<p>Beck, C. A. J., &amp; Sales, B. D. (2001). <em>Family mediation: Facts, myths, and future prospects</em>. Washington, DC: American Psychological Association. <a href=\"http://dx.doi.org/10.1037/10401-000\">&nbsp;https://doi.org/10.1037/10401-000</a></p>\r\n<ul>\r\n<li><em>Two or more works by the same author</em></li>\r\n</ul>\r\n<p><em>Arrange by the year of publication, the earliest first.</em></p>\r\n<p>Postman, N. (1979). <em>Teaching as a conserving activity</em>. New York, NY: Delacorte Press.</p>\r\n<p>Postman, N. (1985). <em>Amusing ourselves to death: Public discourse in the age of show business</em>. New York, NY: Viking.</p>\r\n<p><em>If works by the same author are published in the same year, arrange alphabetically by title and distinguish the documents by adding a lowercase letter after the year of publication as indicated below.</em></p>\r\n<p>McLuhan, M. (1970a). <em>Culture is our business</em>. New York, NY: McGraw-Hill.</p>\r\n<p>McLuhan, M. (1970b). <em>From cliché to archetype</em>. New York, NY: Viking Press.</p>\r\n<ul>\r\n<li><em>Book by a corporate author</em></li>\r\n</ul>\r\n<p><em>Associations, corporations, agencies, government departments, and organizations are considered authors when there is no single author.</em></p>\r\n<p>American Psychological Association. (1972). <em>Ethical standards of psychologists</em>. Washington, DC: American Psychological Association.</p>\r\n<ul>\r\n<li><em>A book with no author or editor listed</em></li>\r\n</ul>\r\n<p><em>Merriam-Webster’s collegiate dictionary </em>(10th ed.). (1993). Springfield, MA: Merriam-Webster.</p>\r\n<ul>\r\n<li><em>A translated work and/or a republished work</em></li>\r\n</ul>\r\n<p>Laplace, P. S. (1814/1951). <em>A philosophical essay on probabilities </em>(F. W. Truscott &amp; F. L. Emory, Trans.). New York: Dover.</p>\r\n<p><strong>Anthologies, Course Packs, &amp; Encyclopedias </strong></p>\r\n<ul>\r\n<li><em>Anthology or compilation</em></li>\r\n</ul>\r\n<p>Gibbs, J. T., &amp; Huang, L. N. (Eds.). (1991). <em>Children of color: Psychological interventions with minority youth</em>. San Francisco, CA: Jossey-Bass.</p>\r\n<ul>\r\n<li><em>Work in an anthology or an essay in a book</em></li>\r\n</ul>\r\n<p>Bjork, R. A. (1989). Retrieval inhibition as an adaptive mechanism in human memory. In H. L. Roediger III, &amp; F. I. M. Craik (Eds.), <em>Varieties of memory &amp; consciousness</em> (pp. 309-330). Hillsdale, NJ: Erlbaum.</p>\r\n<ul>\r\n<li><em>Work in a course pack</em></li>\r\n</ul>\r\n<p>Goleman, D. (2009). What makes a leader? In D. Demers (Ed.), <em>AHSC 230: Interpersonal communication and relationships</em> (pp. 47-56). Montreal, Canada: Concordia University Bookstore. (Reprinted from <em>Harvard Business Review</em>,<em> 76</em>(6), pp. 93-102, 1998).</p>\r\n<ul>\r\n<li><em>Article in a reference book or an entry in an encyclopedia </em></li>\r\n</ul>\r\n<p><em>If the article/entry is signed, include the author’s name; if unsigned, begin with the title of the entry</em></p>\r\n<p>Guignon, C. B. (1998). Existentialism. In E. Craig (Ed.), <em>Routledge encyclopedia of philosophy</em> (Vol. 3, pp. 493-502). London, England: Routledge.</p>\r\n<p><strong>Articles </strong></p>\r\n<ul>\r\n<li><em>Article in a journal––for articles retrieved online </em></li>\r\n</ul>\r\n<p>Mellers, B. A. (2000). Choice and the relative pleasure of consequences. <em>Psychological Bulletin</em>,<em> 126</em>, 910-924. https://doi.org/10.1037/0033-2909.126.6.910</p>\r\n<p><em>Note: List only the volume number if the periodical uses continuous pagination throughout a particular volume. If each issue begins with page 1, then list the issue number as well.</em></p>\r\n<p>Klimoski, R., &amp; Palmer, S. (1993). The ADA and the hiring process in organizations. <em>Consulting Psychology Journal: Practice and Research</em>,<em> 45</em>(2), 10-36.<br>https://doi.org/10.1037/1061-4087.45.2.10</p>\r\n<ul>\r\n<li><em>Articles in a journal, more than seven authors</em></li>\r\n</ul>\r\n<p>Gilbert, D. G., McClernon, J. F., Rabinovich, N. E., Sugai, C., Plath, L. C., Asgaard, G., ... Botros, N. (2004). Effects of quitting smoking on EEG activation and attention last for more than 31 days and are more severe with stress, dependence, DRD2 A 1 allele, and depressive traits. <em>Nicotine and Tobacco Research</em>, <em>6</em>, 249-267. https://doi.org/10.1 080/1462220041 0001676305</p>\r\n<ul>\r\n<li><em>Article in a newspaper or magazine</em></li>\r\n</ul>\r\n<p>Semenak, S. (1995, December 28). Feeling right at home: Government residence eschews traditional rules. <em>Montreal Gazette</em>, p. A4.</p>\r\n<p>Schwartz, J. (1993, September 30). Obesity affects economic, social status. <em>The Washington Post</em>, pp. A1, A4.</p>\r\n<p>Driedger, S. D. (1998, April 20). After divorce. <em>Maclean’s</em>,<em> 111</em>(16), 38-43.</p>\r\n<ul>\r\n<li><em>Article from an electronic source</em></li>\r\n</ul>\r\n<p>Zhao, S., Grasmuck, S., &amp; Martin, J. (2008). Identity construction on Facebook: Digital empowerment in anchored relationships. <em>Computers in Human Behavior</em>,<em> 24</em>(5), 1816-1836. https://doi.org/10.1016/j.chb.2008.02.012</p>\r\n<p><em>URL for an online periodical:</em></p>\r\n<p>Cooper, A., &amp; Humphreys, K. (2008). The uncertainty is killing me: Self-triage decision making and information availability. <em>E-Journal of Applied Psychology</em><em>, 4</em>(1). Retrieved from http://ojs.lib.swin.edu.au/index.php/ejap/article/view/124/129</p>\r\n<p>Cress, C. M. (2009). <em>Curricular strategies for student success and engaged learning</em> [PowerPoint slides]. Retrieved from http://www.vtcampuscompact.org/2009/TCL_post/presenter_powerpoints /Christine%20Cress%20-%20Curricular%20Strategies.ppt</p>\r\n<p><strong>Doctoral Dissertations and Master’s Theses</strong></p>\r\n<ul>\r\n<li><em>Unpublished theses and dissertations</em></li>\r\n</ul>\r\n<p>Jordan, J. J. (2005). <em>Psychosocial effects of gifted programming</em> (Unpublished master’s thesis). University of Saskatchewan, Saskatoon, Canada.</p>\r\n<p>Berg, D. H. (2003). <em>Prospective leadership development in colleges and universities in Canada: Perceptions of leaders, educators and students</em> (Unpublished doctoral dissertation). University of Saskatchewan, Saskatoon, Canada.</p>\r\n<ul>\r\n<li><em>Electronic theses and dissertations</em></li>\r\n</ul>\r\n<p>Hiebert, R. W. (2006). <em>The education of children from poverty: A descriptive case study of a public school and a community school</em> (Doctoral dissertation). Available from ProQuest Dissertation &amp; Theses: Full Text (NR18185).</p>\r\n<p>Richet, E. (2007). <em>The citizenship education system in Canada from 1945-2005: An overview and assessment</em> (Master’s thesis, University of Saskatchewan, Saskatoon, Canada). Retrieved from http://library2.usask.ca/etd</p>\r\n<p><strong>Meetings and Symposia</strong></p>\r\n<ul>\r\n<li><em>Proceedings published in a book form</em></li>\r\n</ul>\r\n<p>McKay, G. (1999). Self-determination in Aboriginal education. In L. B. Muller (Ed.), <em>Changing the climate: Proceedings of the 1998 Conference for Graduate Students in the Social Sciences and Humanities</em> (pp. 1-11). Saskatoon, Canada: University of Saskatchewan.</p>\r\n<ul>\r\n<li><em>Proceedings published regularly online</em></li>\r\n</ul>\r\n<p>Herculano-Houzel, S., Collins, C. E., Wong, P., Kaas, J. H., &amp; Lent, R. (2008). The basic nonuniformity of the cerebral cortex. <em>Proceedings of the National Academy of Sciences</em>, <em>105</em>, 12593-12598. <a href=\"https://doi.org/10.1073/pnas.0805417105\">https://doi.org/10.1073/pnas.0805417105</a></p>\r\n<ul>\r\n<li><em>Paper presentation or poster session</em></li>\r\n</ul>\r\n<p>Liu, S. (2005, May). <em>Defending against business crises with the help of intelligent agent based early warning solutions</em>. Paper presented at the Seventh International Conference on Enterprise Information Systems, Miami, FL. Abstract retrieved from <a href=\"http://www.iceis.org/iceis2005/abstracts_2005.htm\">http://www.iceis.org/iceis2005/abstracts_2005.htm</a></p>\r\n<p><strong>Multimedia </strong></p>\r\n<ul>\r\n<li><em>Television or radio program</em></li>\r\n</ul>\r\n<p>MacIntyre, L. (Reporter). (2002, January 23). Scandal of the century [Television series episode]. In H. Cashore (Producer), <em>The fifth estate</em>. Toronto, Canada: Canadian Broadcasting Corporation.</p>\r\n<ul>\r\n<li><em>Film, video recording or DVD</em></li>\r\n</ul>\r\n<p>Kubrick, S. (Director). (1980). <em>The shining</em> [Motion picture]. United States: Warner Brothers.</p>\r\n<ul>\r\n<li><em>Online lecture notes and presentation slides (such as Moodle)</em></li>\r\n</ul>\r\n<p>Cress, C. M. (2009). <em>Curricular strategies for student success and engaged learning</em> [PowerPoint slides]. Retrieved from <a href=\"http://www.vtcampuscompact.org/2009/TCL_post/presenter_powerpoints%20/Christine%20Cress%20-%20Curricular%20Strategies.ppt\">http://www.vtcampuscompact.org/2009/TCL_post/presenter_powerpoints /Christine%20Cress%20-%20Curricular%20Strategies.ppt</a></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Web pages </strong></p>\r\n<ul>\r\n<li><em>Web pages and non-periodical documents on the Internet</em></li>\r\n</ul>\r\n<p>Library and Archives Canada. (2008). <em>Celebrating women’s achievements: Women artists in Canada.</em> Retrieved from http://www.collectionscanada.gc.ca/women/002026-500-e.html</p>\r\n<p>Geography of Canada. (2009, September 29). In <em>Wikipedia, the free encyclopedia.</em> Retrieved September 30, 2009, from http://en.wikipedia.org/wiki/Geography_of_Canada</p>\r\n<ol start=\"5\">\r\n<li><strong> Note</strong></li>\r\n</ol>\r\n<p>Please avoid using footnotes. Change footnotes to endnotes. Insert “(Note 1, Note 2)” in the running text and explain the note in an end notes section after the references page. Please see the template (http://ccsenet.org/web/submissionguide) for examples.</p>\r\n<ol start=\"6\">\r\n<li><strong> Appendix</strong></li>\r\n</ol>\r\n<p>The appendix comes after the references and the notes. In the text, refer to appendices by their labels: e.g., produced the same results for both studies (see Appendices A and B for complete proofs). Please see the template (www.asr.org/submission) for examples.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>&nbsp;</strong></p>', 'string'),
(31, 'en_US', 'remoteUrl', '', 'string'),
(31, 'en_US', 'title', 'Paper Submission Guide', 'string'),
(32, 'en_US', 'content', '<p>We kindly request all reviewers to follow the following criteria set by all journals published under the KUDSJ:</p>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li>The reviewer should avoid personal comments or criticism for an article submitted.</li>\r\n<li>A reviewer should maintain the confidentiality of the review process by not disclosing information of the reviewed paper without permission from the editorial office.</li>\r\n<li>A reviewer should determine originality, credit, and scope of the work and also need to suggest a number of ways to improve it so that it highlights the quality of the article.</li>\r\n<li>A reviewer should give his/her comments in an unbiased manner following the ethical rules.</li>\r\n<li>A reviewer should take a concern from the editor before rejecting/accepting an article.</li>\r\n<li>A reviewer should ensure that published articles meet Journal requirements.</li>\r\n<li>A peer reviewer should protect readers from incorrect or flawed research or studies that cannot be validated by others.</li>\r\n<li>A reviewer should not use/disclose any unpublished work/ arguments/ interpretations of a submitted manuscript for his/her own work, but with consent from the author.</li>\r\n<li>Reviewers should agree to review the manuscript if and only if they have expertise in the subject area.</li>\r\n<li>Reviewers should openly declare any potential conflict of interests and take assistance from the Editor regarding any uncertain conflicts.</li>\r\n<li>Reviewers should declare and disagree to review the manuscript if they are involved in the submitted work in any manner.</li>\r\n<li>Reviewers should notify the Editor if the manuscript has been already reviewed by them before in other journal and seek guidance whether to carry further or not.</li>\r\n<li>Reviewers should immediately notify the Editor if they found any partial or whole information in the manuscript is plagiarized or infringed.</li>\r\n<li>Reviewers should not attempt to contact the authors before the article gets published without the permission of the Editor.</li>\r\n</ol>\r\n<p>&nbsp;</p>', 'string'),
(32, 'en_US', 'remoteUrl', '', 'string'),
(32, 'en_US', 'title', 'Reviewers Guide', 'string'),
(33, 'en_US', 'content', '<p>index data here</p>', 'string'),
(33, 'en_US', 'remoteUrl', '', 'string'),
(33, 'en_US', 'title', 'Index', 'string'),
(34, 'en_US', 'content', '<p><strong>Submitted Papers:-</strong></p>\r\n<p>EPRA Journals has a&nbsp;<strong>strict zero-tolerance policy&nbsp;for plagiarism</strong>. If the submitted paper has been plagiarised editorial office will reject that article immediately and note that author name(s). In the event that same author send the plagiarised article &nbsp;second time in different title, editorial office will block that author(s) all communications. Editorial office never repond that author’s email or phone calls.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Accepted Papers:-</strong></p>\r\n<p>Suppose any article found plagiarism in later stage, i.e after acceptance, we never publish that article and notify to the corresponding author by email. Paper staus also will change to Rejected. If any minor part is plagariased, we will ask revision in that part and publish that article after satisfactory revision made by author(s).</p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>Responsibility:-</strong></p>\r\n<p>Author(s) are 100 percent responsible for plagiarism issues. Chief Editor or Editor or Editorial board never responsible for plagiarism reports, complaints and legal actions. So author(s) are full responsible for their paper’s plagiarism, unlawful contents and defamatory etc. &nbsp;&nbsp;</p>', 'string'),
(34, 'en_US', 'remoteUrl', '', 'string'),
(34, 'en_US', 'title', 'Plagiarism Policy', 'string'),
(35, 'en_US', 'content', '<p><strong>FAQs</strong></p>\r\n<p>Q1:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Is the Department of Scientific Journals of Kabul University a registered organization?</p>\r\n<p>The Department of Scientific Journals of Kabul University is a public organization and is registered with the Ministry of Higher Education of Afghanistan as an international Publisher of the academic and scholarly papers across the world.</p>\r\n<p>&nbsp;</p>\r\n<p>Q2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Does the Department of Scientific Journals of Kabul University charge submission fee?</p>\r\n<p>No. The Department of Scientific Journals of Kabul University does not charge any submission fee.</p>\r\n<p>&nbsp;</p>\r\n<p>Q3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Does the Department of Scientific Journals of Kabul University charge any publication fee?</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. There is no publication fee for online publication of the journals.</p>\r\n<p>&nbsp;</p>\r\n<p>Q4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Who pays for all the publication expenses and how it works?</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Department of Scientific Journals of Kabul University is funded by the university budget.</p>\r\n<p>&nbsp;</p>\r\n<p>Q5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; How do you detect the plagiarism?</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Department of Scientific Journals of Kabul University uses Turnitin Software to check for the plagiarism. Turnitin is the one of the most reliable software for plagiarism detection.</p>\r\n<p>&nbsp;</p>\r\n<p>Q6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; How frequently the journals are published?</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; All the journals published under Department of Scientific Journals of Kabul University are set for quarterly publication like end of March, end of June, end of September and end of December each year.</p>\r\n<p>&nbsp;</p>\r\n<p>Q7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Does the journals published have impact factor of H-index?</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It depends on each journal. Please visit the relevant journal website for more details.</p>\r\n<p>&nbsp;</p>\r\n<p>Q8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What is the rate of acceptance of the paper publication?</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It depends on the paper and the journal but in overall the rate of acceptance is 50% in all the journals publication. Please visit the journals website for more information.</p>\r\n<p>&nbsp;</p>\r\n<p>Q9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; What are the main languages used in the journals?</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Only the Sharia and Law journal accepts Arabic language with an abstract in English. The rest of the journals are published in English language only.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', 'string'),
(35, 'en_US', 'remoteUrl', '', 'string'),
(35, 'en_US', 'title', 'FAQs', 'string'),
(36, 'en_US', 'content', '<p><strong>Copyright Policy</strong></p>\r\n<p>Copyrights for articles are retained by the authors, with first publication rights granted to the journal/publisher. Authors have rights to reuse, republish, archive, and distribute their own articles after publication. The journal/publisher is not responsible for subsequent uses of the work. Authors shall permit the publisher to apply a DOI to their articles and to archive them in the university databases and indexes.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Open-access Policy</strong></p>\r\n<p>KUCSR follows open access policy to enhance the outreach of scholars and researchers. This means that our journals provide immediate open access for readers to all articles on the publisher’s website. The readers, therefore, are allowed to read, download, copy, distribute, print, search, link to the full texts or use them for any other lawful purpose.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Publication Fee</strong></p>\r\n<p>The journal does not charge any publication fee. The submission and the publication of the original manuscripts are charge free.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Submission Policy</strong></p>\r\n<p>Submission of an article implies that the work described has not been published previously (except in the form of an abstract or as part of a published lecture or academic thesis), that it is not under consideration for publication elsewhere, that its publication is approved by all authors and tacitly or explicitly by the authorities responsible where the work was carried out. However, we accept submissions that have previously appeared on preprint servers (for example: arXiv, bioRxiv, Nature Precedings, Philica, Social Science Research Network, and Vixra); have previously been presented at conferences; or have previously appeared in other “non-journal” venues (for example: blogs or posters). Authors are responsible for updating the archived preprint with the journal reference (including DOI) and a link to the published articles on the appropriate journal website upon publication.</p>\r\n<p>The publisher and journals have a zero-tolerance plagiarism policy. We check the issue using two methods: a plagiarism prevention tool (Turintin) and a reviewer check. All submissions will be checked by Turintin before being sent to reviewers.</p>\r\n<p>We insist a rigorous viewpoint on the self-plagiarism. The&nbsp;<a href=\"https://en.wikipedia.org/wiki/Plagiarism\">self-plagiarism</a>&nbsp;is plagiarism, as it fails to contribute to the research and science.</p>', 'string'),
(36, 'en_US', 'remoteUrl', '', 'string'),
(36, 'en_US', 'title', 'Publication Policy', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `context_id`, `user_id`, `level`, `type`, `date_created`, `date_read`, `assoc_type`, `assoc_id`) VALUES
(42, 1, 0, 3, 16777220, '2022-11-15 09:50:45', NULL, 1048585, 2),
(43, 1, 0, 3, 16777222, '2022-11-15 09:50:46', NULL, 1048585, 2),
(44, 1, 0, 3, 16777223, '2022-11-15 09:50:46', NULL, 1048585, 2),
(45, 1, 0, 3, 16777224, '2022-11-15 09:50:46', NULL, 1048585, 2),
(48, 1, 0, 2, 16777243, '2022-11-15 09:50:50', NULL, 1048585, 2),
(49, 1, 0, 2, 16777245, '2022-11-15 09:50:51', NULL, 1048585, 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification_mail_list`
--

CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `confirmed` smallint(6) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_subscription_settings`
--

CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_subscription_settings`
--

INSERT INTO `notification_subscription_settings` (`setting_id`, `setting_name`, `setting_value`, `user_id`, `context`, `setting_type`) VALUES
(1, 'blocked_emailed_notification', '8', 2, 1, 'int'),
(2, 'blocked_emailed_notification', '268435477', 2, 1, 'int');

-- --------------------------------------------------------

--
-- Table structure for table `oai_resumption_tokens`
--

CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_settings`
--

CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_name`, `context_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
('acronplugin', 0, 'crontab', '[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"classes.tasks.SubscriptionExpiryReminder\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]', 'object'),
('acronplugin', 0, 'enabled', '1', 'bool'),
('browseblockplugin', 1, 'enabled', '1', 'bool'),
('defaultthemeplugin', 0, 'enabled', '1', 'bool'),
('defaultthemeplugin', 1, 'baseColour', '#1E6292', 'string'),
('defaultthemeplugin', 1, 'enabled', '1', 'bool'),
('defaultthemeplugin', 1, 'showDescriptionInJournalIndex', 'true', 'string'),
('defaultthemeplugin', 1, 'typography', 'notoSans', 'string'),
('defaultthemeplugin', 1, 'useHomepageImageAsHeader', 'false', 'string'),
('developedbyblockplugin', 0, 'enabled', '0', 'bool'),
('developedbyblockplugin', 0, 'seq', '0', 'int'),
('developedbyblockplugin', 1, 'enabled', '0', 'bool'),
('developedbyblockplugin', 1, 'seq', '0', 'int'),
('dublincoremetaplugin', 1, 'enabled', '1', 'bool'),
('googlescholarplugin', 1, 'enabled', '1', 'bool'),
('healthsciencesthemeplugin', 1, 'baseColour', '#BB8E6D', 'string'),
('healthsciencesthemeplugin', 1, 'enabled', '1', 'bool'),
('htmlarticlegalleyplugin', 1, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'seq', '7', 'int'),
('languagetoggleblockplugin', 0, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 0, 'seq', '4', 'int'),
('languagetoggleblockplugin', 1, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 1, 'seq', '4', 'int'),
('lensgalleyplugin', 1, 'enabled', '1', 'bool'),
('makesubmissionblockplugin', 1, 'enabled', '1', 'bool'),
('pdfjsviewerplugin', 1, 'enabled', '1', 'bool'),
('pragmathemeplugin', 1, 'baseColour', '#FBFED7', 'string'),
('pragmathemeplugin', 1, 'enabled', '1', 'bool'),
('resolverplugin', 1, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 1, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 1, 'seq', '2', 'int'),
('tinymceplugin', 0, 'enabled', '1', 'bool'),
('tinymceplugin', 1, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'uniqueSiteId', '636a225d96c81', 'string'),
('usagestatsplugin', 0, 'accessLogFileParseRegex', '/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/', 'string'),
('usagestatsplugin', 0, 'chartType', 'bar', 'string'),
('usagestatsplugin', 0, 'createLogFiles', '1', 'bool'),
('usagestatsplugin', 0, 'datasetMaxCount', '4', 'string'),
('usagestatsplugin', 0, 'enabled', '1', 'bool'),
('usagestatsplugin', 0, 'optionalColumns', '[\"city\",\"region\"]', 'object'),
('webfeedplugin', 1, 'displayItems', '1', 'bool'),
('webfeedplugin', 1, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 1, 'enabled', '1', 'bool');

-- --------------------------------------------------------

--
-- Table structure for table `publications`
--

CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL,
  `access_status` bigint(20) DEFAULT 0,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publications`
--

INSERT INTO `publications` (`publication_id`, `access_status`, `date_published`, `last_modified`, `locale`, `primary_contact_id`, `section_id`, `seq`, `submission_id`, `status`, `url_path`, `version`) VALUES
(2, 0, NULL, '2022-11-15 10:18:10', NULL, 2, 1, 0.00, 2, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `publication_categories`
--

CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication_galleys`
--

CREATE TABLE `publication_galleys` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `submission_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` smallint(6) NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication_galley_settings`
--

CREATE TABLE `publication_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication_settings`
--

CREATE TABLE `publication_settings` (
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publication_settings`
--

INSERT INTO `publication_settings` (`publication_id`, `locale`, `setting_name`, `setting_value`) VALUES
(2, '', 'categoryIds', '[]'),
(2, 'en_US', 'abstract', '<p>no abs</p>'),
(2, 'en_US', 'title', 'example');

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `query_participants`
--

CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queued_payments`
--

CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_assignments`
--

CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_files`
--

CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_forms`
--

CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_elements`
--

CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_element_settings`
--

CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_responses`
--

CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_settings`
--

CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_rounds`
--

CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_round_files`
--

CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_tasks`
--

CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scheduled_tasks`
--

INSERT INTO `scheduled_tasks` (`class_name`, `last_run`) VALUES
('classes.tasks.SubscriptionExpiryReminder', '2022-11-08 10:28:34'),
('lib.pkp.classes.task.ReviewReminder', '2022-11-28 08:09:47'),
('lib.pkp.classes.task.StatisticsReport', '2022-11-08 10:28:34'),
('plugins.generic.usageStats.UsageStatsLoader', '2022-11-28 08:09:39'),
('plugins.importexport.crossref.CrossrefInfoSender', '2022-11-28 08:09:44'),
('plugins.importexport.datacite.DataciteInfoSender', '2022-11-28 08:09:47'),
('plugins.importexport.doaj.DOAJInfoSender', '2022-11-28 08:09:47');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `editor_restricted` smallint(6) NOT NULL DEFAULT 0,
  `meta_indexed` smallint(6) NOT NULL DEFAULT 0,
  `meta_reviewed` smallint(6) NOT NULL DEFAULT 1,
  `abstracts_not_required` smallint(6) NOT NULL DEFAULT 0,
  `hide_title` smallint(6) NOT NULL DEFAULT 0,
  `hide_author` smallint(6) NOT NULL DEFAULT 0,
  `is_inactive` smallint(6) NOT NULL DEFAULT 0,
  `abstract_word_count` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `journal_id`, `review_form_id`, `seq`, `editor_restricted`, `meta_indexed`, `meta_reviewed`, `abstracts_not_required`, `hide_title`, `hide_author`, `is_inactive`, `abstract_word_count`) VALUES
(1, 1, 0, 1.00, 0, 1, 1, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section_settings`
--

CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section_settings`
--

INSERT INTO `section_settings` (`section_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'abbrev', 'ART', 'string'),
(1, 'en_US', 'identifyType', '', 'string'),
(1, 'en_US', 'policy', '<p>Artical Sections&nbsp;</p>', 'string'),
(1, 'en_US', 'title', 'Articles', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` smallint(6) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`, `domain`) VALUES
('49e3c0b3i32eab659g1d1jsi8m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0', 1668834835, 1668845627, 0, 'csrf|a:2:{s:9:\"timestamp\";i:1668845613;s:5:\"token\";s:32:\"5b6f0075e5ac3db396bb68f362f2b534\";}username|s:8:\"mshirzad\";', 'localhost'),
('p060g5mc3si9lcf044jiind1di', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 1667898185, 1669620043, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1669620044;s:5:\"token\";s:32:\"b5d9505ba3b431fb0869ff33bc671c7b\";}username|s:5:\"admin\";userId|i:1;', 'localhost');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
(0, 'en_US', 6, '[\"fa_IR\",\"en_US\"]', '[\"fa_IR\",\"en_US\"]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`setting_name`, `locale`, `setting_value`) VALUES
('contactEmail', 'en_US', 'admin@ku.af'),
('contactName', 'en_US', 'Open Journal Systems'),
('contactName', 'fa_IR', 'سامانه مجله باز'),
('themePluginPath', '', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `stage_assignments`
--

CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stage_assignments`
--

INSERT INTO `stage_assignments` (`stage_assignment_id`, `submission_id`, `user_group_id`, `user_id`, `date_assigned`, `recommend_only`, `can_change_metadata`) VALUES
(2, 2, 14, 2, '2022-11-15 09:49:15', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `static_page_settings`
--

CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subeditor_submission_group`
--

CREATE TABLE `subeditor_submission_group` (
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` smallint(6) NOT NULL DEFAULT 1,
  `work_type` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`submission_id`, `context_id`, `current_publication_id`, `date_last_activity`, `date_submitted`, `last_modified`, `stage_id`, `locale`, `status`, `submission_progress`, `work_type`) VALUES
(2, 1, 2, '2022-11-15 10:18:10', '2022-11-15 09:50:40', '2022-11-15 09:50:40', 1, 'en_US', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `submission_comments`
--

CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_files`
--

CREATE TABLE `submission_files` (
  `submission_file_id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `source_submission_file_id` bigint(20) DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `submission_files`
--

INSERT INTO `submission_files` (`submission_file_id`, `submission_id`, `file_id`, `source_submission_file_id`, `genre_id`, `file_stage`, `direct_sales_price`, `sales_type`, `viewable`, `created_at`, `updated_at`, `uploader_user_id`, `assoc_type`, `assoc_id`) VALUES
(2, 2, 2, NULL, 1, 2, NULL, NULL, NULL, '2022-11-15 09:49:40', '2022-11-15 09:49:57', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `submission_file_revisions`
--

CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) UNSIGNED NOT NULL,
  `submission_file_id` bigint(20) UNSIGNED NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `submission_file_revisions`
--

INSERT INTO `submission_file_revisions` (`revision_id`, `submission_file_id`, `file_id`) VALUES
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `submission_file_settings`
--

CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `submission_file_settings`
--

INSERT INTO `submission_file_settings` (`submission_file_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(2, 'en_US', 'name', 'چارت جریان دوره مقاله.docx', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_keyword_list`
--

CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL,
  `keyword_text` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_objects`
--

CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_object_keywords`
--

CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_settings`
--

CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_tombstones`
--

CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_types`
--

CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` smallint(6) NOT NULL DEFAULT 0,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` smallint(6) NOT NULL DEFAULT 0,
  `membership` smallint(6) NOT NULL DEFAULT 0,
  `disable_public_display` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_type_settings`
--

CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temporary_files`
--

CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `temporary_files`
--

INSERT INTO `temporary_files` (`file_id`, `user_id`, `file_name`, `file_type`, `file_size`, `original_file_name`, `date_uploaded`) VALUES
(17, 1, 'txtAB48.tmp', 'text/x-php', 4317, 'HealthSciencesThemePlugin.inc.php', '2022-11-15 08:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `usage_stats_temporary_records`
--

CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT 1,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `url`, `phone`, `mailing_address`, `billing_address`, `country`, `locales`, `gossip`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`, `inline_help`) VALUES
(1, 'admin', '$2y$10$J3c2FJ51m08OtdkT.jyT.OhpQiU5InbSNwc7FAQlmJXUSLxV.8VH6', 'admin@ku.af', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2022-11-08 10:02:28', NULL, '2022-11-09 09:45:03', 0, NULL, NULL, 0, NULL, 1),
(2, 'mshirzad', '$2y$10$JYcyTiNBLdP2dCvk4Hex4.VUvCnMETIzfY/R0WEK8trlu6v2RhD42', 'shirzad.mati@gmail.com', NULL, NULL, NULL, NULL, 'AF', '', NULL, NULL, '2022-11-10 08:27:32', NULL, '2022-11-19 09:11:52', 0, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 1,
  `permit_self_registration` smallint(6) NOT NULL DEFAULT 0,
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `context_id`, `role_id`, `is_default`, `show_title`, `permit_self_registration`, `permit_metadata_edit`) VALUES
(1, 0, 1, 1, 0, 0, 0),
(2, 1, 16, 1, 0, 0, 1),
(3, 1, 16, 1, 0, 0, 1),
(4, 1, 16, 1, 0, 0, 1),
(5, 1, 17, 1, 0, 0, 1),
(6, 1, 17, 1, 0, 0, 0),
(7, 1, 4097, 1, 0, 0, 0),
(8, 1, 4097, 1, 0, 0, 0),
(9, 1, 4097, 1, 0, 0, 0),
(10, 1, 4097, 1, 0, 0, 0),
(11, 1, 4097, 1, 0, 0, 0),
(12, 1, 4097, 1, 0, 0, 0),
(13, 1, 4097, 1, 0, 0, 0),
(14, 1, 65536, 1, 0, 1, 0),
(15, 1, 65536, 1, 0, 0, 0),
(16, 1, 4096, 1, 0, 1, 0),
(17, 1, 1048576, 1, 0, 1, 0),
(18, 1, 2097152, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_settings`
--

CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_settings`
--

INSERT INTO `user_group_settings` (`user_group_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Site Admin', 'string'),
(1, 'fa_IR', 'name', '##default.groups.name.siteAdmin##', 'string'),
(2, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(2, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(2, 'en_US', 'abbrev', 'JM', 'string'),
(2, 'en_US', 'name', 'Journal manager', 'string'),
(2, 'fa_IR', 'abbrev', '##default.groups.abbrev.manager##', 'string'),
(2, 'fa_IR', 'name', '##default.groups.name.manager##', 'string'),
(3, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(3, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(3, 'en_US', 'abbrev', 'JE', 'string'),
(3, 'en_US', 'name', 'Journal editor', 'string'),
(3, 'fa_IR', 'abbrev', '##default.groups.abbrev.editor##', 'string'),
(3, 'fa_IR', 'name', '##default.groups.name.editor##', 'string'),
(4, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(4, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(4, 'en_US', 'abbrev', 'ProdE', 'string'),
(4, 'en_US', 'name', 'Production editor', 'string'),
(4, 'fa_IR', 'abbrev', '##default.groups.abbrev.productionEditor##', 'string'),
(4, 'fa_IR', 'name', '##default.groups.name.productionEditor##', 'string'),
(5, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(5, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(5, 'en_US', 'abbrev', 'SecE', 'string'),
(5, 'en_US', 'name', 'Section editor', 'string'),
(5, 'fa_IR', 'abbrev', '##default.groups.abbrev.sectionEditor##', 'string'),
(5, 'fa_IR', 'name', '##default.groups.name.sectionEditor##', 'string'),
(6, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
(6, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
(6, 'en_US', 'abbrev', 'GE', 'string'),
(6, 'en_US', 'name', 'Guest editor', 'string'),
(6, 'fa_IR', 'abbrev', '##default.groups.abbrev.guestEditor##', 'string'),
(6, 'fa_IR', 'name', '##default.groups.name.guestEditor##', 'string'),
(7, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(7, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(7, 'en_US', 'abbrev', 'CE', 'string'),
(7, 'en_US', 'name', 'Copyeditor', 'string'),
(7, 'fa_IR', 'abbrev', '##default.groups.abbrev.copyeditor##', 'string'),
(7, 'fa_IR', 'name', '##default.groups.name.copyeditor##', 'string'),
(8, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(8, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(8, 'en_US', 'abbrev', 'Design', 'string'),
(8, 'en_US', 'name', 'Designer', 'string'),
(8, 'fa_IR', 'abbrev', '##default.groups.abbrev.designer##', 'string'),
(8, 'fa_IR', 'name', '##default.groups.name.designer##', 'string'),
(9, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(9, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(9, 'en_US', 'abbrev', 'FC', 'string'),
(9, 'en_US', 'name', 'Funding coordinator', 'string'),
(9, 'fa_IR', 'abbrev', '##default.groups.abbrev.funding##', 'string'),
(9, 'fa_IR', 'name', '##default.groups.name.funding##', 'string'),
(10, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(10, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(10, 'en_US', 'abbrev', 'IND', 'string'),
(10, 'en_US', 'name', 'Indexer', 'string'),
(10, 'fa_IR', 'abbrev', '##default.groups.abbrev.indexer##', 'string'),
(10, 'fa_IR', 'name', '##default.groups.name.indexer##', 'string'),
(11, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(11, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(11, 'en_US', 'abbrev', 'LE', 'string'),
(11, 'en_US', 'name', 'Layout Editor', 'string'),
(11, 'fa_IR', 'abbrev', '##default.groups.abbrev.layoutEditor##', 'string'),
(11, 'fa_IR', 'name', '##default.groups.name.layoutEditor##', 'string'),
(12, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(12, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(12, 'en_US', 'abbrev', 'MS', 'string'),
(12, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(12, 'fa_IR', 'abbrev', '##default.groups.abbrev.marketing##', 'string'),
(12, 'fa_IR', 'name', '##default.groups.name.marketing##', 'string'),
(13, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(13, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(13, 'en_US', 'abbrev', 'PR', 'string'),
(13, 'en_US', 'name', 'Proofreader', 'string'),
(13, 'fa_IR', 'abbrev', '##default.groups.abbrev.proofreader##', 'string'),
(13, 'fa_IR', 'name', '##default.groups.name.proofreader##', 'string'),
(14, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(14, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(14, 'en_US', 'abbrev', 'AU', 'string'),
(14, 'en_US', 'name', 'Author', 'string'),
(14, 'fa_IR', 'abbrev', '##default.groups.abbrev.author##', 'string'),
(14, 'fa_IR', 'name', '##default.groups.name.author##', 'string'),
(15, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(15, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(15, 'en_US', 'abbrev', 'Trans', 'string'),
(15, 'en_US', 'name', 'Translator', 'string'),
(15, 'fa_IR', 'abbrev', '##default.groups.abbrev.translator##', 'string'),
(15, 'fa_IR', 'name', '##default.groups.name.translator##', 'string'),
(16, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(16, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(16, 'en_US', 'abbrev', 'R', 'string'),
(16, 'en_US', 'name', 'Reviewer', 'string'),
(16, 'fa_IR', 'abbrev', '##default.groups.abbrev.externalReviewer##', 'string'),
(16, 'fa_IR', 'name', '##default.groups.name.externalReviewer##', 'string'),
(17, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(17, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(17, 'en_US', 'abbrev', 'Read', 'string'),
(17, 'en_US', 'name', 'Reader', 'string'),
(17, 'fa_IR', 'abbrev', '##default.groups.abbrev.reader##', 'string'),
(17, 'fa_IR', 'name', '##default.groups.name.reader##', 'string'),
(18, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
(18, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
(18, 'en_US', 'abbrev', 'SubM', 'string'),
(18, 'en_US', 'name', 'Subscription Manager', 'string'),
(18, 'fa_IR', 'abbrev', '##default.groups.abbrev.subscriptionManager##', 'string'),
(18, 'fa_IR', 'name', '##default.groups.name.subscriptionManager##', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_stage`
--

CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_stage`
--

INSERT INTO `user_group_stage` (`context_id`, `user_group_id`, `stage_id`) VALUES
(1, 3, 1),
(1, 3, 3),
(1, 3, 4),
(1, 3, 5),
(1, 4, 4),
(1, 4, 5),
(1, 5, 1),
(1, 5, 3),
(1, 5, 4),
(1, 5, 5),
(1, 6, 1),
(1, 6, 3),
(1, 6, 4),
(1, 6, 5),
(1, 7, 4),
(1, 8, 5),
(1, 9, 1),
(1, 9, 3),
(1, 10, 5),
(1, 11, 5),
(1, 12, 4),
(1, 13, 5),
(1, 14, 1),
(1, 14, 3),
(1, 14, 4),
(1, 14, 5),
(1, 15, 1),
(1, 15, 3),
(1, 15, 4),
(1, 15, 5),
(1, 16, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`user_id`, `locale`, `setting_name`, `assoc_type`, `assoc_id`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'familyName', 0, 0, 'admin', 'string'),
(1, 'en_US', 'givenName', 0, 0, 'admin', 'string'),
(2, 'en_US', 'affiliation', 0, 0, 'ku', 'string'),
(2, 'en_US', 'familyName', 0, 0, 'Shirzad', 'string'),
(2, 'en_US', 'givenName', 0, 0, 'Matiullah', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `user_user_groups`
--

CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_user_groups`
--

INSERT INTO `user_user_groups` (`user_group_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(14, 1),
(14, 2),
(16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT 0 COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT 0 COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT 0 COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT 0 COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`, `product_class_name`, `lazy_load`, `sitewide`) VALUES
(1, 0, 0, 0, '2022-11-08 10:02:45', 1, 'plugins.metadata', 'dc11', '', 0, 0),
(1, 0, 1, 0, '2022-11-08 10:02:46', 1, 'plugins.blocks', 'browse', 'BrowseBlockPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:46', 1, 'plugins.blocks', 'developedBy', 'DevelopedByBlockPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:46', 1, 'plugins.blocks', 'information', 'InformationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:46', 1, 'plugins.blocks', 'languageToggle', 'LanguageToggleBlockPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:46', 1, 'plugins.blocks', 'makeSubmission', 'MakeSubmissionBlockPlugin', 1, 0),
(1, 1, 0, 0, '2022-11-08 10:02:46', 1, 'plugins.blocks', 'subscription', 'SubscriptionBlockPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:46', 1, 'plugins.gateways', 'resolver', '', 0, 0),
(1, 2, 0, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'acron', 'AcronPlugin', 1, 1),
(1, 0, 0, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'announcementFeed', 'AnnouncementFeedPlugin', 1, 0),
(0, 1, 0, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'citationStyleLanguage', 'CitationStyleLanguagePlugin', 1, 0),
(1, 2, 0, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'customBlockManager', 'CustomBlockManagerPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'driver', 'DRIVERPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'dublinCoreMeta', 'DublinCoreMetaPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'googleAnalytics', 'GoogleAnalyticsPlugin', 1, 0),
(1, 1, 0, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'googleScholar', 'GoogleScholarPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'htmlArticleGalley', 'HtmlArticleGalleyPlugin', 1, 0),
(1, 0, 1, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'lensGalley', 'LensGalleyPlugin', 1, 0),
(1, 1, 2, 19, '2022-11-08 10:02:47', 1, 'plugins.generic', 'orcidProfile', 'OrcidProfilePlugin', 1, 0),
(1, 0, 1, 0, '2022-11-08 10:02:47', 1, 'plugins.generic', 'pdfJsViewer', 'PdfJsViewerPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.generic', 'recommendByAuthor', 'RecommendByAuthorPlugin', 1, 1),
(1, 0, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.generic', 'recommendBySimilarity', 'RecommendBySimilarityPlugin', 1, 1),
(1, 2, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.generic', 'staticPages', 'StaticPagesPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.generic', 'tinymce', 'TinyMCEPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.generic', 'usageEvent', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.generic', 'usageStats', 'UsageStatsPlugin', 0, 1),
(1, 0, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.generic', 'webFeed', 'WebFeedPlugin', 1, 0),
(2, 1, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.importexport', 'crossref', '', 0, 0),
(2, 0, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.importexport', 'datacite', '', 0, 0),
(1, 1, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.importexport', 'doaj', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.importexport', 'native', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:48', 1, 'plugins.importexport', 'pubmed', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.importexport', 'users', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.oaiMetadataFormats', 'dc', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.oaiMetadataFormats', 'marc', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.oaiMetadataFormats', 'marcxml', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.oaiMetadataFormats', 'rfc1807', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.paymethod', 'manual', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.paymethod', 'paypal', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.pubIds', 'doi', 'DOIPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.pubIds', 'urn', 'URNPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.reports', 'articles', '', 0, 0),
(1, 1, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.reports', 'counterReport', '', 0, 0),
(2, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.reports', 'reviewReport', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.reports', 'subscriptions', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:49', 1, 'plugins.reports', 'views', '', 0, 0),
(1, 0, 0, 0, '2022-11-08 10:02:50', 1, 'plugins.themes', 'default', 'DefaultThemePlugin', 1, 0),
(3, 3, 0, 7, '2022-11-08 10:00:04', 1, 'core', 'ojs2', '', 0, 1),
(1, 1, 0, 0, '2022-11-16 09:44:06', 0, 'plugins.themes', 'pragma', 'PragmaThemePlugin', 1, 0),
(1, 1, 1, 0, '2022-11-16 09:53:24', 1, 'plugins.themes', 'healthSciences', 'HealthSciencesThemePlugin', 1, 0),
(1, 1, 1, 0, '2022-11-16 09:56:29', 1, 'plugins.themes', 'pragma', 'PragmaThemePlugin', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_keys`
--
ALTER TABLE `access_keys`
  ADD PRIMARY KEY (`access_key_id`),
  ADD KEY `access_keys_hash` (`key_hash`,`user_id`,`context`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `announcements_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `announcement_settings`
--
ALTER TABLE `announcement_settings`
  ADD UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  ADD KEY `announcement_settings_announcement_id` (`announcement_id`);

--
-- Indexes for table `announcement_types`
--
ALTER TABLE `announcement_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `announcement_type_settings`
--
ALTER TABLE `announcement_type_settings`
  ADD UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  ADD KEY `announcement_type_settings_type_id` (`type_id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `authors_publication_id` (`publication_id`);

--
-- Indexes for table `author_settings`
--
ALTER TABLE `author_settings`
  ADD UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  ADD KEY `author_settings_author_id` (`author_id`);

--
-- Indexes for table `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`auth_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_path` (`context_id`,`path`),
  ADD KEY `category_context_id` (`context_id`,`parent_id`);

--
-- Indexes for table `category_settings`
--
ALTER TABLE `category_settings`
  ADD UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`);

--
-- Indexes for table `citations`
--
ALTER TABLE `citations`
  ADD PRIMARY KEY (`citation_id`),
  ADD UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  ADD KEY `citations_publication` (`publication_id`);

--
-- Indexes for table `citation_settings`
--
ALTER TABLE `citation_settings`
  ADD UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  ADD KEY `citation_settings_citation_id` (`citation_id`);

--
-- Indexes for table `completed_payments`
--
ALTER TABLE `completed_payments`
  ADD PRIMARY KEY (`completed_payment_id`);

--
-- Indexes for table `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  ADD PRIMARY KEY (`controlled_vocab_id`),
  ADD UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`);

--
-- Indexes for table `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  ADD PRIMARY KEY (`controlled_vocab_entry_id`),
  ADD KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`);

--
-- Indexes for table `controlled_vocab_entry_settings`
--
ALTER TABLE `controlled_vocab_entry_settings`
  ADD UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  ADD KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`);

--
-- Indexes for table `custom_issue_orders`
--
ALTER TABLE `custom_issue_orders`
  ADD UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`);

--
-- Indexes for table `custom_section_orders`
--
ALTER TABLE `custom_section_orders`
  ADD UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`);

--
-- Indexes for table `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  ADD PRIMARY KEY (`tombstone_id`),
  ADD KEY `data_object_tombstones_data_object_id` (`data_object_id`);

--
-- Indexes for table `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`);

--
-- Indexes for table `data_object_tombstone_settings`
--
ALTER TABLE `data_object_tombstone_settings`
  ADD UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  ADD KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`);

--
-- Indexes for table `edit_decisions`
--
ALTER TABLE `edit_decisions`
  ADD PRIMARY KEY (`edit_decision_id`),
  ADD KEY `edit_decisions_submission_id` (`submission_id`),
  ADD KEY `edit_decisions_editor_id` (`editor_id`);

--
-- Indexes for table `email_log`
--
ALTER TABLE `email_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `email_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `email_log_users`
--
ALTER TABLE `email_log_users`
  ADD UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`);

--
-- Indexes for table `email_templates_default`
--
ALTER TABLE `email_templates_default`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `email_templates_default_email_key` (`email_key`);

--
-- Indexes for table `email_templates_default_data`
--
ALTER TABLE `email_templates_default_data`
  ADD UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`);

--
-- Indexes for table `email_templates_settings`
--
ALTER TABLE `email_templates_settings`
  ADD UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  ADD KEY `email_settings_email_id` (`email_id`);

--
-- Indexes for table `event_log`
--
ALTER TABLE `event_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `event_log_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `event_log_settings`
--
ALTER TABLE `event_log_settings`
  ADD UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  ADD KEY `event_log_settings_log_id` (`log_id`),
  ADD KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `filter_groups`
--
ALTER TABLE `filter_groups`
  ADD PRIMARY KEY (`filter_group_id`),
  ADD UNIQUE KEY `filter_groups_symbolic` (`symbolic`);

--
-- Indexes for table `filter_settings`
--
ALTER TABLE `filter_settings`
  ADD UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  ADD KEY `filter_settings_id` (`filter_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `genre_settings`
--
ALTER TABLE `genre_settings`
  ADD UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  ADD KEY `genre_settings_genre_id` (`genre_id`);

--
-- Indexes for table `institutional_subscriptions`
--
ALTER TABLE `institutional_subscriptions`
  ADD PRIMARY KEY (`institutional_subscription_id`),
  ADD KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  ADD KEY `institutional_subscriptions_domain` (`domain`);

--
-- Indexes for table `institutional_subscription_ip`
--
ALTER TABLE `institutional_subscription_ip`
  ADD PRIMARY KEY (`institutional_subscription_ip_id`),
  ADD KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  ADD KEY `institutional_subscription_ip_start` (`ip_start`),
  ADD KEY `institutional_subscription_ip_end` (`ip_end`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `issues_journal_id` (`journal_id`),
  ADD KEY `issues_url_path` (`url_path`);

--
-- Indexes for table `issue_files`
--
ALTER TABLE `issue_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `issue_files_issue_id` (`issue_id`);

--
-- Indexes for table `issue_galleys`
--
ALTER TABLE `issue_galleys`
  ADD PRIMARY KEY (`galley_id`),
  ADD KEY `issue_galleys_issue_id` (`issue_id`),
  ADD KEY `issue_galleys_url_path` (`url_path`);

--
-- Indexes for table `issue_galley_settings`
--
ALTER TABLE `issue_galley_settings`
  ADD UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  ADD KEY `issue_galley_settings_galley_id` (`galley_id`);

--
-- Indexes for table `issue_settings`
--
ALTER TABLE `issue_settings`
  ADD UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  ADD KEY `issue_settings_issue_id` (`issue_id`),
  ADD KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `item_views`
--
ALTER TABLE `item_views`
  ADD UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`journal_id`),
  ADD UNIQUE KEY `journals_path` (`path`);

--
-- Indexes for table `journal_settings`
--
ALTER TABLE `journal_settings`
  ADD UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  ADD KEY `journal_settings_journal_id` (`journal_id`);

--
-- Indexes for table `library_files`
--
ALTER TABLE `library_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `library_files_context_id` (`context_id`),
  ADD KEY `library_files_submission_id` (`submission_id`);

--
-- Indexes for table `library_file_settings`
--
ALTER TABLE `library_file_settings`
  ADD UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  ADD KEY `library_file_settings_id` (`file_id`);

--
-- Indexes for table `metadata_descriptions`
--
ALTER TABLE `metadata_descriptions`
  ADD PRIMARY KEY (`metadata_description_id`),
  ADD KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `metadata_description_settings`
--
ALTER TABLE `metadata_description_settings`
  ADD UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  ADD KEY `metadata_description_settings_id` (`metadata_description_id`);

--
-- Indexes for table `metrics`
--
ALTER TABLE `metrics`
  ADD KEY `metrics_load_id` (`load_id`),
  ADD KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  ADD KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  ADD KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`);

--
-- Indexes for table `navigation_menus`
--
ALTER TABLE `navigation_menus`
  ADD PRIMARY KEY (`navigation_menu_id`);

--
-- Indexes for table `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  ADD PRIMARY KEY (`navigation_menu_item_id`);

--
-- Indexes for table `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  ADD PRIMARY KEY (`navigation_menu_item_assignment_id`);

--
-- Indexes for table `navigation_menu_item_assignment_settings`
--
ALTER TABLE `navigation_menu_item_assignment_settings`
  ADD UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  ADD KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`);

--
-- Indexes for table `navigation_menu_item_settings`
--
ALTER TABLE `navigation_menu_item_settings`
  ADD UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  ADD KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `notes_assoc` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  ADD KEY `notifications_context_id` (`context_id`,`level`),
  ADD KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  ADD KEY `notifications_user_id_level` (`user_id`,`level`);

--
-- Indexes for table `notification_mail_list`
--
ALTER TABLE `notification_mail_list`
  ADD PRIMARY KEY (`notification_mail_list_id`),
  ADD UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`);

--
-- Indexes for table `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oai_resumption_tokens`
--
ALTER TABLE `oai_resumption_tokens`
  ADD UNIQUE KEY `oai_resumption_tokens_pkey` (`token`);

--
-- Indexes for table `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  ADD KEY `plugin_settings_plugin_name` (`plugin_name`);

--
-- Indexes for table `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`publication_id`),
  ADD KEY `publications_submission_id` (`submission_id`),
  ADD KEY `publications_section_id` (`section_id`),
  ADD KEY `publications_url_path` (`url_path`);

--
-- Indexes for table `publication_categories`
--
ALTER TABLE `publication_categories`
  ADD UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`);

--
-- Indexes for table `publication_galleys`
--
ALTER TABLE `publication_galleys`
  ADD PRIMARY KEY (`galley_id`),
  ADD KEY `publication_galleys_publication_id` (`publication_id`),
  ADD KEY `publication_galleys_url_path` (`url_path`),
  ADD KEY `publication_galleys_submission_file_id_foreign` (`submission_file_id`);

--
-- Indexes for table `publication_galley_settings`
--
ALTER TABLE `publication_galley_settings`
  ADD UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  ADD KEY `publication_galley_settings_galley_id` (`galley_id`),
  ADD KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `publication_settings`
--
ALTER TABLE `publication_settings`
  ADD UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  ADD KEY `publication_settings_publication_id` (`publication_id`),
  ADD KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150));

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`query_id`),
  ADD KEY `queries_assoc_id` (`assoc_type`,`assoc_id`);

--
-- Indexes for table `query_participants`
--
ALTER TABLE `query_participants`
  ADD UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`);

--
-- Indexes for table `queued_payments`
--
ALTER TABLE `queued_payments`
  ADD PRIMARY KEY (`queued_payment_id`);

--
-- Indexes for table `review_assignments`
--
ALTER TABLE `review_assignments`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_assignments_submission_id` (`submission_id`),
  ADD KEY `review_assignments_reviewer_id` (`reviewer_id`),
  ADD KEY `review_assignments_form_id` (`review_form_id`),
  ADD KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`);

--
-- Indexes for table `review_files`
--
ALTER TABLE `review_files`
  ADD UNIQUE KEY `review_files_pkey` (`review_id`,`submission_file_id`),
  ADD KEY `review_files_review_id` (`review_id`),
  ADD KEY `review_files_submission_file_id_foreign` (`submission_file_id`);

--
-- Indexes for table `review_forms`
--
ALTER TABLE `review_forms`
  ADD PRIMARY KEY (`review_form_id`);

--
-- Indexes for table `review_form_elements`
--
ALTER TABLE `review_form_elements`
  ADD PRIMARY KEY (`review_form_element_id`),
  ADD KEY `review_form_elements_review_form_id` (`review_form_id`);

--
-- Indexes for table `review_form_element_settings`
--
ALTER TABLE `review_form_element_settings`
  ADD UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  ADD KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`);

--
-- Indexes for table `review_form_responses`
--
ALTER TABLE `review_form_responses`
  ADD KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`);

--
-- Indexes for table `review_form_settings`
--
ALTER TABLE `review_form_settings`
  ADD UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  ADD KEY `review_form_settings_review_form_id` (`review_form_id`);

--
-- Indexes for table `review_rounds`
--
ALTER TABLE `review_rounds`
  ADD PRIMARY KEY (`review_round_id`),
  ADD UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  ADD KEY `review_rounds_submission_id` (`submission_id`);

--
-- Indexes for table `review_round_files`
--
ALTER TABLE `review_round_files`
  ADD UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`submission_file_id`),
  ADD KEY `review_round_files_submission_id` (`submission_id`),
  ADD KEY `review_round_files_submission_file_id_foreign` (`submission_file_id`);

--
-- Indexes for table `scheduled_tasks`
--
ALTER TABLE `scheduled_tasks`
  ADD UNIQUE KEY `scheduled_tasks_pkey` (`class_name`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `sections_journal_id` (`journal_id`);

--
-- Indexes for table `section_settings`
--
ALTER TABLE `section_settings`
  ADD UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  ADD KEY `section_settings_section_id` (`section_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_pkey` (`session_id`),
  ADD KEY `sessions_user_id` (`user_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`);

--
-- Indexes for table `stage_assignments`
--
ALTER TABLE `stage_assignments`
  ADD PRIMARY KEY (`stage_assignment_id`),
  ADD UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  ADD KEY `stage_assignments_submission_id` (`submission_id`),
  ADD KEY `stage_assignments_user_group_id` (`user_group_id`),
  ADD KEY `stage_assignments_user_id` (`user_id`);

--
-- Indexes for table `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`static_page_id`);

--
-- Indexes for table `static_page_settings`
--
ALTER TABLE `static_page_settings`
  ADD UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  ADD KEY `static_page_settings_static_page_id` (`static_page_id`);

--
-- Indexes for table `subeditor_submission_group`
--
ALTER TABLE `subeditor_submission_group`
  ADD UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  ADD KEY `section_editors_context_id` (`context_id`),
  ADD KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  ADD KEY `subeditor_submission_group_user_id` (`user_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `submissions_context_id` (`context_id`),
  ADD KEY `submissions_publication_id` (`current_publication_id`);

--
-- Indexes for table `submission_comments`
--
ALTER TABLE `submission_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `submission_comments_submission_id` (`submission_id`);

--
-- Indexes for table `submission_files`
--
ALTER TABLE `submission_files`
  ADD PRIMARY KEY (`submission_file_id`),
  ADD KEY `submission_files_submission_id` (`submission_id`),
  ADD KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  ADD KEY `submission_files_file_id_foreign` (`file_id`);

--
-- Indexes for table `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  ADD PRIMARY KEY (`revision_id`),
  ADD KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  ADD KEY `submission_file_revisions_file_id_foreign` (`file_id`);

--
-- Indexes for table `submission_file_settings`
--
ALTER TABLE `submission_file_settings`
  ADD UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  ADD KEY `submission_file_settings_id` (`submission_file_id`);

--
-- Indexes for table `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  ADD PRIMARY KEY (`keyword_id`),
  ADD UNIQUE KEY `submission_search_keyword_text` (`keyword_text`);

--
-- Indexes for table `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `submission_search_object_submission` (`submission_id`);

--
-- Indexes for table `submission_search_object_keywords`
--
ALTER TABLE `submission_search_object_keywords`
  ADD UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  ADD KEY `submission_search_object_keywords_keyword_id` (`keyword_id`);

--
-- Indexes for table `submission_settings`
--
ALTER TABLE `submission_settings`
  ADD UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  ADD KEY `submission_settings_submission_id` (`submission_id`);

--
-- Indexes for table `submission_tombstones`
--
ALTER TABLE `submission_tombstones`
  ADD PRIMARY KEY (`tombstone_id`),
  ADD KEY `submission_tombstones_journal_id` (`journal_id`),
  ADD KEY `submission_tombstones_submission_id` (`submission_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `subscription_types`
--
ALTER TABLE `subscription_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `subscription_type_settings`
--
ALTER TABLE `subscription_type_settings`
  ADD UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  ADD KEY `subscription_type_settings_type_id` (`type_id`);

--
-- Indexes for table `temporary_files`
--
ALTER TABLE `temporary_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `temporary_files_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_username` (`username`),
  ADD UNIQUE KEY `users_email` (`email`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`user_group_id`),
  ADD KEY `user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_groups_context_id` (`context_id`),
  ADD KEY `user_groups_role_id` (`role_id`);

--
-- Indexes for table `user_group_settings`
--
ALTER TABLE `user_group_settings`
  ADD UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`);

--
-- Indexes for table `user_group_stage`
--
ALTER TABLE `user_group_stage`
  ADD UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  ADD KEY `user_group_stage_context_id` (`context_id`),
  ADD KEY `user_group_stage_user_group_id` (`user_group_id`),
  ADD KEY `user_group_stage_stage_id` (`stage_id`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`);

--
-- Indexes for table `user_settings`
--
ALTER TABLE `user_settings`
  ADD UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  ADD KEY `user_settings_user_id` (`user_id`),
  ADD KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`);

--
-- Indexes for table `user_user_groups`
--
ALTER TABLE `user_user_groups`
  ADD UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  ADD KEY `user_user_groups_user_group_id` (`user_group_id`),
  ADD KEY `user_user_groups_user_id` (`user_id`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_keys`
--
ALTER TABLE `access_keys`
  MODIFY `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcement_types`
--
ALTER TABLE `announcement_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_sources`
--
ALTER TABLE `auth_sources`
  MODIFY `auth_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `citations`
--
ALTER TABLE `citations`
  MODIFY `citation_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `completed_payments`
--
ALTER TABLE `completed_payments`
  MODIFY `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  MODIFY `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  MODIFY `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_object_tombstones`
--
ALTER TABLE `data_object_tombstones`
  MODIFY `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_object_tombstone_oai_set_objects`
--
ALTER TABLE `data_object_tombstone_oai_set_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edit_decisions`
--
ALTER TABLE `edit_decisions`
  MODIFY `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_log`
--
ALTER TABLE `email_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates_default`
--
ALTER TABLE `email_templates_default`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `event_log`
--
ALTER TABLE `event_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `filter_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `filter_groups`
--
ALTER TABLE `filter_groups`
  MODIFY `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `institutional_subscriptions`
--
ALTER TABLE `institutional_subscriptions`
  MODIFY `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institutional_subscription_ip`
--
ALTER TABLE `institutional_subscription_ip`
  MODIFY `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `issue_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_files`
--
ALTER TABLE `issue_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_galleys`
--
ALTER TABLE `issue_galleys`
  MODIFY `galley_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `journal_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `library_files`
--
ALTER TABLE `library_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metadata_descriptions`
--
ALTER TABLE `metadata_descriptions`
  MODIFY `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navigation_menus`
--
ALTER TABLE `navigation_menus`
  MODIFY `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `navigation_menu_items`
--
ALTER TABLE `navigation_menu_items`
  MODIFY `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `navigation_menu_item_assignments`
--
ALTER TABLE `navigation_menu_item_assignments`
  MODIFY `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `notification_mail_list`
--
ALTER TABLE `notification_mail_list`
  MODIFY `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_subscription_settings`
--
ALTER TABLE `notification_subscription_settings`
  MODIFY `setting_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `publications`
--
ALTER TABLE `publications`
  MODIFY `publication_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `publication_galleys`
--
ALTER TABLE `publication_galleys`
  MODIFY `galley_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `query_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queued_payments`
--
ALTER TABLE `queued_payments`
  MODIFY `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_assignments`
--
ALTER TABLE `review_assignments`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_forms`
--
ALTER TABLE `review_forms`
  MODIFY `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_form_elements`
--
ALTER TABLE `review_form_elements`
  MODIFY `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_rounds`
--
ALTER TABLE `review_rounds`
  MODIFY `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stage_assignments`
--
ALTER TABLE `stage_assignments`
  MODIFY `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submission_comments`
--
ALTER TABLE `submission_comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_files`
--
ALTER TABLE `submission_files`
  MODIFY `submission_file_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  MODIFY `revision_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submission_search_keyword_list`
--
ALTER TABLE `submission_search_keyword_list`
  MODIFY `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_search_objects`
--
ALTER TABLE `submission_search_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submission_tombstones`
--
ALTER TABLE `submission_tombstones`
  MODIFY `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_types`
--
ALTER TABLE `subscription_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temporary_files`
--
ALTER TABLE `temporary_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `publication_galleys`
--
ALTER TABLE `publication_galleys`
  ADD CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);

--
-- Constraints for table `review_files`
--
ALTER TABLE `review_files`
  ADD CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);

--
-- Constraints for table `review_round_files`
--
ALTER TABLE `review_round_files`
  ADD CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);

--
-- Constraints for table `submission_files`
--
ALTER TABLE `submission_files`
  ADD CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`);

--
-- Constraints for table `submission_file_revisions`
--
ALTER TABLE `submission_file_revisions`
  ADD CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  ADD CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
