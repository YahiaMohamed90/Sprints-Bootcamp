#!/usr/bin/env bash

User_Root_Privilage()

{

if ((EUID !=0)); then
    echo " root or sudo required for script ( $(basename $0) )"
exit
fi

}
User_Root_Privilage


Change_SSH_Port()

{

echo " Enter New Port: "

read port

sed -i "s/^#Port 22/Port $port/g" /etc/ssh/sshd_config

echo " The Defult Port has been Changed to $port "

systemctl restart sshd

}

#Change_SSH_Port

Display_Root_Login()

{

sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config



}

#Display_Root_Login

Update_Firewall_Selinux()

{

semanage port -a -t ssh_port_t -p tcp $1

systemctl reload sshd

echo "Selinux has been resolved to port $1"

firewall-cmd --zone=public --add-port=$1/tcp --permanent

systemctl reload firewalld.service

echo "firewall has been resolved to port $1"

}

Update_Firewall_Selinux



Add_Group()

{

groupadd -f Audit -g $1

echo "Audit group has been added with $1 GID "

}


#Add_Group


Create_Reports()

{

 YEAR="$(date +%Y)"

 mkdir -p /home/$USER/Reports

 touch /home/$USER/Reports/$YEAR-{1..12}-{1..31}.xls

 chmod 660 /home/$USER/Reports/*

}
#Create_Reports


Yum_Update()

{
yum -b -y update

yum -y upgrade


echo " system has been updated successfully : "


}

#Yum_Update


EPEL()

{

yum -y install epel-release

echo "EPEL_Repsitory  has been installed successfully!:"

}

EPEL


Install_Fail2ban()

{

yum -y install fail2ban

systemctl enable fail2an

systemctl start fail2ban

echo " Fail2ban has been installed successfully!:"


}

#Install_Fail2ban


Backup_Reports()

{



U=$(date +%u)

W=$(date +%w)

mkdir -p /home/root/backups/reports

echo "0 1 * * 1-4 tar -czf /root/backups/reports-$W-$U.tar /home/$USER/Reports">> "/var/spool/cron/root"

}

#Backup_Reports

Add_Manager_User()

{

useradd -u 30000 manager

echo "User manager has benn added successfully"

}

#Add_Manager_User

Bacup_Manager_Reports()

{



mkdir -p /home/manager/Audit/Reports_Manger

echo "0 2 * * 1-4 rsync -av /home/$USER/Reports/* /home/manager/Audit/Reports_Manager"

>> "/var/spool/cron/root"

}


#Bacup_Manager_Reports


