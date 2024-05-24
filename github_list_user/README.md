**GitHub User Access Checker Script**

This script retrieves a list of users with read access (pull access) to a specific GitHub repository using the GitHub API.

**Requirements:**

``Bash shell
curl command-line tool
jq JSON processor (optional, for enhanced output formatting)
GitHub Personal Access Token with appropriate permissions (refer to GitHub's documentation for creation)
```
**Installation:**

Save the script as ```get_github_repo_access.sh```
Make the script executable: ```chmod +x get_github_repo_access.sh```
Set environment variables (USERNAME and TOKEN) for your GitHub username and personal access token. There are two recommended approaches:
Using a .bashrc file: Add lines like these to your .bashrc file (replace <username> and <token> with your actual values):

```Bash
export USERNAME=<username>
export TOKEN=<token>
```

Then, source your .bashrc to load the variables: ```source ~/.bashrc```

Using command-line arguments: You can pass the username and token as arguments when running the script, but this approach exposes them in your command history and is less secure:

```Bash
./get_github_repo_access.sh <owner> <repo>
```
Replace <owner> with the username or organization that owns the repository.
Replace <repo> with the name of the repository.
**Output:**

The script will display one of the following messages:

If no users have read access, it will print: "No users with read access found for <owner>/<repo>."
If users have read access, it will print: "Users with read access to <owner>/<repo>:" followed by a list of usernames with read access.
