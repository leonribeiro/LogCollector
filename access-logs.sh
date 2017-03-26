#!/bin/bash
        stty erase ^H
        echo -e "\nInforme o tipo do dominio da conta:\n(1) - Conta @terra. Ex.: @terra.com.br\n(2) - Conta de dominio proprio. Ex.: @vimaco.com.br\n"
        read key;


        atmail=/nfs/log-mail-mcivil01/mail-web-mia/marco_civil/atmail_mc.log
        mercury=/nfs/log-mail-mcivil01/mail-web-mia/marco_civil/mercury_mc.log
        imap=/nfs/log-mail-mcivil01/mail-proxy-mia/marco_civil/imap_mc.log
        pop=/nfs/log-mail-mcivil01/mail-proxy-mia/marco_civil/pop3_mc.log

if [ "$key" == "1" ];

then

        echo -e "\nInforme o username:\n"
        read user;

        echo -e "\nUsuario informado: $user\n"

        echo -e "\nInforme o dominio do e-mail. (Ex.: terra.com.br):\n"
        read terra;

        echo -e "\nDominio informado: $terra\n"

        echo -e "\nInforme a data do periodo de coleta. (Ex.: 2016*, 2016-01*, 2016-0[1-7]-*)\n"
        read data;

        echo -e "\nData Informada: $data\n"

        ##

        nohup zgrep $user@$terra $atmail.$data* > /tmp/"$user"_atmail.log &
        echo $! "= ATMAIL - pid"

        nohup zgrep $user $mercury.$data* > /tmp/"$user"_mercury.log &
        echo $! "= MERCURY - pid"

        nohup zgrep $user $imap.$data* > /tmp/"$user"_imap.log &
        echo $! "= IMAP - pid"

        nohup zgrep $user $pop.$data* > /tmp/"$user"_pop.log &
        echo $! "= POP - pid"
        echo -e "\n\n"

elif [ "$key" == "2" ];

then

        echo -e "\nNome do usuario:\n"
        read user;

        echo -e "\nUsuario informado: $user\n"

 echo -e "\nInforme o dominio do e-mail, sem @. Ex.: vimaco.com.br\n"
        read dominio;

        echo -e "\nDominio informado: $dominio\n"

        echo -e "\nInforme a data do periodo de coleta. (Ex.: 2016*, 2016-01*, 2016-0[1-7]-*)\n"
        read data;

        echo -e "\nData Informada: $data\n"

        ##

        nohup zgrep $user@$dominio $atmail.$data* > /tmp/"$user"_atmail.log &
        echo $! "= ATMAIL - pid"

        nohup zgrep $user@$dominio $mercury.$data* > /tmp/"$user"_mercury.log &
        echo $! "= MERCURY - pid"

        nohup zgrep $user@$dominio $imap.$data* > /tmp/"$user"_imap.log &
        echo $! "= IMAP - pid"

        nohup zgrep $user@$dominio $pop.$data* > /tmp/"$user"_pop.log &
        echo $! "= POP - pid"

        echo -e "\n\n\n\n"

else

        echo -e "Opcao Invalida"

fi
