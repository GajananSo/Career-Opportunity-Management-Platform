# Career Opportunity Management Platform (OJPMS)

A modern Java Web Application designed to manage career opportunities, user registrations, and candidate profiles efficiently. The application features a fully responsive frontend, real-time client-side validation, and a dynamic backend for comprehensive CRUD (Create, Read, Update, Delete) data operations.

---

## 🚀 Key Features

* **Dynamic Home Dashboard**: An intuitive entry point providing easy routing to registration forms and user directories.
* **Advanced Client-Side Form Validation**:
  * Real-time letter-only checking for full names (blocks numbers and special symbols directly).
  * Strict 10-digit numerical constraint validations on mobile values.
  * Prevention of future-dated selections for Date of Birth inputs.
* **Complete CRUD Capabilities**: Seamlessly create accounts, retrieve database records, edit data records with automatically retained values, and delete entries.
* **Safe-Delete Lifecycle Controls**: Embedded confirmation warnings prevent accidental data deletions by prompting the user before performing destructive database updates.
* **Modern CSS Interactivity**: High-performance flexbox grids, CSS custom variables, stable error-state placeholders to eliminate screen-shifting, and animated micro-interactions.

---

## 🛠️ Tech Stack & Architecture

* **Backend Framework:** Java (Jakarta EE / Servlet API)
* **View Layer:** JSP (JavaServer Pages), JSTL (JSP Standard Tag Library)
* **Database Mapping:** JPA / Hibernate (configured via `persistence.xml`)
* **Build tool:** Apache Maven
* **Styling & Interaction:** Modern CSS3, Vanilla JavaScript

---

## 📂 Project Structure

```text
ojpms/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com.jsp.ojpms/
│   │   │       ├── controller/   # Servlets routing traffic
│   │   │       ├── dao/          # Database interaction logic
│   │   │       ├── entity/       # Database mapping Models
│   │   │       └── util/         # Shared utilities
│   │   ├── resources/
│   │   │   └── META-INF/
│   │   │       └── persistence.xml # Database Configuration
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── web.xml
│   │       ├── index.jsp         # Interactive Home Page
│   │       ├── register.jsp      # Validated Registration Form
│   │       ├── edit.jsp          # Pre-populated Update Form
│   │       └── display.jsp       # Responsive Management Board
└── pom.xml

## Database Configuration

Open src/main/resources/META-INF/persistence.xml and update your database credentials:

<property name="jakarta.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/your_database_name" />
<property name="jakarta.persistence.jdbc.user" value="your_username" />
<property name="jakarta.persistence.jdbc.password" value="your_password" />


####Importing & Running the Project
Open Eclipse and select File ➡️ Import... ➡️ Existing Maven Projects.

Browse to the project root directory and click Finish.

Right-click the project root ➡️ Run As ➡️ Run on Server.

Select your configured Apache Tomcat environment and hit Finish.

Access the landing page in your browser at: http://localhost:8080/ojpms/



### How to add this to your project:
1. Create a new file named **`README.md`** inside your main project folder (`ojpms`).
2. Copy and paste the markdown text above into it and save.
3. Open your command prompt and push it up to GitHub using:
   ```bash
   git add README.md
   git commit -m "Add README file"
   git push origin master
