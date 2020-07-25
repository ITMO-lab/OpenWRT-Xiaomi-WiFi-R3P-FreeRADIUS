# Установка OpenWRT на роутер Xiaomi R3P [ Xiaomi Mi WiFi router Pro(r3p) ] с настройкой WiFi wpa2-enterprise с запущеными на роутере FreeRADIUS (для предоставления индивидуальных ключей wpa2-enterprise), SQLite (для хранения этих ключей) и SQLite Web Admin (для удобного редактирования учётных записей пользователей)

# **ОГЛАВЛЕНИЕ**

[**1 Краткий обзор основных характеристик роутера**](#1-краткий-обзор-основных-характеристик-роутера)

[**2 Первая настройка роутера**](#2-первая-настройка-роутера)

[**3 Подготовка роутера к установке кастомных прошивок**](#3-подготовка-роутера-к-установке-кастомных-прошивок)

[**4 Установка кастомной прошивки**](#4-установка-кастомной-прошивки)

- [4.1 Переход от прошивки Xiaomi к базовой прошивке OpenWRT](#41--переход-от-прошивки-Xiaomi-к-базовой-прошивке-OpenWRT)
- [4.2 Обновление ядра (или восстановление роутера из состояния кирпича)](#42--обновление-ядра-или-восстановление-роутера-из-состояния-кирпича)
- [4.3 Установка новой прошивки роутера](#43--установка-новой-прошивки-роутера)

[**5 Первая полноценная настройка прошивки**](#5-первая-полноценная-настройка-прошивки)







# !!!!!!!!!!!!!!!!!!!!!!!

# !!! WARNING !!!

# !!!!!!!!!!!!!!!!!!!!!!!

**Прежде всего рекомендую ознакомиться с оглавлением, так как эту инструкцию могут читать разные люди: кто-то только купил роутер, кто-то уже удалил базовую прошивку, а кто-то уже "ОКИРПИЧИЛ" это чудо Китайского Роутеростроения :D	(без доли сарказма, классный быстрый роутер)**

**P.S. Для тех, кто тут только за восстановлением кирпича (да, это сделать проще, чем кажется), вам сюда: [4.2 Восстановление роутера из состояния кирпича](#42--обновление-ядра-или-восстановление-роутера-из-состояния-кирпича)**

**Автор постарался написать инструкцию таким образом, чтобы смог разобраться даже ещё больший ламер, чем автор. несмотря на это автор открыт к критике, исправлению и модификации инструкций.** 

**Вы делаете все описанные ниже действия на свой страх и риск. Автор не несёт ответственности за возможный выход вашего роутера из строя, а так же за прекращение поддержки базовых пакетов роутера (отсылка к тем, кто пытался нормально настроить freeradius, который не имеет обратной совместимости даже среди версий одного релиза). У Автора не было перебоев электропитания непосредственно во время прошивки роутера (не во время установки пакетов), но даже если они или любые критические поломки базовых пакетов случатся у вас, не переживайте, всегда можно прошить ядро заново через UART.**

# 1 Краткий обзор основных характеристик роутера

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/photos/20200624_162317.jpg)

Характеристики роутера позволяют запускать на нём даже полноценные web сервисы:

| Параметр                                  | Значение                                 |
| ----------------------------------------- | ---------------------------------------- |
| Класс Wi-Fi                               | AC2600                                   |
| Максимальная скорость и стандарты 2.4 ГГц | 802.11 b/g/n,          800 Мбит/сек      |
| Максимальная скорость и стандарты 5 ГГц   | 802.11 AC/b/g/n,    1733 Мбит/сек        |
| Скорость LAN порта                        | 1000 Мбит/сек                            |
| Центральный процессор                     | MT7621A MIPS Dual Core 880MHz (4 потока) |
| Встроенная память                         | 256M SLC Nand Flash                      |
| Оперативная память                        | 512MB DDR3-1200                          |
| Процессор Wi-Fi                           | MediaTek MT7615E                         |

# 2 Первая настройка роутера

Если вы включаете роутер впервые, тогда он раздаст открытый WiFi с названием  Xiaomi_XXXX_XXXX

Подключаетесь к этому WiFi и переходите по адресу 192.168.31.1

Автоматически откроется страница http://192.168.31.1/cgi-bin/luci/web/init/hello

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/2/1.png)

Гугл переводчик переводит это как:

[текст] Пожалуйста, прочтите «Пользовательское лицензионное соглашение» и выберите, соглашаться ли 

[галочка] Присоединяйтесь к «Программе улучшения взаимодействия с пользователем»

*Лично я галочку снял*

Нажимаем большую синюю кнопку и попадаем в меню первой настройки роутера

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/2/2.png)

Или же, если в роутер не воткнут кабель с интернетом (перекинул на ноут, чтобы переводить китайский)

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/2/3.png)

Выбираем верхний режим работы и попадаем в меню выше

Логично, что тут выбирается имя сети WiFi (SSID) и её пароль, тут я галочку не снял (отвечает за какие-то настройки firewall. нам всё равно прошивку стирать, так что не важно) и нажал большую синюю кнопку.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/2/4.png)

Тут выбирается пароль к админке этой прошивке. Если нажмёте галочку, тогда будет выбран тот же пароль, что и для WiFi. В чём разница между "Семья", "Компания" и "Подгоняет" я не понял, ну и не важно, пусть будет по умолчанию ("Семья"), нам ещё не долго пользоваться этой прошивкой. 

Снова нажимаем большую синюю кнопку. 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/2/5.png)

Ждём загрузки роутера. На нём оранжевая лампочка сменится синей, когда всё завершится. Кстати, роутер ещё умеет мигать красным, если вы попытаетесь прошить его через USB такой прошивкой, которую он принципиально не может скушать.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/2/6.png)

Думаю, тут очевидно, куда нажимать. Только не забудьте подключиться к новой Wi-Fi сети )

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/2/7.png)

