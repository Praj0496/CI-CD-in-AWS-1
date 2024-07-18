#!/bin/bash

# Start the Apache server
sudo systemctl start apache2

# Enable Apache to start on boot
sudo systemctl enable apache2

# Print a success message
echo "Apache server started and enabled to start on boot."
