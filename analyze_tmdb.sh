#!/bin/bash

# Define input CSV file
INPUT_FILE="tmdb-movies.csv"

# Ensure the file exists before proceeding
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: File $INPUT_FILE not found!"
    exit 1
fi

echo "Processing TMDB movie dataset..."

# Sort movies by release year first, then by release date (descending order)
csvsort -c release_year,release_date -r "$INPUT_FILE" > sorted_movies.csv
echo "Sorted movies by release year and release date"

# Filter movies with vote_average >= 7.5, sorted in descending order
csvsql --query "SELECT * FROM tmdb WHERE CAST(vote_average AS FLOAT) >= 7.5 ORDER BY CAST(vote_average AS FLOAT) DESC" --tables tmdb "$INPUT_FILE" > high_rated_movies.csv
echo "Extracted high-rated movies (7.5+ rating)"

# Find the movie with the highest revenue
csvsort -c revenue -r "$INPUT_FILE" | head -n 2 > highest_revenue.csv
echo "Found highest revenue movie"

# Find the movie with the lowest revenue
csvsort -c revenue "$INPUT_FILE" | head -n 2 > lowest_revenue.csv
echo "Found lowest revenue movie"

# Calculate total revenue from all movies
csvstat --sum "$INPUT_FILE" | grep "revenue" > sum_revenue.txt
echo "Calculated total revenue"

# Find top 10 most profitable movies (Revenue - Budget)
csvcut -c original_title,revenue,budget "$INPUT_FILE" | csvsql --query "SELECT original_title, revenue - budget AS profit FROM stdin ORDER BY profit DESC LIMIT 10" > top10_profit_movies.csv
echo "Extracted top 10 most profitable movies"

# Find the top 10 directors with the most movies
csvcut -c director "$INPUT_FILE" | tail -n +2 | grep -v '^""$' | grep -v '^$' | sort | uniq -c | sort -nr | head -n 10 > top10_director.txt
echo "Extracted top 10 directors"

# Find the top 10 actors with the most movies
csvcut -c cast "$INPUT_FILE" | tail -n +2 | tr "|" "\n" | grep -v '^""$' | grep -v '^$' | sort | uniq -c | sort -nr | head -n 10 > top10_actor.txt
echo "Extracted top 10 actors"

# Count the number of movies per genre
csvcut -c genres "$INPUT_FILE" | tail -n +2 | tr "|" "\n" | grep -v '^""$' | grep -v '^$' | sort | uniq -c | sort -nr > stat_genre.txt
echo "Counted number of movies per genre"

echo "Analysis complete! Results saved in respective CSV/TXT files."
