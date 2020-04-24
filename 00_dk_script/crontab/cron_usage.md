####################
## 4. Cron Script
####################

### Reference
https://lunightstory.tistory.com/8
https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-ubuntu-1804


### Basic Info
- Cron is a time-based job scheduling daemon found in Unix-like operating systems
- Cron runs in the background and tasks scheduled with cron, referred to as “cron jobs,
- Cron jobs are recorded and managed in a special file known as a crontab.

- User 별 계정 사용 or /etc/crontab
- cron script 주의사항 : 현재 디렉토리(user hoem), 환경변수 (PATH, SHELL)


```
# Linux: crond
# FreeBSD: cron

# path: /etc/crontab
# =>
# The periodic and atrun jobs have moved to launchd jobs
# See /System/Library/LaunchDaemons
#
    # minute	hour	mday	month	wday	who	command

# edit mode: $ crontab -e
# ex)
# 0 1 * * * /usr/bin/command

# list: $ crontab -l
# remove: # crontab -r
```
```
# crontab path by user
# Linux: /var/spool/cron/USERNAME
# FreeBSD: /var/cron/tabs/USERNAME
```
```
# cron manual
# $ man 1 crontab: command for user management
# $ man 5 crontab: crontab definition
# man cron: describe cron daemon
```

### How to enable cron
```
$ sudo apt install cron
$ sudo systemctl enable cron
Synchronizing state of cron.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable cron
```

### How to edit
```
// case-1
crontab -e

// case-2
crontab -l > crontab_my
vim crontab_my
crontab crontab_my
```

### How to check crontab log
```
// Case-1
$ cat /var/log/syslog | grep CRON

// Case-2
// Set below
$ cat /etc/rsyslog.d/50-default.conf  | grep cron
#cron.*                 /var/log/cron.log
sudo service rsyslog restart

$ cat /var/log/cron.log
...
Apr 22 23:08:24 dk-VirtualBox crontab[4419]: (dk) REPLACE (dk)
Apr 22 23:08:37 dk-VirtualBox crontab[4421]: (dk) LIST (dk)
Apr 22 23:09:01 dk-VirtualBox cron[459]: (dk) RELOAD (crontabs/dk)
Apr 22 23:09:01 dk-VirtualBox CRON[4436]: (dk) CMD (/home/dk/myShell/book_unix-linux-shellscript/0_dk/cron_test.sh)
Apr 22 23:09:01 dk-VirtualBox CRON[4437]: (dk) CMD (/tmp/cron_test.sh)
Apr 22 23:10:01 dk-VirtualBox CRON[4450]: (dk) CMD (/home/dk/myShell/book_unix-linux-shellscript/0_dk/cron_test.sh)
Apr 22 23:10:01 dk-VirtualBox CRON[4451]: (dk) CMD (/tmp/cron_test.sh)
Apr 22 23:11:01 dk-VirtualBox CRON[4456]: (dk) CMD (/home/dk/myShell/book_unix-linux-shellscript/0_dk/cron_test.sh)
Apr 22 23:11:01 dk-VirtualBox CRON[4458]: (dk) CMD (/tmp/cron_test.sh)
```

### How to check crontab config

```
$ crontab -l
$ sudo cat /var/spool/cron/crontabs/dk

# DO NOT EDIT THIS FILE - edit the master and reinstall.
# (crontab_my installed on Wed Apr 22 22:57:43 2020)
# (Cron version -- $Id: crontab.c,v 2.13 1994/01/17 03:20:37 vixie Exp $)
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin
SHELL=/bin/bash
HOME=/
MAILTO=""

1 * * * * /home/dk/myShell/book_unix-linux-shellscript/0_dk/cron_test.sh
1 * * * * /tmp/cron_test.sh
```