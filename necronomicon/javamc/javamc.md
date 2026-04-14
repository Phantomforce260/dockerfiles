Make sure you assign a cronjob to auto backups

```bash

crontab -e

```

Select 'vim' as your editor

```bash

0 4 * * * /home/user/dockerfiles/necronomicon/javamc/backup.sh # Or wherever the script is located. Absolute path only.

```

This is call ./backup.sh every day at 4AM.
