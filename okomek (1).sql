-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Мар 01 2017 г., 06:24
-- Версия сервера: 5.5.25-log
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `okomek`
--

-- --------------------------------------------------------

--
-- Структура таблицы `callback`
--

CREATE TABLE IF NOT EXISTS `callback` (
  `id` int(2) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` int(16) NOT NULL,
  `message` text,
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ok_commentmeta`
--

CREATE TABLE IF NOT EXISTS `ok_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ok_comments`
--

CREATE TABLE IF NOT EXISTS `ok_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ok_links`
--

CREATE TABLE IF NOT EXISTS `ok_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ok_options`
--

CREATE TABLE IF NOT EXISTS `ok_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=509 ;

--
-- Дамп данных таблицы `ok_options`
--

INSERT INTO `ok_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/okomek', 'yes'),
(2, 'home', 'http://localhost/okomek', 'yes'),
(3, 'blogname', 'Oňat Kömek', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'id.murik@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '1', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'M d, Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:2;s:22:"cyr2lat/cyr-to-lat.php";i:3;s:27:"qtranslate-x/qtranslate.php";i:4;s:9:"rh/rh.php";i:5;s:16:"russian-date.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '5', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', 'a:5:{i:0;s:75:"Z:\\home\\localhost\\www\\okomek/wp-content/plugins/woocommerce/woocommerce.php";i:1;s:63:"Z:\\home\\localhost\\www\\okomek/wp-content/themes/okomek/style.css";i:3;s:85:"Z:\\home\\localhost\\www\\okomek/wp-content/plugins/smsc-woocommerce/smsc_woocommerce.php";i:4;s:63:"Z:\\home\\localhost\\www\\okomek/wp-content/themes/okomek/image.php";i:5;s:65:"Z:\\home\\localhost\\www\\okomek/wp-content/themes/okomek/content.php";}', 'no'),
(41, 'template', 'okomek', 'yes'),
(42, 'stylesheet', 'okomek', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '29630', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', '', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:50:"google-analytics-for-wordpress/googleanalytics.php";s:35:"monsterinsights_lite_uninstall_hook";}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '29630', 'yes'),
(89, 'ok_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:132:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:1:{s:4:"read";b:1;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:110:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:3:{s:5:"title";s:38:"[:ru]Новости[:tm]Täzelikler[:]";s:6:"number";i:2;s:9:"show_date";b:1;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:5:{s:18:"orphaned_widgets_1";a:5:{i:0;s:8:"search-2";i:1;s:17:"recent-comments-2";i:2;s:10:"archives-2";i:3;s:12:"categories-2";i:4;s:6:"meta-2";}s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:1:{i:0;s:14:"recent-posts-2";}s:9:"sidebar-2";a:1:{i:0;s:12:"qtranslate-2";}s:13:"array_version";i:3;}', 'yes'),
(96, 'cron', 'a:7:{i:1488337234;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"2937749bdb63b97e582698a4b62671c0";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:57;}}}}i:1488346384;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1488346391;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1488353640;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1488388466;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1488412860;a:1:{s:26:"monsterinsights_daily_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(99, '_transient_random_seed', '8c644ada91e16e33963ca4aa7a11961c', 'yes'),
(104, 'rushelper_nag_count', '10', 'yes'),
(107, '_transient_timeout_plugin_slugs', '1488417102', 'no'),
(108, '_transient_plugin_slugs', 'a:7:{i:0;s:19:"akismet/akismet.php";i:1;s:22:"cyr2lat/cyr-to-lat.php";i:2;s:9:"hello.php";i:3;s:16:"russian-date.php";i:4;s:9:"rh/rh.php";i:5;s:27:"qtranslate-x/qtranslate.php";i:6;s:35:"wp-testimonials/wp-testimonials.php";}', 'no'),
(111, 'can_compress_scripts', '1', 'yes'),
(114, '_transient_twentyfourteen_category_count', '1', 'yes'),
(118, 'theme_mods_twentyfourteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1488089719;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(119, 'current_theme', 'Onat Komek', 'yes'),
(120, 'theme_mods_okomek', 'a:4:{i:0;b:0;s:16:"header_textcolor";s:6:"1e73be";s:12:"header_image";s:13:"remove-header";s:18:"nav_menu_locations";a:1:{s:7:"primary";i:0;}}', 'yes'),
(121, 'theme_switched', '', 'yes'),
(122, 'theme_mods_twentythirteen', 'a:4:{i:0;b:0;s:16:"header_textcolor";s:6:"220e10";s:12:"header_image";s:13:"remove-header";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1488259348;s:4:"data";a:13:{s:19:"wp_inactive_widgets";a:5:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:10:"archives-2";i:3;s:12:"categories-2";i:4;s:6:"meta-2";}s:9:"sidebar-1";a:1:{i:0;s:17:"recent-comments-2";}s:9:"sidebar-2";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:18:"orphaned_widgets_2";a:0:{}s:18:"orphaned_widgets_3";a:0:{}s:18:"orphaned_widgets_4";N;s:18:"orphaned_widgets_5";N;s:18:"orphaned_widgets_6";N;s:18:"orphaned_widgets_7";N;s:18:"orphaned_widgets_8";N;s:18:"orphaned_widgets_9";N;s:19:"orphaned_widgets_10";N;}}}', 'yes'),
(123, 'theme_switched_via_customizer', '', 'yes'),
(124, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(125, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(126, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(127, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(128, 'WPLANG', 'ru_RU', 'yes'),
(136, 'recently_activated', 'a:11:{s:19:"akismet/akismet.php";i:1488330701;s:36:"contact-form-7/wp-contact-form-7.php";i:1488330421;s:38:"request-call-back/request-callback.php";i:1488329637;s:29:"callback-request/callback.php";i:1488329635;s:25:"beget-call/beget-call.php";i:1488324226;s:21:"powr-map/powr-map.php";i:1488320803;s:31:"wp-google-maps/wpGoogleMaps.php";i:1488319327;s:50:"google-analytics-for-wordpress/googleanalytics.php";i:1488317838;s:35:"wp-testimonials/wp-testimonials.php";i:1488273315;s:37:"smsc-woocommerce/smsc_woocommerce.php";i:1488255171;s:27:"woocommerce/woocommerce.php";i:1488195322;}', 'yes'),
(243, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:4:"crop";i:1;}', 'yes'),
(244, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"600";s:6:"height";s:3:"600";s:4:"crop";i:1;}', 'yes'),
(245, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:3:"180";s:6:"height";s:3:"180";s:4:"crop";i:1;}', 'yes'),
(316, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(318, '_transient_wc_count_comments', 'O:8:"stdClass":7:{s:8:"approved";s:1:"1";s:14:"total_comments";i:1;s:3:"all";i:1;s:9:"moderated";i:0;s:4:"spam";i:0;s:5:"trash";i:0;s:12:"post-trashed";i:0;}', 'yes'),
(320, '_transient_timeout_external_ip_address_127.0.0.1', '1488799658', 'no'),
(321, '_transient_external_ip_address_127.0.0.1', '0.0.0.0', 'no'),
(323, '_transient_timeout_geoip_127.0.0.1', '1488799683', 'no'),
(324, '_transient_geoip_127.0.0.1', '', 'no'),
(325, '_transient_timeout_geoip_0.0.0.0', '1488799683', 'no'),
(326, '_transient_geoip_0.0.0.0', '', 'no'),
(334, '_transient_shipping-transient-version', '1488195155', 'yes'),
(335, '_transient_timeout_wc_shipping_method_count_0_1488195155', '1490787155', 'no'),
(336, '_transient_wc_shipping_method_count_0_1488195155', '0', 'no'),
(362, 'sfs_admng', 'update_plugins', 'yes'),
(363, 'sfs_deldata', '', 'yes'),
(364, 'sfs_linktext', 'Еще отзывы', 'yes'),
(365, 'sfs_linkurl', '', 'yes'),
(366, 'sfs_setlimit', '3', 'yes'),
(367, 'sfs_showlink', '', 'yes'),
(368, 'sfs_imgalign', 'alignleft', 'yes'),
(369, 'sfs_sorder', 'testid DESC', 'yes'),
(375, 'sfs_imgmax', '100', 'yes'),
(379, 'qtranslate_admin_notices', 'a:2:{s:15:"initial-install";i:1488268957;s:26:"survey-translation-service";i:1488317448;}', 'yes'),
(380, 'qtranslate_enabled_languages', 'a:2:{i:0;s:2:"ru";i:1;s:2:"tm";}', 'yes'),
(381, 'qtranslate_default_language', 'ru', 'yes'),
(382, 'qtranslate_version_previous', '34680', 'yes'),
(383, 'qtranslate_versions', 'a:4:{i:34680;i:1488260539;s:1:"l";i:1488268957;s:1:"t";i:7365;s:1:"p";i:1488267904;}', 'yes'),
(384, 'qtranslate_admin_config', 'a:7:{s:4:"post";a:4:{s:5:"pages";a:2:{s:8:"post.php";s:0:"";s:12:"post-new.php";s:0:"";}s:7:"anchors";a:1:{s:17:"post-body-content";a:1:{s:5:"where";s:10:"first last";}}s:5:"forms";a:2:{s:4:"post";a:1:{s:6:"fields";a:8:{s:5:"title";a:0:{}s:7:"excerpt";a:0:{}s:18:"attachment_caption";a:0:{}s:14:"attachment_alt";a:0:{}s:13:"view-post-btn";a:1:{s:6:"encode";s:7:"display";}s:14:"wp-editor-area";a:1:{s:6:"jquery";s:15:".wp-editor-area";}s:15:"gallery-caption";a:2:{s:6:"jquery";s:16:".gallery-caption";s:6:"encode";s:4:"none";}s:15:"wp-caption-text";a:2:{s:6:"jquery";s:16:".wp-caption-text";s:6:"encode";s:7:"display";}}}s:14:"wpbody-content";a:1:{s:6:"fields";a:2:{s:7:"wrap-h1";a:2:{s:6:"jquery";s:8:".wrap h1";s:6:"encode";s:7:"display";}s:7:"wrap-h2";a:2:{s:6:"jquery";s:8:".wrap h2";s:6:"encode";s:7:"display";}}}}s:7:"js-exec";a:1:{s:9:"post-exec";a:1:{s:3:"src";s:27:"./admin/js/post-exec.min.js";}}}s:15:"options-general";a:3:{s:14:"preg_delimiter";s:1:"#";s:5:"pages";a:1:{s:19:"options-general.php";s:21:"^(?!.*page=[^=&]+).*$";}s:5:"forms";a:1:{s:7:"options";a:1:{s:6:"fields";a:3:{s:8:"blogname";a:0:{}s:15:"blogdescription";a:0:{}s:10:"head-title";a:2:{s:6:"jquery";s:10:"head title";s:6:"encode";s:7:"display";}}}}}s:7:"widgets";a:4:{s:5:"pages";a:1:{s:11:"widgets.php";s:0:"";}s:7:"anchors";a:1:{s:13:"widgets-right";a:1:{s:5:"where";s:12:"before after";}}s:5:"forms";a:1:{s:13:"widgets-right";a:1:{s:6:"fields";a:3:{s:12:"widget-title";a:1:{s:6:"jquery";s:34:"input[id^=''widget-''][id$=''-title'']";}s:16:"widget-text-text";a:1:{s:6:"jquery";s:41:"textarea[id^=''widget-text-''][id$=''-text'']";}s:15:"in-widget-title";a:2:{s:6:"jquery";s:20:"span.in-widget-title";s:6:"encode";s:7:"display";}}}}s:7:"js-exec";a:1:{s:12:"widgets-exec";a:1:{s:3:"src";s:30:"./admin/js/widgets-exec.min.js";}}}s:8:"edit-tag";a:3:{s:5:"pages";a:2:{s:8:"term.php";s:0:"";s:13:"edit-tags.php";s:11:"action=edit";}s:5:"forms";a:1:{s:7:"edittag";a:1:{s:6:"fields";a:3:{s:4:"name";a:0:{}s:11:"description";a:0:{}s:6:"parent";a:1:{s:6:"encode";s:7:"display";}}}}s:7:"js-exec";a:1:{s:13:"edit-tag-exec";a:1:{s:3:"src";s:31:"./admin/js/edit-tag-exec.min.js";}}}s:9:"edit-tags";a:5:{s:14:"preg_delimiter";s:1:"#";s:5:"pages";a:1:{s:13:"edit-tags.php";s:21:"^(?!.*action=edit).*$";}s:7:"anchors";a:1:{s:12:"posts-filter";a:1:{s:5:"where";s:12:"before after";}}s:5:"forms";a:3:{s:6:"addtag";a:1:{s:6:"fields";a:3:{s:8:"tag-name";a:0:{}s:15:"tag-description";a:0:{}s:6:"parent";a:1:{s:6:"encode";s:7:"display";}}}s:8:"col-left";a:1:{s:6:"fields";a:1:{s:8:"tagcloud";a:2:{s:6:"jquery";s:13:".tagcloud > a";s:6:"encode";s:7:"display";}}}s:8:"the-list";a:1:{s:6:"fields";a:2:{s:9:"row-title";a:2:{s:6:"jquery";s:10:".row-title";s:6:"encode";s:7:"display";}s:11:"description";a:2:{s:6:"jquery";s:12:".description";s:6:"encode";s:7:"display";}}}}s:7:"js-exec";a:1:{s:14:"edit-tags-exec";a:1:{s:3:"src";s:32:"./admin/js/edit-tags-exec.min.js";}}}s:9:"nav-menus";a:4:{s:5:"pages";a:1:{s:13:"nav-menus.php";s:23:"action=edit|menu=\\d+|^$";}s:7:"anchors";a:1:{s:12:"menu-to-edit";a:1:{s:5:"where";s:12:"before after";}}s:5:"forms";a:2:{s:15:"update-nav-menu";a:1:{s:6:"fields";a:5:{s:5:"title";a:1:{s:6:"jquery";s:27:"[id^=edit-menu-item-title-]";}s:10:"attr-title";a:1:{s:6:"jquery";s:32:"[id^=edit-menu-item-attr-title-]";}s:11:"description";a:1:{s:6:"jquery";s:33:"[id^=edit-menu-item-description-]";}s:10:"span.title";a:2:{s:6:"jquery";s:20:"span.menu-item-title";s:6:"encode";s:7:"display";}s:16:"link-to-original";a:2:{s:6:"jquery";s:20:".link-to-original >a";s:6:"encode";s:7:"display";}}}s:14:"side-sortables";a:1:{s:6:"fields";a:2:{s:11:"label.title";a:2:{s:6:"jquery";s:21:"label.menu-item-title";s:6:"encode";s:7:"display";}s:23:"accordion-section-title";a:2:{s:6:"jquery";s:26:"h3.accordion-section-title";s:6:"encode";s:7:"display";}}}}s:7:"js-exec";a:1:{s:14:"nav-menus-exec";a:1:{s:3:"src";s:32:"./admin/js/nav-menus-exec.min.js";}}}s:9:"all-pages";a:1:{s:7:"filters";a:1:{s:4:"text";a:1:{s:11:"admin_title";s:2:"20";}}}}', 'yes'),
(385, 'qtranslate_front_config', 'a:1:{s:9:"all-pages";a:1:{s:7:"filters";a:3:{s:4:"text";a:11:{s:12:"widget_title";s:2:"20";s:11:"widget_text";s:2:"20";s:9:"the_title";s:2:"20";s:20:"category_description";s:2:"20";s:9:"list_cats";s:2:"20";s:16:"wp_dropdown_cats";s:2:"20";s:9:"term_name";s:2:"20";s:18:"get_comment_author";s:2:"20";s:10:"the_author";s:2:"20";s:9:"tml_title";s:2:"20";s:16:"term_description";s:2:"20";}s:4:"term";a:10:{s:7:"cat_row";s:1:"0";s:8:"cat_rows";s:1:"0";s:19:"wp_get_object_terms";s:1:"0";s:16:"single_cat_title";s:1:"0";s:16:"single_tag_title";s:1:"0";s:17:"single_term_title";s:1:"0";s:12:"the_category";s:1:"0";s:8:"get_term";s:1:"0";s:9:"get_terms";s:1:"0";s:12:"get_category";s:1:"0";}s:3:"url";a:16:{s:16:"author_feed_link";s:2:"10";s:11:"author_link";s:2:"10";s:27:"get_comment_author_url_link";s:2:"10";s:23:"post_comments_feed_link";s:2:"10";s:8:"day_link";s:2:"10";s:10:"month_link";s:2:"10";s:9:"year_link";s:2:"10";s:9:"page_link";s:2:"10";s:9:"post_link";s:2:"10";s:13:"category_link";s:2:"10";s:18:"category_feed_link";s:2:"10";s:8:"tag_link";s:2:"10";s:9:"term_link";s:2:"10";s:13:"the_permalink";s:2:"10";s:9:"feed_link";s:2:"10";s:13:"tag_feed_link";s:2:"10";}}}}', 'yes'),
(386, 'qtranslate_next_thanks', '1510465341', 'yes'),
(387, 'qtranslate_next_update_mo', '1488865341', 'yes'),
(388, 'qtranslate_language_names', 'a:1:{s:2:"tm";s:8:"Türkmen";}', 'yes'),
(389, 'qtranslate_locales', 'a:1:{s:2:"tm";s:5:"tm_TM";}', 'yes'),
(390, 'qtranslate_na_messages', 'a:1:{s:2:"tm";s:55:"Sorry, this entry is only available in %LANG:, : and %.";}', 'yes'),
(391, 'qtranslate_date_formats', 'a:1:{s:2:"tm";s:14:"%A %B %e%q, %Y";}', 'yes'),
(392, 'qtranslate_time_formats', 'a:1:{s:2:"tm";s:8:"%I:%M %p";}', 'yes'),
(393, 'qtranslate_flags', 'a:1:{s:2:"tm";s:6:"tm.png";}', 'yes'),
(394, 'qtranslate_header_css', '.qtranxs_flag_ru {background-image: url(http://localhost/okomek/wp-content/plugins/qtranslate-x/flags/ru.png); background-repeat: no-repeat;}\r\n.qtranxs_flag_en {background-image: url(http://localhost/okomek/wp-content/plugins/qtranslate-x/flags/gb.png); background-repeat: no-repeat;}\r\n', 'yes'),
(395, 'qtranslate_ignore_file_types', 'gif,jpg,jpeg,png,svg,pdf,swf,tif,rar,zip,7z,mpg,divx,mpeg,avi,css,js,mp3,mp4,apk', 'yes'),
(396, 'widget_qtranslate', 'a:2:{i:2;a:4:{s:5:"title";s:16:"[:tm]Язык[:]";s:4:"type";s:4:"both";s:10:"widget-css";s:857:".qtranxs_widget ul { margin: 0; }\r\n.qtranxs_widget ul li\r\n{\r\ndisplay: inline; /* horizontal list, use "list-item" or other appropriate value for vertical list */\r\nlist-style-type: none; /* use "initial" or other to enable bullets */\r\nmargin: 0 5px 0 0; /* adjust spacing between items */\r\nopacity: 0.5;\r\n-o-transition: 1s ease opacity;\r\n-moz-transition: 1s ease opacity;\r\n-webkit-transition: 1s ease opacity;\r\ntransition: 1s ease opacity;\r\n}\r\n/* .qtranxs_widget ul li span { margin: 0 5px 0 0; } */ /* other way to control spacing */\r\n.qtranxs_widget ul li.active { opacity: 0.8; }\r\n.qtranxs_widget ul li:hover { opacity: 1; }\r\n.qtranxs_widget img { box-shadow: none; vertical-align: middle; display: initial; }\r\n.qtranxs_flag { height:12px; width:18px; display:block; }\r\n.qtranxs_flag_and_text { padding-left:20px; }\r\n.qtranxs_flag span { display:none; }\r\n";s:10:"hide-title";b:1;}s:12:"_multiwidget";i:1;}', 'yes'),
(411, 'rewrite_rules', 'a:67:{s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(412, 'widget_testimonials', 'a:2:{i:2;a:1:{s:5:"title";s:85:"[:ru]ОТЗЫВЫ НАШИХ КЛИЕНТОВ:[:tm]Müşderilermiziň seslenmeleri[:]";}s:12:"_multiwidget";i:1;}', 'yes'),
(413, 'qtranslate_use_strftime', '2', 'yes'),
(414, 'qtranslate_auto_update_mo', '0', 'yes'),
(417, 'qtranslate_term_name', 'a:1:{s:14:"Новости";a:2:{s:2:"ru";s:14:"Новости";s:2:"tm";s:11:"Täzelikler";}}', 'yes'),
(419, 'category_children', 'a:0:{}', 'yes'),
(432, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1488356368', 'no'),
(433, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>Ошибка RSS</strong>: WP HTTP Error: Could not resolve host: mywordpress.ru; Host not found</p></div><div class="rss-widget"><p><strong>Ошибка RSS</strong>: WP HTTP Error: Could not resolve host: planet.wordpress.org; Host not found</p></div><div class="rss-widget"><ul></ul></div>', 'no'),
(437, 'monsterinsights_over_time', 'a:3:{s:17:"installed_version";s:6:"6.0.11";s:14:"installed_date";i:1488317491;s:13:"installed_pro";b:0;}', 'yes'),
(438, 'monsterinsights_db_version', '6.0.0', 'yes'),
(439, 'monsterinsights_settings_version', '6.0.0', 'yes'),
(440, 'monsterinsights_current_version', '6.0.11', 'yes'),
(441, 'monsterinsights_settings', 'a:23:{s:14:"manual_ua_code";s:0:"";s:26:"track_internal_as_outbound";i:0;s:23:"track_internal_as_label";s:0:"";s:14:"track_outbound";i:1;s:14:"allow_tracking";i:0;s:13:"tracking_mode";s:9:"analytics";s:11:"events_mode";s:2:"js";s:12:"demographics";i:1;s:12:"ignore_users";a:2:{i:0;s:13:"administrator";i:1;s:6:"editor";}s:19:"dashboards_disabled";i:0;s:13:"anonymize_ips";i:0;s:17:"track_download_as";s:5:"event";s:19:"extensions_of_files";s:30:"doc,exe,js,pdf,ppt,tgz,zip,xls";s:18:"subdomain_tracking";s:0:"";s:16:"tag_links_in_rss";i:0;s:12:"allow_anchor";i:0;s:16:"add_allow_linker";i:0;s:25:"enhanced_link_attribution";i:1;s:11:"custom_code";s:0:"";s:10:"debug_mode";i:0;s:14:"anonymous_data";i:0;s:12:"save_setings";a:0:{}s:12:"view_reports";a:0:{}}', 'yes'),
(442, 'monsterinsights_tracking_notice', '1', 'yes'),
(443, '_transient_timeout__monsterinsights_addons', '1488318163', 'no'),
(444, '_transient__monsterinsights_addons', '', 'no'),
(447, 'wpgmza_temp_api', 'AIzaSyChPphumyabdfggISDNBuGOlGVBgEvZnGE', 'yes'),
(448, 'wpgmza_xml_location', '{uploads_dir}/wp-google-maps/', 'yes'),
(449, 'wpgmza_xml_url', '{uploads_url}/wp-google-maps/', 'yes'),
(450, 'wpgmza_db_version', '6.4.03', 'yes'),
(451, 'wpgmaps_current_version', '6.4.03', 'yes'),
(452, 'WPGMZA_OTHER_SETTINGS', 'a:1:{s:27:"wpgmza_settings_marker_pull";s:1:"0";}', 'yes'),
(453, 'wpgmza_stats', 'a:1:{s:14:"settings_basic";a:3:{s:5:"views";i:2;s:13:"last_accessed";s:19:"2017-02-28 22:01:14";s:14:"first_accessed";s:19:"2017-02-28 21:37:52";}}', 'yes'),
(457, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1488330722', 'yes'),
(458, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:100:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"6202";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3806";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3802";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"3335";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2902";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"2627";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:4:"2283";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"2255";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"2174";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"2151";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"2113";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"2078";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"2018";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1973";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1809";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1703";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1680";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1501";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1415";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1326";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1311";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:4:"1181";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:4:"1157";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:4:"1108";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:4:"1046";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:4:"1037";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:4:"1005";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:4:"1001";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"994";}s:10:"responsive";a:3:{s:4:"name";s:10:"responsive";s:4:"slug";s:10:"responsive";s:5:"count";s:3:"980";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"945";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"921";}s:10:"e-commerce";a:3:{s:4:"name";s:10:"e-commerce";s:4:"slug";s:10:"e-commerce";s:5:"count";s:3:"892";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"882";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"881";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"847";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"804";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"804";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"796";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"788";}s:9:"analytics";a:3:{s:4:"name";s:9:"analytics";s:4:"slug";s:9:"analytics";s:5:"count";s:3:"782";}s:6:"slider";a:3:{s:4:"name";s:6:"slider";s:4:"slug";s:6:"slider";s:5:"count";s:3:"780";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"779";}s:4:"form";a:3:{s:4:"name";s:4:"form";s:4:"slug";s:4:"form";s:5:"count";s:3:"767";}s:3:"css";a:3:{s:4:"name";s:3:"CSS";s:4:"slug";s:3:"css";s:5:"count";s:3:"765";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"760";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"750";}s:5:"embed";a:3:{s:4:"name";s:5:"embed";s:4:"slug";s:5:"embed";s:5:"count";s:3:"744";}s:6:"search";a:3:{s:4:"name";s:6:"search";s:4:"slug";s:6:"search";s:5:"count";s:3:"740";}s:6:"custom";a:3:{s:4:"name";s:6:"custom";s:4:"slug";s:6:"custom";s:5:"count";s:3:"734";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"718";}s:4:"menu";a:3:{s:4:"name";s:4:"menu";s:4:"slug";s:4:"menu";s:5:"count";s:3:"664";}s:9:"slideshow";a:3:{s:4:"name";s:9:"slideshow";s:4:"slug";s:9:"slideshow";s:5:"count";s:3:"662";}s:6:"button";a:3:{s:4:"name";s:6:"button";s:4:"slug";s:6:"button";s:5:"count";s:3:"660";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"656";}s:9:"dashboard";a:3:{s:4:"name";s:9:"dashboard";s:4:"slug";s:9:"dashboard";s:5:"count";s:3:"642";}s:5:"theme";a:3:{s:4:"name";s:5:"theme";s:4:"slug";s:5:"theme";s:5:"count";s:3:"642";}s:6:"mobile";a:3:{s:4:"name";s:6:"mobile";s:4:"slug";s:6:"mobile";s:5:"count";s:3:"638";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"629";}s:4:"tags";a:3:{s:4:"name";s:4:"tags";s:4:"slug";s:4:"tags";s:5:"count";s:3:"624";}s:10:"categories";a:3:{s:4:"name";s:10:"categories";s:4:"slug";s:10:"categories";s:5:"count";s:3:"609";}s:10:"statistics";a:3:{s:4:"name";s:10:"statistics";s:4:"slug";s:10:"statistics";s:5:"count";s:3:"608";}s:6:"editor";a:3:{s:4:"name";s:6:"editor";s:4:"slug";s:6:"editor";s:5:"count";s:3:"601";}s:4:"user";a:3:{s:4:"name";s:4:"user";s:4:"slug";s:4:"user";s:5:"count";s:3:"599";}s:3:"ads";a:3:{s:4:"name";s:3:"ads";s:4:"slug";s:3:"ads";s:5:"count";s:3:"596";}s:12:"social-media";a:3:{s:4:"name";s:12:"social media";s:4:"slug";s:12:"social-media";s:5:"count";s:3:"590";}s:5:"users";a:3:{s:4:"name";s:5:"users";s:4:"slug";s:5:"users";s:5:"count";s:3:"577";}s:4:"list";a:3:{s:4:"name";s:4:"list";s:4:"slug";s:4:"list";s:5:"count";s:3:"567";}s:12:"contact-form";a:3:{s:4:"name";s:12:"contact form";s:4:"slug";s:12:"contact-form";s:5:"count";s:3:"566";}s:9:"affiliate";a:3:{s:4:"name";s:9:"affiliate";s:4:"slug";s:9:"affiliate";s:5:"count";s:3:"562";}s:6:"simple";a:3:{s:4:"name";s:6:"simple";s:4:"slug";s:6:"simple";s:5:"count";s:3:"555";}s:9:"marketing";a:3:{s:4:"name";s:9:"marketing";s:4:"slug";s:9:"marketing";s:5:"count";s:3:"555";}s:4:"shop";a:3:{s:4:"name";s:4:"shop";s:4:"slug";s:4:"shop";s:5:"count";s:3:"548";}s:7:"plugins";a:3:{s:4:"name";s:7:"plugins";s:4:"slug";s:7:"plugins";s:5:"count";s:3:"546";}s:9:"multisite";a:3:{s:4:"name";s:9:"multisite";s:4:"slug";s:9:"multisite";s:5:"count";s:3:"543";}s:3:"api";a:3:{s:4:"name";s:3:"api";s:4:"slug";s:3:"api";s:5:"count";s:3:"530";}s:7:"picture";a:3:{s:4:"name";s:7:"picture";s:4:"slug";s:7:"picture";s:5:"count";s:3:"523";}s:7:"contact";a:3:{s:4:"name";s:7:"contact";s:4:"slug";s:7:"contact";s:5:"count";s:3:"517";}s:3:"url";a:3:{s:4:"name";s:3:"url";s:4:"slug";s:3:"url";s:5:"count";s:3:"496";}s:10:"newsletter";a:3:{s:4:"name";s:10:"newsletter";s:4:"slug";s:10:"newsletter";s:5:"count";s:3:"492";}s:10:"navigation";a:3:{s:4:"name";s:10:"navigation";s:4:"slug";s:10:"navigation";s:5:"count";s:3:"475";}s:4:"html";a:3:{s:4:"name";s:4:"html";s:4:"slug";s:4:"html";s:5:"count";s:3:"473";}s:6:"events";a:3:{s:4:"name";s:6:"events";s:4:"slug";s:6:"events";s:5:"count";s:3:"473";}s:8:"pictures";a:3:{s:4:"name";s:8:"pictures";s:4:"slug";s:8:"pictures";s:5:"count";s:3:"467";}s:8:"tracking";a:3:{s:4:"name";s:8:"tracking";s:4:"slug";s:8:"tracking";s:5:"count";s:3:"464";}s:10:"shortcodes";a:3:{s:4:"name";s:10:"shortcodes";s:4:"slug";s:10:"shortcodes";s:5:"count";s:3:"459";}s:8:"calendar";a:3:{s:4:"name";s:8:"calendar";s:4:"slug";s:8:"calendar";s:5:"count";s:3:"452";}s:4:"meta";a:3:{s:4:"name";s:4:"meta";s:4:"slug";s:4:"meta";s:5:"count";s:3:"448";}s:8:"lightbox";a:3:{s:4:"name";s:8:"lightbox";s:4:"slug";s:8:"lightbox";s:5:"count";s:3:"446";}s:11:"advertising";a:3:{s:4:"name";s:11:"advertising";s:4:"slug";s:11:"advertising";s:5:"count";s:3:"445";}s:12:"notification";a:3:{s:4:"name";s:12:"notification";s:4:"slug";s:12:"notification";s:5:"count";s:3:"438";}s:3:"tag";a:3:{s:4:"name";s:3:"tag";s:4:"slug";s:3:"tag";s:5:"count";s:3:"437";}s:9:"thumbnail";a:3:{s:4:"name";s:9:"thumbnail";s:4:"slug";s:9:"thumbnail";s:5:"count";s:3:"436";}s:6:"paypal";a:3:{s:4:"name";s:6:"paypal";s:4:"slug";s:6:"paypal";s:5:"count";s:3:"436";}s:5:"popup";a:3:{s:4:"name";s:5:"popup";s:4:"slug";s:5:"popup";s:5:"count";s:3:"436";}s:6:"upload";a:3:{s:4:"name";s:6:"upload";s:4:"slug";s:6:"upload";s:5:"count";s:3:"431";}s:4:"news";a:3:{s:4:"name";s:4:"News";s:4:"slug";s:4:"news";s:5:"count";s:3:"430";}s:16:"custom-post-type";a:3:{s:4:"name";s:16:"custom post type";s:4:"slug";s:16:"custom-post-type";s:5:"count";s:3:"427";}s:8:"linkedin";a:3:{s:4:"name";s:8:"linkedin";s:4:"slug";s:8:"linkedin";s:5:"count";s:3:"426";}s:7:"sharing";a:3:{s:4:"name";s:7:"sharing";s:4:"slug";s:7:"sharing";s:5:"count";s:3:"423";}}', 'yes'),
(478, 'wpcallback_plugin_option', 'a:29:{s:5:"label";s:29:"ОБРАТНЫЙ ЗВОНОК";s:7:"styling";s:6:"preset";s:6:"colour";s:6:"orange";s:10:"custom_css";s:27:"a.callback-btn-style {\r\n\r\n}";s:7:"classes";s:0:"";s:8:"position";s:4:"none";s:8:"lightbox";s:7:"enabled";s:13:"callback_page";s:2:"53";s:5:"width";s:3:"50%";s:11:"description";s:128:"Оставьте свои контактные данные и мы свяжемся свами в ближайшее время";s:5:"email";s:18:"id.murik@gmail.com";s:6:"target";s:2:"53";s:11:"field_email";s:8:"disabled";s:10:"field_time";s:8:"disabled";s:14:"allowable_from";s:3:"8.5";s:12:"allowable_to";s:4:"19.5";s:13:"field_message";s:8:"optional";s:23:"field_option_label_name";s:6:"Имя";s:29:"field_option_placeholder_name";s:15:"Ваше имя";s:28:"field_option_label_telephone";s:14:"Телефон";s:34:"field_option_placeholder_telephone";s:34:"Ваш номер телефона";s:24:"field_option_label_email";s:5:"Email";s:30:"field_option_placeholder_email";s:12:"Ваш email";s:23:"field_option_label_time";s:25:"Когда звонить";s:29:"field_option_placeholder_time";s:23:"Когда угодно";s:26:"field_option_label_message";s:18:"Сообщение";s:32:"field_option_placeholder_message";s:27:"Ваше сообщение";s:25:"field_option_label_submit";s:18:"Отправить";s:8:"colorbox";s:7:"enabled";}', 'yes'),
(496, '_site_transient_timeout_theme_roots', '1488331834', 'yes'),
(497, '_site_transient_theme_roots', 'a:4:{s:6:"okomek";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(498, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:0:{}s:15:"version_checked";s:3:"4.0";s:12:"last_checked";i:1488330042;}', 'yes'),
(499, '_site_transient_update_plugins', 'O:8:"stdClass":2:{s:12:"last_checked";i:1488330702;s:8:"response";N;}', 'yes'),
(500, '_site_transient_update_themes', 'O:8:"stdClass":1:{s:12:"last_checked";i:1488330688;}', 'yes');

-- --------------------------------------------------------

--
-- Структура таблицы `ok_postmeta`
--

CREATE TABLE IF NOT EXISTS `ok_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=143 ;

--
-- Дамп данных таблицы `ok_postmeta`
--

INSERT INTO `ok_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(123, 60, '_wp_attached_file', '2017/03/Desert.jpg'),
(124, 60, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1024;s:6:"height";i:768;s:4:"file";s:18:"2017/03/Desert.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"Desert-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"Desert-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"Desert-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(125, 59, '_thumbnail_id', '60'),
(126, 59, '_edit_last', '1'),
(129, 59, '_edit_lock', '1488331255:1'),
(130, 62, '_thumbnail_id', '60'),
(131, 62, '_edit_last', '1'),
(134, 62, '_edit_lock', '1488331414:1');

-- --------------------------------------------------------

--
-- Структура таблицы `ok_posts`
--

CREATE TABLE IF NOT EXISTS `ok_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Дамп данных таблицы `ok_posts`
--

INSERT INTO `ok_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(3, 1, '2017-02-26 05:33:11', '0000-00-00 00:00:00', '', 'Авто-черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-02-26 05:33:11', '0000-00-00 00:00:00', '', 0, 'http://localhost/okomek/?p=3', 0, 'post', '', 0),
(5, 1, '2017-02-26 22:14:26', '0000-00-00 00:00:00', '', 'Авто-черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-02-26 22:14:26', '0000-00-00 00:00:00', '', 0, 'http://localhost/okomek/?p=5', 0, 'post', '', 0),
(37, 1, '2017-02-27 16:31:31', '0000-00-00 00:00:00', '', 'Авто-черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-02-27 16:31:31', '0000-00-00 00:00:00', '', 0, 'http://localhost/okomek/?post_type=product&p=37', 0, 'product', '', 0),
(38, 1, '2017-02-27 16:34:48', '0000-00-00 00:00:00', '', 'Авто-черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-02-27 16:34:48', '0000-00-00 00:00:00', '', 0, 'http://localhost/okomek/?post_type=product&p=38', 0, 'product', '', 0),
(39, 1, '2017-02-28 09:15:21', '0000-00-00 00:00:00', '', 'Авто-черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-02-28 09:15:21', '0000-00-00 00:00:00', '', 0, 'http://localhost/okomek/?p=39', 0, 'post', '', 0),
(40, 1, '2017-02-28 09:15:51', '0000-00-00 00:00:00', '', 'Авто-черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-02-28 09:15:51', '0000-00-00 00:00:00', '', 0, 'http://localhost/okomek/?p=40', 0, 'post', '', 0),
(43, 1, '2017-02-28 10:55:50', '0000-00-00 00:00:00', '', 'Авто-черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-02-28 10:55:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/okomek/?p=43', 0, 'post', '', 0),
(44, 1, '2017-02-28 13:03:00', '0000-00-00 00:00:00', '', 'Авто-черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-02-28 13:03:00', '0000-00-00 00:00:00', '', 0, 'http://localhost/okomek/?p=44', 0, 'post', '', 0),
(59, 1, '2017-03-01 06:18:11', '2017-03-01 01:18:11', '[:ru]Строительство предприятия\r\n\r\nGigafactory важно для Tesla не только\r\n\r\nСтроительство предприятия\r\n\r\nGigafactory важно для Tesla не только[:]', '[:ru]Tesla удалось снизить себестоимость  аккумуляторных батарей на 35%[:]', '', 'publish', 'open', 'open', '', 'tesla-udalos-snizit-sebestoimost-akkumulyatornyih-batarey-na-35', '', '', '2017-03-01 06:22:47', '2017-03-01 01:22:47', '', 0, 'http://localhost/okomek/?p=59', 0, 'post', '', 0),
(60, 1, '2017-03-01 06:17:59', '2017-03-01 01:17:59', '', 'Desert', '', 'inherit', 'open', 'open', '', 'desert', '', '', '2017-03-01 06:17:59', '2017-03-01 01:17:59', '', 59, 'http://localhost/okomek/wp-content/uploads/2017/03/Desert.jpg', 0, 'attachment', 'image/jpeg', 0),
(61, 1, '2017-03-01 06:18:11', '2017-03-01 01:18:11', '[:ru]Строительство предприятия Gigafactory важно для Tesla не только[:]', '[:ru]Tesla удалось снизить себестоимость  аккумуляторных батарей на 35%[:]', '', 'inherit', 'open', 'open', '', '59-revision-v1', '', '', '2017-03-01 06:18:11', '2017-03-01 01:18:11', '', 59, 'http://localhost/okomek/59-revision-v1/', 0, 'revision', '', 0),
(62, 1, '2017-03-01 06:19:07', '2017-03-01 01:19:07', '[:ru]Строительство предприятия\r\n\r\nGigafactory важно для Tesla не только\r\n\r\nСтроительство предприятия\r\n\r\nGigafactory важно для Tesla не только[:]', '[:ru]Tesla удалось снизить себестоимость аккумуляторных батарей на 35%[:]', '', 'publish', 'open', 'open', '', 'tesla-udalos-snizit-sebestoimost-akkumulyatornyih-batarey-na-35-2', '', '', '2017-03-01 06:23:31', '2017-03-01 01:23:31', '', 0, 'http://localhost/okomek/?p=62', 0, 'post', '', 0),
(63, 1, '2017-03-01 06:19:07', '2017-03-01 01:19:07', '[:ru]Строительство предприятия Gigafactory важно для Tesla не только[:]', '[:ru]Tesla удалось снизить себестоимость аккумуляторных батарей на 35%[:]', '', 'inherit', 'open', 'open', '', '62-revision-v1', '', '', '2017-03-01 06:19:07', '2017-03-01 01:19:07', '', 62, 'http://localhost/okomek/62-revision-v1/', 0, 'revision', '', 0),
(64, 1, '2017-03-01 06:21:47', '2017-03-01 01:21:47', '[:ru]Строительство предприятия\r\n\r\nGigafactory важно для Tesla не только[:]', '[:ru]Tesla удалось снизить себестоимость аккумуляторных батарей на 35%[:]', '', 'inherit', 'open', 'open', '', '62-revision-v1', '', '', '2017-03-01 06:21:47', '2017-03-01 01:21:47', '', 62, 'http://localhost/okomek/62-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2017-03-01 06:22:20', '2017-03-01 01:22:20', '[:ru]Строительство предприятия\r\n\r\nGigafactory важно для Tesla не только[:]', '[:ru]Tesla удалось снизить себестоимость  аккумуляторных батарей на 35%[:]', '', 'inherit', 'open', 'open', '', '59-revision-v1', '', '', '2017-03-01 06:22:20', '2017-03-01 01:22:20', '', 59, 'http://localhost/okomek/59-revision-v1/', 0, 'revision', '', 0),
(66, 1, '2017-03-01 06:22:47', '2017-03-01 01:22:47', '[:ru]Строительство предприятия\r\n\r\nGigafactory важно для Tesla не только\r\n\r\nСтроительство предприятия\r\n\r\nGigafactory важно для Tesla не только[:]', '[:ru]Tesla удалось снизить себестоимость  аккумуляторных батарей на 35%[:]', '', 'inherit', 'open', 'open', '', '59-revision-v1', '', '', '2017-03-01 06:22:47', '2017-03-01 01:22:47', '', 59, 'http://localhost/okomek/59-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2017-03-01 06:23:31', '2017-03-01 01:23:31', '[:ru]Строительство предприятия\r\n\r\nGigafactory важно для Tesla не только\r\n\r\nСтроительство предприятия\r\n\r\nGigafactory важно для Tesla не только[:]', '[:ru]Tesla удалось снизить себестоимость аккумуляторных батарей на 35%[:]', '', 'inherit', 'open', 'open', '', '62-revision-v1', '', '', '2017-03-01 06:23:31', '2017-03-01 01:23:31', '', 62, 'http://localhost/okomek/62-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ok_terms`
--

CREATE TABLE IF NOT EXISTS `ok_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `ok_terms`
--

INSERT INTO `ok_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(3, 'Полезные советы недели', 'poleznyie-sovetyi-nedeli', 0),
(5, 'post-format-quote', 'post-format-quote', 0),
(6, 'simple', 'simple', 0),
(7, 'grouped', 'grouped', 0),
(8, 'variable', 'variable', 0),
(9, 'external', 'external', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ok_term_relationships`
--

CREATE TABLE IF NOT EXISTS `ok_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ok_term_relationships`
--

INSERT INTO `ok_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(59, 1, 0),
(62, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ok_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `ok_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `ok_term_taxonomy`
--

INSERT INTO `ok_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(3, 3, 'nav_menu', '', 0, 0),
(5, 5, 'post_format', '', 0, 0),
(6, 6, 'product_type', '', 0, 0),
(7, 7, 'product_type', '', 0, 0),
(8, 8, 'product_type', '', 0, 0),
(9, 9, 'product_type', '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ok_testimonials`
--

CREATE TABLE IF NOT EXISTS `ok_testimonials` (
  `testid` int(15) NOT NULL AUTO_INCREMENT,
  `text_short` text,
  `text_full` text,
  `clientname` text,
  `company` text,
  `homepage` text,
  `sfimgurl` text,
  `storder` int(5) NOT NULL,
  PRIMARY KEY (`testid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ok_testimonials`
--

INSERT INTO `ok_testimonials` (`testid`, `text_short`, `text_full`, `clientname`, `company`, `homepage`, `sfimgurl`, `storder`) VALUES
(2, 'Благодарю за оперативную заправку картриджа. Все сделали при мне, плюс в качестве бонуса много чего, полезного рассказали. Спасибо удачи в работе.', 'Благодарю за оперативную заправку картриджа. Все сделали при мне, плюс в качестве бонуса много чего, полезного рассказали. Спасибо удачи в работе.', 'Людмила Петровна', 'Офис менеджер GTN', '', 'http://localhost/okomek/wp-content/themes/okomek/images/fm.png', 0),
(3, 'Благодарю за оперативную заправку картриджа. Все сделали при мне, плюс в качестве бонуса много чего, полезного рассказали. Спасибо удачи в работе.', 'Благодарю за оперативную заправку картриджа. Все сделали при мне, плюс в качестве бонуса много чего, полезного рассказали. Спасибо удачи в работе.', 'Людмила Петровна', 'Офис менеджер GTN', '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ok_usermeta`
--

CREATE TABLE IF NOT EXISTS `ok_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Дамп данных таблицы `ok_usermeta`
--

INSERT INTO `ok_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'light'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'false'),
(10, 1, 'ok_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'ok_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp350_media,wp360_revisions,wp360_locks,wp390_widgets'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:7:{s:64:"b28e2e2925981992b9dbfb9ccc2b0ac5d8147cdd7ae093f543ba4f29b2a1b387";i:1488347629;s:64:"537d6447749c12d1cf546054461a9f73cb3963523da5783ba66ec10e3216a735";i:1488350554;s:64:"3db6ebc6b21f2ee83b02b5b871f4177248c2745a4275d4bdef71b432443c328f";i:1488402859;s:64:"befec11187a501da6d6d6d9f7fbbdf4bc71c83a047f8d106ed5eb3a35996c245";i:1488456902;s:64:"0fe40b6ddca6aeec2c4387e35a7232e48e421ba531094dfb92e15b92b233bcf9";i:1488475473;s:64:"d0dd9d1fac901a8973ed1ce9f25d65ea9ef5445d96dba579fa4502cadd30ccf2";i:1488490183;s:64:"95a924dfad80a75b95ae1c7325f926cc775a729ec43fc57dfd30d0798e75464d";i:1488493573;}'),
(15, 1, 'ok_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'closedpostboxes_post', 'a:0:{}'),
(17, 1, 'metaboxhidden_post', 'a:6:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:10:"postcustom";i:3;s:16:"commentstatusdiv";i:4;s:7:"slugdiv";i:5;s:9:"authordiv";}'),
(18, 1, 'ok_user-settings', 'libraryContent=browse&urlbutton=none&advImgDetails=show&editor=tinymce&editor_expand=off&align=left&mfold=o&hidetb=0&wplink=1'),
(19, 1, 'ok_user-settings-time', '1488192192'),
(20, 1, 'manageedit-postcolumnshidden', 'a:4:{i:0;s:6:"author";i:1;s:10:"categories";i:2;s:0:"";i:3;s:0:"";}'),
(21, 1, 'edit_post_per_page', '8'),
(22, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(23, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(24, 1, 'nav_menu_recently_edited', '3'),
(25, 1, 'meta-box-order_post', 'a:3:{s:4:"side";s:61:"submitdiv,formatdiv,categorydiv,tagsdiv-post_tag,postimagediv";s:6:"normal";s:71:"postexcerpt,trackbacksdiv,postcustom,commentstatusdiv,slugdiv,authordiv";s:8:"advanced";s:0:"";}'),
(26, 1, 'screen_layout_post', '2'),
(27, 1, 'manageedit-shop_ordercolumnshidden', 'a:1:{i:0;s:15:"billing_address";}'),
(28, 1, 'ok_media_library_mode', 'grid'),
(29, 1, 'closedpostboxes_page', 'a:0:{}'),
(30, 1, 'metaboxhidden_page', 'a:4:{i:0;s:10:"postcustom";i:1;s:16:"commentstatusdiv";i:2;s:7:"slugdiv";i:3;s:9:"authordiv";}');

-- --------------------------------------------------------

--
-- Структура таблицы `ok_users`
--

CREATE TABLE IF NOT EXISTS `ok_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ok_users`
--

INSERT INTO `ok_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BonAJBhe3qGDYXFWHoO8LRDbRFyK25/', 'admin', 'id.murik@gmail.com', '', '2017-02-26 05:32:59', '', 0, 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
