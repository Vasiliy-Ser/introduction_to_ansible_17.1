# Домашнее задание к занятию 17.1 «Введение в Ansible» - Падеев Василий


## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.  

![answer1](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/1.png)

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

![answer2](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/2.png)

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

![answer3](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/3.png)

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

Изменим рабочую дирректорию при работе с ansible на /tmp. Получаем ошибки несовпадения имен контейнеров.
![answer4](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/4.png)  
В контейнере ubuntu отсутствует python
![answer5](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/7.png)  
![answer6](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/8.png) 

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.  
6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.  

![answer7](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/9.png) 

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.  

![answer8](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/10.png) 

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.  

![answer9](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/11.png) 

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.  

![answer10](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/12.png)  
![answer11](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/13.png)  

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.  
11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.   

![answer12](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/14.png) 

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.
13. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.   

![answer13](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/15.png) 

2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.   

![answer14](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/16.png) 

3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.   

![answer15](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/17.png)  
![answer16](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/png/18.png) 

4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).
5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.  
 [automate.sh](https://github.com/Vasiliy-Ser/introduction_to_ansible_17.1/blob/c84543b36e5be32a5af46e3ffaa96d1b620751d5/playbook/automate.sh)
6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.

---

### Как оформить решение задания

Приложите ссылку на ваше решение в поле «Ссылка на решение» и нажмите «Отправить решение»
---
