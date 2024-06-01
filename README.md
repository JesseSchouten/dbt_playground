# Setup

# Cheatsheet for initial setup

- sudo apt install python3-poetry
- pip install poetry
- poetry config virtualenvs.in-project true
- poetry install
- Poetry project initialize:
  - To initialize new:
    - poetry new ge_test
  - As existing project:
    - cd ge_test
    - poetry init ge_test
- poetry env use python3.10
- poetry add dbt-core=1.7
- poetry add dbt-databricks
- poetry shell

# Run dbt project

- Set the environment variables, e.g. this is how you do it on linux:
  - export databricks_pat=<databricks_pat>
  - export databricks_host=<databricks_host>
  - export databricks_http_path=<databricks_http_path>
- Add .dbt/profiles.yaml file somewhere, e.g. in the project_001 directory.
- Set .dbt file location (<https://docs.getdbt.com/docs/core/connect-data-platform/connection-profiles#advanced-customizing-a-profile-directory>)
