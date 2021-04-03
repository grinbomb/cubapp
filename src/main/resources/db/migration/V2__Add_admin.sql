insert into usr (id, username, password, active, email)
    values (1, 'admin', 'admin666', true, 'testmail@grishagrisha1124553.ru');

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');