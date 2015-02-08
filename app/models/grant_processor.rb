class GrantProcessor
  
  def self.filter(question_answer_hash)
    grants = Grant.all
    results = []
    grants.each do |grant|
      pass = true
      question_answer_hash.each do |question_id, answer|
        question = Question.find(question_id)
        match = match_question(grant, question, answer)
        expected = GrantCondition.where(:grant_id => grant.id, :question_id => question.id)
        expected_id = 0
        expected_id = expected.first.question_option_id if expected && expected.first
        Rails.logger.info "======> checking grant/question/expected/ answer/match: " +
          "#{grant.id}-#{grant.name}/ #{question.id}-#{question.text}/ " + 
          "#{expected_id}/ #{answer}/ #{match}"
        unless match
          pass = false
        end
      end
      results << grant if pass
    end
    results
  end
  
  private
  def self.match_question(grant, question, answer)
    result = true
    if (question.input_type == Question::QUESTION_TYPE_DROPDOWN) 
      expected = GrantCondition.where(:grant_id => grant.id, :question_id => question.id).try(:first)
      if (expected)
        result = false unless answer.to_i == expected.question_option_id
      end
    elsif (question.input_type == Question::QUESTION_TYPE_TEXT_BOX) 
      
    end
    result
  end
  
  # def self.check_income()
    
  # end

  #var income_limit = determineincome_limit(familySize, location);
  # def determine_income_limit(family_size, location) {
  #   income_limit = 0
  #   increment_one = 0
  #   increment_two = 0
  #   if (location == "Seattle") {
  #     income_limit = 44750
  #     increment_one = 6400
  #     increment_two = 5100
  #   } elsif (location == "Spokane") {
  #     income_limit = 35500
  #     increment_one = 5050
  #     increment_two = 4050
  #   }

  #   for (i = 1; i < family_size; i++) {
  #     if (i <= 3) {
  #       income_limit += increment_one;
  #     } else {
  #       income_limit += increment_two;
  #     }
  #   }

  #   return income_limit;
  # end
end
