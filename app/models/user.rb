class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_tags
  has_many :tags, through: :user_tags
  has_many :auditions, dependent: :destroy

  def shoes_size
    tags.find_by(name: 'shoes_size')&.value
  end

  def hair_color
    tags.find_by(name: 'hair_color')&.value
  end

  def gender
    tags.find_by(name: 'gender')&.value
  end

  def drive_licence
    tags.find_by(name: 'drive_licence')&.value
  end

  def piercing
    tags.find_by(name: 'piercing')&.value
  end

  def language
    tags.find_by(name: 'language')&.value
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
