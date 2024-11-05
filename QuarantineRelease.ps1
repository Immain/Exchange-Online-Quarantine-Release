# User-defined variables
$SenderEmail = @("noreply@legit-email.com")

# Connect to Exchange Online
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName "user@contoso.com"

# Fetch quarantined messages from the specified sender
$quarantinedEmails = Get-QuarantineMessage -SenderAddress $SenderEmail

# Check if there are any emails to release
if ($quarantinedEmails) {
    # Release the emails from quarantine
    foreach ($email in $quarantinedEmails) {
        Release-QuarantineMessage -Identity $email.Identity -ReleaseToAll
        Write-Host "Released email from quarantine: $($email.Identity)"
    }
} else {
    Write-Host "No quarantined emails found from $SenderEmail"
}

# Disconnect from Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
