DROP TABLE IF EXISTS tracks;

CREATE TABLE tracks (
        artists STRING,
        album_name STRING,
        track_name STRING,
        popularity INT,
        duration_sec INT,
        explicit BOOLEAN,
        danceability FLOAT,
        energy FLOAT,
        key INT,
        loudness FLOAT,
        mode INT,
        speechiness FLOAT,
        acousticness FLOAT,
        instrumentalness FLOAT,
        liveness FLOAT,
        valence FLOAT,
        tempo FLOAT,
        time_signature INT,
        track_genre STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/Users/ronankelly/hive/input/cleaned_dataset.csv'
INTO TABLE tracks;;
