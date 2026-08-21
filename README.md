# layoffs-sql-data-cleaning
Data cleaning of a real-world layoffs dataset using SQL (MySQL) — from raw, messy data to analysis-ready."

# Layoffs Dataset — SQL Data Cleaning Project

## Overview
This project takes a real-world, messy dataset of global tech layoffs and cleans it into an analysis-ready format using SQL (MySQL). The goal was to practice core data cleaning skills: identifying and removing duplicates, standardizing formatting, and handling missing values — all using SQL queries rather than manual spreadsheet editing.

## Problem
The raw dataset contained several common data quality issues that needed to be resolved before any analysis could be trusted:
- Duplicate records
- Inconsistent formatting (e.g. date formats, inconsistent text casing/spacing in company and industry names)
- Missing (NULL/blank) values in key columns

## Tools Used
- MySQL (MySQL Workbench)
- SQL (DDL/DML — CREATE, UPDATE, DELETE, window functions for duplicate detection)

## Process
1. **Staged the raw data** — created a working copy of the raw table to avoid modifying original source data directly
2. **Removed duplicates** — used a window function (ROW_NUMBER / PARTITION BY) to identify and delete exact duplicate rows
3. **Standardized formatting** — trimmed whitespace, fixed inconsistent casing/naming across text fields, and converted date fields into a consistent, correctly-typed date format
4. **Handled missing values** — identified NULL/blank fields and either populated them (where a matching value existed elsewhere in the dataset) or flagged/removed rows where the value couldn't reasonably be recovered
5. **Verified the clean table** — ran checks to confirm no duplicate rows remained and formatting was consistent across the dataset

## Key Takeaways
- Practiced using window functions for duplicate detection, a common real-world SQL cleaning technique
- Learned to distinguish between values that are genuinely missing vs. recoverable from other columns
- Reinforced the importance of never cleaning data directly in the raw table — always work on a staged copy

## Files in This Repo
- `raw_data/` — original, unedited dataset
- `cleaned_data/` — final cleaned dataset (CSV export)
- `layoffs_cleaning.sql` — full SQL script with all cleaning steps, commented

## What I'd Do Differently Next Time
- Automate the NULL-checking process with a reusable SQL script rather than manually reviewing each column
- Add data validation checks (e.g. constraints) earlier in the process to catch formatting issues sooner

---
**Author:** Nana Botah | [LinkedIn](https://www.linkedin.com/in/nanabotah)
