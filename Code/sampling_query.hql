SELECT 
    CORR(danceability, tempo) AS correlation_danceability_tempo,
    CORR(energy, tempo) AS correlation_energy_tempo,
    CORR(danceability, energy) AS correlation_danceability_energy,
    CORR(danceability, popularity) AS correlation_danceability_popularity,
    CORR(popularity, energy) AS correlation_popularity_energy
FROM tracks
TABLESAMPLE(20 PERCENT);
