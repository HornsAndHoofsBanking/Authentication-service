CREATE TABLE `banking`.`account` (
  `id` BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  `user_id` BIGINT(20) NOT NULL);

CREATE TABLE `banking`.`wallet` (
  `acc_id` BIGINT(20) NOT NULL,
  `currency` VARCHAR(255) NOT NULL,
  `amount` DECIMAL(21) ZEROFILL NOT NULL,
  CONSTRAINT pk_founds_item PRIMARY KEY (acc_id, currency));

CREATE TABLE `banking`.`transfer` (
  `id` BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  `from_acc_id` BIGINT(20) NOT NULL,
  `to_acc_id` BIGINT(20) NOT NULL,
  `currency` VARCHAR(255) NOT NULL,
  `amount` DECIMAL(21) NOT NULL);

  CREATE TABLE `banking`.`payment` (
  `id` BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
  `acc_id` BIGINT(20) NOT NULL,
  `currency` VARCHAR(255) NOT NULL,
  `amount` DECIMAL(21) NOT NULL);

CREATE TABLE `banking`.`permission` (
  id int(11) not null auto_increment,
  name varchar(512) default null,
  primary key (id),
  unique key name (name)
);

CREATE TABLE `banking`.`role` (
  id int(11) not null auto_increment,
  name varchar(255) default null,
  primary key (id),
  unique key name (name)
);

CREATE TABLE `banking`.`user` (
  id BIGINT(20) not null auto_increment,
  username varchar(100) not null,
  password varchar(1024) not null,
  email varchar(1024) not null,
  enabled tinyint(4) not null,
  account_non_expired tinyint(4) not null,
  credentials_non_expired tinyint(4) not null,
  account_non_locked tinyint(4) not null,
  primary key (id),
  unique key username (username)
);

CREATE TABLE `banking`.`permission_role` (
  permission_id int(11) default null,
  role_id int(11) default null,
  key permission_id (permission_id),
  key role_id (role_id),
  constraint permission_role_ibfk_1 foreign key (permission_id) references permission (id),
  constraint permission_role_ibfk_2 foreign key (role_id) references role (id)
);

CREATE TABLE `banking`.`role_user` (
  role_id int(11) default null,
  user_id BIGINT(20) default null,
  key role_id (role_id),
  key user_id (user_id),
  constraint role_user_ibfk_1 foreign key (role_id) references role (id),
  constraint role_user_ibfk_2 foreign key (user_id) references user (id)
);

ALTER TABLE `banking`.`account`
  ADD CONSTRAINT `account_user_id_fk`
  FOREIGN KEY (`user_id`)
  REFERENCES `banking`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `banking`.`wallet`
  ADD CONSTRAINT `founds_item_account_id_fk`
  FOREIGN KEY (`acc_id`)
  REFERENCES `banking`.`account` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
