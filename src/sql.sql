
CREATE TABLE `user` (
  `userName` VARCHAR(255) NOT NULL PRIMARY KEY,
  `passWd`   VARCHAR(255) NOT NULL,
  `phone`    VARCHAR(255) DEFAULT NULL,
  `email`    VARCHAR(255) DEFAULT NULL
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8;


CREATE TABLE `contract` (
  `id`                 INT(11) NOT NULL PRIMARY KEY,
  `state`              INT(11)      DEFAULT 0,
  `name`               VARCHAR(255) DEFAULT NULL,
  `userName1`          VARCHAR(255) DEFAULT NULL,
  `userName2`          VARCHAR(255) DEFAULT NULL,
  `engineeringSection` VARCHAR(255) DEFAULT NULL,
  `encodingBudget`     VARCHAR(255) DEFAULT NULL,
  `contractAmount`     VARCHAR(255) DEFAULT NULL,
  `shareAmount`        VARCHAR(255) DEFAULT NULL,
  `shareRatio`         VARCHAR(255) DEFAULT NULL
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8;
ALTER TABLE contract MODIFY id INTEGER AUTO_INCREMENT;
