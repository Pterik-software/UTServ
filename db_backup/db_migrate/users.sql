﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.688.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 21.09.2021 22:26:05
-- Server version: 8.0.26
-- Client version: 4.1
--


SET NAMES 'utf8';

INSERT INTO xbill.users(user_id, full_name, login, password, role_id, is_active, hiring_date, closure_date, access_to_app) VALUES
(1, 'Начальненко Станислав Игоревич', 'BOSS', '121212', '1', 1, '2021-09-30', NULL, 1),
(2, 'Башлялкин Сергей', 'BOSS0', 'boss', '1', 1, '2021-08-28', NULL, 1),
(6, 'Расчётина Татьяна Игоревна', 'GLAVBUCH', 'glavbuch1', '5', 1, '2021-08-28', NULL, 1),
(8, 'Мендельсон Абрам Моисеевич', 'ZNAET2', 'znaert2', '2', 1, '2021-08-28', NULL, 1),
(10, 'Скворцова Наталья', 'BUCH12', 'buch122', '5', 1, '2021-08-31', NULL, 1),
(14, 'Марков Сергей Валерьевич', 'MARK', 'ssrraa222', '5', 1, '2021-08-28', NULL, 1),
(15, 'Ветренный Игорь', 'VETER2', '111', '6', 0, '2021-08-29', '2021-09-21', 1),
(24, 'Малявкин Владимир', 'ADM2', 'aaaa', '5', 0, '2021-08-29', '2021-09-21', 1),
(25, 'Серенко Сергей', 'ADM4', 'adm1', '3', 1, '2021-08-29', NULL, 1),
(26, 'Чмаркин Олег', '4MO', '1111', '2', 1, '2001-01-20', NULL, 1),
(27, 'Серяковский Сергей Васильевич', 'BOSS2', '123', '1', 1, '2021-09-18', NULL, 1),
(28, 'Сидоров Василий', 'SIDR', '123', '6', 1, '2021-09-18', NULL, 1),
(31, 'Молекула Евгений', '', '', '6', 1, '2021-06-30', NULL, 0),
(32, 'Лежебока', '', '', '2', 1, '2021-09-20', NULL, 0),
(33, 'Ветренко Мария', '', '', '6', 1, '2021-09-21', NULL, 0),
(34, 'Петрова Анна Ивановна', 'ANNA1', '111', '6', 1, '2021-09-07', NULL, 1);