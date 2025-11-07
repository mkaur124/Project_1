# 1.1 — Datasets Description

## Overview / chosen topic
**Topic:** Schools, Teachers, and Students

This project uses simple, synthetic data generated with the **Faker** gem to model a small school system. The dataset represents schools, the teachers who work there, and the students enrolled in each school. This allows us to explore relationships between entities such as "one school has many teachers" and "one teacher has many students."

### Data source 1
**Name:** Schools (synthetic)
**Source / file:** Generated in `db/seeds.rb` using Faker
**Sample fields to import:** name, address, city, principal_name, founded_year
**Target table:** schools
**Notes:** Each school record will be created using Faker with unique names and addresses.

### Data source 2
**Name:** Teachers (synthetic)
**Source / file:** Generated in `db/seeds.rb` using Faker
**Sample fields to import:** first_name, last_name, subject, email, school_id
**Target table:** teachers
**Notes:** Each teacher belongs to a school and teaches a random subject.

### Data source 3
**Name:** Students (synthetic)
**Source / file:** Generated in `db/seeds.rb` using Faker
**Sample fields to import:** first_name, last_name, grade_level, email, teacher_id
**Target table:** students
**Notes:** Each student belongs to a teacher and has a random grade level.

### Database tables and keys
- **schools**: id (PK), name, address, city, principal_name, founded_year, created_at, updated_at
- **teachers**: id (PK), school_id (FK → schools.id), first_name, last_name, subject, email, created_at, updated_at
- **students**: id (PK), teacher_id (FK → teachers.id), first_name, last_name, grade_level, email, created_at, updated_at

### Relationships / mapping
- `School` **has_many** `Teachers`
- `Teacher` **belongs_to** `School`
- `Teacher` **has_many** `Students`
- `Student` **belongs_to** `Teacher`

### Short paragraph for deliverable (About page / docs)
This project models a small school system using Faker-generated data. It includes three tables — Schools, Teachers, and Students — with one-to-many relationships. Each school can have multiple teachers, and each teacher can have multiple students. The dataset is fully synthetic and will be generated automatically using the Faker gem in the Rails seed file.
