-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.0
-- Время создания: Май 04 2025 г., 12:02
-- Версия сервера: 8.0.41
-- Версия PHP: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order` int DEFAULT '0',
  `parent_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `title`, `url`, `order`, `parent_id`, `created_at`) VALUES
(1, 'Home', '/', 1, NULL, '2025-05-01 08:03:08'),
(2, 'About', '/about', 2, NULL, '2025-05-01 08:03:08'),
(3, 'Services', '/services', 3, NULL, '2025-05-01 08:03:08'),
(4, 'Contact', '/contact', 4, NULL, '2025-05-01 08:03:08'),
(5, 'Web Design', '/services/web-design', 1, 3, '2025-05-01 08:03:08'),
(6, 'Development', '/services/development', 2, 3, '2025-05-01 08:03:08');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_item_section`
--

CREATE TABLE `menu_item_section` (
  `menu_item_id` int NOT NULL,
  `section_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `menu_item_section`
--

INSERT INTO `menu_item_section` (`menu_item_id`, `section_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(4, 2),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sections`
--

CREATE TABLE `sections` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sections`
--

INSERT INTO `sections` (`id`, `title`, `created_at`) VALUES
(1, 'Main menu', '2025-05-01 08:03:08'),
(2, 'Footer', '2025-05-01 08:03:08'),
(3, 'Sidebar', '2025-05-01 08:03:08');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `menu_item_section`
--
ALTER TABLE `menu_item_section`
  ADD PRIMARY KEY (`menu_item_id`,`section_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Индексы таблицы `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_item_section`
--
ALTER TABLE `menu_item_section`
  ADD CONSTRAINT `menu_item_section_ibfk_1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_item_section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
