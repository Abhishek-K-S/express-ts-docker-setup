# express-ts-docker-setup
# Express with TypeScript Docker Container Generator

This repository contains a Bash script that generates a Docker container for an Express server with TypeScript configurations. The script automates the process of setting up the Docker container and installs all the required libraries.

## Prerequisites

To use this script, ensure that you have the following prerequisites installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Windows users need to use git bash for methode 1. 

## Getting Started
## Method 1: Using bash script (preferred, requires rootless-docker)
1. Run the following command inside your project directory
   ```bash
   curl -fsSL https://raw.githubusercontent.com/Abhishek-K-S/express-ts-docker-setup/main/setup.sh --ssl-no-revoke | bash
   ```
2. Voila!!. Your server is already up. Server runs on port 9999 by default. happyHacking!!

## Method 2: Cloning

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/express-ts-docker-generator.git
   ```
2. Navigate to the cloned repository:
   ```bash
   cd express-ts-docker-setup
   ```
3. Run docker now
   ```bash
   docker compose up
   ```
   Initial setup might take some time.
   Once the server is up, it will be running on port number 9999.
   happyHacking!!

## Note
1. Once installed, for subsequent runs, you can run
   ```bash
   docker compose up
   ```
2. To stop the server, run:
   ```bash
   docker compose down
   ```
3. Look for docker documentation for controlling your containers.
4. For changing port numbers, edit .env file and also docker-compose.yaml port mappings
