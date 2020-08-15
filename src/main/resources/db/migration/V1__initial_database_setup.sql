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
insert into users (email, name, login, password)
values ('test.gmail.com','test','test123','$2a$10$ANTykbmY7.YXAQef6d4TcucvQlLVSuVvdA79dIlrIkY3VqV4Mj0Lq');
create table images
(
    id         int auto_increment
        primary key,
    image_name varchar(128) null,
    place_id   int          null,
    constraint FKkqggk31j9pr4opo2yyhq1ouoe
        foreign key (place_id) references places (id)
);
create table reviews
(
    id       int auto_increment
        primary key,
    comment  varchar(255) null,
    value    int          null,
    place_id int          null,
    user_id  int          null,
    constraint FKcgy7qjc1r99dp117y9en6lxye
        foreign key (user_id) references users (id),
    constraint FKcnnkvk0h9vrih5xqxef7sv2r6
        foreign key (place_id) references places (id)
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
insert into images (image_name, place_id)
 values ('store9.jpg',1),('store8.jpg',1),('store7.jpg',1),
        ('store6.jpg',2),('store5.jpg',2),('store4.jpg',2),
        ('store4.jpg',3),('store5.jpg',4),('store2.jpg',6);

insert into reviews (comment, value, place_id, user_id)
values ('Good place',5,1,1);

