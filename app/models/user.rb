class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :omniauthable

  # :recoverable - needs mailer
  
  has_attached_file :avatar, :styles => { :small => "150x150>", :large => "400x400>"}, :default_url => "http://placehold.it/150x150", :processors => [:cropper]
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  has_many :weights, dependent: :destroy
  has_many :notes, dependent: :destroy
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end
  
  def self.find_for_facebook_oauth access_token
    if user = User.where(:url => access_token.info.urls.Facebook).first
      user
    else 
      email = access_token.extra.raw_info.email.present? ? access_token.extra.raw_info.email : "#{access_token.info.urls.Facebook}@fatlosspro.net"
      setup = {
        :provider => access_token.provider, 
        :url => access_token.info.urls.Facebook, 
        :email => email, 
        :password => Devise.friendly_token[0,20], 
        :first_name => access_token.extra.raw_info.first_name, 
        :last_name => access_token.extra.raw_info.last_name
      }
      user = User.new(setup)
      user.avatar_from_url access_token.info.image
      user.save!
      user
    end
  end

  def avatar_from_url(url)                                              # Omniauth link builder is broken...
    self.avatar = URI.parse(url.sub(/type=\S+/,'width=600&height=800')) # They're not fixing it for 3 months
  end                                                                   # Monkeypatching, here I come!
end
