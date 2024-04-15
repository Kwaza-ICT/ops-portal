# Repository

## List members of a repository

```shell
curl -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer <github-token>" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/ORG/REPOSITORY/collaborators
```

## Delete a repository

```shell
curl -L \
    -X DELETE \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer <github-token>" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/ORG/REPOSITORY
```
