
    class Buser
        include Mongoid::Document
         field :name

         mount_uploader :file, AvatarUploader
     end

