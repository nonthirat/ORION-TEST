-- File: init.sql
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS songs (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_songs (
  user_id INT REFERENCES users(id),
  song_id INT REFERENCES songs(id),
  PRIMARY KEY (user_id, song_id)
);

-- Insert 10 users
INSERT INTO users (name, email) VALUES
  ('User 1', 'user1@example.com'),
  ('User 2', 'user2@example.com'),
  ('User 3', 'user3@example.com'),
  ('User 4', 'user4@example.com'),
  ('User 5', 'user5@example.com'),
  ('User 6', 'user6@example.com'),
  ('User 7', 'user7@example.com'),
  ('User 8', 'user8@example.com'),
  ('User 9', 'user9@example.com'),
  ('User 10', 'user10@example.com');

-- Insert 20 songs
INSERT INTO songs (name) VALUES
  ('Song 1'),
  ('Song 2'),
  ('Song 3'),
  ('Song 4'),
  ('Song 5'),
  ('Song 6'),
  ('Song 7'),
  ('Song 8'),
  ('Song 9'),
  ('Song 10'),
  ('Song 11'),
  ('Song 12'),
  ('Song 13'),
  ('Song 14'),
  ('Song 15'),
  ('Song 16'),
  ('Song 17'),
  ('Song 18'),
  ('Song 19'),
  ('Song 20');

-- Insert favorite songs for each user (3 songs per user)
INSERT INTO user_songs (user_id, song_id)
SELECT user_id, song_id
FROM (
  SELECT
    u.id AS user_id,
    s.id AS song_id,
    ROW_NUMBER() OVER(PARTITION BY u.id ORDER BY RANDOM()) AS rn
  FROM
    users u
  CROSS JOIN
    songs s
) sub
WHERE rn <= 3;
