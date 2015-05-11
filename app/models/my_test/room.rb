class MyTest::Room
  include Mongoid::Document
  field :name, :type => String

  mount_uploader :attachment, AttachmentUploader

end
