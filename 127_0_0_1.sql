-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2022 a las 12:47:58
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `weekly_menu`
--
DROP DATABASE IF EXISTS `weekly_menu`;
CREATE DATABASE IF NOT EXISTS `weekly_menu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `weekly_menu`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add recipes', 7, 'add_recipes'),
(26, 'Can change recipes', 7, 'change_recipes'),
(27, 'Can delete recipes', 7, 'delete_recipes'),
(28, 'Can view recipes', 7, 'view_recipes'),
(29, 'Can add recipe', 7, 'add_recipe'),
(30, 'Can change recipe', 7, 'change_recipe'),
(31, 'Can delete recipe', 7, 'delete_recipe'),
(32, 'Can view recipe', 7, 'view_recipe'),
(33, 'Can add menu', 8, 'add_menu'),
(34, 'Can change menu', 8, 'change_menu'),
(35, 'Can delete menu', 8, 'delete_menu'),
(36, 'Can view menu', 8, 'view_menu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$07igfCdy4Ey1RF9uTejLQz$J9SIEfpkyBjOYvzsaM3TIsYOMI8qLyG3g0hxb8JswZY=', '2022-04-04 20:00:20.125647', 1, 'admin', '', '', 'seragonzalez11@misena.edu.co', 1, 1, '2022-04-04 19:59:32.842677');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-04-04 20:02:07.118336', '1', 'recipes object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-04-04 20:07:31.596820', '1', 'Changua', 3, '', 7, 1),
(3, '2022-04-04 20:09:44.887535', '2', 'Changua', 1, '[{\"added\": {}}]', 7, 1),
(4, '2022-04-04 20:10:24.010949', '3', 'Frijoles', 1, '[{\"added\": {}}]', 7, 1),
(5, '2022-04-04 20:10:54.172832', '4', 'Ensalada', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'menu', 'menu'),
(7, 'menu', 'recipe'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-04 19:52:34.924794'),
(2, 'auth', '0001_initial', '2022-04-04 19:52:35.328795'),
(3, 'admin', '0001_initial', '2022-04-04 19:52:35.430795'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-04-04 19:52:35.437796'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-04 19:52:35.443795'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-04-04 19:52:35.487793'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-04-04 19:52:35.549795'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-04-04 19:52:35.562796'),
(9, 'auth', '0004_alter_user_username_opts', '2022-04-04 19:52:35.569795'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-04-04 19:52:35.605796'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-04-04 19:52:35.607794'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-04-04 19:52:35.615795'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-04-04 19:52:35.628794'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-04-04 19:52:35.641797'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-04-04 19:52:35.656795'),
(16, 'auth', '0011_update_proxy_permissions', '2022-04-04 19:52:35.664797'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-04-04 19:52:35.675798'),
(18, 'menu', '0001_initial', '2022-04-04 19:52:35.700796'),
(19, 'menu', '0002_rename_recipe_recipes', '2022-04-04 19:52:35.716796'),
(20, 'sessions', '0001_initial', '2022-04-04 19:52:35.746795'),
(21, 'menu', '0003_rename_recipes_recipe', '2022-04-04 20:08:23.215820'),
(22, 'menu', '0004_alter_recipe_type', '2022-04-05 00:02:46.954370'),
(23, 'menu', '0005_alter_recipe_type', '2022-04-05 00:24:19.250660'),
(24, 'menu', '0006_auto_20220407_0221', '2022-04-07 07:21:44.214611');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('08w0rv2m0btyucllud1zdckcjc1m7qq1', '.eJxVjMsOwiAUBf-FtSGF4gVcuu83ELgPqZo2Ke3K-O_apAvdnpk5L5Xytta0NV7SSOqijDr9biXjg6cd0D1Pt1njPK3LWPSu6IM2PczEz-vh_h3U3Oq3RiwBxIv14MggnEMgtg7BOOpAIPfOgmFgsr2Qd8EXIaI-xo4Fo6j3B-6TOIM:1nbSs8:VAPfiUJaNUGXk2XOiwPAVc9a_h0FNMeJOiQsipua5OM', '2022-04-18 20:00:20.127647');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_menu`
--

