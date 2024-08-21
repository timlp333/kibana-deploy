# Kibana Installation Batch Script

This batch script automates the installation and configuration of Kibana on multiple remote hosts. The script performs the following tasks for each host listed in `hosts.txt`:

1. Uploads the Kibana tarball.
2. Uploads and executes a series of shell scripts (`step1.sh`, `step2.sh`, `step3.sh`).
3. Uploads the `kibana.yml` configuration file.
4. Uploads the SSL certificates.
5. Uploads the `kibana.service` systemd service file.

## Prerequisites

- Ensure `pscp.exe` and `plink.exe` are available in your PATH.
- Create a `hosts.txt` file with the list of target hostnames or IP addresses.
- Prepare the following files in the same directory as the batch script:
  - `kibana-8.15.0-linux-x86_64.tar.gz`
  - `step1.sh`
  - `step2.sh`
  - `step3.sh`
  - `kibana.yml`
  - `certs.tar.gz`
  - `kibana.service`

## Usage

1. Open a command prompt.
2. Navigate to the directory containing the batch script and the required files.
3. Run the batch script:
   Installkibana.bat