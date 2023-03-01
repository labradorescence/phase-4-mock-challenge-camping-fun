class SignupActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty

  # belongs_to :camper
  # belongs_to :activity

  def name
    self.object.camper.name
  end

  def difficulty
    self.object.activity.difficulty
  end
end
