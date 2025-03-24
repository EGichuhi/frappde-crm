# Git Workflow for Team Development

## Initial Repository Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/username/frappe-crm.git
   cd frappe-crm
   ```

2. **Set up Git identity (if not already configured)**
   ```bash
   git config user.name "Your Name"
   git config user.email "your.email@example.com"
   ```

## Branching Strategy

We use a simplified Git Flow strategy:

- `main` - Production-ready code
- `develop` - Integration branch for completed features
- Feature branches - Individual features (branch from `develop`)

### Working on Features

1. **Always start from an updated develop branch**
   ```bash
   git checkout develop
   git pull origin develop
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/descriptive-feature-name
   ```

3. **Commit changes regularly with meaningful messages**
   ```bash
   git add .
   git commit -m "feat: Add specific functionality"
   ```

4. **Push your branch to GitHub**
   ```bash
   git push -u origin feature/descriptive-feature-name
   ```

5. **Create a Pull Request on GitHub**
   - Navigate to the repository on GitHub
   - Click "Pull requests" > "New pull request"
   - Set the base branch to `develop` and compare branch to your feature branch
   - Fill in the PR template and submit

## Handling Updates from Teammates

1. **Update your local repository**
   ```bash
   git fetch origin
   ```

2. **If you need changes from develop while working on a feature**
   ```bash
   git checkout feature/your-feature
   git merge origin/develop
   # Resolve any conflicts
   git add .
   git commit -m "merge: Incorporate updates from develop"
   ```

## Container Management with Git

- The Docker-related files are versioned in Git
- Local development data (in volumes) is not versioned
- Database changes are managed through Frappe migrations

## Best Practices

1. **Pull before starting work each day**
2. **Commit often with clear messages**
3. **Push your feature branch at the end of each workday**
4. **Create small, focused pull requests**
5. **Request code reviews from teammates**
