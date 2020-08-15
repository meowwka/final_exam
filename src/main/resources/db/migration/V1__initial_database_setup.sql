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
