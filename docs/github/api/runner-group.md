# Runner group

## List all the offline runner groups

```shell
curl -L \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer <github-token>" \
-H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/orgs/<org-name>/actions/runner-groups/<runner-group-number>/runners | jq '.runners | .[] | select(.status == "offline") | .id'
```

## Delete a runner from runner group

```shell
curl -L \
-X DELETE \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer <github-token>" \
-H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/orgs/<org-name>/actions/runner-groups/<runner-group-number>/runners/<runner-id>
```
