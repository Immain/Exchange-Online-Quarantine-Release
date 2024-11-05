# Exchange Online Quarantine Release Script

## Description

Automates the process of releasing quarantined emails from a specific sender in Exchange Online. It connects to Exchange Online, fetches quarantined messages from a designated sender, and releases them if any are found.

## Prerequisites

- PowerShell 5.1 or later
- Exchange Online PowerShell module installed
- Appropriate permissions to connect to Exchange Online and manage quarantined messages

## Setup

1. Ensure you have the Exchange Online PowerShell module installed. If not, install it using:
   ```powershell
   Install-Module -Name ExchangeOnlineManagement
   ```

2. Update the `$SenderEmail` variable with the email address of the sender whose quarantined messages you want to release.

3. Update the `-UserPrincipalName` parameter in the `Connect-ExchangeOnline` cmdlet with your Exchange Online admin account.

## Usage

1. Open PowerShell as an administrator.
2. Navigate to the directory containing the script.
3. Run the script:
   ```powershell
   .\QuarantineRelease.ps1
   ```

## Script Breakdown

- **User-defined variables:**
  - `$SenderEmail`: Specifies the sender's email address for which quarantined messages will be released.

- **Connect to Exchange Online:**
  - Imports the ExchangeOnlineManagement module.
  - Connects to Exchange Online using the specified admin account.

- **Fetch quarantined messages:**
  - Retrieves all quarantined messages from the specified sender.

- **Release quarantined emails:**
  - If quarantined emails are found, it iterates through each email and releases it.
  - If no quarantined emails are found, it displays a message.

- **Disconnect from Exchange Online:**
  - Closes the connection to Exchange Online.

## Notes

- This script will release **ALL** quarantined messages from the specified sender. Use with caution.
- Ensure you have the necessary permissions to perform these actions in your Exchange Online environment.
- It's recommended to test this script in a non-production environment first.
