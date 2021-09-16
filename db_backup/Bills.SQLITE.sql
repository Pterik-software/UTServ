--SQLite Maestro 21.5.0.1
------------------------------------------
--Host     : localhost
--Database : D:\Projects\GitHub\UTServ\SQLite\Bills.SQLITE


CREATE TABLE accounts (
  account_id      integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  payer_id        integer NOT NULL,
  account_amount  numeric(15,4) NOT NULL
);

CREATE TABLE address_types (
  address_type  varchar(100) NOT NULL,
  /* Keys */
  PRIMARY KEY (address_type)
);

CREATE TABLE addresses (
  address_id       bigint NOT NULL,
  address_type_id  varchar(100),
  location         varchar(200) NOT NULL,
  /* Keys */
  PRIMARY KEY (address_id),
  /* Foreign keys */
  CONSTRAINT FK_address_type_
    FOREIGN KEY (address_type_id)
    REFERENCES address_types(address_type)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE INDEX FK_address_type_
  ON addresses
  (address_type_id);

CREATE TABLE agreements (
  agrement_id       bigint NOT NULL,
  agreement_header  varchar(255),
  payer_id          integer,
  can_be_published  smallint,
  /* Keys */
  PRIMARY KEY (agrement_id)
);

CREATE TABLE bills (
  bill_id            integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  payer_id           integer,
  period_id          integer,
  bill_amount        numeric(15,4),
  credit_account_id  integer,
  debet_account_id   integer,
  payment_date       datetime,
  payment_status     char(1)
);

CREATE TABLE business_items (
  business_id  varchar(50) NOT NULL,
  /* Keys */
  PRIMARY KEY (business_id)
);

CREATE TABLE calendar (
  calendar_id       integer NOT NULL,
  c_date            datetime NOT NULL,
  c_day_of_month    smallint NOT NULL,
  c_is_work_day     smallint NOT NULL,
  c_month           smallint NOT NULL,
  c_year            smallint NOT NULL,
  c_quater          smallint NOT NULL,
  c_day_of_week     smallint NOT NULL,
  c_reason_day_off  varchar(100),
  c_week_of_year    smallint,
  c_day_of_year     smallint
);

CREATE UNIQUE INDEX calendar_dates
  ON calendar
  (c_date);

CREATE TABLE message_types (
  message_type  varchar(50) NOT NULL,
  /* Keys */
  PRIMARY KEY (message_type)
);

CREATE TABLE messages (
  message_id    integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  payer_id      integer,
  message_type  varchar(50),
  message_text  text,
  send_date     datetime,
  updated       datetime,
  updated_by    varchar(255)
);

CREATE TABLE objects (
  object_id          bigint NOT NULL,
  house_address      varchar(255),
  location           varchar(255),
  payer_id           integer NOT NULL,
  apartment_number   integer,
  apartment_code     varchar(50),
  front_door_number  integer,
  front_door_code    varchar(50),
  /* Keys */
  PRIMARY KEY (object_id)
);

CREATE TABLE payers (
  payer_id             bigint NOT NULL,
  full_name            varchar(255),
  telephon_number      varchar(255),
  old_telephon_number  varchar(255),
  email                varchar(50),
  bank_filter_id       integer,
  agreement_id         integer,
  billing_address      varchar(255),
  /* Keys */
  PRIMARY KEY (payer_id)
);

CREATE TABLE payment_statuses (
  status              char(1) NOT NULL,
  status_description  varchar(255) NOT NULL,
  /* Keys */
  PRIMARY KEY (status)
);

CREATE TABLE payment_transactions (
  payment_id      integer NOT NULL,
  transaction_id  integer NOT NULL,
  created_date    datetime NOT NULL,
  created_by      integer NOT NULL,
  updated_date    datetime,
  updated_by      integer
);

CREATE TABLE payment_types (
  payment_type_id  varchar(255) NOT NULL,
  /* Keys */
  PRIMARY KEY (payment_type_id)
);

CREATE TABLE payments (
  payment_id                  bigint NOT NULL,
  payer_id                    integer NOT NULL,
  amount                      float(14,4) NOT NULL,
  payment_date                date NOT NULL,
  bank_statements_date        date,
  bank_statement_description  text,
  payment_status              char(1) NOT NULL,
  payment_type_id             varchar(255) NOT NULL,
  bank_statements_number      integer,
  is_cancelled                smallint NOT NULL DEFAULT 0,
  created_by                  integer,
  created_date                datetime,
  updated_by                  integer,
  updated_date                datetime,
  /* Keys */
  PRIMARY KEY (payment_id)
);

CREATE TABLE period_calendar (
  period_id   bigint NOT NULL,
  start_date  date NOT NULL,
  end_date    date NOT NULL,
  /* Keys */
  PRIMARY KEY (period_id)
);

CREATE TABLE settings (
  setting_id    rowid,
  "key"         varchar(255),
  value         varchar(255),
  required      smallint NOT NULL,
  created_date  datetime DEFAULT CURRENT_TIMESTAMP,
  created_by    integer,
  updated_date  datetime,
  updated_by    integer,
  /* Keys */
  PRIMARY KEY ("key")
);

CREATE TRIGGER settings_created_date
  BEFORE INSERT
  ON settings
BEGIN
  SELECT 
  CASE WHEN (NEW.CREATED_DATE IS NULL) 
  THEN NEW.CREATED_DATE = CURRENT_TIMESTAMP
  END;
END;

CREATE TRIGGER settings_updated_date
  BEFORE UPDATE
  ON settings
BEGIN
    SELECT 
  CASE WHEN NEW.UPDATED_DATE IS NULL 
  THEN NEW.UPDATED_DATE = CURRENT_TIMESTAMP
  END;
END;

CREATE TABLE transactions (
  transaction_id  bigint NOT NULL,
  payment_id      integer,
  account_id      integer,
  amount          numeric(14,4),
  created_date    datetime,
  created_by      integer,
  updated_date    datetime,
  updated_by      integer,
  is_cancelled    smallint NOT NULL DEFAULT 0,
  /* Keys */
  PRIMARY KEY (transaction_id)
);

CREATE TABLE user_roles (
  role_id  varchar(50) NOT NULL,
  orderby  integer NOT NULL DEFAULT 0,
  /* Keys */
  PRIMARY KEY (role_id)
);

CREATE TABLE users (
  user_id       integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  full_name     varchar(255) NOT NULL,
  user          varchar(255) NOT NULL,
  password      varchar(255) NOT NULL,
  role_id       varchar(255) NOT NULL,
  is_active     smallint NOT NULL DEFAULT 1,
  hiring_date   date,
  closure_date  date,
  /* Foreign keys */
  CONSTRAINT FK_users_role_id
    FOREIGN KEY (role_id)
    REFERENCES user_roles(role_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE INDEX FK_users_role_id
  ON users
  (role_id);

/* Data for table accounts */




/* Data for table address_types */
INSERT INTO address_types (address_type) VALUES ('Физический адрес регистрации плательщика');
INSERT INTO address_types (address_type) VALUES ('Юридический адрес получателя (ОСББ)');
INSERT INTO address_types (address_type) VALUES ('Адрес плательщика для переписки');
INSERT INTO address_types (address_type) VALUES ('Номер плательщика в Telegram');
INSERT INTO address_types (address_type) VALUES ('Номер плательщика в Viber');
INSERT INTO address_types (address_type) VALUES ('Номер плательщика Whatsapp');
INSERT INTO address_types (address_type) VALUES ('Электронная почта плательщика');
INSERT INTO address_types (address_type) VALUES ('Адрес объекта для оплаты');
INSERT INTO address_types (address_type) VALUES ('Номер телефона плательщика');



/* Data for table addresses */




/* Data for table agreements */




/* Data for table bills */




/* Data for table business_items */
INSERT INTO business_items (business_id) VALUES ('Отопление');
INSERT INTO business_items (business_id) VALUES ('Поставка электричества');
INSERT INTO business_items (business_id) VALUES ('Поставка горячей воды');
INSERT INTO business_items (business_id) VALUES ('Поставка холодной воды');
INSERT INTO business_items (business_id) VALUES ('Вывоз мусора');
INSERT INTO business_items (business_id) VALUES ('Поставка газа');
INSERT INTO business_items (business_id) VALUES ('Уборка территории');
INSERT INTO business_items (business_id) VALUES ('Взносы на капитальный ремонт');
INSERT INTO business_items (business_id) VALUES ('Оплата интернет-услуг');
INSERT INTO business_items (business_id) VALUES ('Оплата телефонных услуг');
INSERT INTO business_items (business_id) VALUES ('Расходы на ведение ОСББ');



/* Data for table calendar */




/* Data for table message_types */
INSERT INTO message_types (message_type) VALUES ('Почтовое с уведомлением');
INSERT INTO message_types (message_type) VALUES ('Почтовое сообщение');
INSERT INTO message_types (message_type) VALUES ('Сообщение в Telegram');
INSERT INTO message_types (message_type) VALUES ('Сообщение в Viber');
INSERT INTO message_types (message_type) VALUES ('Сообщение по email');
INSERT INTO message_types (message_type) VALUES ('Требование об оплате');
INSERT INTO message_types (message_type) VALUES ('Тяжелое требование при задолженности');



/* Data for table messages */




/* Data for table objects */




/* Data for table payers */




/* Data for table payment_statuses */




/* Data for table payment_transactions */




/* Data for table payment_types */
INSERT INTO payment_types (payment_type_id) VALUES ('Каждую неделю');
INSERT INTO payment_types (payment_type_id) VALUES ('Каждый год');
INSERT INTO payment_types (payment_type_id) VALUES ('Каждый квартал');
INSERT INTO payment_types (payment_type_id) VALUES ('Каждый месяц');



/* Data for table payments */




/* Data for table period_calendar */
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (100, '2021-01-01', '2021-01-31');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (101, '2021-02-01', '2021-02-28');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (102, '2021-03-01', '2021-03-31');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (103, '2021-04-01', '2021-04-30');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (104, '2021-05-01', '2021-05-31');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (105, '2021-06-01', '2021-06-30');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (106, '2021-07-01', '2021-07-30');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (107, '2021-08-01', '2021-08-31');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (108, '2021-09-01', '2021-09-30');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (109, '2021-10-01', '2021-10-31');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (110, '2021-11-01', '2021-11-30');
INSERT INTO period_calendar (period_id, start_date, end_date) VALUES (111, '2021-12-01', '2021-12-31');



/* Data for table settings */
INSERT INTO settings (setting_id, "key", value, required, created_date, created_by, updated_date, updated_by) VALUES (NULL, 'theme', 'dark', 1, NULL, NULL, '2021-09-01 18:14:20', 0);
INSERT INTO settings (setting_id, "key", value, required, created_date, created_by, updated_date, updated_by) VALUES (NULL, 'round_money', '1.00', 1, '2021-08-31 19:41:56', NULL, '2021-09-01 18:14:20', 0);



/* Data for table transactions */




/* Data for table user_roles */
INSERT INTO user_roles (role_id, orderby) VALUES ('Администратор', 3);
INSERT INTO user_roles (role_id, orderby) VALUES ('Бухгалтер', 5);
INSERT INTO user_roles (role_id, orderby) VALUES ('Главный бухгалтер', 4);
INSERT INTO user_roles (role_id, orderby) VALUES ('Директор', 1);
INSERT INTO user_roles (role_id, orderby) VALUES ('Руководитель', 2);
INSERT INTO user_roles (role_id, orderby) VALUES ('Персонал', 6);



/* Data for table users */
INSERT INTO users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES (1, 'Админов Иван', 'admin', 'admin', 'Администратор', 1, NULL, NULL);
INSERT INTO users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES (2, 'Башлялкин Сергей', 'boss', 'boss', 'Директор', 1, NULL, NULL);
INSERT INTO users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES (6, 'Расчётина Татьяна Игоревна', 'glavbuch', 'glavbuch', 'Главный бухгалтер', 1, NULL, NULL);
INSERT INTO users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES (8, 'Мендельсон Абрам Моисеевич', 'znaet', 'znaert', 'Руководитель', 1, NULL, NULL);
INSERT INTO users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES (10, 'Скворцова Наталья', 'buch1', 'buch1', 'Бухгалтер', 1, '2021-08-31', NULL);
INSERT INTO users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES (14, 'Марков Сергей Валерьевич', 'mark1', 'ssrraa22', 'Главный бухгалтер', 1, '2021-08-28', '2021-08-28');
INSERT INTO users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES (15, 'Ветренный Игорь', 'veter', '111', 'Персонал', 1, '2021-08-29', '2021-08-28');
INSERT INTO users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES (24, 'Малявкин Владимир', 'adm1', 'aaaa', 'Администратор', 1, '2021-08-29', '2021-08-28');
INSERT INTO users (user_id, full_name, user, password, role_id, is_active, hiring_date, closure_date) VALUES (25, 'Серенко Сергей', 'adm2', 'adm1', 'Администратор', 1, '2021-08-29', '2021-08-28');

