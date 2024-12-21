# Clustering-data-to-unveil-Maji-Ndogo-s-water-crisis

This project is about using data to understand and solve water-related problems in Maji Ndogo. By organizing and analyzing the information, we can identify patterns and trends, such as areas with the most water challenges. The goal is to take this knowledge and turn it into practical steps to make clean water more available and accessible to everyone in the community.
![Project Overview](./images/IMG_4135.PNG)

## Project Objective


Data cleaning:

- Standardized employee email formats.
- Identified and corrected inconsistencies in phone numbers.

Data Exploration:
- Clustered data by location and source type.
- Explored queueing patterns for water collection.

Insights Generation:
- Analyzed the distribution of water sources across provinces and towns.
- Calculated the percentage of water sources in rural vs. urban areas.
- Assessed the capacity and condition of water sources.

## Data Analysis Highlights

- Key Findings
Water Source Distribution:

- 60% of water sources are located in rural areas.
- Shared taps serve 43% of the population, with an average of 2,000 users per tap.
  
Infrastructure Challenges:

- 31% of people have taps at home, but 45% of these are non-functional due to infrastructure issues.
- Only 28% of wells provide clean water.
  
Queue Analysis:

- Average queue time for water collection: 123 minutes.
- Queue times vary significantly by day and source.

##  Recommendations

- Prioritize Repairs: Focus on shared taps and high-capacity water sources.
- Data-Driven Ranking: Use SQL ranking functions to guide repair efforts.

## Database Structure

The project uses the following tables:

- **`visits`**: Contains information on visits to each water source, including queue times and assigned employees.
- **`employee`**: contains information of employee details including IDs, address and phone number.
- **`water_source`**: Stores metadata on each water source, including type and population served.
- **`location`**: Stores location-specific information, including town, province, and address.

## Key Features

1. **Project Tracking**: Automatically updates Employee details including emails and phone number.
2. **Employee Performance**: Checked for employees with the highest number of location visits
3. **Infrastructure Recommendations**: Generates specific infrastructure improvement actions based on data (e.g., installing additional taps for long queues).

## How to Run the Project

1. Import the SQL files provided in the `/sql` directory.
2. Populate the database with sample data, following the instructions in `data_loading.sql`.
3. Execute the query files to generate views, track progress, and analyze data.

## Access the Full Documentation

Dataset was provided by ALX [project documentation](https://alx.com).
