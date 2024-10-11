#!/bin/bash

# Determine the user's shell
SHELL_TYPE=$(basename "$SHELL")

# Define the alias command
ALIAS_COMMAND='alias koii-task="npx @_koii/create-task-cli@latest"'

# Function to add alias to the appropriate shell config file
add_alias() {
    local config_file="$1"
    if ! grep -q "$ALIAS_COMMAND" "$config_file"; then
        echo "$ALIAS_COMMAND" >> "$config_file"
        echo "Alias added to $config_file. Please restart your terminal or run 'source $config_file' to apply changes."
    else
        echo "Alias already exists in $config_file."
    fi
}

# Add alias to the appropriate configuration file
case "$SHELL_TYPE" in
    bash)
        add_alias "$HOME/.bashrc"
        ;;
    zsh)
        add_alias "$HOME/.zshrc"
        ;;
    *)
        echo "Unsupported shell: $SHELL_TYPE. Please add the alias manually."
        ;;
esac
