# 🚀 WordPress WP-CLI-bulk plugin install
This PowerShell script will bulk install 1 plugin on a list of websites using SSH and the WP CL

The purpose of this script will be to upload something like a custom plugin and distribute this over your websites.
You will need to the enter the IP or domainname and SSH credentials.
The script to SSH into each website, install the plugin and write to the logfile.

This module is using PoshSSH to connect

## ⚙️ How to install
1. Download the script
2. Change the script to your desired websites and change the .ZIP url
3. Change the path of the .TXT file where your log will be
4. Download & Import PoshSSH (Install-Module -Name Posh-SSH -Force -AllowClobber and Import-Module Posh-SSH)
5. Run the powershell script as Administrator and let the magic do the work.
It will create a output file named unifi_log.txt to tell you the output of the SSH command

## 💬 Support
This script comes with no support what so ever, but i'm happy to help if you have questions or need custom functions.
