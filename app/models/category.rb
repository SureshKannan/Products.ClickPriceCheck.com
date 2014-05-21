class Category < ActiveRecord::Base
  belongs_to :parent,:class_name=>"Category",:foreign_key=>"Category_id"
  belongs_to :categorytype
  #,:foreign_key=>'Categorytype_id'
  has_many :categories,:class_name=>"Category",:foreign_key=>"Category_id"
end
