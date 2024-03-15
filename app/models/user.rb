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
    tags.find_by(name: "taille chaussures")&.value
  end

  def sexe
    tags.find_by(name: "sexe")&.value&.capitalize
  end

  def permis_de_conduire
    tags.find_by(name: "permis de conduire")&.value&.capitalize || "/"
  end

  def piercing
    tags.find_by(name: "piercing")&.value&.capitalize || "/"
  end

  def langues
    tags.find_by(name: "langues")&.value
  end

  def sport
    tags.find_by(name: "sport")&.value&.capitalize || "/"
  end

  def musique
    tags.find_by(name: "musique")&.value || "/"
  end

  def hair_color
    tags.find_by(name: "couleur de cheveux")&.value&.capitalize
  end

  def eye_color
    tags.find_by(name: "couleur yeux")&.value&.capitalize
  end

  def taille
    tags.find_by(name: "taille")&.value
  end

  def taille_haut
    tags.find_by(name: "taille haut")&.value
  end

  def taille_bas
    tags.find_by(name: "taille bas")&.value
  end

  def tour_de_buste
    tags.find_by(name: "tour de buste")&.value
  end

  def tour_de_taille
    tags.find_by(name: "tour de taille")&.value
  end

  def tour_de_hanches
    tags.find_by(name: "tour de hanches")&.value
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
