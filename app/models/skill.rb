class Skill < ActiveRecord::Base
  has_many :proficiencies
  has_many :users, through: :proficiencies
  validates :name, uniqueness: true

  def user_with_proficiency(value)
    looking_for_proficiency = Proficiency.find_by_setting_and_skill_id(value, self.id)
    finding_user = User.find_by_id(looking_for_proficiency.user_id)
  end

end