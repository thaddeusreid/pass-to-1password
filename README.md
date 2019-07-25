# pass-to-1password
import your passwords from pass (password-store) to 1Password.

`./index.sh` will generate a CSV ready to be imported to 1Password as a "Login" type. The path of the password-store GPG file will become the title of the 1Password entry. The first line of the file is the password. Any other data in the GPG file will be stored under "Notes".

See the [1Password Docs](https://support.1password.com/import/) for steps on how to import.

Note: Any values in your password-store GPG file with double-quotations (`"`) will cause the import to 1Password to fail. I manually imported those entries, since it was quicker than finding a work-around.