Попадаем в такое меню. Здесь вводим пароль от роутера и нажимаем стрелочку. При первом входе роутер предложит провести некоторые настройки. Там есть синяя кнопка.     НЕ     НАЖИМАЙТЕ     НА     НЕЁ     . Вместо этого нажмите на подчёркнутый текст под кнопкой. Это пропустит гайд по этой прошивке. Прокликайте по свободным местам, чтобы пройти навязанное введение в интерфейс прошивки. Всё, с этого момента можно приступать к настройке роутера для установки кастомных прошивок.

# 3 Подготовка роутера к установке кастомных прошивок

*Часть инструкций в этой главе была взята с открытого источника:* https://openwrt.org/toh/xiaomi/xiaomi_r3p_pro 

Во-первых, загрузите Xiaomi «прошивку разработчика» с http://cdn.cnbj1.fds.api.mi-img.com/xiaoqiang/rom/r3p/miwifi_r3p_firmware_daddf_2.13.65.bin

Или воспользуйтесь его копией на github [miwifi_r3p_firmware_daddf_2.13.65.bin](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/firmware/xiaomi-developer/miwifi_r3p_firmware_daddf_2.13.65.bin), ведь его могут убрать из открытых источников.

Далее по кабелю подключаемся или WiFi к роутеру и переходим на http://192.168.31.1

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/1.png)

Войдите в систему и найдите страницу, на которой вы можете обновить прошивку (найдите большую желтую точку с «i» внутри).

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/2.png)

Здесь выбираете обновление прошивки вручную.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/3.png)

Вы увидите номер версии маршрутизатора, а внизу есть кнопка, где вы можете загрузить файл. 
Загрузите miwifi_r3p_firmware_daddf_2.13.65.bin (прошивка для разработчиков), нажмите синюю кнопку и подождите несколько минут.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/4.png)

