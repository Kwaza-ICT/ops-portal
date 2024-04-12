# How to do a minor upgrade

## How to add Gitlab repository into ubuntu

```shell
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
```

### Check status of all services gitlab

```shell
sudo gitlab-ctl status
```

### Run a update before list packages

```shell
apt update
```

### Check all the available versions

```shell
apt list -a | grep gitlab-ce
```

### Check version available for upgrade

```shell
apt list --upgradable | grep gitlab
```

### Upgrade to specific version (my case 13.12.15)

```shell
apt install gitlab-ce=13.12.15-ce.0
```
