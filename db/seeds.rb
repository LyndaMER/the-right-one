# frozen_string_literal: true
Tag.destroy_all
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
    social_link: row['social_link'],
    address: row['address'],
    city: row['city'],
    languages: row['languages'],
    portfolio: row['portfolio'],
    email: row['email'],
    birth_date: row['birth_date'],
    pola_face: row['pola_face'],
    pola_3_4: row['pola_3_4'],
    pola_silhouette: row['pola_silhouette'],
    pola_mains: row['pola_mains'],
    presentation_video: row['presentation_video']
  )
  if row['birth_date'].present?
    tag = Tag.find_or_create_by!(name: "age", value: user.age)
    UserTag.create!(user: user, tag: tag)
  end
  if row['city'].present?
    tag = Tag.find_or_create_by!(name: "city", value: row['city'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['languages'].present?
    tag = Tag.find_or_create_by!(name: "languages", value: row['languages'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['origine_ethnique'].present?
    tag = Tag.find_or_create_by!(name: "origine_ethnique", value: row['origine_ethnique'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['sexe'].present?
    tag = Tag.find_or_create_by!(name: "sexe", value: row['sexe'])
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
  if row['musique'].present?
    tag = Tag.find_or_create_by!(name: "musique", value: row['musique'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['permis_de_conduire'].present?
    tag = Tag.find_or_create_by!(name: "permis_de_conduire", value: row['permis_de_conduire'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['couleur_de_cheveux'].present?
    tag = Tag.find_or_create_by!(name: "couleur_de_cheveux", value: row['couleur_de_cheveux'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['couleur_yeux'].present?
    tag = Tag.find_or_create_by!(name: "couleur_yeux", value: row['couleur_yeux'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['taille_haut'].present?
    tag = Tag.find_or_create_by!(name: "taille_haut", value: row['taille_haut'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['taille_bas'].present?
    tag = Tag.find_or_create_by!(name: "taille_bas", value: row['taille_bas'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['taille'].present?
    tag = Tag.find_or_create_by!(name: "taille", value: row['taille'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['taille_chaussures'].present?
    tag = Tag.find_or_create_by!(name: "taille_chaussures", value: row['taille_chaussures'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['tour_de_buste'].present?
    tag = Tag.find_or_create_by!(name: "tour_de_buste", value: row['tour_de_buste'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['tour_de_taille'].present?
    tag = Tag.find_or_create_by!(name: "tour_de_taille", value: row['tour_de_taille'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['tour_de_hanches'].present?
    tag = Tag.find_or_create_by!(name: "tour_de_hanches", value: row['tour_de_hanches'])
    UserTag.create!(user: user, tag: tag)
  end
end

# audition = Audition.create!(
#   name: 'Audition 1',
#   description: 'Audition pour une nouvelle marque de collants',
#   date: '2024-03-05',
#   user: User.first)
#   tag = Tag.find_or_create_by!(name: "couleur_de_cheveux", value: 'noir')
#   AuditionTag.create!(audition: audition, tag: tag, required: true)
#   tag = Tag.find_or_create_by!(name: "sexe", value: 'H')
#   AuditionTag.create!(audition: audition, tag: tag, required: true)
#   tag = Tag.find_or_create_by!(name: "taille_chaussures", value: '43')
#   AuditionTag.create!(audition: audition, tag: tag, required: false)
#   tag = Tag.find_or_create_by!(name: "permis_de_conduire", value: 'true')
#   AuditionTag.create!(audition: audition, tag: tag, required: false)
#   tag = Tag.find_or_create_by!(name: "piercing", value: 'true')
#   AuditionTag.create!(audition: audition, tag: tag, required: false)
#   tag = Tag.find_or_create_by!(name: "langue", value: 'français')
#   AuditionTag.create!(audition: audition, tag: tag, required: false)
#   tag = Tag.find_or_create_by!(name: "age", value: '25')
#   AuditionTag.create!(audition: audition, tag: tag, required: false)
