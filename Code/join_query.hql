WITH avg_energy_danceability AS (
    SELECT track_genre,
           AVG(energy) AS avg_energy,
           AVG(danceability) AS avg_danceability
    FROM tracks
    GROUP BY track_genre
)

SELECT t.track_name, t.artists, t.track_genre
FROM tracks t
JOIN avg_energy_danceability a ON t.track_genre = a.track_genre
ORDER BY a.avg_energy DESC, a.avg_danceability DESC
LIMIT 5;
