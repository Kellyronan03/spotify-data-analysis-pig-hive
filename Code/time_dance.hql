SELECT time_signature, AVG(danceability) AS avg_danceability
FROM tracks
WHERE danceability IS NOT NULL AND time_signature IS NOT NULL
GROUP BY time_signature
ORDER BY avg_danceability DESC;
