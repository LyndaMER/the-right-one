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
    tag = Tag.find_or_create_by!(name: "ville", value: row['city'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['languages'].present?
    tag = Tag.find_or_create_by!(name: "languages", value: row['languages'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['origine_ethnique'].present?
    tag = Tag.find_or_create_by!(name: "origine ethnique", value: row['origine_ethnique'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['sexe'].present?
    tag = Tag.find_or_create_by!(name: "sexe", value: row['sexe'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['piercing'].present?
    tag = Tag.find_or_create_by!(name: "piercing", value: row['piercing'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['sport'].present?
    tag = Tag.find_or_create_by!(name: "sport", value: row['sport'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['musique'].present?
    tag = Tag.find_or_create_by!(name: "musique", value: row['musique'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['permis_de_conduire'].present?
    tag = Tag.find_or_create_by!(name: "permis de conduire", value: row['permis_de_conduire'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['couleur_de_cheveux'].present?
    tag = Tag.find_or_create_by!(name: "couleur de cheveux", value: row['couleur_de_cheveux'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['couleur_yeux'].present?
    tag = Tag.find_or_create_by!(name: "couleur yeux", value: row['couleur_yeux'].downcase)
    UserTag.create!(user: user, tag: tag)
  end
  if row['taille_haut'].present?
    tag = Tag.find_or_create_by!(name: "taille haut", value: row['taille_haut'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['taille_bas'].present?
    tag = Tag.find_or_create_by!(name: "taille bas", value: row['taille_bas'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['taille'].present?
    tag = Tag.find_or_create_by!(name: "taille", value: row['taille'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['taille_chaussures'].present?
    tag = Tag.find_or_create_by!(name: "taille chaussures", value: row['taille_chaussures'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['tour_de_buste'].present?
    tag = Tag.find_or_create_by!(name: "tour de buste", value: row['tour_de_buste'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['tour_de_taille'].present?
    tag = Tag.find_or_create_by!(name: "tour de taille", value: row['tour_de_taille'])
    UserTag.create!(user: user, tag: tag)
  end
  if row['tour_de_hanches'].present?
    tag = Tag.find_or_create_by!(name: "tour de hanches", value: row['tour_de_hanches'])
    UserTag.create!(user: user, tag: tag)
  end
end

User.create!(email:"asbaldeyroncast@gmail.com", password:"123456", first_name:"Anne-Sophie", last_name:"Baldeyron", admin: true, pola_face: "https://scontent.flyn1-1.fna.fbcdn.net/v/t39.30808-6/386765810_10231780868804807_6112603021977143620_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_ohc=iu9FEHYkz9AAX_9eMan&_nc_ht=scontent.flyn1-1.fna&oh=00_AfBdqGoACEsK8EtQq96QFmlqYCYBD2KPXqr9NeAhHkR0TQ&oe=65F49760")
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
