class Category < ActiveRecord::Base
  belongs_to :parent,:class_name=>"Category",:foreign_key=>"category_id"
  belongs_to :categorytype,:foreign_key=>'categorytype_id'
  has_many :categories,:class_name=>"Category",:foreign_key=>"category_id"
  # def ParentCategories
      # Category.all
  # end
end
