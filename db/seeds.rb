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
User.create!(email:"admin@admin.com", password:"123456", first_name:"Admin", last_name:"", admin: true, pola_face: "https://scontent.flyn1-1.fna.fbcdn.net/v/t39.30808-6/332926026_8839187282822982_7674830938355777980_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=FHr7JykADb0AX-NBC49&_nc_ht=scontent.flyn1-1.fna&cb_e2o_trans=t&oh=00_AfC4e9A5dU0gATDd_WjG9vhPs67oAaIkrSfFSZc4zDInpg&oe=65F80AE6")
# Inès;Asnoun;Femme;20/03/1998;Français, Anglais;Arabe;625341737;;;;;noir;marron;S;38;172;39;80;38;75;Inesasnounpro@gmail.com;9 rue du Château d’Eau;Paris;https://portfolio-comfgbu.format.com/;https://ines.asnoun;https://scontent.flyn1-1.fna.fbcdn.net/v/t39.30808-6/423162414_122106768830193404_7690339566518826869_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=HVh0CU7pboIAX8MeQ6G&_nc_ht=scontent.flyn1-1.fna&oh=00_AfB_wmKiDGPNH-kjySjoLyeuu2v0njglKoQKCI_Fz-d6EQ&oe=65F37147;https://api.typeform.com/responses/files/126baad4d8d530e95779a1c268a88310e5eef6769ac9c6bd99e27afdcd9d12d9/0EF869C2_5C43_4DCA_B35F_7FC2AA9C3B00.jpeg;https://api.typeform.com/responses/files/56f3f4f7a8dea46be3ceb1667ee562f7ad798667469c2079582dcdb4696f9b45/8ED20807_4059_4622_911D_9AAFA5816251.jpeg;https://api.typeform.com/responses/files/4d2a3ec6a0ea944cda68b9e38c0900d0836c71965e46e833f94f2548a6f4dc51/1FB70FC3_26E2_476F_9947_4242C25175C4.jpeg;https://api.typeform.com/responses/files/020d9ca312200d96f09dd72e2023c2ecc83f8d9775419c383c45565fb0b4d55a/AF2B0136_7EFA_4DFE_8F56_D627853151D7.jpeg
