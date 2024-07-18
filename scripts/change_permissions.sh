#!/bin/bash

# Set the permissions for directories to 755 (rwxr-xr-x)
sudo chmod -R 755 /var/www/html/

# Set the permissions for files to 644 (rw-r--r--)
sudo chown -R www-data:www-data /var/www/html/

# Print a success message
echo "Permissions have been successfully changed."