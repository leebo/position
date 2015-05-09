# encoding: utf-8
require 'carrierwave/processing/mini_magick'
class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  #CarrierWave.configure do |config|
  #config.grid_fs_database = 'octface_development'
  #config.grid_fs_host = 'localhost'
  #config.grid_fs_access_url = "/images"
  #config.storage = :grid_fs
  #end

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :grid_fs
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    if original_filename
      "octfacefile.#{split_extension(original_filename)[1]}"
    end
  end

  private
  def split_extension(filename)
    # regular expressions to try for identifying extensions
    extension_matchers = [
        /\A(.+)\.(tar\.gz)\z/, # matches "something.tar.gz"
        /\A(.+)\.([^\.]+)\z/ # matches "something.jpg"
    ]

    extension_matchers.each do |regexp|
      if filename =~ regexp
        return $1, $2
      end
    end
    return filename, "" # In case we weren't able to split the extension
  end

end
