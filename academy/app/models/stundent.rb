class Stundent < ActiveRecord::Base
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }
  
  attr_accessible :city, :email, :lastname, :name, :avatar

  def image_url
    avatar.url
  end
  
end
