# Solution 1 - Bash CSV ETL Pipeline Automation for CDE 
The [solution](https://github.com/Choiceugwuede/CDE_ASSIGNMENT_SUBMISSION/blob/main/Scripts/Bash-Scripts/Bash-ETL/ETL.sh
) is designed to automate the extraction and transformation of CSV file from online source.

The final, cleaned file is then saved into a "Gold" folder, ready for further processing.

<img width="2324" height="964" alt="image" src="https://github.com/user-attachments/assets/8d5c58b5-a13e-427a-92de-2674a6680ac3" />


### Features
- Fully automated via cron on Ubuntu
- Written in Bash with zero dependencies
- All outputs logged for troubleshooting
- Scheduled to run 12am daily 

# Solution 3 - Bash multiple file transfers

This [solution](https://github.com/Choiceugwuede/CDE_ASSIGNMENT_SUBMISSION/blob/main/Scripts/Bash-Scripts/file_transfer.sh) is a simple script to automate the transfer of multiple files between folders.

# Solution 4 - ETL automation 
This [solution](https://github.com/Choiceugwuede/CDE_ASSIGNMENT_SUBMISSION/blob/main/Scripts/Bash-Scripts/Parch-Posey-ETL/ETL.sh) automates the extraction of multiple CSV files from online source into Postgres Database.

### Features
- Downloads multiple files from Github raw URLs
- Copys CSV into Postgres Tables
- Existing files are removed before download to ensure a fresh load.
- Ensures fresh loads by truncating tables before inserting new data.

### Requirements
- Docker (Postgres is running in container)







