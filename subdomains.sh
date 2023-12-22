#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function for user feedback
user_feedback() {
  echo -e "\n>>> $1\n"
}

# Function to install a package
install_package() {
  package_name=$1
  user_feedback "Installing $package_name..."
  pip install "$package_name"
}

# Install necessary Python packages
user_feedback "Installing required Python packages..."
install_package "requests"
install_package "argparse"
install_package "dnspython"
install_package "geoip2"

user_feedback "Installation of Python packages completed."

# Install necessary tools if not already installed
user_feedback "Checking and installing necessary tools..."

# Install Sublist3r
if ! command_exists sublist3r; then
  install_package "sublist3r"
else
  user_feedback "Sublist3r is already installed."
fi

# Install Amass
if ! command_exists amass; then
  user_feedback "Installing Amass..."
  go get -u github.com/OWASP/Amass/v3/...
else
  user_feedback "Amass is already installed."
fi

# Install Subfinder
if ! command_exists subfinder; then
  user_feedback "Installing Subfinder..."
  GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
else
  user_feedback "Subfinder is already installed."
fi

# Install Knockpy
if ! command_exists knockpy; then
  install_package "knockpy"
else
  user_feedback "Knockpy is already installed."
fi

user_feedback "Installation of necessary tools completed."

# Take user input for the target domain
read -p "Enter the target domain: " target_domain

# Run Sublist3r
user_feedback "Running Sublist3r..."
sublist3r -d "$target_domain" -o sublist3r_output.txt
user_feedback "Sublist3r completed."

# Run Amass
user_feedback "Running Amass..."
amass enum -d "$target_domain" -o amass_output.txt
user_feedback "Amass completed."

# Run Subfinder
user_feedback "Running Subfinder..."
subfinder -d "$target_domain" -o subfinder_output.txt
user_feedback "Subfinder completed."

# Run Knockpy
user_feedback "Running Knockpy..."
knockpy "$target_domain" -o knockpy_output.txt -f json
user_feedback "Knockpy completed."

user_feedback "Subdomain enumeration finished. Check the respective output files for results."
