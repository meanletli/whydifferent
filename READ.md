Subdomain Enumeration Script

This Bash script automates the process of subdomain enumeration using various tools, including Sublist3r, Amass, Subfinder, and Knockpy. The script checks for the availability of required dependencies and installs them if necessary. After installation, it prompts the user for the target domain and runs each subdomain enumeration tool, saving the results to corresponding output files.
Prerequisites

Ensure that the following dependencies are installed and available in your PATH:

    pip
    go
    git

Installation of Python Packages

The script installs the following Python packages using pip:

    requests
    argparse
    dnspython
    geoip2

Installation of Tools

The script checks for the presence of the following tools and installs them if not already installed:

    Sublist3r
    Amass
    Subfinder
    Knockpy

Usage

    Run the script:

    bash

    ./subdomains.sh

    Enter the target domain when prompted.

    The script will run Sublist3r, Amass, Subfinder, and Knockpy sequentially, saving the results to respective output files.

    Check the output files (sublist3r_output.txt, amass_output.txt, subfinder_output.txt, knockpy_output.txt) for subdomain enumeration results.

Notes

    Ensure that you have the necessary permissions to install packages and tools.
    Adjust the script or install additional tools based on your specific requirements.

Feel free to customize the script to suit your needs or integrate it into your reconnaissance workflow. Subdomain enumeration results can be crucial for understanding the attack surface of a target domain.
