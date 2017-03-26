#!/bin/bash
        stty erase ^H
        echo -e "Selecione uma opcao"
                echo -e "[1] - Caixa postal ainda nao migrada"
                echo -e "[2] - Caixa postal ja migrada\n"
        read key;

        box=/gfs-log/mail-box-mia/dovecot2/dovecot2.log
        obox=/gfs-log/mail-obox-mia/dovecot/dovecot.log

if [ "$key" == "1" ];

then
                echo -e "\nInforme o username da conta:\n"
        read name;
                echo -e "\nUsername da conta informado: $name\n"

        echo -e "\nInforme o idperm:\n"
        read id;
        echo -e "\nIdperm informado: $id\n"

        echo -e "\nInforme a data do periodo da perda. (Ex.: 2016*, 2016-01*, 2016-0[1-7]-*)\n"
        read data;
        echo -e "\nData Informada: $data\n"

        nohup grep $id $box.$data* | egrep -i "pop3|del=|copy|delete|expunge" | grep -v "del=0/" > /tmp/"$name".log &
        echo $! "<= PID"
        echo -e "\n\n"

elif [ "$key" == "2" ];

then
                echo -e "\nInforme o username da conta:\n"
        read name;
                echo -e "\nUsername da conta informado: $name\n"

        echo -e "\nInforme o idperm:\n"
        read id;
        echo -e "\nIdperm informado: $id\n"

        echo -e "\nInforme a data do periodo da perda. (Ex.: 2016*, 2016-01*, 2016-0[1-7]-*)\n"
        read data;
        echo -e "\nData Informada: $data\n"

        nohup grep $id $obox.$data* | egrep -i "pop3|del=|copy|delete|expunge" | grep -v "del=0/" > /tmp/"$name".log &
        echo $! "<= PID"
        echo -e "\n\n"
else
        echo -e "Opcao Invalida"
fi