Далее будет предложено стереть все пользовательские настройки. Лично я поставил галочку и стёр. И вам рекомендую так поступить, ведь не известно, какие ещё новые прошивки будут устанавливаться в роутеры с завода, и как они будут совместимы с данными старой прошивки. Остаётся только ждать окончания прошивки - загорится синяя лампочка.

Запомните, что наша последующая задача - получить персональный (там пароли к ssh индивидуальные) upgrade роутера с ssh с сайта xiaomi.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/5.png)

Если вы впервые устанавливаете прошивку разработчика на роутер, тогда вам будет показано это окно. Если же этого окна нет, и вместо него идёт сразу окно с входом в админку, тогда ничего страшного, просто идём дальше по инструкции. Для настройки роутера вам потребуется специальное приложение. Установите приложение Android "Mi Wi-Fi" из https://play.google.com/store/apps/details?id=com.xiaomi.router на свой телефон / планшет (есть также приложение для iOS). 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/6_2.png)

Откройте приложение «Mi Wi-Fi», затем войдите в свою учетную запись Xiaomi (Если у вас её нет, то сначала создайте на сайте https://www.mi.com/). 

Маршрутизатор будет обнаружен и добавлен в вашу учетную запись (при условии, что вы подключены к WiFi роутера в режиме 2.4G, а порт WAN маршрутизатора подключен к Интернету). Нажимаем "Настроить роутер", в следующем меню выбираем пароль и настройка завершена. 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/7_2.png)

На этом этапе лично у меня всегда зависает приложение, хотя я подключился к нужному WiFi, но да не важно, закрываем его, но не удаляем, оно нам ещё понадобится.

Обязательно подключаемся к нашему Wi-Fi и переходим в http://192.168.31.1 

Нас там встретит уже знакомое меню с логином. Входим в админку, пропускаем лишнее знакомство с прошивкой уже НАЖАТИЕМ на синюю кнопку.

На ПК зайдите на сайт https://d.miwifi.com/rom/ssh и войдите в свою учетную запись Xiaomi. Вы попадете на страницу, на которой должны отображаться ваш роутер, пароль root и кнопка загрузки. Нажмите кнопку, чтобы получить miwifi_ssh.bin и сохранить пароль. (Если страница загрузки с перенаправлением http://d.miwifi.com/rom/ssh?userId=SOME_NUMBER не работает, попробуйте ввести "http://" вместо "https://" перед "d.miwifi.com" и наоборот)

Если новый роутер появился, тогда вы просто везунчик. Если же ваше везение на моём уровне, регистрация роутера не прошла успешно.

Открываем приложение "Mi Wi-Fi". Если вы войдёте в учётную запись Xiaomi, то вам будет доступен интерфейс, в верхней части которого будет выпадающее меню. Нажимаем на него, а потом нажимаем на "Добавить роутер". Снова подчеркну, что важно быть подключенным к нужному роутеру по WiFi в режиме 2.4G. Появится картинка с предложением "Выполнить сопряжение роутера". Соглашаемся. Нас попросят ввести пароль администратора. Если вы шли по моим инструкциям, то это тот же пароль к WiFi. После правильного спряжения роутер отобразится в списке ваших устройств, а сайт https://d.miwifi.com/rom/ssh выдаст в списке ваш роутер после всё тех же манипуляций с "https://".

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/8.png)

Находим нужный роутер в списке и сохраняем куда-нибудь пароль от пользователя root - те 8 символов после слова root и иероглифов. После чего нажимаем на соответствующую кнопку справа.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/9.png)

Принимаем соглашение, которое было переведено специально для вас. И должно начаться скачивание... Ага, должно. Придётся снова посвапать "http://" и "https://" и загрузка начнётся. Результатом будет файл: miwifi_ssh.bin

На этом этапе вам понадобится флешка с файловой системой **FAT32 (ЭТО ВАЖНО!)**. Если у вас такой нет, тогда форматните какую-нибудь флешку в этом формате. Не мне вам рассказывать, что при форматировании файлы стираются, поэтому сделайте их резервную копию на компьютере, если они вам нужны. Если вы пользователь windows 10, тогда вам могут понадобится отдельные программы для форматирования разделов. Лично я воспользовался программой [guiformat](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/firmware/programs/guiformat.exe), но за неё не ручаюсь, поэтому можете скачать любую на свой выбор.

