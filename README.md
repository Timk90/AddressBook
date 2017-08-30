# AddressBook

Простое приложение - "Адресная книга", использующее следующие технологии:
Java + Spring MVC + MyBatis (в качестве ORM) + PostgreSQL. Готовый war файл можно деплоить на tomcat, чтобы потестировать 
работоспособность приложения. Перед тестированием демо необходимо создать БД с именем "AddressBook", а также пользователя Admin c паролем: root1234. 
Инициализация таблиц и популяция данными происходит автоматически с использованием Liquibase. 
В приложении имеются две таблицы: первая с пользовательскими данными составляющими контент адресной книги, 
такими как: имя, пароль, адрес, эл.почта, номер телефона, во второй таблице роли пользователей в системе и их имена.
Осуществлена связь между обеими таблицами как One to Many по имени пользователя ( имя пользователя является уникальным,
тогда как ролей у каждого может быть много). 
Процецедура аутентификации и доступа к данным происходит основании роли с использование библиотек Spring Secrurity.
Также осуществлена валидация данных по определенным критериям при регистрации нового пользователя или изменении информации о старом.
После авторизации в системе для администратора доступна возможность редактирования всех полей таблицы, простой пользователь может редактировать 
только информацию о себе, но просматривать всю таблицу.    

Simple Address Book Web application. The next technologies have been used: Spring  + MyBatis + PostgreSQL + Validation and Spring security. 
This is the web application uses popular Spring MVC framework. 
There are two possible roles for rigistreted useres - ROLE_ADMIN and ROLE_USER. 
Admin is able to update an information about every user whereas the user without ROLE_ADMIN can only updete his own information.
 In order to check the functionality you firstly have to initialize DB with the name AddressBook and add new user "Admin",with password "root1234" in your local PostgreSQL server.
Class DBhelper now is useless. When visit a website you should use username: Timur and password 1234timk for Admin rights and any other user for User rights. 

Any questions and discussions at any time, just contact me: 
timk90@mail.ru. 
+79503181629 (Call or WhatsApp)

WAR file https://drive.google.com/open?id=0B454J0B3DhoUSEFYbDBFc1k4UTA 

