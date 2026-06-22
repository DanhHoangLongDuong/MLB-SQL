# MLB Player & Salary SQL Analysis ⚾📊

## 📌 Project Overview
This project is an advanced SQL exercise exploring historical Major League Baseball (MLB) data. It analyzes player career trajectories, franchise payroll spending, physical attributes over time, and collegiate backgrounds. The goal of this project is to demonstrate proficiency in complex SQL querying, including data transformation, window functions, and database schema management.

## 🛠️ Tech Stack & Techniques
* **Database Engine:** MySQL
* **Core SQL Skills Demonstrated:**
  * **Window Functions:** `SUM() OVER()`, `ROW_NUMBER()`, `NTILE()`
  * **Advanced Aggregations & Pivoting:** `GROUP_CONCAT`, `CASE WHEN` to pivot categorical data into columns.
  * **Query Structuring:** Common Table Expressions (CTEs), Views, and Temporary Tables.
  * **Date & Time Manipulation:** `TIMESTAMPDIFF`, `EXTRACT()`, and custom date formatting.

## 🗄️ Database Schema
The database consists of four core tables:
* `players`: Player demographics, birth details, physical traits (height/weight), and debut/final game dates.
* `salaries`: Annual compensation data per player and team.
* `schools`: Mapping of players to their respective colleges/universities.
* `school_details`: Collegiate institution metadata (name, city, state).

## 📂 Project Structure & Analysis Files

| File Name | Description | Key Questions Answered |
|---|---|---|
| `setup_and_insert_data.sql` | Database Initialization | Contains the DDL to create tables and the DML to populate the database with raw MLB data. |
| `salary_analysis.sql` | Franchise Payroll Tracking | Identifies the top 20% of teams by average spending, calculates year-over-year cumulative spending per team, and flags the exact year franchises surpassed $1 Billion in total payroll. |
| `player_career_analysis.sql` | Career Longevity & Loyalty | Calculates exact ages at debut/retirement and tracks "franchise players" who debuted and retired with the exact same team over a 10+ year career. |
| `player_comparison_analysis.sql` | Physical Traits & Attributes | Tracks how the average height and weight of debut players changed decade-by-decade, and pivots data to find the exact percentage of Left, Right, and Switch hitters per team. |
| `school_analysis.sql` | Collegiate Talent Pipelines | Ranks the top 5 colleges for producing MLB talent historically, and uses partition ranking to find the top 3 schools per decade. |

## 🚀 How to Run the Project locally

1. Ensure you have a **MySQL** server running (e.g., via MySQL Workbench, XAMPP, or command line).
2. Clone this repository to your local machine:
   ```bash
   git clone [https://github.com/DanhHoangLongDuong/MLB-SQL.git](https://github.com/DanhHoangLongDuong/MLB-SQL.git)
