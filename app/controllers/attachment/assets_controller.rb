#coding: utf-8
# require "find"
class Attachment::AssetsController < ApplicationController
  # skip_before_filter :verify_authenticity_token

  def serve
    gridfs_path = env["PATH_INFO"].gsub("/upload/grid/", "")
    begin
      gridfs_file = Mongoid::GridFS[gridfs_path]
      self.response_body = gridfs_file.data
      self.content_type = gridfs_file.content_type
    rescue
      self.status = :file_not_found
      self.content_type = 'text/plain'
      self.response_body = ''
    end
  end

  def new
    @attachment_asset = Attachment::Asset.new
    puts "1111111111111111111111111111111111111111111111111111111111111111"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @attachment_asset }
    end

  end


  def create
    @attachment_asset = Attachment::Asset.new
    @attachment_asset.asset = params[:attachment]

    params[:attachment_asset][:attachment].read.split("\r\n").each { |line|zhe
     puts line
      sub = Subscriber.new
      sub.name = line.split(",")[0]
      sub.mdn = line.split(",")[1]
      sub.emsi = line.split(",")[2]
      sub.save
    }
    redirect_to "/attachment/assets"
  end

  def list

    @root_path = "#{Rails.public_path}/#{upload_store_dir}/"
    @root_url = "/#{upload_store_dir}/"
    @img_ext = Attachment::AssetUploader::EXT_NAMES[:image]
    @dir = params[:dir].strip || ""
    unless Attachment::AssetUploader::EXT_NAMES.keys.map(&:to_s).push("").include?(@dir)
      render :text => "Invalid Directory name."
      return
    end

    Dir.chdir(Rails.public_path)
    upload_store_dir.split('/').each do |dir|
      Dir.mkdir(dir) unless Dir.exist?(dir)
      Dir.chdir(dir)
    end

    Dir.mkdir(@dir) unless Dir.exist?(@dir)

    @root_path += @dir + "/"
    @root_url += @dir + "/"

    @path = params[:path].strip || ""
    if @path.empty?
      @current_path = @root_path
      @current_url = @root_url
      @current_dir_path = ""
      @moveup_dir_path = ""
    else
      @current_path = @root_path + @path + "/"
      @current_url = @root_url + @path + "/"
      @current_dir_path = @path
      @moveup_dir_path = @current_dir_path.gsub(/(.*?)[^\/]+\/$/, "")
    end
    @order = %w(name size type).include?(params[:order].downcase) ? params[:order].downcase : "name"
    if !@current_path.match(/\.\./).nil?
      render :text => "Access is not allowed."
      return
    end
    if @current_path.match(/\/$/).nil?
      render :text => "Parameter is not valid."
      return
    end
    if !File.exist?(@current_path) || !File.directory?(@current_path)
      render :text => "Directory does not exist."
      return
    end
    @file_list = []
    Dir.foreach(@current_path) do |filename|
      hash = {}
      if filename != "." and filename != ".." and filename != ".DS_Store"
        file = @current_path + filename
        if File.directory?(file)
          hash[:is_dir] = true
          hash[:has_file] = (Dir.foreach(file).count > 2)
          hash[:filesize] = 0
          hash[:is_photo] = false
          hash[:filetype] = ""
        else
          hash[:is_dir] = false
          hash[:has_file] = false
          hash[:filesize] = File.size(file)
          hash[:dir_path] = ""
          file_ext = file.gsub(/.*\./, "")
          hash[:is_photo] = @img_ext.include?(file_ext)
          hash[:filetype] = file_ext
        end
        hash[:filename] = filename
        hash[:datetime] = File.mtime(file).to_s(:db)
        @file_list << hash
      end
    end

    @file_list.sort! { |a, b| a["file#{@order}".to_sym] <=> b["file#{@order}".to_sym] }

    @result = {}
    @result[:moveup_dir_path] = @moveup_dir_path
    @result[:current_dir_path] = @current_dir_path
    @result[:current_url] = @current_url
    @result[:total_count] = @file_list.count
    @result[:file_list] = @file_list
    render :text => @result.to_json
  end

  protected
  def upload_store_dir
    "#{Rails.root}/uploads"
  end

  private
  def show_error(msg)
    render :text => ({:error => 1, :message => msg}.to_json)
  end

end