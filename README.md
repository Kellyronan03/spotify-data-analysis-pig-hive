# 🎵 Spotify Music Analysis

## Overview

This project analyses Spotify music data to explore relationships between song characteristics like energy, danceability, and popularity. Using **Apache Pig** and **Hive** on large-scale music datasets to test whether high-energy, danceable songs correlate with popularity.

## Hypothesis

**Initial Theory**: Songs with high danceability and energy would have high popularity scores.  
**Result**: Hypothesis rejected! Energy and danceability showed minimal correlation with popularity.

## Tools Used

- Apache Pig (data cleaning and preprocessing)
- Apache Hive (SQL-style querying and analysis)
- Hadoop MapReduce (distributed processing)

## Key Findings

- **Death Metal** ranked highest for energy and danceability (unexpected!)
- Popular songs ≠ high energy/danceability songs (zero overlap found)
- 7/4 time signature had highest average danceability
- Very weak correlations: danceability vs popularity (+0.1), energy vs popularity (-0.1)

