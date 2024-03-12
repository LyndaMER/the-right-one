class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_tags
  has_many :tags, through: :user_tags
  has_many :auditions, dependent: :destroy

  scope :not_admin, -> { where(admin: false) }
  validates :first_name, presence: true

  def taille_chaussures
    tags.find_by(name: "taille_chaussures")&.value
  end

  def couleur_cheveux
    tags.find_by(name: "couleur_cheveux")&.value
  end

  def sexe
    tags.find_by(name: "sexe")&.value
  end

  def permis_de_conduire
    tags.find_by(name: "permis_de_conduire")&.value
  end

  def piercing
    tags.find_by(name: "piercing")&.value
  end

  def langues
    tags.find_by(name: "langues")&.value
  end

  def sport
    tags.find_by(name: "sport")&.value
  end

  def musique
    tags.find_by(name: "musique")&.value
  end

  def couleur_de_cheveux
    tags.find_by(name: "couleur_de_cheveux")&.value
  end

  def couleur_yeux
    tags.find_by(name: "couleur_yeux")&.value
  end

  def taille
    tags.find_by(name: "taille")&.value
  end

  def taille_haut
    tags.find_by(name: "taille_haut")&.value
  end

  def taille_bas
    tags.find_by(name: "taille_bas")&.value
  end

  def tour_de_buste
    tags.find_by(name: "tour_de_buste")&.value
  end

  def tour_de_taille
    tags.find_by(name: "tour_de_taille")&.value
  end

  def tour_de_hanches
    tags.find_by(name: "tour_de_hanches")&.value
  end

  def age()
    if birth_date.present?
      now = Time.now.utc.to_date
      dob = birth_date.to_date
      age = now.year - dob.year
      # Réduire l'âge si l'anniversaire n'a pas encore eu lieu cette année
      age -= 1 if now < dob + age.years
      age
    else
      nil
    end
  end
end
