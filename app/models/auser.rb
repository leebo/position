class Auser
  include Mongoid::Document
  mount_uploader :avatar, AvatarUploader

end