После чего нужно скопировать файл miwifi_ssh.bin в корень флешки (на этой флешке не должно быть папок, только один этот файл).

Отключите питание маршрутизатора, вставьте USB-накопитель в маршрутизатор, нажмите и удерживайте кнопку сброса (рекомендуется со скрепкой, хотя лично я использовал иголку и шило), включите маршрутизатор (удерживая перезагрузку). Когда маршрутизатор начнет мигать желтым (пройдёт секунд 10-12), отпустите кнопку сброса. Подождите, пока маршрутизатор не перезагрузится, и у вас (наконец…) не будет доступа по SSH.

Далее необходимо либо по кабелю, либо по WiFi подключиться к роутеру.

Проверить наличие доступа в windows 10 (и в популярных дистрибутивах linux) можно очень просто, там из коробки идёт ssh client. Если у вас другая версия Windows без ssh клиента, поставьте его отдельно. 

Пишем:

`ssh root@192.168.31.1`

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/10.png)

После чего у нас попросят пароль. Вводим тот самый пароль, что мы записывали и мы в роутере, готовы ставить прошивки.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/11.png)

Если же вы увидели нечто подобное (Windows 10), вам нужно удалить все предыдущие сессии из файла:

`C:\Users\{YOUR_USERNAME}\.ssh\known_hosts`

После чего вы можете прописать `ssh root@192.168.31.1` и увидеть успешный вход в систему. 

С этого момента начинается не самая безопасная зона. Да, в этой прошивке от xiaomi нет ничего опасного, но у вас уже буквально есть возможность стереть ядро. Если же вы каким-то образом умудрились всё сломать на этой прошивке, тогда вам поможет пункт 4.1

# 4 Установка кастомной прошивки

## 4.1  Переход от прошивки Xiaomi к базовой прошивке OpenWRT

Вытаскиваем флешку из роутера, она нам понадобится. 

Для тех, кто начал читать с этого момента - она должна быть формата **FAT32 (ЭТО ВАЖНО!)**

Скачиваем с офф сайта прошивку OpenWRT: [openwrt-ramips-mt7621-xiaomi_mir3p-squashfs-factory.bin](https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/openwrt-ramips-mt7621-xiaomi_mir3p-squashfs-factory.bin)

Но лучше с моего клона на гите, ведь сайт могут и закрыть или версию обновить: [openwrt-ramips-mt7621-xiaomi_mir3p-squashfs-factory.bin](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/firmware/openwrt-ramips-mt7621/openwrt-ramips-mt7621-xiaomi_mir3p-squashfs-factory.bin)

Далее копируем файл в корень нашей флешки так, чтобы на флешке остался только он. Xiaomi там создаст кучу файлов, просто удалите их и скопируйте файл.

Вставляем флешку в роутер. И в консоли `ssh root@192.168.31.1` пишем (команды лучше вводить по очереди, чтобы не было проблем -ash):

`cd /extdisks/sd*` - может отличаться, если вы вытащите и вставите флешку, но cd* должно перейти в любую версию.

`mv openwrt-ramips-mt7621-xiaomi_mir3p-squashfs-factory.bin factory.bin` - сокращаем имя файла прошивки.

`nvram set flag_try_sys1_failed=1 `

`nvram set flag_try_sys2_failed=0`

`nvram set flag_boot_success=0`

`nvram commit`

`dd if=factory.bin bs=1M count=4 | mtd write - kernel1`

`mtd erase rootfs0`

`mtd erase rootfs1`

`mtd erase overlay`

`dd if=factory.bin bs=1M skip=4 | mtd write - rootfs0`

`reboot`

После этих команд адрес роутера должен измениться с 192.168.31.1 на 192.168.1.1 и команда ssh будет выглядеть `ssh root@192.168.1.1`

