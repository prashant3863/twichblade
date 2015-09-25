CREATE USER twichblade WITH PASSWORD 'password';
CREATE DATABASE twichblade_staging;
GRANT CONNECT ON DATABASE twichblade_staging TO twichblade;
GRANT ALL PRIVILEGES ON DATABASE twichblade_staging TO twichblade;
\connect twichblade_staging
CREATE TABLE user_info ( id serial primary key, username varchar(15), password varchar(14));
CREATE TABLE tweets ( id serial primary key, content varchar(140) not null, date_time TIMESTAMP, user_id int references user_info(id));
CREATE TABLE follow( id serial primary key, follower int references user_info(id), following int);
ALTER TABLE user_info OWNER TO twichblade;
ALTER TABLE tweets OWNER TO twichblade;
ALTER TABLE follow OWNER TO twichblade;
