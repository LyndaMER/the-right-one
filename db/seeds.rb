# frozen_string_literal: true

UserTag.destroy_all
User.destroy_all
require 'csv'

CSV.foreach('db/Annesodb.csv', headers: true, col_sep: ';') do |row|
  p row
  user = User.create!(
    first_name: row['first_name'],
    last_name: row['last_name'],
    password: 'password',
    phone_number: row['phone_number'],
    social_link: row['instagram_link'],
    address: row['postal_address'],
    language: row['languages'],
    link_portfolio: row['portfolio'],
    email: row['email'],
    birth_date: row['birth_date'],
    pola_face: row['pola_face'],
    pola_3_4: row['pola_3_4'],
    pola_silhouette: row['pola_silhouette'],
    pola_hands: row['pola_hands'],
    presentation_video: row['presentation_video']
  )

  if row['ethnicity_origins'].present?
    tag = Tag.find_or_create_by!(name: "ethnicity_origins", value: row['ethnicity_origins'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['gender'].present?
    tag = Tag.find_or_create_by!(name: "gender", value: row['gender'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['piercing'].present?
    tag = Tag.find_or_create_by!(name: "piercing", value: row['piercing'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['sport'].present?
    tag = Tag.find_or_create_by!(name: "sport", value: row['sport'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['music'].present?
    tag = Tag.find_or_create_by!(name: "music", value: row['music'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['drive_licence'].present?
    tag = Tag.find_or_create_by!(name: "drive_licence", value: row['drive_licence'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['hair_color'].present?
    tag = Tag.find_or_create_by!(name: "hair_color", value: row['hair_color'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['eyes_color'].present?
    tag = Tag.find_or_create_by!(name: "eyes_color", value: row['eyes_color'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['top_size'].present?
    tag = Tag.find_or_create_by!(name: "top_size", value: row['top_size'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['bottom_size'].present?
    tag = Tag.find_or_create_by!(name: "bottom_size", value: row['bottom_size'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['height'].present?
    tag = Tag.find_or_create_by!(name: "height", value: row['height'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['shoes_size'].present?
    tag = Tag.find_or_create_by!(name: "shoes_size", value: row['shoes_size'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['chest'].present?
    tag = Tag.find_or_create_by!(name: "chest", value: row['chest'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['waist'].present?
    tag = Tag.find_or_create_by!(name: "waist", value: row['waist'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['hips'].present?
    tag = Tag.find_or_create_by!(name: "hips", value: row['hips'])
    UserTag.create!(user: user, tag: tag)
  end
end

audition = Audition.create!(
  name: 'Casting 1',
  description: 'Casting for a new fashion brand',
  date: '2024-03-05',
  user: User.first)
  tag = Tag.find_or_create_by!(name: "hair_color", value: 'noir')
  AuditionTag.create!(audition: audition, tag: tag, required: true)
  tag = Tag.find_or_create_by!(name: "gender", value: 'H')
  AuditionTag.create!(audition: audition, tag: tag, required: false)
