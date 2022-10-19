class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time, :camper_id, :activity_id

  has_one :activity
# belongs_to :activity
end
