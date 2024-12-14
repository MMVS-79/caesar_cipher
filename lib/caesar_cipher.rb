# frozen_string_literal: true

require_relative "caesar_cipher/version"

module CaesarCipher
  class Error < StandardError; end
  
end

module InputHandler
  def get_user_input
    puts "Enter a string:"
    string_input = gets.chomp
    
    # Validate string input
    if string_input.empty?
      puts "Invalid input: String cannot be empty."
      return
    end

    puts "Enter an integer:"
    integer_input = gets.chomp

    # Validate integer input
    if integer_input.match?(/^\d+$/) # Regex to check if input contains only digits
      integer_input = integer_input.to_i
    else
      puts "Invalid input: Please enter a valid integer."
      return
    end

    # If both inputs are valid, display them
    puts "You entered the string: '#{string_input}' and the integer: #{integer_input}"
  end
end
