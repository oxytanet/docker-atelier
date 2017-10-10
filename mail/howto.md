# Install

`pacman -S msmtp-mta`

# Configure

`/etc/msmtprc`:
```
account default
host mail.gandi.net
auth on
from services@oxyta.net
user services@oxyta.net
password PASSWORD
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

aliases /etc/aliases

syslog LOG_MAIL
```

`/etc/aliases`:
```
root: services+root-HOSTNAME@oxyta.net
default: services+HOSTNAME@oxyta.net
```

# Test

`echo "test." | msmtp -a default root`
