# Netflix Movies & TV Shows Data Cleaning and SQL Analysis

## Project Overview

Netflix is one of the world's largest streaming platforms, offering thousands of movies and TV shows across different countries, genres, and audience groups.

This project focuses on transforming raw Netflix content data into a clean, reliable, and analysis-ready dataset using Microsoft SQL Server. The primary objective is to demonstrate practical SQL skills in data cleaning, transformation, data quality assessment, and exploratory business analysis.

The project follows a complete analytics workflow:

Raw Dataset → Data Cleaning → Data Transformation → Business Analysis → Insights

---

## Business Problem

Raw datasets often contain inconsistencies such as:

* Missing values
* Duplicate records
* Unstructured text fields
* Mixed data formats
* Data quality issues

Before generating reports or dashboards, organizations must ensure that their data is accurate and trustworthy.

This project simulates a real-world scenario where a Data Analyst is responsible for preparing Netflix content data for downstream analytics and decision-making.

---

## Dataset Information

Source: Kaggle

Dataset Name: Netflix Movies and TV Shows

Records: 8,800+

Features:

* Show ID
* Type (Movie / TV Show)
* Title
* Director
* Cast
* Country
* Date Added
* Release Year
* Rating
* Duration
* Genre
* Description

---

## Project Objectives

The objectives of this project are:

* Identify and resolve data quality issues.
* Standardize inconsistent data formats.
* Handle missing and duplicate values.
* Transform raw attributes into analysis-ready fields.
* Answer key business questions using SQL.
* Generate actionable insights from the dataset.

---
## Data Cleaning Process

### 1. Data Quality Assessment

Initial checks were performed to identify:

* Missing values
* Duplicate records
* Invalid date formats
* Inconsistent text values
* Null attributes

### 2. Data Standardization

Standardized:

* Date formats
* Text spacing
* Null handling
* Duration formatting

### 3. Data Transformation

Created additional fields:

* date_added_clean
* duration_value
* duration_unit

Example:

"90 min" → 90 + Minutes

"3 Seasons" → 3 + Seasons

### 4. Data Validation

Post-cleaning validation was conducted to ensure:

* No critical null values
* Consistent data types
* Reliable analytical output

---

## Database Design

The dataset was modeled into relational tables following normalization principles.

Core Tables:

* Titles
* Directors
* Countries
* Genres

Bridge Tables:

* Title_Director
* Title_Country
* Title_Genre

Benefits:

* Reduced redundancy
* Improved query performance
* Better scalability
* Production-style database structure

---

## Business Questions

The project investigates several business-oriented questions:

### Content Distribution

* How many Movies and TV Shows are available on Netflix?
* What is the percentage distribution between Movies and TV Shows?

### Content Growth

* Which year had the highest number of titles added?
* How has Netflix's content library evolved over time?

### Geography Analysis

* Which countries contribute the most content?
* Which countries dominate Movie production?

### Content Analysis

* Which genres are most common?
* Which ratings appear most frequently?
* Who are the most prolific directors on Netflix?

### Duration Analysis

* What are the longest Movies available?
* What is the average Movie duration?

---

## Key Findings

### Netflix is Movie-Dominant

Movies represent the majority of Netflix's catalog, significantly outnumbering TV Shows.

### Rapid Expansion After 2016

Netflix experienced substantial content growth beginning in 2016, reflecting its aggressive global expansion strategy.

### United States Leads Content Production

The United States contributes the largest volume of content, followed by India and several international markets.

### Mature Audience Content Dominates

TV-MA is the most common content rating, indicating a strong focus on adult audiences.

### Drama is King

Drama-related genres consistently appear among the most popular content categories on the platform.

---

## Conclusion

This project demonstrates how SQL can be used beyond simple querying to solve real-world data quality challenges. By transforming raw Netflix data into a structured and analysis-ready format, the project highlights essential skills required for Data Analyst roles, including data cleaning, data modeling, business analysis, and insight generation.