CREATE TABLE `menu_menu` (
  `id` int(11) NOT NULL,
  `friday_breakfast_id` int(11) DEFAULT NULL,
  `friday_dinner_id` int(11) DEFAULT NULL,
  `friday_lunch_id` int(11) DEFAULT NULL,
  `monday_breakfast_id` int(11) DEFAULT NULL,
  `monday_dinner_id` int(11) DEFAULT NULL,
  `monday_lunch_id` int(11) DEFAULT NULL,
  `saturday_breakfast_id` int(11) DEFAULT NULL,
  `saturday_dinner_id` int(11) DEFAULT NULL,
  `saturday_lunch_id` int(11) DEFAULT NULL,
  `sunday_breakfast_id` int(11) DEFAULT NULL,
  `sunday_dinner_id` int(11) DEFAULT NULL,
  `sunday_lunch_id` int(11) DEFAULT NULL,
  `thursday_breakfast_id` int(11) DEFAULT NULL,
  `thursday_dinner_id` int(11) DEFAULT NULL,
  `thursday_lunch_id` int(11) DEFAULT NULL,
  `tuesday_breakfast_id` int(11) DEFAULT NULL,
  `tuesday_dinner_id` int(11) DEFAULT NULL,
  `tuesday_lunch_id` int(11) DEFAULT NULL,
  `wednesday_breakfast_id` int(11) DEFAULT NULL,
  `wednesday_dinner_id` int(11) DEFAULT NULL,
  `wednesday_lunch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_recipe`
--

CREATE TABLE `menu_recipe` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `ingredients` longtext DEFAULT NULL,
  `instructions` longtext DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu_recipe`
--

INSERT INTO `menu_recipe` (`id`, `title`, `type`, `ingredients`, `instructions`, `photo`) VALUES
(2, 'Changua', 'Desayuno', 'Leche, Huevo', '1. \r\n2. \r\n3.\r\n4.\r\n5.', 'images/py.jpg'),
(3, 'Frijoles', 'Almuerzo', 'Frijoles, Arroz, Cerdo, Sal', '1. \r\n2. \r\n3.\r\n4.\r\n5.', 'images/bike.jpg'),
(4, 'Torta', 'Almuerzo', 'Lechuga, Tomate, Vinagre', '1. \r\n2. \r\n3.\r\n4.\r\n5.', 'images/Hearthstone_Screenshot_11-17-21_23.32.17.png'),
(6, 'Ensalada', 'Cena', 'Mango, manzana, crema de leche', '1. \r\n2. \r\n3. \r\n4. \r\n5.', 'images/stromae.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `menu_menu`
--
ALTER TABLE `menu_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_menu_friday_breakfast_id_51e5721e_fk_menu_recipe_id` (`friday_breakfast_id`),
  ADD KEY `menu_menu_friday_dinner_id_4d650409_fk_menu_recipe_id` (`friday_dinner_id`),
  ADD KEY `menu_menu_friday_lunch_id_d3ea5e66_fk_menu_recipe_id` (`friday_lunch_id`),
  ADD KEY `menu_menu_monday_breakfast_id_fb78baad_fk_menu_recipe_id` (`monday_breakfast_id`),
  ADD KEY `menu_menu_monday_dinner_id_6ee0b6b3_fk_menu_recipe_id` (`monday_dinner_id`),
  ADD KEY `menu_menu_monday_lunch_id_c8e4aea8_fk_menu_recipe_id` (`monday_lunch_id`),
  ADD KEY `menu_menu_saturday_breakfast_id_4b851e7e_fk_menu_recipe_id` (`saturday_breakfast_id`),
  ADD KEY `menu_menu_saturday_dinner_id_4592abf0_fk_menu_recipe_id` (`saturday_dinner_id`),
  ADD KEY `menu_menu_saturday_lunch_id_7c7e51fd_fk_menu_recipe_id` (`saturday_lunch_id`),
  ADD KEY `menu_menu_sunday_breakfast_id_a4bf61af_fk_menu_recipe_id` (`sunday_breakfast_id`),
  ADD KEY `menu_menu_sunday_dinner_id_d50275cf_fk_menu_recipe_id` (`sunday_dinner_id`),
  ADD KEY `menu_menu_sunday_lunch_id_b7eda052_fk_menu_recipe_id` (`sunday_lunch_id`),
  ADD KEY `menu_menu_thursday_breakfast_id_799e142f_fk_menu_recipe_id` (`thursday_breakfast_id`),
  ADD KEY `menu_menu_thursday_dinner_id_50abc3d8_fk_menu_recipe_id` (`thursday_dinner_id`),
  ADD KEY `menu_menu_thursday_lunch_id_0627f403_fk_menu_recipe_id` (`thursday_lunch_id`),
  ADD KEY `menu_menu_tuesday_breakfast_id_bb8e5d5b_fk_menu_recipe_id` (`tuesday_breakfast_id`),
  ADD KEY `menu_menu_tuesday_dinner_id_72f689d3_fk_menu_recipe_id` (`tuesday_dinner_id`),
  ADD KEY `menu_menu_tuesday_lunch_id_4e53e118_fk_menu_recipe_id` (`tuesday_lunch_id`),
  ADD KEY `menu_menu_wednesday_breakfast_id_88194f4b_fk_menu_recipe_id` (`wednesday_breakfast_id`),
  ADD KEY `menu_menu_wednesday_dinner_id_c448318e_fk_menu_recipe_id` (`wednesday_dinner_id`),
  ADD KEY `menu_menu_wednesday_lunch_id_d7b33a52_fk_menu_recipe_id` (`wednesday_lunch_id`);

--
-- Indices de la tabla `menu_recipe`
--
ALTER TABLE `menu_recipe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `menu_menu`
--
ALTER TABLE `menu_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `menu_recipe`
--
ALTER TABLE `menu_recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `menu_menu`
--
ALTER TABLE `menu_menu`
  ADD CONSTRAINT `menu_menu_friday_breakfast_id_51e5721e_fk_menu_recipe_id` FOREIGN KEY (`friday_breakfast_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_friday_dinner_id_4d650409_fk_menu_recipe_id` FOREIGN KEY (`friday_dinner_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_friday_lunch_id_d3ea5e66_fk_menu_recipe_id` FOREIGN KEY (`friday_lunch_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_monday_breakfast_id_fb78baad_fk_menu_recipe_id` FOREIGN KEY (`monday_breakfast_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_monday_dinner_id_6ee0b6b3_fk_menu_recipe_id` FOREIGN KEY (`monday_dinner_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_monday_lunch_id_c8e4aea8_fk_menu_recipe_id` FOREIGN KEY (`monday_lunch_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_saturday_breakfast_id_4b851e7e_fk_menu_recipe_id` FOREIGN KEY (`saturday_breakfast_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_saturday_dinner_id_4592abf0_fk_menu_recipe_id` FOREIGN KEY (`saturday_dinner_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_saturday_lunch_id_7c7e51fd_fk_menu_recipe_id` FOREIGN KEY (`saturday_lunch_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_sunday_breakfast_id_a4bf61af_fk_menu_recipe_id` FOREIGN KEY (`sunday_breakfast_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_sunday_dinner_id_d50275cf_fk_menu_recipe_id` FOREIGN KEY (`sunday_dinner_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_sunday_lunch_id_b7eda052_fk_menu_recipe_id` FOREIGN KEY (`sunday_lunch_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_thursday_breakfast_id_799e142f_fk_menu_recipe_id` FOREIGN KEY (`thursday_breakfast_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_thursday_dinner_id_50abc3d8_fk_menu_recipe_id` FOREIGN KEY (`thursday_dinner_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_thursday_lunch_id_0627f403_fk_menu_recipe_id` FOREIGN KEY (`thursday_lunch_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_tuesday_breakfast_id_bb8e5d5b_fk_menu_recipe_id` FOREIGN KEY (`tuesday_breakfast_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_tuesday_dinner_id_72f689d3_fk_menu_recipe_id` FOREIGN KEY (`tuesday_dinner_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_tuesday_lunch_id_4e53e118_fk_menu_recipe_id` FOREIGN KEY (`tuesday_lunch_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_wednesday_breakfast_id_88194f4b_fk_menu_recipe_id` FOREIGN KEY (`wednesday_breakfast_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_wednesday_dinner_id_c448318e_fk_menu_recipe_id` FOREIGN KEY (`wednesday_dinner_id`) REFERENCES `menu_recipe` (`id`),
  ADD CONSTRAINT `menu_menu_wednesday_lunch_id_d7b33a52_fk_menu_recipe_id` FOREIGN KEY (`wednesday_lunch_id`) REFERENCES `menu_recipe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
