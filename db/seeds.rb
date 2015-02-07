# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### Grants ####
Grant.all.each{|m| m.destroy}
Grant.create(id: 1, name: "Dream Maker Grant")
Grant.create(id: 2, name: "Good Neighbor Next Door")
Grant.create(id: 3, name: "First Homes Program")
Grant.create(id: 4, name: "Alliance Housing Assistance Gift Funds")
Grant.create(id: 5, name: "House Key Extra")
Grant.create(id: 6, name: "Home Quest Program")
Grant.create(id: 7, name: "Futures Home Assistance Program")
Grant.create(id: 8, name: "Down Payment Assistance Program")
Grant.create(id: 9, name: "Down Payment Assistance")
Grant.create(id: 10, name: "HomeChoice")
Grant.create(id: 11, name: "House Key Plus Downpayment Assistance")
Grant.create(id: 12, name: "House Key Rural")
Grant.create(id: 13, name: "Downpayment Assistance Program")
Grant.create(id: 14, name: "House Key Schools")
Grant.create(id: 15, name: "House Key")
Grant.create(id: 16, name: "Rural Housing Direct Loan")
Grant.create(id: 17, name: "HUD-Insured Loans for Condominiums")
Grant.create(id: 18, name: "Rural Housing Guaranteed Loan")
Grant.create(id: 19, name: "HUD-Insured Energy Efficient Loans")
Grant.create(id: 20, name: "HUD's FHA Loan")
Grant.create(id: 21, name: "VA Home Loans")

### Questions ###
Question.all.each{|m| m.destroy}
Question.create(id: 1, text: "US Citizen")
Question.create(id: 2, text: "Location")
Question.create(id: 3, text: "First Home")
Question.create(id: 4, text: "Household Income")
Question.create(id: 5, text: "Family Size")
Question.create(id: 6, text: "Vetren Status")
Question.create(id: 7, text: "Profession")
Question.create(id: 8, text: "Diability Status")

### Question Options ###
QuestionOption.all.each{|m| m.destroy}
QuestionOption.create(question_id: 1, text: "Yes")
QuestionOption.create(question_id: 1, text: "No")
QuestionOption.create(question_id: 2, text: "Seattle")
QuestionOption.create(question_id: 2, text: "Spokane")
QuestionOption.create(question_id: 3, text: "Yes")
QuestionOption.create(question_id: 3, text: "No")
QuestionOption.create(question_id: 4, text: "0 - $20,000")
QuestionOption.create(question_id: 4, text: "$20,001 - $30,000")
QuestionOption.create(question_id: 4, text: "$30,001 - $45,000")
QuestionOption.create(question_id: 4, text: "$45,001 - $60,000")
QuestionOption.create(question_id: 4, text: "$60,001 - $75,000")
QuestionOption.create(question_id: 4, text: "$75,001+")
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
QuestionOption.create(question_id: 7, text: "Active Military")
QuestionOption.create(question_id: 8, text: "Aids/HIV")
QuestionOption.create(question_id: 8, text: "Birth defect")
QuestionOption.create(question_id: 8, text: "Disabled vetern")
