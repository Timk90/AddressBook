
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS user_roles CASCADE;

CREATE TABLE IF NOT EXISTS users
                    (ID SERIAL PRIMARY KEY,
                    name           TEXT    NOT NULL UNIQUE,
                    password       TEXT    NOT NULL,
                    email          TEXT,
                    address        TEXT,
                    phone          TEXT,
                    enabled        SMALLINT NOT NULL DEFAULT '1');

CREATE TABLE IF NOT EXISTS user_roles
                    (ID         SERIAL  PRIMARY KEY ,
                    name        TEXT    NOT NULL,
                    role        TEXT    NOT NULL,
                    FOREIGN KEY (name) REFERENCES users (name));

INSERT INTO users (NAME, password, email, address, phone, enabled)
VALUES ('Timur', '1234timk', 'timk90@mail.ru', 'Russia, Kazan', '89503181629', 1);
INSERT INTO user_roles (NAME, ROLE) VALUES ('Timur', 'ROLE_ADMIN');
INSERT INTO user_roles (NAME, ROLE) VALUES ('Timur', 'ROLE_USER');

INSERT INTO users (NAME, password, email, address, phone, enabled)
VALUES ('Andrew', '1234andrew', 'andrew@mail.ru', 'Russia, Moscow', '890504321629', 1);
INSERT INTO user_roles (NAME, ROLE) VALUES ('Andrew', 'ROLE_ADMIN');

INSERT INTO users (NAME, password, email, address, phone, enabled)
VALUES ('Mateo', '1234mateo', 'mateo@mail.ru', 'Italy, Rome', '13204321629', 1);
INSERT INTO user_roles (NAME, ROLE) VALUES ('Mateo', 'ROLE_USER');

INSERT INTO users (NAME, password, email, address, phone, enabled)
VALUES ('Владимир', '1234вова', 'vovka@mail.ru', 'Россия, Хабаровск', '8784321629', 1);
INSERT INTO user_roles (NAME, ROLE) VALUES ('Владимир', 'ROLE_USER');

INSERT INTO users (NAME, password, email, address, phone, enabled)
VALUES ('Попадыра', '1234индирыч', 'indira@mail.ru', 'Россия, Ленинград', '8939021629', 1);
INSERT INTO user_roles (NAME, ROLE) VALUES ('Владимир', 'ROLE_USER');


