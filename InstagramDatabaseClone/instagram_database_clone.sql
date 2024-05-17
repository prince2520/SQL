-- create database
CREATE DATABASE instagram_database;

-- use database
use instagram_database;

-- select database
select DATABASE();

-- create user schema ( table )
create table users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- create photos schema ( table )
create table photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

-- create comments schema ( table )
create table comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
);

-- create likes schema ( table )
create table likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (photo_id) REFERENCES photos (id),
    PRIMARY KEY (user_id, photo_id)
);

-- create follows schema ( table )
create table follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followee_id) REFERENCES users (id),
    PRIMARY KEY (follower_id, followee_id)
);

-- create tags schema ( table )
create table tags (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- create photo_tags schema ( table )
create table photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (photo_id) REFERENCES photos (id),
    FOREIGN KEY (tag_id) REFERENCES tags (id),
    PRIMARY KEY (photo_id, tag_id)
);

-- instagram challenge - 1
select * from users order by created_at LIMIT 5;

-- instagram challenge - 2
select count(*) as no_user_register, DAYNAME(created_at) as day
from users
group by
    day
ORDER BY no_user_register DESC
LIMIT 2;

-- instagram challenge - 3
select *
from users
    left join photos on users.id = photos.user_id
where
    photos.id is NULL;

-- instagram challenge - 4
SELECT username, photos.id, photos.image_url, COUNT(*) AS total
FROM photos
    INNER JOIN likes ON likes.photo_id = photos.id
    INNER JOIN users ON photos.user_id = users.id
GROUP BY
    photos.id
ORDER BY total DESC
LIMIT 1;

-- instagram challenge - 5
SELECT (
        SELECT Count(*)
        FROM photos
    ) / (
        SELECT Count(*)
        FROM users
    ) AS avg;

-- instagram challenge - 6
SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

-- instagram challenge - 7
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 