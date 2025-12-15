-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Dec 15, 2025 at 02:24 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitnami_redmine`
--

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'production', '2025-12-10 21:04:12.810895', '2025-12-10 21:04:12.810895');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `disk_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filesize` bigint(20) NOT NULL DEFAULT 0,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `digest` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk_directory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `container_id`, `container_type`, `filename`, `disk_filename`, `filesize`, `content_type`, `digest`, `downloads`, `author_id`, `created_on`, `description`, `disk_directory`) VALUES
(3, 11, 'Issue', 'Screenshot 2025-12-15 165610.png', '251215165708_aea6970692a3c95ef41fef0dc78872fb.png', 279672, 'image/png', '475e8de4e548e69e2c5c359a1085f90ab33f7f360b58399aaced6b49cb33c059', 0, 6, '2025-12-15 09:57:08', '', '2025/12'),
(4, 11, 'Issue', 'clothes-web-shop.sql', '251215165739_clothes-web-shop.sql', 34169, 'text/plain', '8e41d8729a284f523c14b9c15d894befe63d0858708da54a97a3e505d88f3a47', 0, 6, '2025-12-15 09:57:39', '', '2025/12'),
(5, 14, 'Issue', 'Screenshot 2025-12-15 171748.png', '251215171918_6972fcce8b1bd1cd57cd0a51994cbf3e.png', 73181, 'image/png', 'c4ce9900fb30eac5401c90e6195f49ba8781a3a0384f5cd645dab2654cf57332', 0, 6, '2025-12-15 10:19:18', '', '2025/12'),
(6, NULL, NULL, 'Screenshot 2025-12-15 172328.png', '251215172349_e67df1bd6edebeae34531c3340a4ffe9.png', 68579, 'image/png', 'd8a846af9f9f239b20587e689a41a60fc440e60acce653f54acad7ae55447606', 0, 6, '2025-12-15 10:23:49', NULL, '2025/12'),
(7, 26, 'Issue', 'Screenshot 2025-12-15 173503.png', '251215173512_72946bc6399117cbbd90eaef050fc8c2.png', 98187, 'image/png', 'e6a61800a9c0c60d4f572406e065ac08791db6954493a8e05ba9f343ede5b5b6', 0, 6, '2025-12-15 10:35:12', '', '2025/12'),
(8, 32, 'Issue', 'Screenshot 2025-12-15 174032.png', '251215174045_ed6302411995602a045d3b8722dafc0a.png', 34619, 'image/png', '2d5847d10d8bb8cf56bfc81d9cdde1c27d070d9159936cc4711bd889058cee8e', 0, 6, '2025-12-15 10:40:45', '', '2025/12'),
(9, 32, 'Issue', 'Screenshot 2025-12-15 174118.png', '251215174128_b07d97d83a577d6e545f9e4dd8282541.png', 34408, 'image/png', '1295794a02b72136a4093523be09a1200ae839f9280922777ae06486632a748d', 0, 6, '2025-12-15 10:41:28', '', '2025/12'),
(10, 17, 'Issue', 'Screenshot 2025-12-15 174312.png', '251215174325_7d22dd900e53c3a6368d724bd52aa0b3.png', 85577, 'image/png', 'a5fa617b5e5e53a4834203836bd74a868db2d28b36b421b3d8f225598b579ada', 0, 6, '2025-12-15 10:43:25', '', '2025/12'),
(11, 33, 'Issue', 'Screenshot 2025-12-15 174645.png', '251215174702_dd50f1d68358ebee920dcbd622b208a3.png', 33797, 'image/png', '2701ef47916dc2de3b179eb521444d851c749aac094eaa6bfba7a97567f49f4c', 0, 6, '2025-12-15 10:47:02', '', '2025/12'),
(12, 21, 'Issue', 'Screenshot 2025-12-15 174850.png', '251215174859_064fa4fd573f90cbc62205fee075e714.png', 84688, 'image/png', 'f47ffbf1f89cd9d5c292c2e81f72f2fcb8fe4faa207d40393582c1bf000f0f95', 0, 6, '2025-12-15 10:48:59', '', '2025/12'),
(14, 27, 'Issue', 'Screenshot 2025-12-15 181923.png', '251215181935_3af55866f0b50f1b35515093f00811a8.png', 62284, 'image/png', '8b629f453f0aef5e6d0cf60bb3357e6a77dc578d464b56406b1f31c1d56bc4fe', 0, 6, '2025-12-15 11:19:35', '', '2025/12');

-- --------------------------------------------------------

--
-- Table structure for table `auth_sources`
--

CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `host` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `base_dn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_login` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_firstname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_lastname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_mail` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT 0,
  `tls` tinyint(1) NOT NULL DEFAULT 0,
  `filter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `verify_peer` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `topics_count` int(11) NOT NULL DEFAULT 0,
  `messages_count` int(11) NOT NULL DEFAULT 0,
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changes`
--

