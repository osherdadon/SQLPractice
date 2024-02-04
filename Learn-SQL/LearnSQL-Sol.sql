# Mission 1

CREATE TABLE songs (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    length FLOAT NOT NULL,
    PRIMARY KEY(id),
    album_id INT NOT NULL,
    FOREIGN KEY(album_id) REFERENCES albums(id)
);

# Mission 2

SELECT name AS 'Band Name' FROM bands;

##########################
# After Mission 7 , The oldest has changed. 
# In order to get the right answer as the git page shows, there is a need to update value to NULL.
UPDATE albums
SET release_date = NULL
WHERE id = 4;
##########################

# Mission 3

SELECT * FROM albums 
WHERE release_date IS NOT NULL
ORDER BY release_date
LIMIT  1;

# Mission 4 , two ways

SELECT DISTINCT bands.name AS 'Band Name'
FROM bands
JOIN albums ON bands.id = albums.band_id;

# Or 
SELECT bands.name AS 'Band Name' FROM bands
JOIN albums ON bands.id = albums.band_id
GROUP BY bands.name;

# Mission 5

SELECT bands.name AS 'Band Name' FROM bands
LEFT JOIN albums on albums.band_id = bands.id
GROUP BY bands.name
HAVING COUNT(albums.band_id) = 0;

# Mission 6

SELECT 
	albums.name AS 'Name',
	albums.release_date AS 'Release Year',
	SUM(songs.length) AS 'Duration'
FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id
ORDER BY Duration DESC
LIMIT 1;

# Mission 7

SELECT * FROM albums;
UPDATE albums
SET release_date = 1986
WHERE id = 4;

# Mission 8 & 9

INSERT INTO bands(name) values('test');
INSERT INTO Albums(band_id,name,release_date) VALUES(8,'test',NULL); 

DELETE FROM albums WHERE id = 19;
DELETE FROM bands WHERE id = 8;

# Mission 10

SELECT AVG(songs.length) AS 'Average Song Duration' FROM songs;

# Mission 11
SELECT
  albums.name AS 'Album',
  albums.release_date AS 'Release Year',
  MAX(songs.length) AS 'Duration'
FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY songs.album_id;

# Mission 12

SELECT * FROM albums;
SELECT * FROM songs;
SELECT * FROM bands;

SELECT 
	bands.name AS 'Band',
    COUNT(songs.name) AS 'Number of Songs'
FROM bands
JOIN albums ON albums.band_id = bands.id
JOIN songs ON albums.id = songs.album_id
GROUP BY bands.id;

/* Solution to Learn-SQL git
 * https://github.com/WebDevSimplified/Learn-SQL/tree/master
 */