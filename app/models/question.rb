class Question < ActiveRecord::Base
  
  has_many :question_options, :dependent => :destroy
  
  QUESTION_TYPE_DROPDOWN = 0
  QUESTION_TYPE_TEXT_BOX = 1

  FAMILY_SIZE_QUESTION_ID = 5
  INCOME_QUESTION_ID = 4
  LOCATINO_QUESTION_ID = 2
  
  def is_family_size
    id == FAMILY_SIZE_QUESTION_ID
  end
  
  def is_income
    id == INCOME_QUESTION_ID
  end
  
  def is_location
    id == LOCATINO_QUESTION_ID
  end
end
