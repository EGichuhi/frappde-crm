#!/bin/bash

# Exit on error
set -e

echo "Setting up Frappe CRM development environment..."

if [ -d "/home/frappe/frappe-bench/apps/frappe" ]; then
    echo "Bench already exists, skipping init"
    cd frappe-bench
else
    echo "Creating new bench..."
    
    # Initialize bench
    bench init --skip-redis-config-generation frappe-bench
    cd frappe-bench
    
    # Configure bench to use Docker containers
    bench set-mariadb-host mariadb
    bench set-redis-cache-host redis:6379
    bench set-redis-queue-host redis:6379
    bench set-redis-socketio-host redis:6379
    
    # Remove redis, watch from Procfile
    sed -i '/redis/d' ./Procfile
    sed -i '/watch/d' ./Procfile
    
    # Get the CRM app
    bench get-app crm --branch develop
    
    # Create new site
    bench new-site crm.localhost \
        --force \
        --mariadb-root-password 123 \
        --admin-password admin \
        --no-mariadb-socket
    
    # Install and configure
    bench --site crm.localhost install-app crm
    bench --site crm.localhost set-config developer_mode 1
    bench --site crm.localhost clear-cache
    bench --site crm.localhost set-config mute_emails 1
    bench use crm.localhost
    
    echo "Frappe bench setup complete!"
fi

# Set up VS Code dev container environment if running in container
if [ -d "/.dockerenv" ]; then
    echo "Setting up VS Code server environment..."
    
    # Install development tools that might be needed
    apt-get update && apt-get install -y \
        git \
        vim \
        curl \
        python3-pip \
        build-essential \
        python3-dev \
        libffi-dev
    
    # Install Python tools for development
    pip3 install pylint black flake8
    
    # Set git config for better VS Code integration
    git config --global core.editor "code --wait"
    git config --global diff.tool "vscode"
    git config --global difftool.vscode.cmd "code --wait --diff \$LOCAL \$REMOTE"
    
    echo "VS Code environment setup complete!"
fi

# Start bench development server
echo "Starting Frappe development server..."
bench start