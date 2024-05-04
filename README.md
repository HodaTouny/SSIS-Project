# SSIS Project

## Introduction
This project aims to demonstrate the implementation of various data warehouse tasks using Microsoft SQL Server Integration Services (SSIS) and SQL Server. It includes solutions for consuming a REST API, implementing Slowly Changing Dimension (SCD) Type 4, versioning data loading, and transforming attendance device data into a more usable format.


## Task Descriptions
1. **Consume REST API and Load Data to Database**:
   - Utilized a script task in SSIS with C# to interact with a REST API and retrieve data.
   - Loaded the required fields into a database table using SSIS components.

2. **Implement Slowly Changing Dimension (SCD)**:
   - Designed and implemented an SCD Type 4  to track historical changes in employee data.
   - Utilized triggers in SQL Server to capture changes to the history table and update it accordingly.
   
3. **Load Source Data with Versioning**:
   - Source data from table is loaded into a target table with versioning.
   -  Each run on the same day closes old records and creates new ones with an incremented version number, On the next day, the process resets with version 1.

4. **Transform Employee Attendance Data and Add State**:
   - Extracted data from an employee attendance device table.
   - Transformed the raw attendance data into a structured format.
   - Added a state column to categorize each attendance record.

## Prerequisites
- Microsoft SQL Server
- Visual Studio & SSIS

## Setup Instructions
1. **Database Setup**:
   - Create a new database in SQL Server to store the project data.
   - Execute the SQL scripts provided in the `Sql_queries` File to create the necessary tables and schemas.

2. **Configuration**:
   - Adjust any package configurations or parameters as needed for your environment.
 

