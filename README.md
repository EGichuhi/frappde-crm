# Frappe CRM Development - Quick Start Guide

This guide will help you get up and running with our Frappe CRM development environment using VS Code and Docker.

## Initial Setup (One-Time)

1. **Install prerequisites**
   - [Docker Desktop](https://www.docker.com/products/docker-desktop)
   - [Visual Studio Code](https://code.visualstudio.com/)
   - [VS Code Remote Development Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
   - [Git](https://git-scm.com/downloads)

2. **Clone the repository**
   ```bash
   git clone https://github.com/EGichuhi/frappe-crm.git
   cd frappe-crm
   ```

3. **Start the development environment**
   ```bash
   docker-compose up -d
   ```
   This will:
   - Download required Docker images
   - Set up the Frappe environment
   - Initialize the bench and site
   - This might take 5-10 minutes on first run

4. **Open in VS Code with Remote Containers**
   ```bash
   code .
   ```
   - When prompted, click "Reopen in Container"
   - Or press F1 and select "Remote-Containers: Reopen in Container"

5. **Wait for container initialization**
   - VS Code will connect to the running container
   - The integrated terminal will be available inside the container
   - Any extensions specified in devcontainer.json will be installed

## Daily Development Workflow

1. **Start the environment** (if not already running)
   ```bash
   docker-compose up -d
   ```

2. **Open VS Code and connect to container**
   ```bash
   code .
   ```
   VS Code should automatically reconnect to the container.

3. **Pull latest changes**
   ```bash
   git pull origin develop
   ```

4. **Create or continue on a feature branch**
   ```bash
   git checkout -b feature/my-new-feature
   # or
   git checkout feature/existing-feature
   ```

5. **Start the Frappe development server** (if not already running)
   ```bash
   cd /workspace/frappe-bench
   bench start
   ```
   You can also open a new terminal in VS Code to keep the server running.

6. **Access the application**
   - Web browser: http://localhost:8000
   - Login:
     - Username: Administrator
     - Password: admin

7. **Make code changes in VS Code**
   - Changes are saved directly to your local filesystem
   - Most changes are picked up automatically by the development server

8. **Commit and push your changes**
   ```bash
   git add .
   git commit -m "feat: Add new feature"
   git push -u origin feature/my-new-feature
   ```

## Troubleshooting

- **Container not starting:**
  ```bash
  docker-compose down
  docker-compose up -d
  ```

- **VS Code not connecting to container:**
  - Try reopening VS Code
  - Check if Docker is running
  - Verify container is up: `docker-compose ps`

- **Changes not reflecting in browser:**
  - Try clearing cache: `bench --site crm.localhost clear-cache`
  - Restart the bench: `bench restart`

- **Database connection issues:**
  - Ensure MariaDB container is running
  - Check site config: `cat sites/crm.localhost/site_config.json`

## Getting Help

If you encounter issues:
1. Check the GIT-WORKFLOW.md document for collaboration help
2. Ask in the team channel on Slack
3. Reference the Frappe documentation at https://frappeframework.com/docs
