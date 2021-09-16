﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.688.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 16.09.2021 09:09:51
-- Server version: 5.7.35
-- Client version: 4.1
--


SET NAMES 'utf8';






INSERT INTO bills_remote.dim_business_items(business_id) VALUES
('Взносы на капитальный ремонт'),
('Вывоз мусора'),
('Оплата интернет-услуг'),
('Оплата телефонных услуг'),
('Отопление'),
('Поставка газа'),
('Поставка горячей воды'),
('Поставка холодной воды'),
('Поставка электричества'),
('Расходы на ведение ОСББ'),
('Уборка территории');






INSERT INTO bills_remote.dim_user_roles(role_id, orderby) VALUES
('Администратор', 3),
('Бухгалтер', 5),
('Главный бухгалтер', 4),
('Директор', 1),
('Персонал', 6),
('Руководитель', 2);







INSERT INTO bills_remote.period_calendar(period_id, start_date, end_date) VALUES
(100, '2021-01-01', '2021-01-31'),
(101, '2021-02-01', '2021-02-28'),
(102, '2021-03-01', '2021-03-31'),
(103, '2021-04-01', '2021-04-30'),
(104, '2021-05-01', '2021-05-31'),
(105, '2021-06-01', '2021-06-30'),
(106, '2021-07-01', '2021-07-30'),
(107, '2021-08-01', '2021-08-31'),
(108, '2021-09-01', '2021-09-30'),
(109, '2021-10-01', '2021-10-31'),
(110, '2021-11-01', '2021-11-30'),
(111, '2021-12-01', '2021-12-31');


INSERT INTO bills_remote.settings(setting_id, s_key, value, required, created_date, created_by, updated_date, updated_by) VALUES
(1, 'theme', 'dark', 1, NULL, NULL, '2021-09-01 18:14:20', 0),
(2, 'round_money', '1.00', 1, '2021-08-31 19:41:56', NULL, '2021-09-01 18:14:20', 0);



INSERT INTO bills_remote.users(user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES
(1, 'Админов Иван', 'admin', 'admin', 'Администратор', 1, NULL, NULL),
(2, 'Башлялкин Сергей', 'boss', 'boss', 'Директор', 1, NULL, NULL),
(6, 'Расчётина Татьяна Игоревна', 'glavbuch', 'glavbuch', 'Главный бухгалтер', 1, NULL, NULL),
(8, 'Мендельсон Абрам Моисеевич', 'znaet', 'znaert', 'Руководитель', 1, NULL, NULL),
(10, 'Скворцова Наталья', 'buch1', 'buch1', 'Бухгалтер', 1, '2021-08-31', NULL),
(14, 'Марков Сергей Валерьевич', 'mark1', 'ssrraa22', 'Главный бухгалтер', 1, '2021-08-28', '2021-08-28'),
(15, 'Ветренный Игорь', 'veter', '111', 'Персонал', 1, '2021-08-29', '2021-08-28'),
(24, 'Малявкин Владимир', 'adm1', 'aaaa', 'Администратор', 1, '2021-08-29', '2021-08-28'),
(25, 'Серенко Сергей', 'adm2', 'adm1', 'Администратор', 1, '2021-08-29', '2021-08-28');