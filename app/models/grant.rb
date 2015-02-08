class Grant < ActiveRecord::Base
  
  INCOME_TEST_GRANT_IDS = [4, 5]
  
  def income_test?
    INCOME_TEST_GRANT_IDS.include?(id)
  end
end
