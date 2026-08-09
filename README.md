# Student Management System

A full-stack web app built with **Core Java, Servlets, JSP, and Hibernate (ORM)**, backed by MySQL.
Includes a styled login page (session-based auth), and full CRUD (Create, Read, Update, Delete,
Search) for student records.

## Tech Stack
- Java 8+ (Core Java, OOP)
- Servlets + JSP (Jakarta/Java EE web layer)
- Hibernate 5 (ORM, HQL)
- MySQL 8
- JSTL (for JSP tags like `<c:forEach>`, `<c:if>`)
- Plain CSS (no frontend framework needed)
- Apache Tomcat 9/10 (servlet container)

## Project Structure
```
StudentManagementSystem/
├── database.sql                          # DB + table creation + seed admin user
├── src/main/java/com/sms/
│   ├── entity/       Student.java, User.java        (Hibernate @Entity classes)
│   ├── util/         HibernateUtil.java              (SessionFactory singleton)
│   ├── dao/          StudentDAO.java, UserDAO.java   (CRUD via Hibernate Session)
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
- Apache Tomcat 9 or 10
- MySQL 8 (running locally)
- An IDE with Maven/Dynamic Web Project support (Eclipse, IntelliJ IDEA) — recommended for
  managing the servlet/JSP build, OR set up a Maven `pom.xml` (see below).

### 2. Create the Database
Run the provided script in MySQL Workbench or the CLI:
```bash
mysql -u root -p < database.sql
```
This creates `student_management_db`, the `users` and `students` tables, a default admin
login (`admin` / `admin123`), and a few sample student rows.

### 3. Configure Database Credentials
Edit `src/main/resources/hibernate.cfg.xml` and update:
```xml
<property name="hibernate.connection.username">root</property>
<property name="hibernate.connection.password">your_mysql_password</property>
```

### 4. Required Dependencies (JARs)
If you're not using Maven, download these into `WEB-INF/lib/`:
- `hibernate-core-5.6.x.jar` (+ its transitive deps: `javax.persistence-api`, `jboss-logging`,
  `antlr`, `dom4j`, `classmate`, etc. — easiest via Maven, see below)
- `mysql-connector-j-8.x.x.jar` (JDBC driver)
- `c3p0-0.9.x.jar` + `hibernate-c3p0-5.6.x.jar` (connection pooling, used in hibernate.cfg.xml)
- `javax.servlet-api-4.0.x.jar` (provided by Tomcat — do NOT bundle this one, mark it "provided")
- `jstl-1.2.jar` + `standard-1.1.2.jar` (for JSTL tags used in dashboard.jsp)

**Recommended: use Maven instead** so all transitive dependencies resolve automatically.
Add this to a `pom.xml` at the project root (packaging `war`):
```xml
<dependencies>
    <dependency>
        <groupId>org.hibernate</groupId>
        <artifactId>hibernate-core</artifactId>
        <version>5.6.15.Final</version>
    </dependency>
    <dependency>
        <groupId>com.mysql</groupId>
        <artifactId>mysql-connector-j</artifactId>
        <version>8.3.0</version>
    </dependency>
    <dependency>
        <groupId>org.hibernate</groupId>
        <artifactId>hibernate-c3p0</artifactId>
        <version>5.6.15.Final</version>
    </dependency>
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>4.0.1</version>
        <scope>provided</scope>
    </dependency>
    <dependency>
        <groupId>jstl</groupId>
        <artifactId>jstl</artifactId>
        <version>1.2</version>
    </dependency>
</dependencies>
```

### 5. Import into your IDE
- **Eclipse**: File → Import → Existing Maven Project (or Dynamic Web Project if not using Maven).
- **IntelliJ**: Open as a Maven project, then set up a Tomcat run configuration pointing at the
  exploded WAR / `StudentManagementSystem` artifact.

### 6. Run
- Deploy to Tomcat (right-click project → Run As → Run on Server in Eclipse, or use the
  Tomcat run configuration in IntelliJ).
- Visit: `http://localhost:8080/StudentManagementSystem/login`
- Log in with `admin` / `admin123`.

## Features
- Styled login page with session timeout + error/success alerts
- Dashboard with student count, search by name/roll no/course
- Add / Edit / Delete student records
- Hibernate ORM (no raw JDBC/SQL in the servlets — all via `Session` and HQL)
- `AuthFilter` protects all pages except login
- Responsive CSS (works on mobile widths too)

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
- Add unit tests for DAO layer with an in-memory H2 database
- Add a REST API layer (Spring Boot) as a v2, since Spring Boot is already listed as
  in-progress — reuse the same entity classes

## Screenshots

### Login Page
![Login Page](<img width="792" height="823" alt="Screenshot 2026-08-09 232009" src="https://github.com/user-attachments/assets/72786355-152c-469c-b12a-9ab771facd3e" />
)

### Dashboard — Student Records
![Dashboard](<img width="1861" height="857" alt="Screenshot 2026-08-09 232605" src="https://github.com/user-attachments/assets/4003d964-7773-4aca-9f4a-e3720cfc10cd" />
)
