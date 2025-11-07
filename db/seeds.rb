# db/seeds.rb
require 'faker'

Faker::Config.locale = 'en'

puts "Clearing existing data..."
Student.delete_all
Teacher.delete_all
School.delete_all

puts "Seeding schools, teachers and students..."

SCHOOL_COUNT = 8
SCHOOL_COUNT.times do |i|
  school = School.create!(
    name: Faker::Educator.unique.university + " School #{i+1}",
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    principal_name: Faker::Name.name,
    founded_year: rand(1950..2020)
  )

  # create 4-8 teachers per school
  rand(4..8).times do
    teacher = school.teachers.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      subject: Faker::Educator.subject,
      email: Faker::Internet.unique.email
    )

    # create 6-8 students per teacher
    rand(6..8).times do
      teacher.students.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        grade_level: rand(0..12),
        email: Faker::Internet.unique.email
      )
    end
  end
end

puts "Seeding complete:"
puts "Schools: #{School.count}, Teachers: #{Teacher.count}, Students: #{Student.count}"
