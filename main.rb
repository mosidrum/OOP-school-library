require_relative 'app'
require_relative 'menu'

def end_app
  puts 'Thanks and goodbye'
end

def main
  app = App.new
  Menu.display(app)
end
main