Что интересно, по умолчанию он для пользователя root отсутствует, установить его можно в web gui или через `passwd root` внутри консоли ssh, но если открыть адрес 192.168.1.1 в браузере, ничего не произойдёт, ведь не установлен пакет web gui.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/3/11.png)

Если же вы увидели нечто подобное при попытке подключиться по ssh (Windows 10), вам нужно удалить все предыдущие сессии из файла:

`C:\Users\{YOUR_USERNAME}\.ssh\known_hosts`

После чего вы можете прописать `ssh root@192.168.1.1` и увидеть успешный вход в систему. 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/1_1.png)

Далее устанавливаем web gui, чтобы можно было продолжить работу в нём.

`opkg update` 

`opkg install luci`

## 4.2  Обновление ядра (или восстановление роутера из состояния кирпича)

Этот пункт является обязательным для всех. Если у вас не подходящая версия ядра, тогда sysupgrade из 4.3 приведёт только к неработоспособности роутера как роутер (WiFi раздаёт, но интернет не видит, а также не работает web gui и ssh). 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/photos/20200624_162705.jpg)

Важно отметить, что гарантия на роутер теряется уже после разборки роутера, для проверки этого на нём предусмотрен один болт с наклейкой.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/photos/20200624_162631.jpg)

Конечно можно полностью разобрать корпус, выкрутив из под прорезиненных ножек 4 болта,

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/photos/20200624_162343.jpg)

Выковыряв ножом с боков пластиковые вставки,

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/photos/20200624_162501.jpg)

И достать плату роутера (с огромным радиатором)... 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/photos/20200624_162400.jpg)

Но зачем нам все эти сложности, ведь нам нужен только доступ к UART разъёму?

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/photos/20200624_212857.jpg)

Просто отключаем роутер от питания, аккуратно ножом поддеваем правую пластиковую стенку,

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/photos/20200624_212925.jpg)

Теперь у нас есть доступ к разъёму. Можно даже к нему подпаять провода, нам нужны RX, TX и GND. Питание на 3.3 v не трогаем.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/photos/20200624_213916.jpg)

Но я не хочу паять плату, поэтому просто подсоединю кабель к роутеру и к UART-Serial конвертору, но вам рекомендую припаять.

Напряжение TX и RX должно быть **3.3 вольта (ЭТО ВАЖНО!)**

Вам потребуется терминал для Serial порта. На linux это делается одной командой, но пользователи Windows могут скачать [putty](https://www.putty.org/) с официального сайта или же по ссылке на моём гите: [putty](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/firmware/programs/putty-0.73-ru-17.zip)

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/5.png)

Запускаем приложение. Выбираем слева снизу "Serial", далее настраиваем всё, как на картинке. COM порт выбираем согласно вашему конвертору. 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/6.png)

Его можно найти в диспетчере устройств.

Если у вас запускается приложение на windows, но при подключение оно просто выдаёт звук и ничего не делает (у меня такое случалось), тогда перейдите в директорию с распакованным putty.exe и выполните:

`.\putty.exe  -serial COM4 -sercfg "115200,8,n,1,"` - только введите ваш COM порт вместо COM4.

Откроется окно последовательного порта. После чего подаём питание на роутер и вылавливаем момент, когда появится меню "Please choose the operation"

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/7.png)

Тут нажимаем 2 в окне с последовательным портом. Далее выполняем то, что систему запрашивает. IP адреса рекомендую не менять, а имя файла нужно ввести своё (далее будет обозначено) и НЕ нажимать ввод. Сначала нужно подключиться по ethernet кабелю к роутеру на поднять DHCP.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/8.png)

Для этого нужно открыть "Сетевые подключения", найти ваш проводной адаптер. Правая кнопка мыши, его свойства...

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/9.png)

