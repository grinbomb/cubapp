create sequence hibernate_sequence start 1 increment 1;

create table product_card (
		id int8 not null, 
		caloriespg float4 not null, 
		carbohydratespg float4 not null, 
		fatspg float4 not null, 
		file_name varchar(255) not null, 
		name varchar(255) not null, 
		product_category varchar(255) not null, 
		proteinspg float4 not null, 
		primary key (id)
	);

create table selected_cards (
		id int8 not null, 
		date timestamp, 
		gram int4, 
		meal_time varchar(255), 
		card_id int8, 
		user_id int8, 
		primary key (id)
	);
	
create table user_role (
		user_id int8 not null, 
		roles varchar(255)
	);
	
create table usr (
		id int8 not null, 
		activation_code varchar(255), 
		active boolean not null, 
		email varchar(255), 
		password varchar(255) not null, 
		username varchar(255) not null, 
		primary key (id)
	);
	
alter table if exists selected_cards 
		add constraint selected_cards_card_fk
		foreign key (card_id) references product_card;
	
alter table if exists selected_cards 
		add constraint selected_cards_user_fk
		foreign key (user_id) references usr;
		
alter table if exists user_role 
		add constraint user_role_user_fk
		foreign key (user_id) references usr;