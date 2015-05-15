class IncidentType
  include Mongoid::Document
  field :name,type: String
  field :desc,type: String
  has_many :incidents
end
