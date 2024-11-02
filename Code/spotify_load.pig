-- Loading in the dataset
tracks = LOAD 'input/dataset.csv' USING PigStorage(',') AS (
    idx:int, 
    track_id:chararray, 
    artists:chararray, 
    album_name:chararray, 
    track_name:chararray,
    popularity:int, 
    duration_ms:long, 
    explicit:boolean, 
    danceability:float, 
    energy:float,
    key:int, 
    loudness:float, 
    mode:int, 
    speechiness:float, 
    acousticness:float,
    instrumentalness:float, 
    liveness:float, 
    valence:float, 
    tempo:float,
    time_signature:int, 
    track_genre:chararray
);

-- filter the data to remove any outliers or unacceptable values
filtered_data = FILTER tracks BY
    (popularity >= 0 AND popularity <= 100) AND
    (duration_ms > 0) AND
    (explicit == true OR explicit == false) AND
    (energy >= 0.0 AND energy <= 1.0) AND
    (mode == 0 OR mode == 1) AND
    (speechiness >= 0.0 AND speechiness <= 1.0) AND
    (acousticness >= 0.0 AND acousticness <= 1.0) AND
    (instrumentalness >= 0.0 AND instrumentalness <= 1.0) AND
    (liveness >= 0.0 AND liveness <= 1.0) AND
    (valence >= 0.0 AND valence <= 1.0);

-- Removing any duplicate entries
duped_data = FOREACH (GROUP filtered_data BY (artists, album_name, track_name)) {
    ordered_data = ORDER filtered_data BY popularity DESC; 
    first_entry = LIMIT ordered_data 1;                     
    GENERATE FLATTEN(first_entry);
};

-- Cleaned the data
cleaned_data = FOREACH duped_data GENERATE
    REPLACE(artists, ',', '') AS artists,
    REPLACE(album_name, ',', '') AS album_name,
    REPLACE(track_name, ',', '') AS track_name,
    popularity,
    ROUND(duration_ms / 1000) AS duration_sec,
    explicit, 
    danceability, 
    energy, 
    key, 
    loudness, 
    mode, 
    speechiness, 
    acousticness,
    instrumentalness, 
    liveness, 
    valence, 
    tempo, 
    time_signature, 
    track_genre;

-- Store the cleaned data
STORE cleaned_data INTO 'output/loaded_tracks' USING PigStorage(',');

