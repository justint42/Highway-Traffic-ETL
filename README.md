# National Highway Traffic Data ETL Pipeline
## Scenario

As a Data Engineer at a leading data analytics consulting firm, I've been tasked with a crucial project aimed at decongesting national highways. By analyzing road traffic data from various toll plazas, each with its unique IT setup and file formats, this ETL pipeline consolidates disparate data into a unified format for further analysis. This streamlined dataset will serve as a foundation for strategies to alleviate traffic congestion.

## Prerequisites

- Apache Airflow
- Bash shell
- Access to toll plaza data sources

# Pipeline Design

The pipeline is orchestrated using Apache Airflow, leveraging its robust scheduling and monitoring capabilities. The process encapsulates an automated ETL (Extract, Transform, Load) flow, executed via a custom Bash script and managed by an Airflow DAG (Directed Acyclic Graph).

## Extract, Tranfsorm

The Bash script **Extract_Transform_data.sh** handles the extraction phase by downloading toll data in different formats and preparing it for transformation.
Transformation tasks include cleaning, consolidating, and normalizing the data into a standardized CSV format. This process involves intricate text processing and data manipulation using utilities like cut, awk, and paste.

<img width="1122" alt="Screen Shot 2024-01-26 at 3 57 40 PM" src="https://github.com/justint42/Highway-Traffic-ETL/assets/106895220/37ef5a7c-1178-4a36-8308-2cb3b6b2525f">
<img width="851" alt="Screen Shot 2024-01-26 at 3 58 06 PM" src="https://github.com/justint42/Highway-Traffic-ETL/assets/106895220/b75e48a4-e898-4eb6-8a5b-8f7078124ccc">

## Load

While the current implementation focuses on extraction and transformation, it sets the stage for a seamless load into any data warehouse solution.

# Usage

To deploy this pipeline:

- Start Apache Airflow with the **start_airflow command**.
- Create a DAG to define workflow parameters and the execution schedule (**ETL_toll_data.py**).
- Place the **Extract_Transform_data.sh** shell script in the Airflow environment.
- Make the DAG operational by copying it to the Airflow DAGs directory, unpausing it in the Airflow UI, and monitoring the execution.

# Airflow DAG

The **ETL_toll_data.py** script defines the DAG with sensible defaults and a clear description. 
It leverages the **BashOperator** to call the ETL script, encapsulating the logic within a managed workflow.

<img width="624" alt="Screen Shot 2024-01-26 at 3 58 42 PM" src="https://github.com/justint42/Highway-Traffic-ETL/assets/106895220/989362ee-d093-4099-9418-2c9f43e9fd11">


# Getting Operational

Once the DAG is unpaused in the Airflow UI, the pipeline is set to execute according to the defined schedule. The Airflow UI provides monitoring capabilities to ensure the ETL process is performing as expected.

<img width="1243" alt="Screen Shot 2024-01-26 at 8 26 41 PM" src="https://github.com/justint42/Highway-Traffic-ETL/assets/106895220/a82931f6-ace3-44b9-affb-83766ac55c0f">

