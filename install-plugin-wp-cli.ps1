# Import the Posh-SSH module
Import-Module Posh-SSH

# Define the sites and their respective login credentials
$sites = @(
    @{ website = "your-domain.com"; User = "ssh_username"; Password = "ssh_password" },
    @{ website = "your-domain.com"; User = "ssh_username"; Password = "ssh_password" },
    @{ website = "your-domain.com"; User = "ssh_username"; Password = "ssh_password" },
    @{ website = "your-domain.com"; User = "ssh_username"; Password = "ssh_password" },
    @{ website = "your-domain.com"; User = "ssh_username"; Password = "ssh_password" },
    @{ website = "your-domain.com"; User = "ssh_username"; Password = "ssh_password" }
)

# Commands to execute, change the --path value to the path of your files.
$command_to_run = "wp plugin install https://your-domain.com/your_filename.zip --force --path='public_html'" 

# Log file path
$logFile = "C:\temp\logfile.txt"

# Clear existing log file
Clear-Content -Path $logFile -ErrorAction SilentlyContinue

# Iterate over each site
foreach ($site in $sites) {
    $webhost = $site.website  # Corrected to use 'website'
    $user = $site.User
    $password = $site.Password

    # Convert the password to a secure string
    $securePassword = ConvertTo-SecureString $password -AsPlainText -Force

    # Create a new SSH session
    $session = New-SSHSession -ComputerName $webhost -Credential (New-Object PSCredential ($user, $securePassword)) -AcceptKey -Port 26

    if ($session) {
        try {
            # Execute commands
            $output1 = Invoke-SSHCommand -SessionId $session.SessionId -Command $command_to_run 
            
            # Log the output
            Add-Content -Path $logFile -Value "Output from $webhost :`n$output1.Output"
        } catch {
            # Log any errors
            Add-Content -Path $logFile -Value "Error executing commands on $webhost : $_`n"
        } finally {
            # Remove the SSH session
            Remove-SSHSession -SessionId $session.SessionId
        }
    } else {
        # Log if the session could not be created
        Add-Content -Path $logFile -Value "Failed to connect to $webhost`n"
    }
}

Write-Host "Execution completed. Log file created at: $logFile"