CREATE TABLE `changes` (
  `id` int(11) NOT NULL,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_revision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changesets`
--

CREATE TABLE `changesets` (
  `id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `committer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changesets_issues`
--

CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changeset_parents`
--

CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `commented_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_format` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `possible_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regexp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_for_all` tinyint(1) NOT NULL DEFAULT 0,
  `is_filter` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT 0,
  `default_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editable` tinyint(1) DEFAULT 1,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `multiple` tinyint(1) DEFAULT 0,
  `format_store` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_projects`
--

CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_roles`
--

CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_trackers`
--

CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT 0,
  `tracker_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_enumerations`
--

CREATE TABLE `custom_field_enumerations` (
  `id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_values`
--

CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL,
  `customized_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT 0,
  `custom_field_id` int(11) NOT NULL DEFAULT 0,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses`
--

CREATE TABLE `email_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 1,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `user_id`, `address`, `is_default`, `notify`, `created_on`, `updated_on`) VALUES
(1, 1, 'namhang0159@gmail.com', 1, 1, '2025-12-10 21:04:09', '2025-12-10 21:04:09'),
(2, 5, 'chithinh@gmail.com', 1, 1, '2025-12-11 15:40:36', '2025-12-11 15:41:17'),
(3, 6, 'trungnguyen@gmail.com', 1, 1, '2025-12-11 15:50:52', '2025-12-11 15:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `enabled_modules`
--

CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enabled_modules`
--

INSERT INTO `enabled_modules` (`id`, `project_id`, `name`) VALUES
(21, 3, 'issue_tracking'),
(22, 3, 'time_tracking'),
(23, 3, 'news'),
(24, 3, 'documents'),
(25, 3, 'files'),
(26, 3, 'wiki'),
(27, 3, 'repository'),
(28, 3, 'boards'),
(29, 3, 'calendar'),
(30, 3, 'gantt');

-- --------------------------------------------------------

--
-- Table structure for table `enumerations`
--

CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enumerations`
--

INSERT INTO `enumerations` (`id`, `name`, `position`, `is_default`, `type`, `active`, `project_id`, `parent_id`, `position_name`) VALUES
(1, 'Low', 1, 0, 'IssuePriority', 1, NULL, NULL, 'lowest'),
(2, 'Normal', 2, 1, 'IssuePriority', 1, NULL, NULL, 'default'),
(3, 'High', 3, 0, 'IssuePriority', 1, NULL, NULL, 'high3'),
(4, 'Urgent', 4, 0, 'IssuePriority', 1, NULL, NULL, 'high2'),
(5, 'Immediate', 5, 0, 'IssuePriority', 1, NULL, NULL, 'highest'),
(6, 'User documentation', 1, 0, 'DocumentCategory', 1, NULL, NULL, NULL),
(7, 'Technical documentation', 2, 0, 'DocumentCategory', 1, NULL, NULL, NULL),
(8, 'Design', 1, 0, 'TimeEntryActivity', 1, NULL, NULL, NULL),
(9, 'Development', 2, 0, 'TimeEntryActivity', 1, NULL, NULL, NULL),
(10, 'Project Management', 3, 0, 'TimeEntryActivity', 1, NULL, NULL, NULL),
(11, 'Testing', 4, 0, 'TimeEntryActivity', 1, NULL, NULL, NULL),
(12, 'Documentation', 5, 0, 'TimeEntryActivity', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups_users`
--

CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_items` int(11) DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_items`
--

CREATE TABLE `import_items` (
  `id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(11) NOT NULL,
  `tracker_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT 0,
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `closed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `tracker_id`, `project_id`, `subject`, `description`, `due_date`, `category_id`, `status_id`, `assigned_to_id`, `priority_id`, `fixed_version_id`, `author_id`, `lock_version`, `created_on`, `updated_on`, `start_date`, `done_ratio`, `estimated_hours`, `parent_id`, `root_id`, `lft`, `rgt`, `is_private`, `closed_on`) VALUES
(8, 4, 3, 'Khởi tạo project Website quản lý shop quần áo', 'Tạo project trên Redmine\r\n\r\nCấu hình module, tracker, workflow', '2025-11-17', NULL, 5, 1, 2, NULL, 1, 9, '2025-12-15 05:50:07', '2025-12-15 14:23:48', '2025-11-16', 100, NULL, NULL, 8, 1, 2, 0, '2025-12-15 16:38:56'),
(9, 4, 3, 'Tạo user và phân quyền hệ thống', '', '2025-11-19', NULL, 5, 6, 3, NULL, 1, 11, '2025-12-15 05:51:06', '2025-12-15 14:23:48', '2025-11-18', 100, NULL, NULL, 9, 1, 2, 0, '2025-12-15 16:39:09'),
(10, 4, 3, 'Lập kế hoạch & phân công task', 'Chia giai đoạn phát triển\r\n\r\nTạo issue cho Developer & Tester', '2025-11-20', NULL, 5, 1, 2, NULL, 1, 5, '2025-12-15 05:52:10', '2025-12-15 14:23:48', '2025-11-19', 100, NULL, NULL, 10, 1, 2, 0, '2025-12-15 16:35:38'),
(11, 4, 3, 'Thiết kế CSDL cho website shop quần áo', 'Thiết kế CSDL cho website shop quần áo', '2025-11-22', NULL, 5, 6, 3, NULL, 1, 7, '2025-12-15 05:53:08', '2025-12-15 14:23:49', '2025-11-21', 100, NULL, NULL, 11, 1, 2, 0, '2025-12-15 16:59:30'),
(12, 2, 3, 'Xây dựng API đăng nhập & phân quyền', '', '2025-11-24', NULL, 5, 6, 3, NULL, 1, 8, '2025-12-15 05:53:56', '2025-12-15 14:23:49', '2025-11-23', 100, NULL, NULL, 12, 1, 2, 0, '2025-12-15 17:13:49'),
(13, 4, 3, 'Viết test case chức năng đăng nhập', 'Viết test case chức năng đăng nhập', '2025-11-25', NULL, 5, 5, 2, NULL, 1, 7, '2025-12-15 05:54:54', '2025-12-15 14:23:49', '2025-11-24', 100, NULL, NULL, 13, 1, 2, 0, '2025-12-15 21:19:53'),
(14, 2, 3, 'API quản lý sản phẩm', 'API CRUD sản phẩm', '2025-11-29', NULL, 5, 6, 3, NULL, 1, 9, '2025-12-15 05:56:06', '2025-12-15 14:23:49', '2025-11-27', 100, NULL, NULL, 14, 1, 2, 0, '2025-12-15 17:19:47'),
(15, 4, 3, 'Test chức năng CRUD sản phẩm', 'Test chức năng CRUD sản phẩm', '2025-11-28', NULL, 5, 5, 2, NULL, 1, 6, '2025-12-15 05:56:56', '2025-12-15 14:23:49', '2025-11-27', 100, NULL, NULL, 15, 1, 2, 0, '2025-12-15 21:19:53'),
(16, 1, 3, 'Báo lỗi không upload được ảnh', 'Lỗi không upload được hình ảnh sản phẩm', '2025-11-29', NULL, 5, 1, 3, NULL, 1, 9, '2025-12-15 05:57:43', '2025-12-15 14:23:49', '2025-11-29', 100, NULL, NULL, 16, 1, 2, 0, '2025-12-15 21:15:08'),
(17, 2, 3, 'Giao diện quản lý sản phẩm', 'Giao diện quản lý sản phẩm', '2025-11-28', NULL, 5, 6, 3, 3, 1, 6, '2025-12-15 05:58:29', '2025-12-15 14:23:49', '2025-11-28', 100, NULL, NULL, 17, 1, 2, 0, '2025-12-15 17:43:38'),
(20, 2, 3, 'API quản lý đơn hàng', 'API quản lý đơn hàng', '2025-12-06', NULL, 5, 6, 2, NULL, 1, 5, '2025-12-15 06:01:28', '2025-12-15 14:23:49', '2025-12-03', 100, NULL, NULL, 20, 1, 2, 0, '2025-12-15 21:03:36'),
(21, 2, 3, 'Giao diện quản lý đơn hàng', 'Giao diện quản lý đơn hàng', '2025-12-09', NULL, 5, 6, 3, 3, 1, 6, '2025-12-15 06:02:02', '2025-12-15 14:23:49', '2025-12-07', 100, NULL, NULL, 21, 1, 2, 0, '2025-12-15 17:49:03'),
(22, 1, 3, 'Kiểm thử chức năng quản lý đơn hàng', 'Kiểm thử chức năng quản lý đơn hàng', '2025-12-11', NULL, 5, 5, 2, NULL, 1, 6, '2025-12-15 06:02:45', '2025-12-15 14:23:49', '2025-12-10', 100, NULL, NULL, 22, 1, 2, 0, '2025-12-15 21:19:53'),
(23, 4, 3, 'Theo dõi tiến độ & kiểm tra chất lượng', 'Theo dõi tiến độ & kiểm tra chất lượng', '2025-12-16', NULL, 5, 1, 2, NULL, 1, 6, '2025-12-15 06:03:37', '2025-12-15 14:23:49', '2025-11-17', 100, NULL, NULL, 23, 1, 2, 0, '2025-12-15 16:37:07'),
(24, 4, 3, 'Lập kế hoạch và phân công công việc', 'Lập kế hoạch và phân công công việc ', '2025-12-16', NULL, 5, 1, 3, 4, 1, 5, '2025-12-15 06:07:32', '2025-12-15 14:23:49', '2025-12-16', 100, NULL, NULL, 24, 1, 2, 0, '2025-12-15 16:37:39'),
(26, 2, 3, 'Xây dựng API quản lý feedback', 'Xây dựng API ', '2025-12-20', NULL, 5, 6, 2, 4, 1, 7, '2025-12-15 06:08:48', '2025-12-15 14:23:49', '2025-12-19', 100, NULL, NULL, 26, 1, 2, 0, '2025-12-15 17:35:16'),
(27, 2, 3, 'Giao diện quản lý feedback', 'Giao diện quản lý feedback', '2025-12-21', NULL, 5, 6, 2, 4, 1, 7, '2025-12-15 06:10:00', '2025-12-15 14:23:49', '2025-12-20', 100, NULL, NULL, 27, 1, 2, 0, '2025-12-15 17:58:35'),
(28, 4, 3, 'Kiểm thử chức năng quản lý feedback', 'Kiểm thử chức năng quản lý feedback', '2025-12-22', NULL, 5, 5, 2, 4, 1, 7, '2025-12-15 06:10:38', '2025-12-15 14:23:49', '2025-12-22', 100, NULL, NULL, 28, 1, 2, 0, '2025-12-15 21:19:53'),
(29, 1, 3, 'Báo lỗi không upload được ảnh feedback', 'Báo lỗi không upload được ảnh lên giao diện', '2025-12-25', NULL, 5, 1, 2, 4, 1, 7, '2025-12-15 06:11:32', '2025-12-15 14:23:49', '2025-12-25', 100, NULL, NULL, 29, 1, 2, 0, '2025-12-15 21:21:08'),
(32, 2, 3, 'Viết API quản lý bài viết', 'API quản lý bài viết', '2025-12-31', NULL, 5, 6, 2, 4, 1, 8, '2025-12-15 06:13:26', '2025-12-15 14:23:50', '2025-12-30', 100, NULL, NULL, 32, 1, 2, 0, '2025-12-15 17:41:31'),
(33, 2, 3, 'Giao diện quản lý bài viết', 'Giao diện quản lý bài viết', '2026-01-03', NULL, 5, 6, 2, 4, 1, 7, '2025-12-15 06:14:14', '2025-12-15 14:23:50', '2026-01-02', 100, NULL, NULL, 33, 1, 2, 0, '2025-12-15 17:47:09'),
(34, 4, 3, 'Test chức năng bài viết', 'Test chức năng bài viết', '2026-01-05', NULL, 5, 5, 2, 4, 1, 6, '2025-12-15 06:15:09', '2025-12-15 14:23:50', '2026-01-04', 100, NULL, NULL, 34, 1, 2, 0, '2025-12-15 21:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `issue_categories`
--

CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issue_relations`
--

CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issue_statuses`
--

CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `default_done_ratio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issue_statuses`
--

INSERT INTO `issue_statuses` (`id`, `name`, `is_closed`, `position`, `default_done_ratio`) VALUES
(1, 'New', 0, 1, NULL),
(2, 'In Progress', 0, 2, NULL),
(3, 'Resolved', 1, 3, NULL),
(4, 'Feedback', 0, 4, NULL),
(5, 'Closed', 1, 5, NULL),
(6, 'Rejected', 1, 6, NULL),
(10, 'Support request', 0, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int(11) NOT NULL,
  `journalized_id` int(11) NOT NULL DEFAULT 0,
  `journalized_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `journalized_id`, `journalized_type`, `user_id`, `notes`, `created_on`, `private_notes`) VALUES
(1, 12, 'Issue', 1, '', '2025-12-15 12:55:19', 0),
(2, 14, 'Issue', 1, '', '2025-12-15 12:56:11', 0),
(3, 8, 'Issue', 1, '', '2025-12-15 16:29:08', 0),
(4, 9, 'Issue', 1, '', '2025-12-15 16:30:56', 0),
(5, 8, 'Issue', 1, '', '2025-12-15 16:31:12', 0),
(6, 8, 'Issue', 1, '', '2025-12-15 16:31:19', 0),
(7, 8, 'Issue', 1, '', '2025-12-15 16:31:28', 0),
(8, 10, 'Issue', 6, '', '2025-12-15 16:35:34', 0),
(9, 10, 'Issue', 6, '', '2025-12-15 16:35:38', 0),
(10, 9, 'Issue', 1, '', '2025-12-15 16:36:18', 0),
(11, 9, 'Issue', 1, '', '2025-12-15 16:36:24', 0),
(12, 23, 'Issue', 1, '', '2025-12-15 16:37:01', 0),
(13, 23, 'Issue', 1, '', '2025-12-15 16:37:07', 0),
(14, 24, 'Issue', 1, '', '2025-12-15 16:37:35', 0),
(15, 24, 'Issue', 1, '', '2025-12-15 16:37:39', 0),
(16, 8, 'Issue', 1, '', '2025-12-15 16:38:56', 0),
(17, 9, 'Issue', 1, '', '2025-12-15 16:39:09', 0),
(18, 11, 'Issue', 6, 'Đang bắt đầu thiết kế csdl cho website shop quần ', '2025-12-15 16:51:49', 0),
(19, 11, 'Issue', 6, 'Đã thiết kế xong CSDL cho website shop quần ', '2025-12-15 16:59:30', 0),
(20, 12, 'Issue', 6, '', '2025-12-15 17:12:34', 0),
(21, 12, 'Issue', 6, '\"Đã xong API login cơ bản. Tài khoản test: admin / 123456\".', '2025-12-15 17:13:49', 0),
(22, 14, 'Issue', 6, 'Đã bắt đầu triển khai viết api quản lý sản ', '2025-12-15 17:16:11', 0),
(23, 14, 'Issue', 6, 'Đã hoàn thành CRUD cho bảng ', '2025-12-15 17:19:47', 0),
(24, 26, 'Issue', 6, 'Đang xây dựng api quản lý feedback', '2025-12-15 17:20:40', 0),
(25, 26, 'Issue', 6, 'Đã xây dựng xong api quản lý feedback', '2025-12-15 17:35:16', 0),
(26, 32, 'Issue', 6, 'Đang xây dựng api quản lý bài viết', '2025-12-15 17:36:12', 0),
(27, 20, 'Issue', 6, '', '2025-12-15 17:37:19', 0),
(28, 32, 'Issue', 6, 'Đang xây dựng API quản lý bài viết', '2025-12-15 17:38:12', 0),
(29, 32, 'Issue', 6, 'Đã hoàn thành api quản lý bài viết', '2025-12-15 17:41:31', 0),
(30, 17, 'Issue', 6, 'Đang xây dựng giao diện quản lý sản phẩm', '2025-12-15 17:42:14', 0),
(31, 17, 'Issue', 6, 'Đã hoàn thành giao diện quản lý sản phẩm', '2025-12-15 17:43:38', 0),
(32, 33, 'Issue', 6, 'Đang xây dựng giao diện quản lý bài viết', '2025-12-15 17:45:49', 0),
(33, 33, 'Issue', 6, 'Đã hoàn thành giao diện quản lý bài viết', '2025-12-15 17:47:09', 0),
(34, 21, 'Issue', 6, 'Đang xây dựng giao diện quản lý đơn hàng', '2025-12-15 17:47:49', 0),
(35, 21, 'Issue', 6, 'Đã hoàn thành giao diện quản lý đơn ', '2025-12-15 17:49:03', 0),
(36, 27, 'Issue', 6, 'Đang xây dựng giao diện quản lý feedback. Gồm các chức năng ẩn,hiện,lọc feedback', '2025-12-15 17:51:34', 0),
(37, 27, 'Issue', 6, 'Đã hoàn thành giao diện quản lý feedback', '2025-12-15 17:58:35', 0),
(38, 9, 'Issue', 6, '', '2025-12-15 18:16:27', 0),
(39, 11, 'Issue', 6, '', '2025-12-15 18:16:52', 0),
(40, 12, 'Issue', 6, '', '2025-12-15 18:17:11', 0),
(41, 14, 'Issue', 6, '', '2025-12-15 18:17:25', 0),
(42, 26, 'Issue', 6, '', '2025-12-15 18:17:41', 0),
(43, 32, 'Issue', 6, '', '2025-12-15 18:18:01', 0),
(44, 17, 'Issue', 6, '', '2025-12-15 18:18:16', 0),
(45, 33, 'Issue', 6, '', '2025-12-15 18:18:29', 0),
(46, 21, 'Issue', 6, '', '2025-12-15 18:18:52', 0),
(47, 27, 'Issue', 6, '', '2025-12-15 18:19:37', 0),
(48, 27, 'Issue', 6, '', '2025-12-15 18:19:47', 0),
(49, 20, 'Issue', 1, '', '2025-12-15 20:55:56', 0),
(50, 9, 'Issue', 1, '', '2025-12-15 21:01:07', 0),
(51, 11, 'Issue', 1, '', '2025-12-15 21:01:24', 0),
(52, 12, 'Issue', 1, '', '2025-12-15 21:01:35', 0),
(53, 14, 'Issue', 1, '', '2025-12-15 21:02:07', 0),
(54, 26, 'Issue', 1, '', '2025-12-15 21:02:28', 0),
(55, 27, 'Issue', 1, '', '2025-12-15 21:02:42', 0),
(56, 32, 'Issue', 1, '', '2025-12-15 21:02:54', 0),
(57, 33, 'Issue', 1, '', '2025-12-15 21:03:02', 0),
(58, 20, 'Issue', 1, '', '2025-12-15 21:03:36', 0),
(59, 17, 'Issue', 1, '', '2025-12-15 21:04:46', 0),
(60, 8, 'Issue', 1, '', '2025-12-15 21:04:58', 0),
(61, 21, 'Issue', 1, '', '2025-12-15 21:05:10', 0),
(62, 9, 'Issue', 1, '', '2025-12-15 21:05:51', 0),
(63, 10, 'Issue', 1, '', '2025-12-15 21:06:37', 0),
(64, 11, 'Issue', 1, '', '2025-12-15 21:06:46', 0),
(65, 12, 'Issue', 1, '', '2025-12-15 21:06:59', 0),
(66, 14, 'Issue', 1, '', '2025-12-15 21:07:05', 0),
(67, 23, 'Issue', 1, NULL, '2025-12-15 21:07:21', 0),
(68, 24, 'Issue', 1, NULL, '2025-12-15 21:07:21', 0),
(69, 26, 'Issue', 1, NULL, '2025-12-15 21:07:21', 0),
(70, 27, 'Issue', 1, NULL, '2025-12-15 21:07:21', 0),
(71, 32, 'Issue', 1, NULL, '2025-12-15 21:07:21', 0),
(72, 33, 'Issue', 1, NULL, '2025-12-15 21:07:21', 0),
(73, 13, 'Issue', 5, 'Done', '2025-12-15 21:09:44', 0),
(74, 15, 'Issue', 5, 'Done', '2025-12-15 21:10:31', 0),
(75, 16, 'Issue', 5, '', '2025-12-15 21:11:30', 0),
(76, 22, 'Issue', 5, '', '2025-12-15 21:11:54', 0),
(77, 29, 'Issue', 5, 'Lỗi', '2025-12-15 21:12:41', 0),
(78, 16, 'Issue', 1, '', '2025-12-15 21:13:25', 0),
(79, 16, 'Issue', 1, '', '2025-12-15 21:13:53', 0),
(80, 16, 'Issue', 6, '', '2025-12-15 21:15:08', 0),
(81, 16, 'Issue', 5, '', '2025-12-15 21:16:27', 0),
(82, 16, 'Issue', 5, 'đã xác nhận', '2025-12-15 21:16:53', 0),
(83, 28, 'Issue', 5, '', '2025-12-15 21:18:31', 0),
(84, 34, 'Issue', 5, '', '2025-12-15 21:18:50', 0),
(85, 13, 'Issue', 1, NULL, '2025-12-15 21:19:46', 0),
(86, 15, 'Issue', 1, NULL, '2025-12-15 21:19:46', 0),
(87, 22, 'Issue', 1, NULL, '2025-12-15 21:19:46', 0),
(88, 28, 'Issue', 1, NULL, '2025-12-15 21:19:46', 0),
(89, 34, 'Issue', 1, NULL, '2025-12-15 21:19:46', 0),
(90, 13, 'Issue', 1, NULL, '2025-12-15 21:19:53', 0),
(91, 15, 'Issue', 1, NULL, '2025-12-15 21:19:53', 0),
(92, 22, 'Issue', 1, NULL, '2025-12-15 21:19:53', 0),
(93, 28, 'Issue', 1, NULL, '2025-12-15 21:19:53', 0),
(94, 34, 'Issue', 1, NULL, '2025-12-15 21:19:53', 0),
(95, 29, 'Issue', 1, '', '2025-12-15 21:20:15', 0),
(96, 29, 'Issue', 6, '', '2025-12-15 21:21:01', 0),
(97, 29, 'Issue', 6, '', '2025-12-15 21:21:08', 0),
(98, 29, 'Issue', 1, '', '2025-12-15 21:22:02', 0),
(99, 13, 'Issue', 1, NULL, '2025-12-15 21:22:58', 0),
(100, 15, 'Issue', 1, NULL, '2025-12-15 21:22:58', 0),
(101, 16, 'Issue', 1, NULL, '2025-12-15 21:22:58', 0),
(102, 22, 'Issue', 1, NULL, '2025-12-15 21:22:58', 0),
(103, 28, 'Issue', 1, NULL, '2025-12-15 21:22:58', 0),
(104, 34, 'Issue', 1, NULL, '2025-12-15 21:22:58', 0),
(105, 10, 'Issue', 1, NULL, '2025-12-15 21:23:48', 0),
(106, 13, 'Issue', 1, NULL, '2025-12-15 21:23:49', 0),
(107, 16, 'Issue', 1, NULL, '2025-12-15 21:23:49', 0),
(108, 20, 'Issue', 1, NULL, '2025-12-15 21:23:49', 0),
(109, 22, 'Issue', 1, NULL, '2025-12-15 21:23:49', 0),
(110, 23, 'Issue', 1, NULL, '2025-12-15 21:23:49', 0),
(111, 24, 'Issue', 1, NULL, '2025-12-15 21:23:49', 0),
(112, 28, 'Issue', 1, NULL, '2025-12-15 21:23:49', 0),
(113, 29, 'Issue', 1, NULL, '2025-12-15 21:23:49', 0),
(114, 34, 'Issue', 1, NULL, '2025-12-15 21:23:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `journal_details`
--

CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL DEFAULT 0,
  `property` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prop_key` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `old_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `journal_details`
--

INSERT INTO `journal_details` (`id`, `journal_id`, `property`, `prop_key`, `old_value`, `value`) VALUES
(1, 1, 'attr', 'tracker_id', '1', '2'),
(2, 2, 'attr', 'tracker_id', '1', '2'),
(3, 3, 'attr', 'status_id', '1', '6'),
(4, 4, 'attr', 'status_id', '1', '4'),
(5, 4, 'attr', 'done_ratio', '0', '100'),
(6, 5, 'attr', 'status_id', '6', '1'),
(7, 6, 'attr', 'status_id', '1', '2'),
(8, 7, 'attr', 'status_id', '2', '4'),
(9, 8, 'attr', 'status_id', '1', '2'),
(10, 9, 'attr', 'status_id', '2', '3'),
(11, 10, 'attr', 'status_id', '4', '2'),
(12, 11, 'attr', 'status_id', '2', '4'),
(13, 12, 'attr', 'status_id', '1', '2'),
(14, 13, 'attr', 'status_id', '2', '3'),
(15, 14, 'attr', 'status_id', '1', '2'),
(16, 15, 'attr', 'status_id', '2', '3'),
(17, 16, 'attr', 'status_id', '4', '3'),
(18, 17, 'attr', 'status_id', '4', '3'),
(19, 18, 'attr', 'status_id', '1', '2'),
(20, 18, 'attr', 'done_ratio', '0', '20'),
(21, 19, 'attachment', '3', NULL, 'Screenshot 2025-12-15 165610.png'),
(22, 19, 'attachment', '4', NULL, 'clothes-web-shop.sql'),
(23, 19, 'attr', 'status_id', '2', '3'),
(24, 19, 'attr', 'assigned_to_id', '6', '1'),
(25, 19, 'attr', 'done_ratio', '20', '100'),
(26, 20, 'attr', 'status_id', '1', '2'),
(27, 21, 'attr', 'status_id', '2', '3'),
(28, 21, 'attr', 'assigned_to_id', '6', '1'),
(29, 21, 'attr', 'done_ratio', '0', '100'),
(30, 22, 'attr', 'status_id', '1', '2'),
(31, 22, 'attr', 'done_ratio', '0', '10'),
(32, 23, 'attachment', '5', NULL, 'Screenshot 2025-12-15 171748.png'),
(33, 23, 'attr', 'status_id', '2', '3'),
(34, 23, 'attr', 'assigned_to_id', '6', '1'),
(35, 23, 'attr', 'done_ratio', '10', '100'),
(36, 24, 'attr', 'status_id', '1', '2'),
(37, 24, 'attr', 'done_ratio', '0', '10'),
(38, 25, 'attachment', '7', NULL, 'Screenshot 2025-12-15 173503.png'),
(39, 25, 'attr', 'status_id', '2', '3'),
(40, 25, 'attr', 'done_ratio', '10', '100'),
(41, 26, 'attr', 'status_id', '1', '2'),
(42, 26, 'attr', 'done_ratio', '0', '10'),
(43, 27, 'attr', 'assigned_to_id', '6', '1'),
(44, 29, 'attachment', '8', NULL, 'Screenshot 2025-12-15 174032.png'),
(45, 29, 'attachment', '9', NULL, 'Screenshot 2025-12-15 174118.png'),
(46, 29, 'attr', 'status_id', '2', '3'),
(47, 29, 'attr', 'done_ratio', '10', '100'),
(48, 30, 'attr', 'status_id', '1', '2'),
(49, 30, 'attr', 'done_ratio', '0', '30'),
(50, 31, 'attachment', '10', NULL, 'Screenshot 2025-12-15 174312.png'),
(51, 31, 'attr', 'status_id', '2', '3'),
(52, 31, 'attr', 'assigned_to_id', '6', '1'),
(53, 31, 'attr', 'fixed_version_id', NULL, '3'),
(54, 31, 'attr', 'done_ratio', '30', '100'),
(55, 32, 'attr', 'status_id', '1', '2'),
(56, 32, 'attr', 'done_ratio', '0', '30'),
(57, 33, 'attachment', '11', NULL, 'Screenshot 2025-12-15 174645.png'),
(58, 33, 'attr', 'status_id', '2', '3'),
(59, 33, 'attr', 'assigned_to_id', '6', '1'),
(60, 33, 'attr', 'done_ratio', '30', '100'),
(61, 34, 'attr', 'status_id', '1', '2'),
(62, 34, 'attr', 'done_ratio', '0', '10'),
(63, 35, 'attachment', '12', NULL, 'Screenshot 2025-12-15 174850.png'),
(64, 35, 'attr', 'status_id', '2', '3'),
(65, 35, 'attr', 'fixed_version_id', NULL, '3'),
(66, 35, 'attr', 'done_ratio', '10', '100'),
(67, 36, 'attr', 'status_id', '1', '2'),
(68, 36, 'attr', 'done_ratio', '0', '20'),
(69, 37, 'attachment', '13', NULL, 'Screenshot 2025-12-15 175818.png'),
(70, 37, 'attr', 'status_id', '2', '3'),
(71, 37, 'attr', 'done_ratio', '20', '100'),
(72, 38, 'attr', 'assigned_to_id', '1', '5'),
(73, 39, 'attr', 'assigned_to_id', '1', '5'),
(74, 40, 'attr', 'assigned_to_id', '1', '5'),
(75, 41, 'attr', 'assigned_to_id', '1', '5'),
(76, 42, 'attr', 'assigned_to_id', '6', '5'),
(77, 43, 'attr', 'assigned_to_id', '6', '5'),
(78, 44, 'attr', 'assigned_to_id', '1', '5'),
(79, 45, 'attr', 'assigned_to_id', '1', '5'),
(80, 46, 'attr', 'assigned_to_id', '6', '5'),
(81, 47, 'attachment', '14', NULL, 'Screenshot 2025-12-15 181923.png'),
(82, 47, 'attr', 'assigned_to_id', '6', '5'),
(83, 48, 'attachment', '13', 'Screenshot 2025-12-15 175818.png', NULL),
(84, 49, 'attr', 'assigned_to_id', '1', '6'),
(85, 50, 'attr', 'assigned_to_id', '5', '6'),
(86, 51, 'attr', 'assigned_to_id', '5', '6'),
(87, 52, 'attr', 'assigned_to_id', '5', '6'),
(88, 53, 'attr', 'assigned_to_id', '5', '6'),
(89, 54, 'attr', 'assigned_to_id', '5', '6'),
(90, 55, 'attr', 'assigned_to_id', '5', '6'),
(91, 56, 'attr', 'assigned_to_id', '5', '6'),
(92, 57, 'attr', 'assigned_to_id', '5', '6'),
(93, 58, 'attr', 'status_id', '1', '5'),
(94, 59, 'attr', 'status_id', '3', '5'),
(95, 59, 'attr', 'assigned_to_id', '5', '6'),
(96, 60, 'attr', 'status_id', '3', '5'),
(97, 61, 'attr', 'status_id', '3', '5'),
(98, 61, 'attr', 'assigned_to_id', '5', '6'),
(99, 62, 'attr', 'status_id', '3', '5'),
(100, 63, 'attr', 'status_id', '3', '5'),
(101, 64, 'attr', 'status_id', '3', '5'),
(102, 65, 'attr', 'status_id', '3', '5'),
(103, 66, 'attr', 'status_id', '3', '5'),
(104, 67, 'attr', 'status_id', '3', '5'),
(105, 68, 'attr', 'status_id', '3', '5'),
(106, 69, 'attr', 'status_id', '3', '5'),
(107, 70, 'attr', 'status_id', '3', '5'),
(108, 71, 'attr', 'status_id', '3', '5'),
(109, 72, 'attr', 'status_id', '3', '5'),
(110, 73, 'attr', 'status_id', '1', '4'),
(111, 74, 'attr', 'status_id', '1', '4'),
(112, 74, 'attr', 'done_ratio', '0', '100'),
(113, 75, 'attr', 'status_id', '1', '4'),
(114, 75, 'attr', 'assigned_to_id', '5', '1'),
(115, 76, 'attr', 'status_id', '1', '4'),
(116, 77, 'attr', 'assigned_to_id', '5', '1'),
(117, 78, 'attr', 'assigned_to_id', '1', '6'),
(118, 79, 'attr', 'status_id', '4', '2'),
(119, 80, 'attr', 'status_id', '2', '3'),
(120, 80, 'attr', 'assigned_to_id', '6', '5'),
(121, 81, 'attr', 'assigned_to_id', '5', '1'),
(122, 83, 'attr', 'tracker_id', '2', '4'),
(123, 83, 'attr', 'status_id', '1', '4'),
(124, 84, 'attr', 'tracker_id', '1', '4'),
(125, 84, 'attr', 'status_id', '1', '4'),
(126, 85, 'attr', 'status_id', '4', '2'),
(127, 86, 'attr', 'status_id', '4', '2'),
(128, 87, 'attr', 'status_id', '4', '2'),
(129, 88, 'attr', 'status_id', '4', '2'),
(130, 89, 'attr', 'status_id', '4', '2'),
(131, 90, 'attr', 'status_id', '2', '3'),
(132, 91, 'attr', 'status_id', '2', '3'),
(133, 92, 'attr', 'status_id', '2', '3'),
(134, 93, 'attr', 'status_id', '2', '3'),
(135, 94, 'attr', 'status_id', '2', '3'),
(136, 95, 'attr', 'assigned_to_id', '1', '6'),
(137, 96, 'attr', 'status_id', '1', '2'),
(138, 97, 'attr', 'status_id', '2', '3'),
(139, 98, 'attr', 'status_id', '3', '5'),
(140, 98, 'attr', 'assigned_to_id', '6', '1'),
(141, 99, 'attr', 'status_id', '3', '5'),
(142, 100, 'attr', 'status_id', '3', '5'),
(143, 101, 'attr', 'status_id', '3', '5'),
(144, 102, 'attr', 'status_id', '3', '5'),
(145, 103, 'attr', 'status_id', '3', '5'),
(146, 104, 'attr', 'status_id', '3', '5'),
(147, 105, 'attr', 'done_ratio', '0', '100'),
(148, 106, 'attr', 'done_ratio', '0', '100'),
(149, 107, 'attr', 'done_ratio', '0', '100'),
(150, 108, 'attr', 'done_ratio', '0', '100'),
(151, 109, 'attr', 'done_ratio', '0', '100'),
(152, 110, 'attr', 'done_ratio', '0', '100'),
(153, 111, 'attr', 'done_ratio', '0', '100'),
(154, 112, 'attr', 'done_ratio', '0', '100'),
(155, 113, 'attr', 'done_ratio', '0', '100'),
(156, 114, 'attr', 'done_ratio', '0', '100');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `user_id`, `project_id`, `created_on`, `mail_notification`) VALUES
(4, 1, 3, '2025-12-15 05:38:07', 0),
(5, 5, 3, '2025-12-15 05:38:14', 0),
(6, 6, 3, '2025-12-15 05:38:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_roles`
--

CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_roles`
--

INSERT INTO `member_roles` (`id`, `member_id`, `role_id`, `inherited_from`) VALUES
(13, 4, 3, NULL),
(14, 5, 6, NULL),
(15, 6, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT 0,
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT 0,
  `sticky` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` int(11) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT 0,
  `default_version_id` int(11) DEFAULT NULL,
  `default_assigned_to_id` int(11) DEFAULT NULL,
  `default_issue_query_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `homepage`, `is_public`, `parent_id`, `created_on`, `updated_on`, `identifier`, `status`, `lft`, `rgt`, `inherit_members`, `default_version_id`, `default_assigned_to_id`, `default_issue_query_id`) VALUES
(3, 'DA_NHOM11', 'DA_NHOM 11', '', 1, NULL, '2025-12-15 05:37:45', '2025-12-15 05:37:45', 'da_nhom11', 1, 1, 2, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects_trackers`
--

CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT 0,
  `tracker_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects_trackers`
--

INSERT INTO `projects_trackers` (`project_id`, `tracker_id`) VALUES
(3, 1),
(3, 2),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `column_names` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_criteria` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) DEFAULT 0,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `project_id`, `name`, `filters`, `user_id`, `column_names`, `sort_criteria`, `group_by`, `type`, `visibility`, `options`) VALUES
(1, NULL, 'Issues assigned to me', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nassigned_to_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 0, NULL, '---\n- - priority\n  - desc\n- - updated_on\n  - desc\n', NULL, 'IssueQuery', 2, NULL),
(2, NULL, 'Reported issues', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nauthor_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 0, NULL, '---\n- - updated_on\n  - desc\n', NULL, 'IssueQuery', 2, NULL),
(3, NULL, 'Updated issues', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nupdated_by:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 0, NULL, '---\n- - updated_on\n  - desc\n', NULL, 'IssueQuery', 2, NULL),
(4, NULL, 'Watched issues', '---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nwatcher_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n', 0, NULL, '---\n- - updated_on\n  - desc\n', NULL, 'IssueQuery', 2, NULL),
(5, NULL, 'My projects', '---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - mine\n', 0, NULL, NULL, NULL, 'ProjectQuery', 2, NULL),
(6, NULL, 'My bookmarks', '---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - bookmarks\n', 0, NULL, NULL, NULL, 'ProjectQuery', 2, NULL),
(7, NULL, 'Spent time', '---\nspent_on:\n  :operator: \"*\"\n  :values:\n  - \'\'\nuser_id:\n  :operator: \"=\"\n  :values:\n  - me\n', 0, NULL, '---\n- - spent_on\n  - desc\n', NULL, 'TimeEntryQuery', 2, '---\n:totalable_names:\n- :hours\n');

-- --------------------------------------------------------

--
-- Table structure for table `queries_roles`
--

CREATE TABLE `queries_roles` (
  `query_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repositories`
--

CREATE TABLE `repositories` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `root_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_encoding` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_encoding` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `assignable` tinyint(1) DEFAULT 1,
  `builtin` int(11) NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issues_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `time_entries_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `all_roles_managed` tinyint(1) NOT NULL DEFAULT 1,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `position`, `assignable`, `builtin`, `permissions`, `issues_visibility`, `users_visibility`, `time_entries_visibility`, `all_roles_managed`, `settings`) VALUES
(1, 'Non member', 0, 1, 1, '---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n', 'default', 'all', 'all', 1, NULL),
(2, 'Anonymous', 0, 1, 2, '---\n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n', 'default', 'all', 'all', 1, NULL),
(3, 'Manager', 1, 1, 0, '---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :mention_users\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :view_wiki_page_watchers\n- :add_wiki_page_watchers\n- :delete_wiki_page_watchers\n- :protect_wiki_pages\n- :manage_wiki\n', 'all', 'all', 'all', 1, '---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),
(4, 'Developer', 2, 1, 0, '---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :mention_users\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :view_wiki_page_watchers\n- :add_wiki_page_watchers\n- :delete_wiki_page_watchers\n- :protect_wiki_pages\n- :manage_wiki\n', 'default', 'all', 'all', 1, '---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),
(5, 'Reporter', 3, 1, 0, '---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n', 'default', 'all', 'all', 1, NULL),
(6, 'Tester', 4, 1, 0, '---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :mention_users\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :view_wiki_page_watchers\n- :add_wiki_page_watchers\n- :delete_wiki_page_watchers\n- :protect_wiki_pages\n- :manage_wiki\n', 'default', 'all', 'all', 1, '---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n');

-- --------------------------------------------------------

--
-- Table structure for table `roles_managed_roles`
--

CREATE TABLE `roles_managed_roles` (
  `role_id` int(11) NOT NULL,
  `managed_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('1'),
('10'),
('100'),
('101'),
('102'),
('103'),
('104'),
('105'),
('106'),
('107'),
('108'),
('11'),
('12'),
('13'),
('14'),
('15'),
('16'),
('17'),
('18'),
('19'),
('2'),
('20'),
('20090214190337'),
('20090312172426'),
('20090312194159'),
('20090318181151'),
('20090323224724'),
('20090401221305'),
('20090401231134'),
('20090403001910'),
('20090406161854'),
('20090425161243'),
('20090503121501'),
('20090503121505'),
('20090503121510'),
('20090614091200'),
('20090704172350'),
('20090704172355'),
('20090704172358'),
('20091010093521'),
('20091017212227'),
('20091017212457'),
('20091017212644'),
('20091017212938'),
('20091017213027'),
('20091017213113'),
('20091017213151'),
('20091017213228'),
('20091017213257'),
('20091017213332'),
('20091017213444'),
('20091017213536'),
('20091017213642'),
('20091017213716'),
('20091017213757'),
('20091017213835'),
('20091017213910'),
('20091017214015'),
('20091017214107'),
('20091017214136'),
('20091017214236'),
('20091017214308'),
('20091017214336'),
('20091017214406'),
('20091017214440'),
('20091017214519'),
('20091017214611'),
('20091017214644'),
('20091017214720'),
('20091017214750'),
('20091025163651'),
('20091108092559'),
('20091114105931'),
('20091123212029'),
('20091205124427'),
('20091220183509'),
('20091220183727'),
('20091220184736'),
('20091225164732'),
('20091227112908'),
('20100129193402'),
('20100129193813'),
('20100221100219'),
('20100313132032'),
('20100313171051'),
('20100705164950'),
('20100819172912'),
('20101104182107'),
('20101107130441'),
('20101114115114'),
('20101114115359'),
('20110220160626'),
('20110223180944'),
('20110223180953'),
('20110224000000'),
('20110226120112'),
('20110226120132'),
('20110227125750'),
('20110228000000'),
('20110228000100'),
('20110401192910'),
('20110408103312'),
('20110412065600'),
('20110511000000'),
('20110902000000'),
('20111201201315'),
('20120115143024'),
('20120115143100'),
('20120115143126'),
('20120127174243'),
('20120205111326'),
('20120223110929'),
('20120301153455'),
('20120422150750'),
('20120705074331'),
('20120707064544'),
('20120714122000'),
('20120714122100'),
('20120714122200'),
('20120731164049'),
('20120930112914'),
('20121026002032'),
('20121026003537'),
('20121209123234'),
('20121209123358'),
('20121213084931'),
('20130110122628'),
('20130201184705'),
('20130202090625'),
('20130207175206'),
('20130207181455'),
('20130215073721'),
('20130215111127'),
('20130215111141'),
('20130217094251'),
('20130602092539'),
('20130710182539'),
('20130713104233'),
('20130713111657'),
('20130729070143'),
('20130911193200'),
('20131004113137'),
('20131005100610'),
('20131124175346'),
('20131210180802'),
('20131214094309'),
('20131215104612'),
('20131218183023'),
('20140228130325'),
('20140903143914'),
('20140920094058'),
('20141029181752'),
('20141029181824'),
('20141109112308'),
('20141122124142'),
('20150113194759'),
('20150113211532'),
('20150113213922'),
('20150113213955'),
('20150208105930'),
('20150510083747'),
('20150525103953'),
('20150526183158'),
('20150528084820'),
('20150528092912'),
('20150528093249'),
('20150725112753'),
('20150730122707'),
('20150730122735'),
('20150921204850'),
('20150921210243'),
('20151020182334'),
('20151020182731'),
('20151021184614'),
('20151021185456'),
('20151021190616'),
('20151024082034'),
('20151025072118'),
('20151031095005'),
('20160404080304'),
('20160416072926'),
('20160529063352'),
('20161001122012'),
('20161002133421'),
('20161010081301'),
('20161010081528'),
('20161010081600'),
('20161126094932'),
('20161220091118'),
('20170207050700'),
('20170302015225'),
('20170309214320'),
('20170320051650'),
('20170418090031'),
('20170419144536'),
('20170723112801'),
('20180501132547'),
('20180913072918'),
('20180923082945'),
('20180923091603'),
('20190315094151'),
('20190315102101'),
('20190510070108'),
('20190620135549'),
('20200826153401'),
('20200826153402'),
('20210704125704'),
('20210705111300'),
('20210728131544'),
('20210801145548'),
('20210801211024'),
('20211213122100'),
('20211213122101'),
('20211213122102'),
('20220224194639'),
('21'),
('22'),
('23'),
('24'),
('25'),
('26'),
('27'),
('28'),
('29'),
('3'),
('30'),
('31'),
('32'),
('33'),
('34'),
('35'),
('36'),
('37'),
('38'),
('39'),
('4'),
('40'),
('41'),
('42'),
('43'),
('44'),
('45'),
('46'),
('47'),
('48'),
('49'),
('5'),
('50'),
('51'),
('52'),
('53'),
('54'),
('55'),
('56'),
('57'),
('58'),
('59'),
('6'),
('60'),
('61'),
('62'),
('63'),
('64'),
('65'),
('66'),
('67'),
('68'),
('69'),
('7'),
('70'),
('71'),
('72'),
('73'),
('74'),
('75'),
('76'),
('77'),
('78'),
('79'),
('8'),
('80'),
('81'),
('82'),
('83'),
('84'),
('85'),
('86'),
('87'),
('88'),
('89'),
('9'),
('90'),
('91'),
('92'),
('93'),
('94'),
('95'),
('96'),
('97'),
('98'),
('99');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `updated_on`) VALUES
(1, 'default_projects_tracker_ids', '---\n- \'1\'\n- \'2\'\n- \'3\'\n', '2025-12-10 14:04:28');

-- --------------------------------------------------------

--
-- Table structure for table `time_entries`
--

CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_entries`
--

INSERT INTO `time_entries` (`id`, `project_id`, `author_id`, `user_id`, `issue_id`, `hours`, `comments`, `activity_id`, `spent_on`, `tyear`, `tmonth`, `tweek`, `created_on`, `updated_on`) VALUES
(10, 3, 1, 1, 8, 1, '', 10, '2025-11-17', 2025, 11, 47, '2025-12-15 13:49:41', '2025-12-15 13:51:31'),
(11, 3, 1, 1, 9, 3, '', 10, '2025-11-19', 2025, 11, 47, '2025-12-15 13:51:13', '2025-12-15 13:51:13'),
(12, 3, 1, 1, 10, 4, '', 10, '2025-11-20', 2025, 11, 47, '2025-12-15 13:52:13', '2025-12-15 13:52:13'),
(13, 3, 1, 1, 23, 240, '', 10, '2025-12-15', 2025, 12, 51, '2025-12-15 14:02:40', '2025-12-15 14:02:40'),
(14, 3, 1, 1, 24, 3, '', 10, '2025-12-16', 2025, 12, 51, '2025-12-15 14:04:40', '2025-12-15 14:04:40'),
(15, 3, 6, 6, 11, 3, '', 9, '2025-12-15', 2025, 12, 51, '2025-12-15 16:59:30', '2025-12-15 16:59:30'),
(16, 3, 6, 6, 12, 2, '', 9, '2025-12-15', 2025, 12, 51, '2025-12-15 17:13:49', '2025-12-15 17:13:49'),
(17, 3, 6, 6, 14, 4, '', 9, '2025-12-15', 2025, 12, 51, '2025-12-15 17:19:47', '2025-12-15 17:19:47'),
(18, 3, 6, 6, 26, 4, '', 9, '2025-12-15', 2025, 12, 51, '2025-12-15 17:35:16', '2025-12-15 17:35:16'),
(19, 3, 6, 6, 32, 4, '', 9, '2025-12-15', 2025, 12, 51, '2025-12-15 17:41:31', '2025-12-15 17:41:31'),
(20, 3, 6, 6, 17, 4, '', 9, '2025-12-15', 2025, 12, 51, '2025-12-15 17:43:38', '2025-12-15 17:43:38'),
(21, 3, 6, 6, 33, 4, '', 9, '2025-12-15', 2025, 12, 51, '2025-12-15 17:47:09', '2025-12-15 17:47:09'),
(22, 3, 6, 6, 21, 2.5, '', 9, '2025-12-15', 2025, 12, 51, '2025-12-15 17:49:03', '2025-12-15 17:49:03'),
(23, 3, 6, 6, 27, 3, '', 9, '2025-12-15', 2025, 12, 51, '2025-12-15 17:58:35', '2025-12-15 17:58:35'),
(24, 3, 5, 5, 15, 3, 'test', 11, '2025-12-15', 2025, 12, 51, '2025-12-15 21:10:31', '2025-12-15 21:10:31'),
(25, 3, 5, 5, 13, 3, 'test', 11, '2025-12-15', 2025, 12, 51, '2025-12-15 21:10:50', '2025-12-15 21:10:50'),
(26, 3, 5, 5, 22, 3, 'test', 11, '2025-12-15', 2025, 12, 51, '2025-12-15 21:11:54', '2025-12-15 21:11:54'),
(27, 3, 5, 5, 28, 7, 'test', 11, '2025-12-15', 2025, 12, 51, '2025-12-15 21:12:17', '2025-12-15 21:12:17'),
(28, 3, 5, 5, 29, 3, 'test', 11, '2025-12-15', 2025, 12, 51, '2025-12-15 21:12:41', '2025-12-15 21:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `action` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `updated_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `action`, `value`, `created_on`, `updated_on`) VALUES
(1, 1, 'session', '109cb042b175c35062fe7c63ea6c017c7a87508e', '2025-12-11 12:56:41', '2025-12-11 07:33:38'),
(2, 1, 'feeds', '0c5b85a3b1739127198a783d24b26045f80b6d50', '2025-12-11 12:56:41', '2025-12-11 05:56:41'),
(6, 6, 'feeds', '45915ce7061d081c0bd512a09a1a9c46247abb51', '2025-12-11 15:51:20', '2025-12-11 08:51:20'),
(8, 6, 'session', '2f92f04ee8f74ff0a09ca65206c62daa21a1c8d9', '2025-12-11 15:58:05', '2025-12-11 09:12:47'),
(9, 6, 'session', '64f28fb3b5ed5bc3fddda553bfd2feaeb9bd375f', '2025-12-12 10:06:35', '2025-12-12 03:06:35'),
(10, 1, 'session', 'b1da2e0fd6c36ed41fa105f937d8497b76f1cf68', '2025-12-15 12:35:16', '2025-12-15 07:03:56'),
(19, 1, 'session', '06c19a57d0c1e74e477c883aad1cf8e5aea05017', '2025-12-15 16:35:55', '2025-12-15 09:39:03'),
(20, 6, 'session', 'eab93977b916e0df3dfcb0658031498c6e85a3da', '2025-12-15 16:48:30', '2025-12-15 11:19:35'),
(23, 5, 'feeds', '9e9e6d3bcebe993f26e773d2ddd2f95ef755f2d6', '2025-12-15 21:09:01', '2025-12-15 14:09:01'),
(30, 1, 'session', 'b242574f0d6281f3cc29492ee11ac0f3a4d67494', '2025-12-15 21:21:31', '2025-12-15 14:23:59');

-- --------------------------------------------------------

--
-- Table structure for table `trackers`
--

CREATE TABLE `trackers` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT 1,
  `fields_bits` int(11) DEFAULT 0,
  `default_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trackers`
--

INSERT INTO `trackers` (`id`, `name`, `description`, `position`, `is_in_roadmap`, `fields_bits`, `default_status_id`) VALUES
(1, 'Bug', NULL, 1, 0, 0, 1),
(2, 'Feature', NULL, 2, 1, 0, 1),
(3, 'Support', NULL, 3, 0, 0, 1),
(4, 'Task', 'Task', 4, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hashed_password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_notification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT 0,
  `passwd_changed_on` datetime DEFAULT NULL,
  `twofa_scheme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twofa_totp_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twofa_totp_last_used_at` int(11) DEFAULT NULL,
  `twofa_required` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `hashed_password`, `firstname`, `lastname`, `admin`, `status`, `last_login_on`, `language`, `auth_source_id`, `created_on`, `updated_on`, `type`, `mail_notification`, `salt`, `must_change_passwd`, `passwd_changed_on`, `twofa_scheme`, `twofa_totp_key`, `twofa_totp_last_used_at`, `twofa_required`) VALUES
(1, 'namhang0159', '712d547aa8a64c0dd5c0393427e704472b5eed0f', 'nam', 'Admin', 1, 1, '2025-12-15 21:21:31', 'en', NULL, '2025-12-10 14:03:56', '2025-12-10 14:03:56', 'User', 'all', 'cfa366f37c3219d6329d41db4b4927eb', 0, NULL, NULL, NULL, NULL, 0),
(2, '', '', '', 'Anonymous users', 0, 1, NULL, '', NULL, '2025-12-10 14:04:09', '2025-12-10 14:04:09', 'GroupAnonymous', '', NULL, 0, NULL, NULL, NULL, NULL, 0),
(3, '', '', '', 'Non member users', 0, 1, NULL, '', NULL, '2025-12-10 14:04:09', '2025-12-10 14:04:09', 'GroupNonMember', '', NULL, 0, NULL, NULL, NULL, NULL, 0),
(4, '', '', '', 'Anonymous', 0, 0, NULL, '', NULL, '2025-12-10 14:04:29', '2025-12-10 14:04:29', 'AnonymousUser', 'only_my_events', NULL, 0, NULL, NULL, NULL, NULL, 0),
(5, 'chithinh', '8098372a438aa43b77bc19b53b0c27b337059f2e', 'chi', 'thinh', 0, 1, '2025-12-15 21:15:39', 'en', NULL, '2025-12-11 08:40:36', '2025-12-11 08:41:17', 'User', 'only_my_events', '2fa57d6e2ca6f903949ae44e5972623c', 0, '2025-12-11 15:41:17', NULL, NULL, NULL, 0),
(6, 'trungnguyen', 'cdaa7c8c474a2d961a6035ebd325faeccde7fb62', 'nguyen', 'trung', 0, 1, '2025-12-15 21:20:29', 'en', NULL, '2025-12-11 08:50:52', '2025-12-11 08:50:52', 'User', 'only_my_events', '624fceca5548fd172fa0a11c8319ace8', 0, '2025-12-11 15:50:52', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `others` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide_mail` tinyint(1) DEFAULT 1,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `user_id`, `others`, `hide_mail`, `time_zone`) VALUES
(1, 1, '---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'3,2,1\'\n:gantt_zoom: 2\n:gantt_months: 6\n', 1, ''),
(2, 5, '---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'3\'\n', 1, ''),
(3, 6, '---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'3,1\'\n:gantt_zoom: 2\n:gantt_months: 6\n', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `wiki_page_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `sharing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `project_id`, `name`, `description`, `effective_date`, `created_on`, `updated_on`, `wiki_page_title`, `status`, `sharing`) VALUES
(3, 3, 'v1.0', 'Sprint 1 Hoàn thiện chức năng login, CRUD sản phẩm, quản lý đơn hàng.', '2025-12-14', '2025-12-15 06:05:20', '2025-12-15 06:05:20', '', 'open', 'none'),
(4, 3, 'v1.1', 'Sprint 1 Hoàn thiện chức năng quản lý feedback , quản lý bài viết.', '2026-01-10', '2025-12-15 06:06:21', '2025-12-15 06:06:21', '', 'open', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `watchers`
--

CREATE TABLE `watchers` (
  `id` int(11) NOT NULL,
  `watchable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `watchers`
--

INSERT INTO `watchers` (`id`, `watchable_type`, `watchable_id`, `user_id`) VALUES
(5, 'Issue', 8, 1),
(6, 'Issue', 11, 1),
(7, 'Issue', 12, 1),
(8, 'Issue', 13, 1),
(9, 'Issue', 14, 1),
(10, 'Issue', 15, 1),
(11, 'Issue', 16, 5),
(12, 'Issue', 16, 1),
(13, 'Issue', 17, 1),
(14, 'Issue', 33, 1),
(15, 'Issue', 9, 1),
(16, 'Issue', 10, 6),
(17, 'Issue', 23, 1),
(18, 'Issue', 24, 1),
(19, 'Issue', 11, 6),
(20, 'Issue', 12, 6),
(21, 'Issue', 14, 6),
(22, 'Issue', 26, 6),
(23, 'Issue', 32, 6),
(24, 'Issue', 20, 6),
(25, 'Issue', 17, 6),
(26, 'Issue', 33, 6),
(27, 'Issue', 21, 6),
(28, 'Issue', 27, 6),
(29, 'Issue', 9, 6),
(30, 'Issue', 20, 1),
(31, 'Issue', 26, 1),
(32, 'Issue', 27, 1),
(33, 'Issue', 32, 1),
(34, 'Issue', 21, 1),
(35, 'Issue', 10, 1),
(36, 'Issue', 13, 5),
(37, 'Issue', 15, 5),
(38, 'Issue', 22, 5),
(39, 'Issue', 29, 5),
(40, 'Issue', 16, 6),
(41, 'Issue', 28, 5),
(42, 'Issue', 34, 5),
(43, 'Issue', 22, 1),
(44, 'Issue', 28, 1),
(45, 'Issue', 34, 1),
(46, 'Issue', 29, 1),
(47, 'Issue', 29, 6);

-- --------------------------------------------------------

--
-- Table structure for table `wikis`
--

CREATE TABLE `wikis` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wikis`
--

INSERT INTO `wikis` (`id`, `project_id`, `start_page`, `status`) VALUES
(3, 3, 'Wiki', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_contents`
--

CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_content_versions`
--

CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  `compression` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_pages`
--

CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_redirects`
--

CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirects_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE `workflows` (
  `id` int(11) NOT NULL,
  `tracker_id` int(11) NOT NULL DEFAULT 0,
  `old_status_id` int(11) NOT NULL DEFAULT 0,
  `new_status_id` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `assignee` tinyint(1) NOT NULL DEFAULT 0,
  `author` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workflows`
--

INSERT INTO `workflows` (`id`, `tracker_id`, `old_status_id`, `new_status_id`, `role_id`, `assignee`, `author`, `type`, `field_name`, `rule`) VALUES
(3, 1, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(14, 1, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(17, 1, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(31, 2, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(37, 2, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(44, 2, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(61, 3, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(62, 3, 1, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(63, 3, 1, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(64, 3, 1, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(65, 3, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(66, 3, 2, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(67, 3, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(68, 3, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(69, 3, 2, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(70, 3, 2, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(71, 3, 3, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(72, 3, 3, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(73, 3, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(74, 3, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(75, 3, 3, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(76, 3, 4, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(77, 3, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(78, 3, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(79, 3, 4, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(80, 3, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(81, 3, 5, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(82, 3, 5, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(83, 3, 5, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(84, 3, 5, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(85, 3, 5, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(86, 3, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(87, 3, 6, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(88, 3, 6, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(89, 3, 6, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(90, 3, 6, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(91, 1, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(95, 1, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(99, 1, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(104, 2, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(105, 2, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(106, 2, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(107, 2, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(108, 2, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(109, 2, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(110, 2, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(111, 2, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(112, 2, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(113, 2, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(114, 2, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(115, 2, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(116, 2, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(117, 3, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(118, 3, 1, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(119, 3, 1, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(120, 3, 1, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(121, 3, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(122, 3, 2, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(123, 3, 2, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(124, 3, 3, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(125, 3, 3, 4, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(126, 3, 3, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(127, 3, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(128, 3, 4, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(129, 3, 4, 5, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(130, 1, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(131, 1, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(132, 1, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(133, 1, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(134, 1, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(135, 2, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(136, 2, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(137, 2, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(138, 2, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(139, 2, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(140, 3, 1, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(141, 3, 2, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(142, 3, 3, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(143, 3, 4, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(144, 3, 3, 4, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(177, 1, 10, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(178, 2, 10, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(179, 3, 10, 5, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(180, 1, 4, 10, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(181, 2, 4, 10, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(182, 3, 4, 10, 5, 0, 0, 'WorkflowTransition', NULL, NULL),
(186, 1, 2, 4, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(188, 3, 2, 4, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(191, 3, 2, 5, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(197, 3, 3, 5, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(200, 3, 4, 5, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(212, 3, 10, 5, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(248, 3, 10, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(251, 3, 10, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(252, 4, 1, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(253, 4, 1, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(254, 4, 2, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(255, 4, 2, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(256, 4, 3, 4, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(257, 4, 3, 5, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(258, 4, 4, 2, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(259, 4, 4, 6, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(260, 4, 6, 1, 3, 0, 0, 'WorkflowTransition', NULL, NULL),
(269, 1, 1, 4, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(270, 1, 4, 2, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(271, 4, 1, 4, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(272, 4, 4, 2, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(273, 2, 4, 3, 6, 0, 0, 'WorkflowTransition', NULL, NULL),
(274, 4, 1, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(275, 4, 2, 3, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(276, 4, 4, 2, 4, 0, 0, 'WorkflowTransition', NULL, NULL),
(277, 4, 4, 3, 3, 0, 0, 'WorkflowTransition', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_attachments_on_author_id` (`author_id`),
  ADD KEY `index_attachments_on_created_on` (`created_on`),
  ADD KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`),
  ADD KEY `index_attachments_on_disk_filename` (`disk_filename`);

--
-- Indexes for table `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_auth_sources_on_id_and_type` (`id`,`type`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boards_project_id` (`project_id`),
  ADD KEY `index_boards_on_last_message_id` (`last_message_id`);

--
-- Indexes for table `changes`
--
ALTER TABLE `changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `changesets_changeset_id` (`changeset_id`);

--
-- Indexes for table `changesets`
--
ALTER TABLE `changesets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  ADD KEY `index_changesets_on_user_id` (`user_id`),
  ADD KEY `index_changesets_on_repository_id` (`repository_id`),
  ADD KEY `index_changesets_on_committed_on` (`committed_on`),
  ADD KEY `changesets_repos_scmid` (`repository_id`,`scmid`);

--
-- Indexes for table `changesets_issues`
--
ALTER TABLE `changesets_issues`
  ADD UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`),
  ADD KEY `index_changesets_issues_on_issue_id` (`issue_id`);

--
-- Indexes for table `changeset_parents`
--
ALTER TABLE `changeset_parents`
  ADD KEY `changeset_parents_changeset_ids` (`changeset_id`),
  ADD KEY `changeset_parents_parent_ids` (`parent_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  ADD KEY `index_comments_on_author_id` (`author_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_custom_fields_on_id_and_type` (`id`,`type`);

--
-- Indexes for table `custom_fields_projects`
--
ALTER TABLE `custom_fields_projects`
  ADD UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`);

--
-- Indexes for table `custom_fields_roles`
--
ALTER TABLE `custom_fields_roles`
  ADD UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`);

--
-- Indexes for table `custom_fields_trackers`
--
ALTER TABLE `custom_fields_trackers`
  ADD UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`);

--
-- Indexes for table `custom_field_enumerations`
--
ALTER TABLE `custom_field_enumerations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_values`
--
ALTER TABLE `custom_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_values_customized` (`customized_type`,`customized_id`),
  ADD KEY `index_custom_values_on_custom_field_id` (`custom_field_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_project_id` (`project_id`),
  ADD KEY `index_documents_on_category_id` (`category_id`),
  ADD KEY `index_documents_on_created_on` (`created_on`);

--
-- Indexes for table `email_addresses`
--
ALTER TABLE `email_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_email_addresses_on_user_id` (`user_id`);

--
-- Indexes for table `enabled_modules`
--
ALTER TABLE `enabled_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enabled_modules_project_id` (`project_id`);

--
-- Indexes for table `enumerations`
--
ALTER TABLE `enumerations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_enumerations_on_project_id` (`project_id`),
  ADD KEY `index_enumerations_on_id_and_type` (`id`,`type`);

--
-- Indexes for table `groups_users`
--
ALTER TABLE `groups_users`
  ADD UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_items`
--
ALTER TABLE `import_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_import_items_on_import_id_and_unique_id` (`import_id`,`unique_id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_project_id` (`project_id`),
  ADD KEY `index_issues_on_status_id` (`status_id`),
  ADD KEY `index_issues_on_category_id` (`category_id`),
  ADD KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  ADD KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  ADD KEY `index_issues_on_tracker_id` (`tracker_id`),
  ADD KEY `index_issues_on_priority_id` (`priority_id`),
  ADD KEY `index_issues_on_author_id` (`author_id`),
  ADD KEY `index_issues_on_created_on` (`created_on`),
  ADD KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`),
  ADD KEY `index_issues_on_parent_id` (`parent_id`);

--
-- Indexes for table `issue_categories`
--
ALTER TABLE `issue_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issue_categories_project_id` (`project_id`),
  ADD KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`);

--
-- Indexes for table `issue_relations`
--
ALTER TABLE `issue_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  ADD KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  ADD KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`);

--
-- Indexes for table `issue_statuses`
--
ALTER TABLE `issue_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_issue_statuses_on_position` (`position`),
  ADD KEY `index_issue_statuses_on_is_closed` (`is_closed`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  ADD KEY `index_journals_on_user_id` (`user_id`),
  ADD KEY `index_journals_on_journalized_id` (`journalized_id`),
  ADD KEY `index_journals_on_created_on` (`created_on`);

--
-- Indexes for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_details_journal_id` (`journal_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  ADD KEY `index_members_on_user_id` (`user_id`),
  ADD KEY `index_members_on_project_id` (`project_id`);

--
-- Indexes for table `member_roles`
--
ALTER TABLE `member_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_member_roles_on_member_id` (`member_id`),
  ADD KEY `index_member_roles_on_role_id` (`role_id`),
  ADD KEY `index_member_roles_on_inherited_from` (`inherited_from`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_board_id` (`board_id`),
  ADD KEY `messages_parent_id` (`parent_id`),
  ADD KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  ADD KEY `index_messages_on_author_id` (`author_id`),
  ADD KEY `index_messages_on_created_on` (`created_on`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_project_id` (`project_id`),
  ADD KEY `index_news_on_author_id` (`author_id`),
  ADD KEY `index_news_on_created_on` (`created_on`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_projects_on_lft` (`lft`),
  ADD KEY `index_projects_on_rgt` (`rgt`);

--
-- Indexes for table `projects_trackers`
--
ALTER TABLE `projects_trackers`
  ADD UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  ADD KEY `projects_trackers_project_id` (`project_id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_queries_on_project_id` (`project_id`),
  ADD KEY `index_queries_on_user_id` (`user_id`);

--
-- Indexes for table `queries_roles`
--
ALTER TABLE `queries_roles`
  ADD UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`);

--
-- Indexes for table `repositories`
--
ALTER TABLE `repositories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_repositories_on_project_id` (`project_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_managed_roles`
--
ALTER TABLE `roles_managed_roles`
  ADD UNIQUE KEY `index_roles_managed_roles_on_role_id_and_managed_role_id` (`role_id`,`managed_role_id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_settings_on_name` (`name`);

--
-- Indexes for table `time_entries`
--
ALTER TABLE `time_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_entries_project_id` (`project_id`),
  ADD KEY `time_entries_issue_id` (`issue_id`),
  ADD KEY `index_time_entries_on_activity_id` (`activity_id`),
  ADD KEY `index_time_entries_on_user_id` (`user_id`),
  ADD KEY `index_time_entries_on_created_on` (`created_on`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_value` (`value`),
  ADD KEY `index_tokens_on_user_id` (`user_id`);

--
-- Indexes for table `trackers`
--
ALTER TABLE `trackers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_users_on_id_and_type` (`id`,`type`),
  ADD KEY `index_users_on_auth_source_id` (`auth_source_id`),
  ADD KEY `index_users_on_type` (`type`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_preferences_on_user_id` (`user_id`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `versions_project_id` (`project_id`),
  ADD KEY `index_versions_on_sharing` (`sharing`);

--
-- Indexes for table `watchers`
--
ALTER TABLE `watchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  ADD KEY `index_watchers_on_user_id` (`user_id`),
  ADD KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`);

--
-- Indexes for table `wikis`
--
ALTER TABLE `wikis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wikis_project_id` (`project_id`);

--
-- Indexes for table `wiki_contents`
--
ALTER TABLE `wiki_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_contents_page_id` (`page_id`),
  ADD KEY `index_wiki_contents_on_author_id` (`author_id`);

--
-- Indexes for table `wiki_content_versions`
--
ALTER TABLE `wiki_content_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  ADD KEY `index_wiki_content_versions_on_updated_on` (`updated_on`);

--
-- Indexes for table `wiki_pages`
--
ALTER TABLE `wiki_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  ADD KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  ADD KEY `index_wiki_pages_on_parent_id` (`parent_id`);

--
-- Indexes for table `wiki_redirects`
--
ALTER TABLE `wiki_redirects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  ADD KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`);

--
-- Indexes for table `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  ADD KEY `index_workflows_on_old_status_id` (`old_status_id`),
  ADD KEY `index_workflows_on_role_id` (`role_id`),
  ADD KEY `index_workflows_on_new_status_id` (`new_status_id`),
  ADD KEY `index_workflows_on_tracker_id` (`tracker_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auth_sources`
--
ALTER TABLE `auth_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `changes`
--
ALTER TABLE `changes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `changesets`
--
ALTER TABLE `changesets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_enumerations`
--
ALTER TABLE `custom_field_enumerations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_values`
--
ALTER TABLE `custom_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_addresses`
--
ALTER TABLE `email_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enabled_modules`
--
ALTER TABLE `enabled_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `enumerations`
--
ALTER TABLE `enumerations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `issue_categories`
--
ALTER TABLE `issue_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_relations`
--
ALTER TABLE `issue_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_statuses`
--
ALTER TABLE `issue_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `member_roles`
--
ALTER TABLE `member_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `repositories`
--
ALTER TABLE `repositories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_entries`
--
ALTER TABLE `time_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `trackers`
--
ALTER TABLE `trackers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `versions`
--
ALTER TABLE `versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `watchers`
--
ALTER TABLE `watchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `wikis`
--
ALTER TABLE `wikis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wiki_contents`
--
ALTER TABLE `wiki_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_content_versions`
--
ALTER TABLE `wiki_content_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_pages`
--
ALTER TABLE `wiki_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_redirects`
--
ALTER TABLE `wiki_redirects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
