# tmdb-analysis

# 🎬 TMDB Movie Analysis (Bash Script)

This repository contains a **Bash script** that analyzes the **TMDB movie dataset** (`tmdb-movies.csv`) using `csvkit`. It extracts useful insights such as **top-rated movies, highest revenue movies, most popular actors, and genres**.

---

## 📂 Files in This Repository

| File Name                 | Description                                          |
|---------------------------|------------------------------------------------------|
| `analyze_tmdb.sh`         | Main Bash script for data analysis                   |
| `sorted_movies.csv`       | Movies sorted by release year and release date       |
| `high_rated_movies.csv`   | Movies with ratings **≥ 7.5**                        |
| `highest_revenue.csv`     | Movie with the **highest revenue**                   |
| `lowest_revenue.csv`      | Movie with the **lowest revenue**                    | 
| `sum_revenue.txt`         | **Total revenue** of all movies                      |
| `top10_profit_movies.csv` | **Top 10 most profitable movies** (Revenue - Budget) |
| `top10_director.txt`      | **Top 10 directors** with the most movies            |
| `top10_actor.txt`         | **Top 10 actors** with the most movies               |
| `stat_genre.txt`          | Count of movies **per genre**                        |

---

## 🚀 How to Run the Script?

### 1️⃣ **Install Required Tools**
Ensure `csvkit` is installed:
```bash
pip install csvkit
```

### 2️⃣ **Run the Script**
```bash
chmod +x analyze_tmdb.sh
./analyze_tmdb.sh
```

### 3️⃣ **View the Results**
After execution, check the generated `.csv` and `.txt` files for insights.

---

## 🌟 Features & Analysis
✅ **Sort movies** by release year & date.  
✅ **Filter movies** with ratings ≥ 7.5.  
✅ **Find highest & lowest revenue movies.**  
✅ **Calculate total revenue of all movies.**  
✅ **Find top 10 most profitable movies.**  
✅ **Identify the most prolific directors & actors.**  
✅ **Count the number of movies per genre.**  

---

## 📌 Contributing
Feel free to fork the repo, suggest improvements, or submit pull requests!

📧 **Contact:** dunhan1905@gmail.com  
🔗 **GitHub:** [DuNhan1930](https://github.com/DuNhan1930)
