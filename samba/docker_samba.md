Give Read/Write Permissions to all folders

```bash

mkdir samba
cd samba

sudo chmod -R 777 ./adri ./javi ./shared

```

FAT32 Drive

```bash

sudo umount /media/adrian/mcbe

# Replace sdX1 with your partition
sudo mount -o uid=1000,gid=1000,umask=000 /dev/sdX1 /media/adrian/mcbe

```

NFTS Drive

```bash

sudo umount /media/adrian/psx

# Replace sdY1 with your partition
sudo mount -t ntfs-3g -o uid=1000,gid=1000,umask=000 /dev/sdY1 /media/adrian/psx

sudo chmod -R 777 /media/adrian/mcbe /media/adrian/psx

```
