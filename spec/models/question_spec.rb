# require 'rails_helper'
#
# describe Question, type: :model do
#   it { should validate_presence_of :text }
#   it { should validate_presence_of :quiz }
#   it { should have_many :answers }
#
#   describe "#answers" do
#     let!(:question) { FactoryGirl.create(:question) }
#     let(:wrong_answers) { FactoryGirl.create_list(:answer, 3, question: question, correct: false) }
#     let(:correct_answer) { FactoryGirl.create(:answer, question: question, correct: true) }
#
#     it "should have four answers" do
#       expect(question.answers.count).to eq 4
#     end
#
#     it "should not have more than four answers" do
#       expect { FactoryGirl.create(:answer, question: question) }.to raise_error("A question can only have four answers")
#     end
#
#     it "should have one correct answer"
#
#     it "should have three incorrect answers"
#   end
#
#   describe "#correct_answer" do
#     it "should return the correct answer"
#   end
#
#   describe "#correct_answer=" do
#     it "should change the correct answer"
#   end
# end
