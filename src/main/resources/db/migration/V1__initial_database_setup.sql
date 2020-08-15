use `rating`;
CREATE TABLE `places` (
    `id` INT auto_increment NOT NULL,
    `name` varchar(128) NOT NULL,
    `address` varchar(128) NOT NULL,
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


insert into `places` (`name`, `address`, `image`)
values ('That Bar', '', 'store1.jpg'),
       ('Juju bar and grill', '', 'photo1.jpg'),
       ('The Rocinante', '', 'photo1.jpg'),
       ('Brand canteen', '', 'store2.jpg'),
       ('Fionn MacCool', '', 'store3.jpg'),
       ('Nuthouse Grill', '', 'store4.jpg'),
       ('McCornlands', '', 'store1.jpg'),
       ('Kickapoo Inn', '', 'photo1.jpg'),
       ('Capers Cafe Le Bar', '', 'store1.jpg'),
       ('White River Fish Market', '', 'store4.jpg'),
       ('Mai Thai Cuisine', '', 'store3.jpg'),
       ('Faustina', '', ''),
       ('Windjammer Sports Bar', '', ''),
       ('Kiku Japanese Steakhouse', '', ''),
       ('Ponderosa Pines', '', ''),
       ('Mountain Village Lounge', '', ''),
       ('Brothers Grimm', '', ''),
       ('Rockerfellas', '', ''),
       ('Sparta Club Oasis', '', ''),
       ('Howling Coyote', '', ''),
       ('Surf Shack', '', ''),
       ('Falono Dilo', '', ''),
       ('Acniv sana', '', ''),
       ('Werok asew', '', ''),
       ('Amoko saskil', '', ''),
       ('Lpoki qwuiop djncl', '', ''),
       ('Surf Shack', '', ''),
       ('polish demoik', '', ''),
       ('qiwyeh axaz', '', ''),
       ('Qwerto azwer', '', ''),
       ('Elevens home', '', ''),
       ('Surf Shack', '', ''),
       ('Mad Dogs British Pub', '', '');
