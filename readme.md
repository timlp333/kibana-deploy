# Elasticsearch Installation Batch Script

This batch script automates the installation and configuration of Elasticsearch on multiple remote hosts. The script performs the following tasks for each host listed in the `hosts.txt` file:

1. Uploads the Elasticsearch tar.
2. Uploads and executes the initial setup script (`step1.sh`).
3. Uploads the Elasticsearch configuration file (`elasticsearch.yml`).
4. Uploads the SSL certificates (`certs.tar.gz`).
5. Uploads and executes the secondary setup script (`step2.sh`).
6. Uploads the Elasticsearch service configuration (`elasticsearch.service`).
7. Uploads and executes the final setup script (`step3.sh`).

## Prerequisites

- Ensure `pscp.exe` and `plink.exe` are available in your system's PATH.
- Create a `hosts.txt` file in the same directory as the batch script, listing the IP addresses or hostnames of the target machines, one per line.
- Ensure the following files are present in the same directory as the batch script:
  - `elasticsearch-<VERSION>-linux-x86_64.tar.gz`
  - `step1.sh`
  - `elasticsearch.yml`
  - `certs.tar.gz`
  - `step2.sh`
  - `elasticsearch.service`
  - `step3.sh`

## Usage

1. Open a command prompt.
2. Navigate to the directory containing the batch script and the required files.
3. Run the batch script:
   ```
   InstallElasticsearch.bat