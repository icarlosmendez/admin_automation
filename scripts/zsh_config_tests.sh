#!/bin/bash

# Define paths to original and temporary files
ORIGINAL_ZSHRC="$HOME/.zshrc"
ORIGINAL_ZSHENV="$HOME/.zshenv"
TEMP_DIR="/tmp/zsh_config_tests"
TEMP_ZSHRC="$TEMP_DIR/.zshrc"
TEMP_ZSHENV="$TEMP_DIR/.zshenv"

# Create temporary directory if it doesn't exist
mkdir -p "$TEMP_DIR"

# Copy original files to temporary directory
cp "$ORIGINAL_ZSHRC" "$TEMP_ZSHRC"
cp "$ORIGINAL_ZSHENV" "$TEMP_ZSHENV"

# Test function to check configurations
test_configurations() {
    echo "Testing configurations..."
    
    # Source temporary .zshrc and .zshenv files
    source "$TEMP_ZSHRC"
    ZDOTDIR="$TEMP_DIR" zsh -c "source $TEMP_ZSHENV"

    # Add additional tests here as needed
    
    # Example: Check if PATH contains expected directories
    if [[ ":$PATH:" != *":/usr/local/bin:"* ]]; then
        echo "ERROR: /usr/local/bin is not included in PATH"
        return 1
    fi
    
    # Add more tests for other configurations
    
    # All tests passed
    echo "All tests passed successfully!"
    return 0
}

# Run test configurations function and capture exit code
test_configurations

# Check exit code to determine success or failure
if [ $? -ne 0 ]; then
    echo "Some tests failed. Please review the temporary configurations in $TEMP_DIR."
else
    echo "All tests passed successfully. You can proceed with applying changes system-wide."
fi
