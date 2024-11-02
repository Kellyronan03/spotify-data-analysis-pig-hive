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

ordered_tracks = ORDER tracks BY energy DESC, track_name ASC;
top_tracks = LIMIT ordered_tracks 5;

result = FOREACH top_tracks GENERATE artists, track_name, energy;
DUMP result;