Там нужно выбрать пункт "IP версии 4...", его свойства, а далее выбрать "Использовать следующий IP-адрес" и настроить всё, как в образце. После чего покликать по кнопкам "ОК". Поздравляю, у вас DHCP и ваш новый адрес 192.168.1.3, а адрес роутера остался 192.168.1.1.

Прошивка ядра осуществляется через TFTP. [Программа для поднятия TFTP сервера](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/firmware/programs/Tftpd64-4.00-setup.exe)

Для начала нам нужен файл ядра [openwrt-ramips-mt7621-xiaomi_mir3p-initramfs-kernel.bin](https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/openwrt-ramips-mt7621-xiaomi_mir3p-initramfs-kernel.bin)

Сохраняем этот файл в удобное место, например, "C:\router". Для удобства я переименую файл "openwrt-ramips-mt7621-xiaomi_mir3p-initramfs-kernel.bin" в "linux.bin". Это то самое ядро, которое у нас просит сейчас роутер. 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/10.png)

Выключаем Wi-Fi и оставляем только одно подключение - по тому кабелю с DHCP. Настраиваем путь к нашей папке "C:\router", выбираем нужный "Server interface" - должен быть нашим IP в собственном DHCP. Программа TFTP сервера запущена автоматически.

Переходим в окно последовательного порта и проверяем данные. Если адреса и имя верные, нажимаем Enter и начнётся процесс загрузки.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/11.png)

Если процесс загрузки идёт хорошо, вы увидите такую картину. Мне удалось прошить ядро без разбора корпуса и пайки.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/12.png)

Кстати, не забудьте выключить DHCP, для этого перейдите в уже знакомое меню "Сетевые подключения" и смените режим работы на "Получать IP-адрес автоматически".

Вместе с этим ядром идёт несколько базовых пакетов, но это далеко не конечная прошивка. Далее требуется скачать файл с обновлением для этого ядра. Он настроит файловую систему. [openwrt-ramips-mt7621-xiaomi_mir3p-squashfs-sysupgrade.bin](https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/openwrt-ramips-mt7621-xiaomi_mir3p-squashfs-sysupgrade.bin)

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/13.png)

Проходим процесс авторизации без пароля (просто нажимаем "Войти") и быстро переходим в "System" -> "Backup / Flash Firmware" -> Выбираете файл (выбираем наш openwrt-ramips-mt7621-xiaomi_mir3p-squashfs-sysupgrade.bin) -> "Flash image...", **НЕ снимая галочку с "Keep settings", это важно**.

Откровенно говоря, эта прошивка нам нужна только для того, чтобы были смонтированы правильно системные разделы. Иначе места для установки даже базовых пакетов для конфигурации разделов буквально не будет (ставить будет некуда), а в комплекте такие приложения не идут.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/14.png)

В этом меню нажимаем "Proceed" и процесс загрузки начнётся. Через минуту у вас будет вполне рабочая конфигурация роутера на OpenWRT с проблемным WiFi и протоколами безопасности. Далее требуется пропатчить сборку кастомной прошивкой в пункте 4.3.

## 4.3  Установка новой прошивки роутера

Данная прошивка взята с комментария на 4pda: https://4pda.ru/forum/index.php?showtopic=810698&st=5440#entry92890464

В ней настроено и сконфигурировано всё для функционирования драйверов для wifi, а также расширенных протоколов безопасности.

Ссылка на клон на гите: [OpenWRT-19.07.1-MiR3P-sysupgrade.bin](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/firmware/OpenWRT-19.07.1-MiR3P-sysupgrade/OpenWRT-19.07.1-MiR3P-sysupgrade.bin)

Скачиваем и обновляемся. Для этого входим в роутер 192.168.1.1 и логинимся (по умолчанию пароль пустой)

Переходим "System" -> "Backup / Flash Firmware"

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/2.png)

После этого нажимаем "Flash image..."

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/3.png)

Далее нажимаем "Browse...", выбираем файл "OpenWRT-19.07.1-MiR3P-sysupgrade.bin" и нажимаем Upload, **снимая галочку с "Keep settings", это важно**. Мы хотим сконфигурированную систему с интернетом на наших разделах файловой системы.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/4/4.png)

