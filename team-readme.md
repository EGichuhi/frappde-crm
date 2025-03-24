# Frappe CRM Development Environment

This repository contains a containerized development environment for our Frappe CRM project, configured for seamless VS Code integration.

## Getting Started

### Prerequisites
- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/downloads)
- [Visual Studio Code](https://code.visualstudio.com/)
- [VS Code Remote Development Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/username/frappe-crm.git
   cd frappe-crm
   ```

2. **Start Docker containers**
   ```bash
   docker-compose up -d
   ```

3. **Open with VS Code Dev Containers**
   - Open VS Code
   - Press F1 and select "Remote-Containers: Open Folder in Container..."
   - Select the project directory
   - VS Code will reopen connected to the development container

   Alternatively, from the command line:
   ```bash
   code --remote-container .
   ```

4. **Work with the project**
   - All changes are automatically synced to your local filesystem
   - Use the Terminal in VS Code to run Frappe bench commands
   - Access the application at http://localhost:8000

### Daily Workflow

1. **Pull latest changes**
   ```bash
   git pull origin main
   ```

2. **Start or update containers**
   ```bash
   docker-compose up -d
   ```

3. **Open VS Code and connect to container**
   - VS Code will remember your last connection and reconnect automatically

4. **Create a feature branch**
   ```bash
   git checkout -b feature/my-new-feature
   ```

5. **Make and test your changes**
   - All your work is inside the container, but synced to your local filesystem

6. **Commit and push changes**
   ```bash
   git add .
   git commit -m "Add my new feature"
   git push origin feature/my-new-feature
   ```

7. **Create a pull request on GitHub**

### Troubleshooting

- **Container not starting:**
  ```bash
  docker-compose down
  docker-compose up -d
  ```

- **VS Code not connecting:**
  - Try restarting VS Code
  - Check Docker is running
  - Run `docker-compose ps` to verify containers are up

- **Sync issues:**
  - Check file permissions in the container and local filesystem
