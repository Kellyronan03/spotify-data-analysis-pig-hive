tracks = LOAD 'input/cleaned_dataset.csv' USING PigStorage(',') AS (
   artists:chararray,
   album:chararray,
   track_name:chararray,
   popularity:int,
   duration_ms:int,
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
   genre:chararray
);

filtered_tracks = FILTER tracks BY danceability < 1.0 AND danceability >= 0.9;
ordered_tracks = ORDER filtered_tracks BY danceability DESC;
top_tracks = LIMIT ordered_tracks 5;

result = FOREACH top_tracks GENERATE artists, track_name, danceability;
DUMP result;
