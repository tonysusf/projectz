class GrantGatewayController < ApplicationController

  def data
    response = [Question.all, QuestionOption.all]

    respond_to do | format |
      format.json { render :text => response.to_json }
    end
  end


  def search
    hash = {}

    params.each do |key, val|
      if(key.index('question-') == 0)
        hash[key.gsub('question-', '')] = val unless val.blank?
      end
    end

    grant_processor = GrantProcessor.new(hash)
    response = grant_processor.filter
    respond_to do | format |
      format.json { render :text => response.to_json }
    end
  end

end
