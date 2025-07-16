#!/bin/bash
if command -v yazi &> /dev/null; then
    ya pkg add yazi-rs/plugins:full-border
    ya pkg add yazi-rs/flavors:catppuccin-frappe
else
    echo "Please install yazi"
fi
