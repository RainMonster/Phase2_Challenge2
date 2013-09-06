class User < ActiveRecord::Base
  has_many :proficiencies
  has_many :skills, through: :proficiencies


  def set_proficiency_for(skill, update_setting)
    update_proficiency = Proficiency.find_by_user_id_and_skill_id(self.id, skill.id)
    update_proficiency.setting = update_setting
    update_proficiency.save
  end

  def proficiency_for(skill)
    find_proficiency = Proficiency.find_by_user_id_and_skill_id(self.id, skill.id)
    find_proficiency.setting
  end

end

### If we're not passing the whole object into the params, but just the skill name:

  # def proficiency_for(skill)
  #   find_skill = Skill.find_by_name(skill)
  #   find_proficiency = Proficiency.find_by_user_id_and_skill_id(self.id, skill.id)
  #   find_proficiency.setting
  # end

  # def set_proficiency_for(skill, update_setting)
  #   update_skill = Skill.find_by_name(skill)
  #   update_proficiency = Proficiency.find_by_user_id_and_skill_id(self.id, update_skill.id)
  #   update_proficiency.setting = update_setting
  #   update_proficiency.save
  # end