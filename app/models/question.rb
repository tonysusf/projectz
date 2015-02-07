class Question < ActiveRecord::Base
  
  has_many :question_options, :dependent => :destroy
  
end
