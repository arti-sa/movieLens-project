Overview:
=========
This ETL (Extract, Transform, Load) pipeline is designed to automate the process of ingesting data from CSV files, transforming it, and loading it into a PostgreSQL database. We use Apache Airflow for scheduling and orchestrating the pipeline, Python for data processing, and PostgreSQL as the destination for the processed data.

  1.Airflow: Manages the scheduling and execution of the pipeline tasks.
  2.PostgreSQL: Stores the processed data in tables (ratings, movies, tags).
  3.Python: Handles the extraction and transformation steps.

Data Flow:
==========
  1.Extract: The data is loaded from CSV files (ratings.csv, movies.csv, tags.csv) using pandas.
  2.Transform: Any necessary data cleaning or transformation is performed. This could include filtering, renaming columns, or other transformations.
  3.Load: The cleaned data is loaded into PostgreSQL using the pandas .to_sql() method.

How the Pipeline Works:
========================
  1.Airflow DAG: Airflow is used to schedule the ETL task. The pipeline runs on a regular schedule, and tasks are automatically triggered to process the data.
  2.Task Execution: When the scheduled time comes, Airflow triggers the ETL task, which reads the CSV files, processes the data, and loads it into PostgreSQL.

Steps for Setting Up and Running the Pipeline:
==============================================
Install Dependencies:

1.Make sure you have Python and the necessary packages installed:
    pip install apache-airflow pandas psycopg2 sqlalchemy
2.You also need a running PostgreSQL instance.

Install and Configure Apache Airflow:
=====================================

1.If you haven’t already installed Apache Airflow, do so with:
    pip install apache-airflow
2.Once installed, initialize the Airflow database:
    airflow db init

Define the Airflow DAG: Here’s an example of a DAG that runs every minute:
==========================================================================

from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator
import pandas as pd
from sqlalchemy import create_engine

def run_movies_ingestion():
    print("Starting the ETL process...")

    # Reading the data from CSV files
    ratings = pd.read_csv('datasets/rating.csv')
    movies = pd.read_csv('datasets/movie.csv')
    tags = pd.read_csv('datasets/tag.csv')

    # Connecting to PostgreSQL using SQLAlchemy
    engine = create_engine('postgresql://postgres:password@localhost/movies_db')

    # Loading data into PostgreSQL
    ratings.to_sql('ratings', engine, if_exists='replace', index=False)
    movies.to_sql('movies', engine, if_exists='replace', index=False)
    tags.to_sql('tags', engine, if_exists='replace', index=False)

    print("ETL process completed.")

with DAG('etl_pipeline', start_date=datetime(2024, 11, 6), schedule='* * * * *') as dag:
    etl_task = PythonOperator(task_id='movies_ingestion_etl', python_callable=run_movies_ingestion)

schedule: The pipeline is set to run every minute using ' * * * * * ' (cron syntax).

PostgreSQL Database:
====================
Verify that the data was loaded into PostgreSQL by querying the ratings, movies, and tags tables.
You can use any SQL client (like pgAdmin or the PostgreSQL CLI) to view the data.

Troubleshooting:
================
If you encounter connection errors, make sure that PostgreSQL is accessible from the machine running Airflow. The connection string should have the correct username, password, host, and database name.