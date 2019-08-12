#!/usr/bin/env bash
##This is only for machines joined to AD through SSSD, please don't use for local accounts.


ls -1 /home | grep -Ev "svc_unix|hasans" >> /tmp/users.txt

for i in `cat /tmp/users.txt`
do
        mkdir -p /home/$i/programs
        ln -s /usr/local/bin/ssh /home/$i/programs/
        ln -s /bin/whoami /home/$i/programs/
        ln -s /bin/sed /home/$i/programs/
        ln -s /bin/logger /home/$i/programs/
        mv /home/$i/.bash_profile /home/$i/.bash_profile_bkup
        cp /root/.bash_profile_restricted /home/$i/.bash_profile
        chattr +i /home/$i/.bash_profile
done
rm -f /tmp/users.txt