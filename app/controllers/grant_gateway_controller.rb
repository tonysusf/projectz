class GrantGatewayController < ApplicationController
  
  
  def data

    response = [get_fake_questions, get_fake_options]
    
    respond_to do | format |
      format.json { render :text => response.to_json }
    end
  end
  
  
  def search
    response = get_fake_grants
    
    respond_to do | format |
      format.json { render :text => response.to_json }
    end
  end
  
  private
  def get_fake_questions
    data = []
    q = Question.new
    q.id = 1
    q.text = 'Are you a US Citizen'
    
    data << q
    data
  end
  
  def get_fake_options
    data = []
    opt1 = QuestionOption.new
    opt1.id = 1
    opt1.text = 'Y'
    opt1.question_id = 1
    
    opt2 = QuestionOption.new
    opt2.id = 2
    opt2.text = 'N'
    opt2.question_id = 1
    
    data << opt1
    data << opt2
    data
  end
  
  def get_fake_grants
    data = []
    obj = Grant.new
    obj.id = 1
    obj.name = 'Dream Maker Grant'
    data << obj
    
    obj = Grant.new
    obj.id = 2
    obj.name = 'Good Neighbor Next Door'
    data << obj
    
    data
  end
end
