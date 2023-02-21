bastion_IP = 158.160.52.140
someinternalhost_IP = 10.128.0.15


Самостоятельное задание
Исследовать способ подключения к someinternalhost в одну команду из вашего рабочего устройства, проверить работоспособность.
Я достиг вот таким методом. В кавычках указав следующую команду.
Это без ВПН

ssh -i ~/.ssh/appuser -A appuser@158.160.52.140 'ssh 10.128.0.15'

Вывод что я получил. Также запросил Хостнейм чтобы проверить точно ли я на нужной ВМке.

"""
sh-3.2# ssh -i ~/.ssh/appuser -A appuser@84.201.172.104 'ssh 10.128.0.15'
Pseudo-terminal will not be allocated because stdin is not a terminal.
Welcome to Ubuntu 20.04.5 LTS (GNU/Linux 5.4.0-137-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

 * Introducing Expanded Security Maintenance for Applications.
   Receive updates to over 25,000 software packages with your
   Ubuntu Pro subscription. Free for personal use.

     https://ubuntu.com/pro
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

hostname
someinternalhost

"""

Предложить вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства, чтобы подключение выполнялось по алиасу
someinternalhost и внести его в README.md в вашем репозитории

Создал такой алиас через баш

alias someinternalhost="ssh -i ~/.ssh/appuser -A appuser@158.160.52.140 'ssh 10.128.0.15'"

Вот сам алиас он выполняет аналогичное подключение

"""
sh-3.2# someinternalhost
Pseudo-terminal will not be allocated because stdin is not a terminal.
Welcome to Ubuntu 20.04.5 LTS (GNU/Linux 5.4.0-137-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

 * Introducing Expanded Security Maintenance for Applications.
   Receive updates to over 25,000 software packages with your
   Ubuntu Pro subscription. Free for personal use.

     https://ubuntu.com/pro
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings
"""

ALias c VPN мы делаем в ssh config 
sh-3.2# nano ~/.ssh/config

Указываем данные настройки

Host someinternalhost
    HostName 10.128.0.15
    User appuser
    IdentityFIle ~/.ssh/appuser

Затем вызываем команду
sh-3.2# ssh someinternalhost

