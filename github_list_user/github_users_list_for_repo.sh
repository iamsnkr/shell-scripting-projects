#!/bin/bash
#########################
# Author: Kedhar
# Date: 24-May-2024
#
# Version: v1
# Get the list of people who have access to particular git hub repo 
# and using shell script 
# with git hub integration
#########################
# Function to retrieve collaborators with pull access for a GitHub repository
get_github_api() {
  # Validate the number of arguments passed
  if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <owner> <repo>"
    exit 1
  fi

  local owner="$1"
  local repo="$2"

  # Construct the API endpoint URL
  local final_endpoint="${API_URL}/repos/${owner}/${repo}/collaborators"

  echo "** Before CURL Response **"

  # Capture curl output in a temporary variable
  # $username:$token are env variables
  # which are exported in **source ~/.bashrc**
  local curl_output=$(curl -s -u "$username:$token" "$final_endpoint")

  # Check for curl errors (optional)
  if [[ $? -ne 0 ]]; then
    echo "Error during curl operation"
    exit 1
  fi

  # Process the output using jq
  local logins=$(echo "$curl_output" | jq -r '.[] | select(.permissions.pull == true) | .login')

  # Display the list of collaborators with read access
  if [[ -z "$logins" ]]; then
    echo "No users with read access found for ${owner}/${repo}."
  else
    echo "** Users with read access to ${owner}/${repo}: **"
    echo "$logins"
  fi
}


# Call the function with owner and repo as arguments
get_github_api
