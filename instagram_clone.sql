CREATE DATABASE instagram_clone;
USE instagram_clone;

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL, 
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

DESC photos;

CREATE TABLE comments (
	id INT PRIMARY KEY AUTO_INCREMENT,
    commented_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL, 
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);
DROP TABLE comments;
DESC comments;

INSERT INTO users (username) VALUES
('BlueTHeCAt'),
('CharlieBrown'),
('ColtSteele');

INSERT INTO photos(image_url, user_id) VALUES
('/dwadwadaw', 1),
('/XxSadadsa', 2),
('/wow', 2);

INSERT INTO comments(commented_text, user_id, photo_id) VALUES 
('Meow', 1, 2),
('Key', 1, 2),
('MII', 1, 2);

SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM comments;
SELECT * FROM photos
JOIN users
	ON photos.user_id = users.id;
    
    
    
    USE ig_clone;
    SET sql_mode = ''; 
    
    -- find 5 oldest users
    SELECT * FROM users ORDER BY created_at ASC LIMIT 5;
    
    -- what day of the week do most users register on? 
    SELECT 
        DAYNAME(created_at) AS RegDay,
        COUNT(*) as RegNumber
        FROM users 
        GROUP BY RegDay
        ORDER BY RegNumber DESC;
    
    -- find users who never posted a photo
    SELECT username, image_url 
		FROM users
        LEFT JOIN photos
			ON users.id = photos.user_id
        WHERE image_url IS NULL;
        
        -- which is the single most popular photo and its creator
        -- to zle
        SELECT 
			username,
            user_id,
            photo_id,
            COUNT(*) as numLikes
            from likes
		LEFT JOIN users
			ON likes.user_id = users.id
        GROUP BY photo_id
        ORDER BY numLikes DESC;
        
        SELECT 
			username,
			photos.id,
			photos.image_url, 
		COUNT(*) AS total
		FROM photos
		INNER JOIN likes
				ON likes.photo_id = photos.id
		INNER JOIN users
				ON photos.user_id = users.id
		GROUP BY photos.id
		ORDER BY total DESC
		LIMIT 1;
        
    -- how many times average user posts a photo
    
    SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users);
    
    -- what are the top 5 most commonly used hashtags?
    
    SELECT *, COUNT(*) as suma
    FROM photo_tags
    JOIN tags
		ON photo_tags.tag_id = tags.id
        GROUP BY tag_id
        ORDER BY suma DESC
		-- LIMIT 5
        ;
        
        
     -- find users who have liked every single photo
     SELECT *, COUNT(*) FROM photos; -- 257
     
     SELECT *, COUNT(photo_id) as num FROM likes
     GROUP BY user_id
     -- HAVING num = 257
     HAVING num = (SELECT COUNT(*) FROM photos); 
     
     