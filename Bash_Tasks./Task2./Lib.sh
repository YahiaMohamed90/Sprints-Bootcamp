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

}

#Change_SSH_Port


Display_Root_Login()

{

sed -i "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config

}

#Display_Root_Login



ADD_USER()

{

read -p "Enter username : " username

read -s -p "Enter password : " password

egrep "^$username" /etc/passwd >/dev/null 

if [ $? -eq 0 ]; then 
	echo "$username exists!"
	exit 1
else 
    pass=$(perl -e 'print crypt($ARGV[0], "password")'	$password)

    useradd -m -p "$pass" "$username"

    [ $? -eq 0 ] && echo " user has been added to system! " || "faild to add a user!"	
fi

echo " You Want To Add $username To Sudoers :if yes please type yes or type no if you not want : "

read check

if   [ $check == 'yes' ]
then 
	echo "$username ALL =(ALL:ALL) ALL" >> /etc/sudoers 

elif [ $check == 'no' ]
then	
        echo "$username not will be in sudoers file :"	
fi

}

#ADD_USER
