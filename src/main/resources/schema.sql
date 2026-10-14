create table if not exists users(
	id bigint generated always as identity primary key,
	name text,
	email text
);