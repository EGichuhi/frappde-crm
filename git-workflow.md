# Git Workflow for Frappe CRM Team

This document outlines our Git workflow for collaborative development on the Frappe CRM project.

## Repository Setup

Our project uses a Git repository with Docker and VS Code Remote Containers for development. This ensures consistency across all team members' environments.

## Git Configuration

When you first open the project in VS Code's Dev Container, Git is already configured to work well with VS Code. You should set your user information:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Branching Strategy

We follow a simplified Git Flow model:

- `main` - Production-ready code
- `develop` - Integration branch for completed features
- Feature branches - Individual features (from `develop`)
- Hotfix branches - Urgent fixes (from `main`)

## Daily Workflow

### Starting Your Day

```bash
# Pull the latest changes
git checkout develop
git pull origin develop

# Create a new feature branch (if starting new work)
git checkout -b feature/descriptive-name

# OR continue on your existing branch
git checkout feature/your-feature
git pull origin feature/your-feature  # If others might have pushed to it
```

### During Development

1. **Make small, focused commits**
   ```bash
   git add .  # Or specific files: git add file1.py file2.py
   git commit -m "feat: Add customer filtering capability"
   ```

2. **Use descriptive commit messages with prefixes**
   - `feat:` - New feature
   - `fix:` - Bug fix
   - `docs:` - Documentation changes
   - `style:` - Formatting changes
   - `refactor:` - Code restructuring
   - `test:` - Adding/updating tests
   - `chore:` - Maintenance tasks

3. **Push your changes regularly**
   ```bash
   # First push of a new branch
   git push -u origin feature/your-feature
   
   # Subsequent pushes
   git push
   ```

### Pull Requests

1. **Create a Pull Request on GitHub**
   - Base: `develop`
   - Compare: `feature/your-feature`
   - Title: Brief description of changes
   - Description: More detailed explanation and context

2. **Request reviews from teammates**
   - Assign at least one reviewer
   - Provide testing instructions if necessary

3. **Address feedback**
   - Make requested changes
   - Push additional commits
   - Respond to comments

4. **Merging**
   Once approved, the PR can be merged using the GitHub interface.

## Keeping Up-to-Date

If your feature branch falls behind develop:

```bash
# Update develop first
git checkout develop
git pull origin develop

# Update your feature branch
git checkout feature/your-feature
git merge develop

# Resolve any conflicts
# Test that everything still works

# Push the updated branch
git push
```

## Handling Merge Conflicts

1. **In VS Code**
   - Conflicts are highlighted with conflict markers
   - VS Code provides UI for resolving conflicts
   - Choose "Accept Current Change", "Accept Incoming Change", "Accept Both Changes", or edit manually

2. **After resolving**
   ```bash
   git add .  # Add the resolved files
   git commit -m "merge: Resolve conflicts with develop"
   git push
   ```

## Best Practices

1. **Pull before starting work each day**
2. **Keep feature branches short-lived** (1-3 days ideally)
3. **Write meaningful commit messages**
4. **Push your work at the end of each day**
5. **Review PRs promptly**
6. **Update your feature branch regularly**
7. **Test before pushing changes**

By following this workflow, we can maintain a clean repository and collaborate effectively as a team.
