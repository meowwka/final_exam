use `rating`;
CREATE TABLE `places` (
    `id` INT auto_increment NOT NULL,
    `name` varchar(128) NOT NULL,
    `description` varchar(128) NOT NULL,
    `image` varchar(128) NOT NULL, PRIMARY KEY (`id`)
);

CREATE TABLE `users`
(
    `id`   INT auto_increment NOT NULL,
    `email` varchar(128)       NOT NULL,
    `name` varchar (128) NOT NULL ,
     `login` varchar(128)       NOT NULL,
    `password` varchar(128)       NOT NULL,
    `enabled` boolean NOT NULL default true ,
    `role` varchar (50) NOT NULL default 'USER',
    PRIMARY KEY (`id`),
    UNIQUE INDEX `email_unique` (`email` ASC )
);


insert into `places` (`name`, `description`, `image`)
values ('That Bar', '', 'store1.jpg'),
       ('Juju bar and grill', '', 'photo1.jpg'),
       ('The Rocinante', '', 'store9.jpg'),
       ('Brand canteen', '', 'store2.jpg'),
       ('Fionn MacCool', '', 'store3.jpg'),
       ('Nuthouse Grill', '', 'store4.jpg'),
       ('McCornlands', '', 'store1.jpg'),
       ('Kickapoo Inn', '', 'photo1.jpg'),
       ('Capers Cafe Le Bar', '', 'store1.jpg'),
       ('White River Fish Market', '', 'photo1.jpg'),
       ('Mai Thai Cuisine', '', 'store3.jpg'),
       ('Faustina', '', 'store4.jpg'),
       ('Windjammer Sports Bar', '', 'store5.jpg'),
       ('Kiku Japanese Steakhouse', '', 'store6.jpg'),
       ('Ponderosa Pines', '', 'store7.jpg'),
       ('Mountain Village Lounge', '', 'store8.jpg'),
       ('Brothers Grimm', '', 'store9.jpg'),
       ('Rockerfellas', '', 'store5.jpg'),
       ('Sparta Club Oasis', '', 'store1.jpg'),
       ('Howling Coyote', '', 'store2.jpg'),
       ('Surf Shack', '', 'store3.jpg'),
       ('Falono Dilo', '', 'store4.jpg'),
       ('Acniv sana', '', 'store5.jpg'),
       ('Werok asew', '', 'store6.jpg'),
       ('Amoko saskil', '', 'store7.jpg'),
       ('Lpoki qwuiop djncl', '', 'store8.jpg'),
       ('Surf Shack', '', 'store9.jpg'),
       ('polish demoik', '', 'store9.jpg'),
       ('qiwyeh axaz', '', 'store5.jpg'),
       ('Mad Dogs British Pub', '', 'photo1.jpg');
