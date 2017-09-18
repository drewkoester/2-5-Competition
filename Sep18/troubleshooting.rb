# cerner_2^5_2017
require 'highline/import'
require 'launchy' # open browser
require 'open-uri' # encoding

# Keep asking the question until we get the desired response
def ask_the_question(question, valid_response)
  loop do
    answer = ask(question + "? [Y/N] ") { |yn| yn.limit = 1, yn.validate = /[yn]/i }
    return answer if answer.downcase == valid_response.downcase || valid_response == ''
  end
end

# Step 1: What is your problem
puts 'What problem are you experiencing?'
users_problem = gets.chomp

# Step 2: Did you try turning it off and back on again?
ask_the_question(' Have you tried turning it off and on again', 'y')
problem_solved = ask_the_question(' Did that solve your problem', '')

# Step 3: Profit
puts 'Sweet' if problem_solved.downcase == 'y'
url = "www.google.com/search?source=hp&q=" << URI::encode(users_problem) << "&safe"
puts Launchy.open(url)  if problem_solved.downcase == 'n'
