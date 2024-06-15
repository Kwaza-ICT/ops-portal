# Alias

## kubectl

### Get all contexts
```
alias get-context="kubectl config get-contexts"
```

### Use a specific context

```
alias context-tt="kubectl config use-context arn:aws:eks:<region>:<account>:cluster/<name cluster>"
```

### Open idea folder on MAC

```
alias idea=’open -a “`ls -dt /Applications/IntelliJ\ IDEA*|head -1`“’
```
