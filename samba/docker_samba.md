Give Read/Write Permissions to all folders

```bash

mkdir samba
cd samba

sudo chmod -R 777 ./adri ./javi ./shared

```

FAT32 Drive

```bash

sudo umount /media/adrian/MCBEPlay

# Replace sdX1 with your partition
sudo mount -o uid=1000,gid=1000,umask=000 /dev/sdX1 /media/adrian/MCBEPlay

```

NFTS Drive

```bash

sudo umount /media/adrian/PSX

# Replace sdY1 with your partition
sudo mount -t ntfs-3g -o uid=1000,gid=1000,umask=000 /dev/sdY1 /media/adrian/PSX

sudo chmod -R 777 /media/adrian/MCBEPlay /media/adrian/PSX

```
