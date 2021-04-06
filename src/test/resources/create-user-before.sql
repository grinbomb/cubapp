delete from user_role;
delete from usr;

insert into usr(id, username, password, active) values
(1, 'admin', '$2a$08$LNMmmnGq0TkCZ4mAlz7nLugw1EJ.PgdH50QLdXdYsr95NW4cAqgHO', true),
(2, 'testuser', '$2a$08$LNMmmnGq0TkCZ4mAlz7nLugw1EJ.PgdH50QLdXdYsr95NW4cAqgHO', true);

insert into user_role(user_id, roles) values
(1, 'ADMIN'), (1, 'USER'),
(2, 'USER');