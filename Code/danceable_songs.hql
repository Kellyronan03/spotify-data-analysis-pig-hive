SELECT artists, track_name, danceability
FROM tracks
WHERE danceability < 1.0 AND danceability >= 0.9
ORDER BY danceability DESC
LIMIT 5;
