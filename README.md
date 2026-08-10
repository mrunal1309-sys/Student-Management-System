#  🎓Student Management System

A full-stack Java web application that lets a college admin or staff member manage student
records online — add, search, edit, and delete students — through a secure, login-protected
dashboard, instead of using spreadsheets or paper registers.

Built with **Core Java, Servlets, JSP, and Hibernate (ORM)**, backed by **PostgreSQL**.

## Screenshots

### Login Page
<img width="792" height="823" alt="Screenshot 2026-08-09 232009" src="https://github.com/user-attachments/assets/7f6e0fda-5b3f-444c-b6cc-00fb17b8c18a" />


### Dashboard — Student Records
<img width="1861" height="857" alt="Screenshot 2026-08-09 232605" src="https://github.com/user-attachments/assets/d96e9c2a-099c-449c-8c00-3e156f94e0b1" />


### Add Student Page
<img width="1898" height="862" alt="Screenshot 2026-08-10 150252" src="https://github.com/user-attachments/assets/c0b55ee0-8e3f-400d-a029-d2e704f5b64c" />



## Tech Stack
- Java 8+ (Core Java, OOP)
- Servlets + JSP (Java EE web layer)
- Hibernate 5 (ORM, HQL — no raw JDBC/SQL in the application code)
- PostgreSQL
- JSTL (for JSP tags like `<c:forEach>`, `<c:if>`)
- Maven (dependency management + build)
- Apache Tomcat 9 (servlet container)

## Features
- Secure, session-based login with a custom `AuthFilter` guarding all restricted pages
- Dashboard showing total student count and a searchable, styled table of all records
- Add / Edit / Delete student records
- Live search by name, roll number, or course
- Clean, responsive CSS styling across every page (no frontend framework needed)
- Centralized error handling with a friendly fallback error page

## Project Structure
```
StudentManagementSystem/
├── database.sql                          # DB + table creation + seed admin user (PostgreSQL)
├── pom.xml                               # Maven dependencies (Hibernate, PostgreSQL driver, JSTL)
├── screenshots/                          # README screenshots
├── src/main/java/com/sms/
│   ├── entity/       Student.java, User.java        (Hibernate @Entity classes)
│   ├── util/         HibernateUtil.java              (SessionFactory singleton)
│   ├── dao/          StudentDAO.java, UserDAO.java   (CRUD via Hibernate Session/HQL)
│   └── servlet/       LoginServlet, LogoutServlet, DashboardServlet,
│                       AddStudentServlet, EditStudentServlet,
│                       DeleteStudentServlet, AuthFilter
├── src/main/resources/
│   └── hibernate.cfg.xml                 # DB connection + entity mappings
└── src/main/webapp/
    ├── WEB-INF/web.xml                   # servlet + filter mappings
    ├── css/style.css                     # all styling
    ├── login.jsp
    ├── dashboard.jsp
    ├── add-student.jsp
    ├── edit-student.jsp
    └── error.jsp
```

## How Login Works
1. `login.jsp` posts username/password to `LoginServlet`.
2. `LoginServlet` calls `UserDAO.validateLogin()`, which runs an HQL query against the `users` table.
3. On success, a `User` object is stored in the `HttpSession`, and the user is redirected to `/dashboard`.
4. `AuthFilter` is mapped to `/dashboard`, `/add-student`, `/edit-student`, `/delete-student` —
   any request to these without a valid session is redirected back to `/login`.
5. `LogoutServlet` invalidates the session.

## Setup Instructions

### 1. Prerequisites
- JDK 8 or higher
- Apache Tomcat 9
- PostgreSQL (running locally)
- Eclipse (or any IDE) with Maven support

### 2. Create the Database
In pgAdmin or `psql`, first create the database:
```sql
CREATE DATABASE "StudentManagementSystem";
```
Then connect to that database specifically and run `database.sql` against it — this creates
the `users` and `students` tables, a default admin login (`admin` / `admin123`), and a few
sample student rows.

### 3. Configure Database Credentials
Edit `src/main/resources/hibernate.cfg.xml` and update:
```xml
<property name="hibernate.connection.url">jdbc:postgresql://localhost:5432/StudentManagementSystem</property>
<property name="hibernate.connection.username">postgres</property>
<property name="hibernate.connection.password">your_postgresql_password</property>
```

### 4. Import into Eclipse
- File → New → Maven Project → Create a simple project → set Group Id `com.sms`, Artifact Id
  `StudentManagementSystem`, Packaging `war`.
- Copy the project's `src/main/java`, `src/main/resources`, and `src/main/webapp` folders
  into the equivalent folders Eclipse generated (they line up 1:1).
- Right-click the project → Maven → Update Project to pull in all dependencies from `pom.xml`.

### 5. Run
- Add the project to your Tomcat 9 server (Servers view → right-click Tomcat → Add and Remove).
- Right-click the project → Run As → Run on Server.
- Visit: `http://localhost:8080/StudentManagementSystem/login`
- Log in with `admin` / `admin123`.

## Security Note (for production use)
This project stores passwords in plain text to keep the login flow easy to follow for a
college/portfolio project. Before using this in any real deployment, swap `UserDAO` to store
and compare **BCrypt-hashed** passwords instead (e.g. using `org.mindrot:jbcrypt`), and never
commit real DB credentials into `hibernate.cfg.xml` — load them from an environment variable
or a properties file excluded from version control instead.

## Possible Extensions (good talking points in interviews)
- Add pagination to the student table for large datasets
- Add role-based access (ADMIN vs STAFF permissions)
- Add file upload for student photos
- Move DB credentials to a `.properties` file read at runtime
- Add unit tests for the DAO layer with an in-memory H2 database
- Add a REST API layer (Spring Boot) as a v2, reusing the same entity classes

