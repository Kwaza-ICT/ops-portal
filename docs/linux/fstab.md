# fstab

## Mount a EFS when machine starts using fstab

```shell
LABEL=cloudimg-rootfs	/	 ext4	defaults,discard	0 1
fs-123456.efs.eu-west-1.amazonaws.com:/ /mnt/efs nfs4 defaults,_netdev 0 0
```