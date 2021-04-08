# Cubapp

###This calorie calculator has the following features:

- calculation of the required daily intake of proteins, fats, carbohydrates and calories, taking into account the entered data (weight, height, age, gender, physical activity, the desired result and the number of meals);
- drawing up a diet by choosing products and distributing them by meals;
- dynamic recalculation of the balance of the necessary proteins, fats, carbohydrates and calories, taking into account the selected products and their mass;
- saving the selected menu to the selected date
- viewing the menu and deleting the menu by the selected date
- registration and authorization
- account settings (there you can change your password or mailbox)
- creating and deleting product cards with a preview (dynamic display of entered data) *only for the administrator*
- viewing the list of registered users *only for the administrator*
- delete or change users (change role or login) *only for administrator*

###Some modules used in this app:

- [Spring Framework](https://spring.io/)
- [FlyWay](https://flywaydb.org)
- [PostreSQL](https://www.postgresql.org)
- [Apache Maven](https://maven.apache.org)

####Frontend:

- HTML
- CSS
- [Angular](https://angular.io)
- [Freemarker](https://freemarker.apache.org)

####Datebase

in the file "application-dev.properties" you can change the database connection settings

```

spring.datasource.url= *url*
spring.datasource.username= *username*
spring.datasource.password= *password*

```

### Project Structure

```

main/
+--java
|  +--com
|     +--chukuobody
|        +--app
|           +-- config    		->     project configuration files (CORS settings, email sending, password encryption and security)
|           +-- controller      ->     controller classes project manager
|           +-- domain  		->     domain model objects
|           	+-- dto     	->     response domain
|           +-- repos         	->     database interaction files
|           +-- service 		->     logic, methods

```

