# passToBitwarden
[ZX2C4 pass standard linux password manager](https://www.passwordstore.org/) to [Bitwarden](https://bitwarden.com/) (CSV) converter  
Converts password files (*.gpg) from ZX2C4 pass standard linux password manager [https://www.passwordstore.org/](https://www.passwordstore.org/)
in the current folder and subfolders in to csv output.  

### Usage
Uses the pass executable for decrypting the files,  so make sure you have it installed.  
The csv has the Bitwarden format (folder,favorite,type,name,notes,fields,login_uri,login_username,login_password,login_totp)  

### Status
Works but treats a big part of the output as notes in Bitwarden,  
so some manual cleanup is required after importing in to bitwarden

