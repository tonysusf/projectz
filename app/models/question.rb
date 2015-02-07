class Question < ActiveRecord::Base
  
  has_many :question_options, :dependent => :destroy
  
  QUESTION_TYPE_DROPDOWN = 0
  QUESTION_TYPE_TEXT_BOX = 1
  
end
