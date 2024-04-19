# Use this file to scan directory trees for sensitive information prior to committing to a public repo.
# Once you know where the info is, you can correct the necessary issues by changing or removing the data
# or adding entire files to your .gitignore

import os
import re
import logging
from logging.handlers import RotatingFileHandler
from datetime import datetime
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

# Initialize Global Variables
LOG_FILE_NAME = 'sensitive_data_scan.log'
# Set this to the admin's email, or leave it as '' to disable email notifications
ADMIN_EMAIL = ''
SENDERS_EMAIL = 'calicci.gardachi@gmail.com' 
SENDERS_PWORD = '' 

# Initialize Global Counter
# Initialize the total files counter
total_files = 0
# Initialize the sensitive info counter
sens_info_count = 0    

# Set up a rotating log handler
# Upon initial execution of the script, it writes the results to a log file and stores it in 
# the same directory.
# RotatingFileHandler as configured in the first line of code below, allows for scan info to be 
# appended to the log file on subsequent scans till the file reaches 2MB in size. 
# Then it will start a new log file with a total of 5 files for a total 
# of 10MB of logged data if required. Adjust as necessary depending on your needs.
log_handler = RotatingFileHandler(LOG_FILE_NAME, maxBytes=2*1024*1024, backupCount=5)
log_handler.setFormatter(logging.Formatter('%(asctime)s %(message)s', datefmt='%Y-%m-%d %H:%M:%S'))

logger = logging.getLogger()
logger.setLevel(logging.INFO)
logger.addHandler(log_handler)

# Regex patterns for detecting sensitive information
regex_patterns = {
    # Your patterns here
    'API Key': r'(?i)(apikey|api_key|access_key|secret_key)\s*[:=]\s*\S+',
    'Email Address': r'[\w.-]+@[\w.-]+\.\w+',
    'URL': r'https?://\S+',
    'Database connection strings': r'db:\/\/[^\s]+',
    'AWS credentials': r'(AWS|aws|Aws)?[_]?[A-Za-z0-9]{20}(:|_)[A-Za-z0-9]{40}',
    'SSH Public Key': r'ssh-(rsa|ed25519)|ecdsa-sha2-nistp[0-9]+',
    'SSH Private Key': r'-----BEGIN (RSA|DSA|EC|OPENSSH) PRIVATE KEY-----',
    # Matches strings of hex characters that are at least 16 chars long
    'Hex Encoded Blob': r'(?:[0-9a-fA-F]{2}){16,}',
    # Various forms of PII
    'Common Phone Number Patterns': r'\b(\d{3}[-.\s]??\d{2}[-.\s]??\d{4}|\(\d{3}\)\s*\d{3}[-.\s]??\d{4}|\d{3}[-.\s]??\d{4})\b',
    'SSN': r'\b\d{3}-\d{2}-\d{4}\b',
    'Drivers License (varies by state)': r'[A-Z]{1}\d{6,8}',
    'Passport Numbers (format varies, typically alphanumeric)': r'[A-Z]{1}\d{8}',
    'Credit Card Numbers (16 digit, Visa/MC)': r'\b\d{4}[ -]?\d{4}[ -]?\d{4}[ -]?\d{4}\b',
    'Credit Card Numbers (15 digit, AmEx)': r'\b3[47]\d{2}[ -]?\d{6}[ -]?\d{5}\b',
    'US Address (simple example)': r'\b\d+\s+\w+\s+\w+\b',
    'US Birthdate (MM/DD/YYYY format)': r'\b(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])/((19|20)\d{2})\b' 
}

def log_results(root_dir, filepath, line_num=None, data_type=None):
    # Declare num_sensitive_info as a global variable
    global sens_info_count

    # Make the file path relative to the root directory
    relative_path = os.path.relpath(filepath, start=root_dir)

    if line_num and data_type:
        logger.info(f'Scanned {relative_path}: Potentially sensitive')
        logger.info(f'{data_type} found on line {line_num}')
        # Increment sens_info_count
        sens_info_count += 1  
    else:
        logger.info(f'Scanned {relative_path}: Clean')

