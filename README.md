# R Basic Manual

A hands-on guide to learning **R programming** through the complete
**data analysis workflow**.

**From Hello R to End-to-End Data Analysis.**

This repository is designed for beginners who want to learn R step by
step through executable code, practical examples, visualization, data
manipulation, reporting, and complete analysis workflows.

------------------------------------------------------------------------

# Overview

The goal of this repository is not simply to memorize R syntax or
individual functions.

Instead, the objective is to learn how R can be used throughout the data
analysis process.

``` text
Data
  ↓
Import
  ↓
Inspect
  ↓
Validate / Clean
  ↓
Transform
  ↓
Analyze
  ↓
Visualize
  ↓
Interpret
  ↓
Report
```

The manual begins with basic R syntax and gradually progresses toward
practical data analysis using packages such as `dplyr`, `tidyr`, and
`ggplot2`.

The final chapters introduce database connectivity, R Markdown, Shiny,
built-in datasets, and a complete End-to-End Analysis Project.

Each chapter contains practical materials such as:

-   **R Script (.R)** --- executable sample code
-   **R Markdown (.Rmd)** --- explanations, examples, and hands-on
    instructions
-   **Sample Data** --- datasets used in exercises
-   **Applications** --- interactive examples such as Shiny

------------------------------------------------------------------------

# Learning Roadmap

## Part 1. Foundations

Build a foundation in R and learn the basic workflow of data analysis.

| Chapter | Topic | Status |
|---|---|---|
| 01 | Hello R | ✅ |
| 02 | Basic Syntax | ✅ |
| 03 | Vectors | ✅ |
| 04 | Data Frame | ✅ |
| 05 | Basic Statistics | ✅ |
| 06 | Visualization (Base R) | ✅ |
| 07 | Real Data Analysis | ✅ |
| 08 | Data Cleaning | ✅ |
| 09 | ggplot2 Basics | ✅ |

## Part 2. Programming for Data Analysis

Learn programming and data-handling techniques that make analysis more
flexible and reusable.

| Chapter | Topic | Status |
|---|---|---|
| 10 | Functions | ✅ |
| 11 | Data Aggregation | ✅ |
| 12 | Apply Family | ✅ |
| 13 | String Processing | ✅ |
| 14 | Date and Time | ✅ |

## Part 3. Data Analysis

Apply R to practical data manipulation, transformation, visualization,
statistics, and data exchange.

| Chapter | Topic | Status |
|---|---|---|
| 15 | Data Manipulation with dplyr | ✅ |
| 16 | Data Joining and Reshaping | ✅ |
| 17 | Advanced ggplot2 | ✅ |
| 18 | Statistical Analysis | ✅ |
| 19 | Import and Export | ✅ |

## Part 4. Practical R

Connect R with databases, reproducible reporting, interactive
applications, and complete analysis workflows.

| Chapter | Topic | Status |
|---|---|---|
| 20 | Database Connectivity | ✅ |
| 21 | R Markdown | ✅ |
| 22 | Shiny Basics | ✅ |
| 23 | Built-in Datasets | ✅ |
| 24 | End-to-End Analysis Project | ✅ |

------------------------------------------------------------------------

# Final Project

Chapter 24 brings together the techniques introduced throughout the
manual into a single use case:

**Retail Sales Performance Analysis**

The project starts with raw CSV data and follows the complete workflow:

``` text
Business Question
        ↓
     Raw CSV
        ↓
      Import
        ↓
      Inspect
        ↓
     Validate
        ↓
       Clean
        ↓
    Transform
        ↓
     Analyze
        ↓
   Statistics
        ↓
   Visualize
        ↓
   Interpret
        ↓
 R Markdown Report
        ↓
 Reproducibility
```

The project includes CSV data import, data quality validation, missing
value handling, string cleaning, date processing, `dplyr`
transformation, `tidyr` reshaping, descriptive statistics, sales
analysis, `ggplot2` visualization, built-in dataset analysis, R Markdown
reporting, and reproducibility checks.

------------------------------------------------------------------------

# Repository Structure

``` text
R-Basic-Manual/
├── apps/       # Shiny applications
├── data/       # Sample datasets
├── docs/       # R Markdown tutorials and reports
├── images/     # Figures and screenshots
├── output/     # Generated analysis results
├── reference/  # Reference materials
├── scripts/    # Executable R scripts
└── README.md
```

Generated HTML files from R Markdown are excluded from Git tracking and
can be reproduced from the corresponding `.Rmd` files.

------------------------------------------------------------------------

# Learning Style

Each chapter follows a hands-on approach:

1.  Introduce the concept
2.  Explain why the technique is useful
3.  Demonstrate it with executable R code
4.  Inspect the output
5.  Apply the technique to data
6.  Connect it with previous chapters

The emphasis is on **learning R by actually running and modifying
code**.

------------------------------------------------------------------------

# Data Analysis Mindset

As the chapters progress, the focus moves from individual functions
toward a repeatable analytical process.

``` text
Understand
    ↓
Inspect
    ↓
Validate
    ↓
Clean
    ↓
Transform
    ↓
Summarize
    ↓
Visualize
    ↓
Interpret
```

The important question is not only *which R function should I use?*, but
*what question am I trying to answer, and what analysis is needed to
answer it?*

------------------------------------------------------------------------

# Recommended Environment

-   **R**
-   **RStudio**

Main packages used throughout the manual include:

-   `ggplot2`
-   `dplyr`
-   `tidyr`
-   `readxl`
-   `writexl`
-   `DBI`
-   `RSQLite`
-   `rmarkdown`
-   `shiny`

Install a package when necessary:

``` r
install.packages("package_name")
```

Then load it:

``` r
library(package_name)
```

------------------------------------------------------------------------

# How to Use This Repository

Clone the repository:

``` bash
git clone https://github.com/toshiyuki-nose/R-Basic-Manual.git
```

Open the repository in RStudio and work through the chapters in
numerical order.

For example:

``` r
source("scripts/01_hello_r.R")
```

Later chapters may require additional actions such as knitting an R
Markdown document, opening generated HTML reports, running a Shiny
application, or connecting to a sample database. Detailed hands-on
instructions are provided in the relevant chapter.

------------------------------------------------------------------------

# What You Will Learn

By completing the manual, you will have practiced:

-   R syntax and data structures
-   Vectors and data frames
-   Basic statistics
-   Data visualization
-   Data cleaning
-   Functions
-   Data aggregation
-   Apply-family functions
-   String processing
-   Date and time processing
-   Data manipulation with `dplyr`
-   Joining and reshaping data
-   Advanced visualization with `ggplot2`
-   Statistical analysis
-   Data import and export
-   Database connectivity
-   R Markdown
-   Shiny
-   Built-in datasets
-   End-to-End data analysis

The goal is not to master every feature of R. The goal is to build a
foundation for using R as a practical **data analysis tool**.

------------------------------------------------------------------------

# Next Steps

After completing this manual, possible next steps include:

-   Working with larger real-world datasets
-   Advanced statistical analysis
-   API data collection
-   Database-driven analytics
-   Machine learning with R
-   Interactive dashboards with Shiny
-   Reproducible analytical projects
-   Integration with BI and data platforms

Regardless of the technology used next, the core analytical workflow
remains:

``` text
Import
  ↓
Validate
  ↓
Transform
  ↓
Analyze
  ↓
Visualize
  ↓
Report
```

------------------------------------------------------------------------

# Author

**Toshiyuki Nose**
