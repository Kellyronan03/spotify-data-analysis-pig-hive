SELECT track_name
FROM tracks
GROUP BY track_name, artists
HAVING AVG(energy) > 0.9 
   AND AVG(danceability) > 0.9 
   AND AVG(valence) > 0.7
ORDER BY AVG(energy) DESC 
LIMIT 5;
