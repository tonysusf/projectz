class GrantProcessor
  
  def initialize(question_answer_hash)
    @question_answer_hash = question_answer_hash
  end
  
  def filter
    grants = Grant.all
    results = []
    grants.each do |grant|
      pass = true
      @question_answer_hash.each do |question_id, answer|
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
  def match_question(grant, question, answer)
    result = true
    if (question.input_type == Question::QUESTION_TYPE_DROPDOWN) 
      expected = GrantCondition.where(:grant_id => grant.id, :question_id => question.id).try(:first)
      if (expected)
        result = false unless answer.to_i == expected.question_option_id
      end
    elsif (question.input_type == Question::QUESTION_TYPE_TEXT_BOX && grant.income_test?) 
      result = false unless check_income
    end
    result
  end
  
  def check_income
    family_size = 0
    income = 0
    location = ''
    @question_answer_hash.each do |question_id, answer|
      question = Question.find(question_id)
      family_size = translate_family_size(answer.to_i) if question.is_family_size
      income = answer.to_i if question.is_income
      location = translate_location(answer.to_i) if question.is_location
    end
    income_limit = determine_income_limit(family_size, location)
    Rails.logger.info "===========> checking family_size/ income/ location/ income_limit: " +
          "#{family_size}/ #{income}/ #{location}/ #{income_limit}"
    return false if (income_limit>0 && income>income_limit)
    true
  end

  def determine_income_limit(family_size, location)
    income_limit = 0
    increment_one = 0
    increment_two = 0
    if (location == "Seattle")
      income_limit = 44750
      increment_one = 6400
      increment_two = 5100
    elsif (location == "Spokane")
      income_limit = 35500
      increment_one = 5050
      increment_two = 4050
    end

    range = 1..family_size-1
    range.each do|i|
      if (i <= 3)
        income_limit += increment_one
      else
        income_limit += increment_two
      end
    end

    income_limit
  end
  
  def translate_family_size(question_option_id)
    return 0 unless question_option_id>0
    question_option = QuestionOption.find(question_option_id)
    str = question_option.text
    str.gsub('+', '').to_i
  end
  
  def translate_location(question_option_id)
    return '' unless question_option_id>0
    question_option = QuestionOption.find(question_option_id)
    question_option.text
  end
end
