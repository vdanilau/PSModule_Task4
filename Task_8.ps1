﻿#8.	Создать файл-сценарий вывода списка установленных программных продуктов 
#в виде таблицы с полями Имя и Версия.
Get-WmiObject win32_product | Select-Object name, version


