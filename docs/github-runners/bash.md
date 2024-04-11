## How to remove offline runners

```shell
#!/usr/bin/env bash

response=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <your temp token>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/orgs/<org-name>/actions/runner-groups/<runner-group-id>/runners | jq '.runners | .[] | select(.status == "offline") | .id')

# Check if the response is not empty
if [ -n "$response" ]; then
    # Loop over each line of the response
    while IFS= read -r line; do
        # Process each line (replace this with your own logic)
        echo "Received: $line"
        curl -L \
          -X DELETE \
          -H "Accept: application/vnd.github+json" \
          -H "Authorization: Bearer <your temp token>" \
          -H "X-GitHub-Api-Version: 2022-11-28" \
          https://api.github.com/orgs/<org-name>/actions/runner-groups/<runner-group-id>/runners/$line
    done <<< "$response"
else
    echo "Empty response received."
fi
```
