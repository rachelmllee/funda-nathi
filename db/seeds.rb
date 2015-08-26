# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  phone_no               :string
#  date_of_birth          :datetime
#  role                   :integer          default(0)

User.create(
    email: "student@test.com",
    password: 'password',
    password_confirmation: 'password',
    name: 'Student',
    phone_no: '84 098 8650 525',
    role: 0
)

User.create(
    email: "tutor@test.com",
    password: 'password',
    password_confirmation: 'password',
    name: 'Tutor',
    phone_no: '84 098 8650 525',
    role: 1
)

User.create(
    email: "admin@test.com",
    password: 'password',
    password_confirmation: 'password',
    name: 'Admin',
    phone_no: '84 098 8650 525',
    role: 2
)


# Table name: courses
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  category    :string
#  grade       :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

Course.create(
    name: 'Insight into Rails Application',
    category: 'Computer Science',
    grade: 12,
    description: 'You will like it! Ruby on Rails is powerful language',
    user_id: User.where(role: 1).first.id
)

#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  length      :string
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string
#
User.create(
    email: "admin@fundanathi.org",
    password: 'password15',
    password_confirmation: 'password15',
    name: 'Admin',
    phone_no: '0847240511',
    role: 2
)

Video.create(
    title: 'Rails installation',
    description: 'A guide from youtube to install Rails on your local machine',
    length: '8 minutes',
    course_id: Course.first.id,
    url: 'https://www.youtube.com/watch?v=tcvw3BR-99E'
)