def find_sensitive_info(root_dir):
    # Access the global total_files variable
    global total_files
    # Log the start of the scan
    logger.info("Sensitive data scan started.")
    # Add the log file path
    # log_file_path = os.path.join(root_dir, 'sensitive_data_scan.log')
    for dirpath, dirnames, filenames in os.walk(root_dir):
        # Skip .git directories
        # The dirnames[:] = [d for d in dirnames if d != '.git'] line modifies the dirnames list 
        # in-place to exclude any .git directories from further traversal. 
        # This prevents descending into .git directories during the walk.
        dirnames[:] = [d for d in dirnames if d != '.git']

        for index, filename in enumerate(filenames):
            filepath = os.path.join(dirpath, filename)
            # Check for and skip the log file
            if filepath.endswith(LOG_FILE_NAME):  
                continue
            # Skip any remaining .git related files if they exist outside the standard .git directory
            # The if '.git' in filepath: check skips over any files that have .git in their path, 
            # including those within .git directories that might have been directly specified 
            # or any git-related files that exist outside the standard structure.
            if '.git' in filepath:
                continue

            found_sensitive_info = False
            try:
                with open(filepath, 'r', errors='ignore') as file:
                    for i, line in enumerate(file, 1):
                        for data_type, pattern in regex_patterns.items():
                            if re.search(pattern, line, re.IGNORECASE):
                                log_results(root_dir, filepath, i, data_type)
                                found_sensitive_info = True
            
            except Exception as e:
                logger.error(f'Error scanning file {filepath}: {e}', exc_info=True)
            
            if not found_sensitive_info:
                log_results(root_dir, filepath)
            
            # Increment total_files counter
            total_files += 1
            
            # Check if this is the last file
            if index == len(filenames) - 1:
                # Log a progress indicator that this is the last file
                logger.info(f"{total_files} files successfully scanned. Scanning now complete.")
            
            # Check if this is the first file
            else:
                if total_files == 1:
                    # Log a progress indicator that this is the first file
                    logger.info(f"{total_files} file successfully scanned. Moving to the next file...")
                else:
                    # Log a progress indicator that this is every other file except the first and the last
                    logger.info(f"{total_files} files successfully scanned. Moving to the next file...")

def send_email(subject, body):
    if ADMIN_EMAIL:
        msg = MIMEMultipart()
        msg['From'] = SENDERS_EMAIL
        msg['To'] = ADMIN_EMAIL
        msg['Subject'] = subject

        msg.attach(MIMEText(body, 'plain'))
        # Update with your SMTP server details
        server = smtplib.SMTP('smtp.example.com', 587)
        server.starttls()
        # Your login credentials from Global Variables above
        server.login(SENDERS_EMAIL, SENDERS_PWORD)
        text = msg.as_string()
        # Senders and Admin email addresses from Global Variables above
        server.sendmail(SENDERS_EMAIL, ADMIN_EMAIL, text)
        server.quit()

def main(root_directory):
    # capture the start_time for logging to console
    start_time = datetime.now()
    # execute the scan
    find_sensitive_info(root_directory)
    # capture the end_time for logging to console
    end_time = datetime.now()
    # calculate duration for logging to console
    duration = end_time - start_time
    # craft the completion message
    completion_message = f"Script completed successfully in {duration.total_seconds()} seconds."
    # log message to console to inform user of completion and duration
    print(completion_message)
    # Log the number of files scanned
    logger.info(f"Total number of files scanned: {total_files}")
    # Log the number of potential issues found
    logger.info(f"Number of potentially sensitive information items found: {sens_info_count}")
    # log message to file for durable record
    logger.info(completion_message)
    # Send email notification if ADMIN_EMAIL is set
    send_email("Sensitive Info Scan Completed", completion_message)

if __name__ == '__main__':
    # Insert a visual break/new scan header in the log file
    logger.info("\n\n----- New scan started on {} -----".format(datetime.now().strftime("%Y-%m-%d %H:%M:%S")))

    # Query user for path to directory to scan
    # root_directory = input("Enter the directory path to scan: ")
    
    # Prompt the user for a directory path or use the current directory as the default
    root_directory = input("Enter the directory path to scan (leave blank to scan the current directory): ").strip()
    # If the user enters an empty string, use the current directory
    if not root_directory:
        # Get the current working directory
        root_directory = os.getcwd()
    
    # Call the main function to execute the scan
    main(root_directory)
