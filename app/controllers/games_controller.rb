require 'json'
require 'open-uri'



class GamesController < ApplicationController

  def new
    @letters = ("A".."Z").to_a.sample(10)
  end

  def score
    @time_now = Time.now.to_i
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    user_serialized = URI.open(url).read
    @result = JSON.parse(user_serialized)
    @letter_in_game = true
    word_letters =  params[:word].upcase.chars
    valid_word(word_letters)
  end

  def valid_word(word_letters)
    all_letters = params[:letters].split
    word_letters.each do |letter|
      if all_letters.include?(letter)
        index = all_letters.find_index(letter)
        all_letters.delete_at(index)
      else
        @letter_in_game = false
      end
    end
  end
end
