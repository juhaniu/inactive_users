Check inactive user in jump Linux server (local accounts)

Made this script while faced many environments where there wasn’t LDAP/AD and I wanted to gain info about the inactive account in my jump servers. In my environment this script runs in daily cron and output is read by Zabbix.

There one know issue, user who only login in with WinSCP don’t leave “trace” so this script will show them as inactive.


It will check following:

Show inactive accounts with following parameters:
- accounts that have passwords 
- have not been logged in within 90 days

Excludes users:
- in wheel group
- root 
- already locked 

