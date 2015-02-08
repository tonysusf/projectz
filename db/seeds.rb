# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### Grants ####
Grant.all.each{|m| m.destroy}
Grant.create(id: 1, name: "Dream Maker Grant", description: "2 to 1 matching for a maximum of $5000, buyer must contribute at least $500")
Grant.create(id: 2, name: "Good Neighbor Next Door", description: "Up to 50% of the value of the home")
Grant.create(id: 3, name: "HomeChoice", description: "$15,000 grant towards downpayment")
Grant.create(id: 4, name: "House Key Plus Downpayment Assistance", description: "$5,000 towards down payment or closing cost")
Grant.create(id: 5, name: "House Key Rural", description: "$10,000 or 6% of purchase price down payment assistance, which ever is greater")
Grant.create(id: 6, name: "House Key Schools", description: "Up to $10,000, repayable at 3%  simple interest after 10 years")
Grant.create(id: 7, name: "House Key", description: "Up to $45,000 for downpayment at 3% loan for 30 years")
Grant.create(id: 8, name: "Rural Housing Guaranteed Loan", description: "Up to 90% loan insurance program to qualifed lenders")
Grant.create(id: 9, name: "HUD's FHA Loan", description: "Insured Loan for under qualifed individuals")
Grant.create(id: 10, name: "VA Home Loans", description: "240,000 for purchase or construction with no down payment and minimal interest")

### Questions ###
Question.all.each{|m| m.destroy}
Question.create(id: 1, text: "US Citizen", input_type: 0)
Question.create(id: 2, text: "City", input_type: 0)
Question.create(id: 3, text: "First Home", input_type: 0)
Question.create(id: 4, text: "Household Income", input_type: 1)
Question.create(id: 5, text: "Family Size", input_type: 0)
Question.create(id: 6, text: "Vetren Status", input_type: 0)
Question.create(id: 7, text: "Profession", input_type: 0)
Question.create(id: 8, text: "Diability Status", input_type: 0)

### Question Options ###
QuestionOption.all.each{|m| m.destroy}
QuestionOption.create(question_id: 1, text: "Yes")
QuestionOption.create(question_id: 1, text: "No")
QuestionOption.create(question_id: 2, text: "Seattle")
QuestionOption.create(question_id: 2, text: "Spokane")
QuestionOption.create(question_id: 3, text: "Yes")
QuestionOption.create(question_id: 3, text: "No")
QuestionOption.create(question_id: 5, text: "1")
QuestionOption.create(question_id: 5, text: "2")
QuestionOption.create(question_id: 5, text: "3")
QuestionOption.create(question_id: 5, text: "4")
QuestionOption.create(question_id: 5, text: "5")
QuestionOption.create(question_id: 5, text: "6+")
QuestionOption.create(question_id: 6, text: "Yes")
QuestionOption.create(question_id: 6, text: "No")
QuestionOption.create(question_id: 7, text: "Teacher")
QuestionOption.create(question_id: 7, text: "Emergency Worker")
QuestionOption.create(question_id: 7, text: "Military")
QuestionOption.create(question_id: 8, text: "Yes")
QuestionOption.create(question_id: 8, text: "No")

### Populate Grant Conditions from Speedsheet ###
GrantCondition.all.each{|m| m.destroy}
def get_question_option_Id(question_id, str)
  obj = QuestionOption.where(:question_id => question_id, :text => str).first
  raise "No '#{str}' for Question #{question_id}" unless obj
  obj.id
end
def gc(grant_id, question_id, str)
  question_option_id = get_question_option_Id(question_id, str)
  GrantCondition.create(:grant_id => grant_id, 
    :question_id => question_id, 
    :question_option_id => question_option_id)
end
gc(1, 1, "Yes")
gc(2, 1, "Yes")
gc(3, 1, "Yes")
gc(4, 1, "Yes")
gc(5, 1, "Yes")
gc(6, 1, "Yes")
gc(7, 1, "Yes")
gc(8, 1, "Yes")
gc(9, 1, "Yes")
gc(10, 1, "Yes")

gc(5, 2, "Spokane")
gc(8, 2, "Spokane")

gc(1, 3, "Yes")
gc(4, 3, "Yes")
gc(5, 3, "Yes")
gc(6, 3, "Yes")
gc(7, 3, "Yes")

gc(1, 6, "Yes")
gc(10, 6, "Yes")

gc(1, 7, "Military")
gc(2, 7, "Emergency Worker")
gc(6, 7, "Teacher")

gc(3, 8, "Yes")
