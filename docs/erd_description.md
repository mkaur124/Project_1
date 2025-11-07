# 1.2 — Database ERD Description

The database includes three main tables: **schools**, **teachers**, and **students**.
Each school can have many teachers, and each teacher can have many students.

- **School → Teacher** = one-to-many
- **Teacher → Student** = one-to-many

This structure allows queries such as:
- Showing all teachers in a school
- Listing all students taught by a specific teacher

The diagram file is saved as `app/assets/images/erd.png`.
