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
values ('That Bar', ' Maecenas maximus at molestie leo ex non odio', 'store1.jpg'),
       ('Juju bar and grill', 'Etiam eu t quam venenatis tincidunt. Vestibulum', 'photo1.jpg'),
       ('The Rocinante', 'Donec eleifend arcu sit amet malesuada pharetra.', 'store9.jpg'),
       ('Brand canteen', ' Nulla ultrices  quis rhoncus lacus suscipit et.', 'store2.jpg'),
       ('Fionn MacCool', 'Vivamus consequat aliquet m', 'store3.jpg'),
       ('Nuthouse Grill', 'Pellentesque  efficitur, ut molestie est condimentum', 'store4.jpg'),
       ('McCornlands', 'Nullam sit amet nunc imperdie', 'store1.jpg'),
       ('Kickapoo Inn', 'Etiam eu dui sit amet quam venenatis tincidunt. Vestibulum', 'photo1.jpg'),
       ('Capers Cafe Le Bar', ' Maecenas maximus, at molestie leo ex non odio', 'store1.jpg'),
       ('White River Fish Market', ' Nulla ultrices  quis rhoncus lacus suscipit et.', 'photo1.jpg'),
       ('Mai Thai Cuisine', 'Donec eleifend arcu sit amet malesuada pharetra.', 'store3.jpg'),
       ('Faustina', 'Vivamus consequat aliquet m', 'store4.jpg'),
       ('Windjammer Sports Bar', 'Pellentesque bibendum t efficitur, ut molestie est condimentum', 'store5.jpg'),
       ('Kiku Japanese Steakhouse', 'Nullam sit amet nunc imperdie', 'store6.jpg'),
       ('Ponderosa Pines', 'Etiam eu dui sit amet quam venenatis tincidunt. Vestibulum', 'store7.jpg'),
       ('Mountain Village Lounge', 'Nullam sit amet nunc imperdie', 'store8.jpg'),
       ('Brothers Grimm', 'Vivamus consequat aliquet m', 'store9.jpg'),
       ('Rockerfellas', ' Maecenas maximus,     at molestie leo ex non odio', 'store5.jpg'),
       ('Sparta Club Oasis', 'Nullam sit amet nunc imperdie', 'store1.jpg'),
       ('Howling Coyote', ' Nulla ultrices    quis rhoncus lacus suscipit et.', 'store2.jpg'),
       ('Surf Shack', 'Etiam eu dui sit amet quam venenatis tincidunt. Vestibulum', 'store3.jpg'),
       ('Falono Dilo', 'Pellentesque t elit efficitur, ut molestie est condimentum', 'store4.jpg'),
       ('Acniv sana', 'Nullam sit amet nunc imperdie', 'store5.jpg'),
       ('Werok asew', 'Donec eleifend arcu sit amet malesuada pharetra.', 'store6.jpg'),
       ('Amoko saskil', 'Etiam eu dui sit amet quam venenatis tincidunt. Vestibulum', 'store7.jpg'),
       ('Lpoki qwuiop djncl', 'Vivamus consequat aliquet m', 'store8.jpg'),
       ('Surf Shack', 'Nullam sit amet nunc imperdie', 'store9.jpg'),
       ('polish demoik', ' Maecenas maximus,at molestie leo ex non odio', 'store9.jpg'),
       ('qiwyeh axaz', ' Nulla ultrices    quis rhoncus lacus suscipit et.', 'store5.jpg'),
       ('Mad Dogs British Pub', 'Pellentesque bibendum sapien  ut molestie est condimentum', 'photo1.jpg');
