# Assignment 3 – Teams & Matches (Dummy Data)

This repo generates two CSVs and computes the **Top teams by wins (2023)**, **including ties** at the 10th rank.

## Files
- `sports_team.ipynb` – Google Colab–ready notebook that:
  - Creates **20 unique teams** (readable names using `faker`)
  - Creates **200 matches** for the **2023** season (every team pair plays at least once)
  - Saves **teams.csv** and **matches.csv**
  - Prints **Top teams by wins (2023)**, including ties
- `top10.sql` – SQL query that returns the **Top teams with ties** using `DENSE_RANK()`.

## How to Run (Google Colab)
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)]([https://colab.research.google.com/github/kyle/assignment-3/blob/main/generate_data.ipynb](https://colab.research.google.com/drive/1bb4H1xc233upP9L3iIv6YwVXTRPWF1bI?usp=sharing))
1. Open `generate_data.ipynb` in Google Colab.
2. Run all cells. The notebook will:
   - Install `faker`
   - Generate data
   - Save **teams.csv** and **matches.csv** in the same directory
   - Display the **Top teams (with ties)**
3. (Optional) Download the CSVs from the Colab file browser.

## Output Schemas
**teams.csv**
- `team_id` (int)
- `team_name` (string)

**matches.csv**
- `match_id` (int)
- `season` (int) – always 2023 in this demo
- `match_date` (YYYY-MM-DD)
- `winner_team_id` (int)
- `loser_team_id` (int)

## Tie Handling
Both the notebook (Pandas) and the SQL (`top10_wins_2023.sql`) **include all teams tied at the 10th place**.  
- Notebook logic: find the 10th-highest `wins` value and include everyone with `wins >= cutoff`.
- SQL logic: use `DENSE_RANK()` and filter `rnk <= 10`.


## Notes
- Randomness is seeded for reproducibility.

