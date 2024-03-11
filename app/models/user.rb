class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_tags
  has_many :tags, through: :user_tags
  has_many :auditions, dependent: :destroy

  def taille_chaussures
    tags.find_by(name: 'taille_chaussures')&.value
  end

  def couleur_cheveux
    tags.find_by(name: 'couleur_cheveux')&.value
  end

  def sexe
    tags.find_by(name: 'sexe')&.value
  end

  def permis_de_conduire
    tags.find_by(name: 'permis_de_conduire')&.value
  end

  def piercing
    tags.find_by(name: 'piercing')&.value
  end

  def langues
    tags.find_by(name: 'langues')&.value
  end

  def age()
    if date_de_naissance.present?
      now = Time.now.utc.to_date
      dob = date_de_naissance.to_date
      age = now.year - dob.year
      # Réduire l'âge si l'anniversaire n'a pas encore eu lieu cette année
      age -= 1 if now < dob + age.years
      age
    else
      nil
    end
  end


end
