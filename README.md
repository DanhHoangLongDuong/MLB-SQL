# MLB Player Analysis ⚾📊

## 📌 Project Overview
This project explores Major League Baseball (MLB) historical data to uncover insights regarding player salaries, career trajectories, and collegiate backgrounds. The goal of this analysis is to demonstrate advanced SQL querying techniques to extract meaningful business and performance metrics from a relational database.

## 🛠️ Tech Stack
* **RDBMS:** MySQL
* **Techniques Used:** Joins, Common Table Expressions (CTEs), Window Functions, Aggregations, Subqueries, and Data Definition/Manipulation (DDL/DML).

## 🗄️ Database Schema
The analysis is built on a custom relational database. *(Note: Include an image of your Entity Relationship Diagram here if you have one).*

Core entities include:
* `players`: Biographical and demographic data.
* `salaries`: Historical contract and compensation data.
* `schools`: Collegiate background information.
* `performance`: Career statistics and game data.

## 📂 Project Structure

| File | Description |
|---|---|
| `setup_and_insert_data.sql` | DDL and DML scripts to create tables, define primary/foreign keys, and load the raw data. |
| `salary_analysis.sql` | Queries analyzing payroll trends, highest-paid positions, and salary growth over time. |
| `school_analysis.sql` | Queries evaluating the correlation between a player's collegiate background and MLB success. |
| `player_career_analysis.sql`| Queries tracking career longevity, peak performance years, and historical milestones. |

## 🚀 How to Run the Project
To replicate this database and run the analysis locally:

1. Ensure you have **MySQL** installed and running.
2. Clone this repository:
```bash
   git clone [https://github.com/DanhHoangLongDuong/MLB-SQL.git](https://github.com/DanhHoangLongDuong/MLB-SQL.git)