После загрузки получаем предупреждение о версии: "xiaomi,mir3p" != "xiaomi,mir-3p". Фактически же это один и тот же роутер, так что нажимаем галочку на "Force upgrade", повторно загружаем файл и нажимаем "Continue", а в следующем меню "Proceed".

Важно, чтобы сейчас у вас не отключили свет, ведь иначе вам потребуется сначала пройти пункт 4.2, а потом пройти 4.3 сначала. Процесс загрузки может занять продолжительное время. 

После завершения загрузки, вам будет доступен web gui, ssh и ещё много пакетов. Уже на этом этапе можно закончить, ведь WiFi работает, а протоколы безопасности установлены, а файловая система настроена, но зачем нам на таком крутом роутере какой-то там WPA2-PSK, если, помимо WPA3, мы  можем поднять настоящий шедевр безопасности - WPA2-Enterprise.

P.S. пароль от пользователя root в той прошивке - "1234567890"

# 5 Первая полноценная настройка прошивки



Эх, люблю этот интерфейс :D

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/5/1.png)

Входим в систему, пароль по умолчанию - "1234567890" (без кавычек). И нам лучше сразу поменять пароль на удобный нам. Для этого переходим в "Система" -> "Управление" -> "Пароль маршрутизатора"

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/5/2.png)

Там всё просто - устанавливаем пароль от роутера на свой вкус **важно, что это не пароль от WiFi. Это пароль от пользователя root и от админки на роутере**

Теперь можно поменять имя машины роутера. Рекомендую выбрать имя, совпадающее с именем WiFi.

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/5/8.png)

Далее настраиваем DHCP, чтобы не возникало проблем с перенаправлением при длительном стриминге данных. 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/5/9.png)

Сначала с этим расширим область выделяемых адресов, меняя маску подсети на 255.0.0.0. Адрес роутера меняем на 192.0.0.0. 

После применения настроек ("Сохранить и применить...") нужно перейти на [новый адрес роутера](http://192.0.0.0/) и авторизоваться. После идём в то же меню и продолжаем настройку. 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/5/10.png)

Аренду начинаем с "10", чтобы оставить место под зарезервированные адреса 192.0.0.0-10, а заканчиваем "256^3 - 10", что равно "16777206". Время аренды ставим на "infinite". Снова применяем настройки ("Сохранить и применить...").



Далее нам нужно настроить конфигурацию WiFi, заодно и проверим, как работает WiFi. По большей части, в этой прошивке уже всё настроено, но вы можете покопаться и поменять всё на свой вкус. 

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/5/3.png)

В меню "Сеть" -> "WiFI" можно настроить WiFi. Необходимо выставить всё, как на фото (часть настроек взята с https://4pda.ru/forum/index.php?showtopic=810698&st=3200#entry82315996)

Сначала настроем 2.4 G (не забудьте нажать "сохранить")

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/5/4.png)

Потом 5 G

![img](https://github.com/ITMO-lab/OpenWRT-for-Xiaomi-Mi-WiFi-router-Pro-r3p-with-FreeRADIUS-SQLite-and-SQLite-Web-Admin/blob/images/screenshots/5/5.png)

После установки настроек, применяем их кнопкой: "Сохранить и применить..."

На этом этапе можно вылезти из красивого web gui и погрузиться в консоль, а ля настоящий программист. (ну или почти :p) Напоминаю, что делается это через `ssh root@192.0.0.0`, а пароль - тот самый пароль от админки web gui.

Сначала установим самые базовые пакеты. Да, к роутеру должен быть подключён кабель с интернетом.

В консоли роутера пишем (опять же, все команды вводить по одной. у нас тут не bash, а просто ash, и всё может крякнуться):

`opkg update`  - аналог "apt update" в ubuntu

`opkg install nano htop bash git git-http` - можете использовать и "vi" (предустановлен) вместо "nano", кому как проще.



