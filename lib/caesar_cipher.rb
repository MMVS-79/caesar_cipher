# frozen_string_literal: true

require_relative "caesar_cipher/version"

module CaesarCipher
  class Error < StandardError; end

  # Method to encode a message
  def encode(message, shift)
    message.chars.map do |char|
      if char.match(/[a-z]/) #ASCII value of 'z' is 122
        # Shift lowercase letters
        ((char.ord - 'a'.ord + shift) % 26 + 'a'.ord).chr #% 26 makes sure that after shifting a letter, the result is always a valid letter within the alphabet
      elsif char.match(/[A-Z]/) 
        # Shift uppercase letters
        ((char.ord - 'A'.ord + shift) % 26 + 'A'.ord).chr
      else
        # Keep non-alphabetic characters unchanged
        char
      end
    end.join
  end

  # Method to decode a message
  def decode(message, shift)
    # Decoding is just encoding with a negative shift
    encode(message, -shift)
  end
  
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
