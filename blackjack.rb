# Notes
# at a p1 p2 game_deck money win loss recordsbv
#
# p1 []
# p2 []
# money
# game_deck = Deck.new
#
# 1 overall method
#
# # require deck and cards
#
# def deal
#   2.times do
#   player_hand << gamedeck.draw
#   dealer_head << gamedeck.draw
#   end
# end
#
# def hit_phase
#   player_hand << gamedeck.draw
#   player_turn
# end
#
# # how much would you like to bet
#
# def player_turn
#   player_hand.each do |card|
#     puts card
#   end
#   hand_value = player_hand.reduce(:+)
#   puts "Your hand is #{hand_value}"
# if answer == 'y'
#   hit.phase
# end
# end
#
# def dealer_turn
#   puts "dealers' turn"
#   puts "#{hand_value [0]}"
#     hand_value = dealer_hand.reduce(:+)
#     if dealer_value < 16
#       dealer_hitphase
#     end
# end
#
#
#
# deal
# player turn
#   look
#   hit
#   stay
# dealer turn
#   decide hit or stay
# show hands
# declare winner
#   output winner
#   money
# rematch
#   if no money no dice



require 'pry'
require_relative 'deck'
require_relative 'card'

class Blackjack
  attr_accessor :mcfly_hand, :house_hand, :bkj_deck, :pot, :first_hand, :hit_phase, :mcfly_final, :house_final

def initialize
    self.mcfly_hand = []
    self.mcfly_final = []
    self.house_hand = []
    self.house_final = []
    self.bkj_deck = Deck.new
    self.pot = 100
  end

  def play
    start
    mcfly_turn
    house_turn
    show_em
      # busted
    winner
    rematch
    hit_phase
    d_hit_phase
    replay
  end


  def start
    if first_hand == true
      puts "Hey McFly, looking to try your hand at BLACKJACK?"
        # jon said there was a way to set a beat/time between put statements... not sure if truew
      puts "Great! There's a $10 buy-in. Let's go."
    end
      self.pot -= 10
        puts pot

    2.times do
      mcfly_hand << bjk_deck.draw
      house_hand << bjk_deck.draw
    end
      puts "You've been dealt:"
        puts mcfly_hand
      puts "The House shows:"
      # way to show only one card to user, like #{house_hand[0]}? if/else
        puts house_hand
  end


  def replay
    puts "Hey McFly, can't get enough, huh? 10 bucks, lets go!"
    self.pot -= 10
      puts pot
    2.times do
      mcfly_hand << bjk_deck.draw
      house_hand << bjk_deck.draw
    end
      puts "You've been dealt:"
        puts mcfly_hand
          puts "The House shows:"
          # way to show user only one house card
            puts house_hand
  end

  # def busted
  #   if mcfly_hand > 21
  #     puts "Hey McFly, you've crapped out!"
  #     puts "Sorry, wrong table!"
  #   end
  # end

  # needs to be both House and player? needs to similar to house_turn if else
  # need to define end of game?


  def mcfly_turn
    mcfly_hand.each do |card|
      puts card
    end
      mcfly_value = mcfly_hand.reduce(:+)
    puts "Your hand is worth #{mcfly_value}."

    puts "Hey, McFly do you wanna HIT or STAY?"
      answer = gets.chomp.downcase
      if answer == "hit"
        hit_phase
      end

  end

  def hit_phase
    mcfly_hand << bjk_deck.draw
    mcfly_turn
  end


  def house_turn
    puts "The House shows:"
    house_value = house_hand.reduce(0) {|sum, num| sum + num.value}
    # had to borrow this from Jacob ... not sure what's going on in math above, but he swears it works
    if house_value < 16
      d_hit_phase
    end
      puts house_value
  end


  def d_hit_phase
    house_hand << bjk_deck.draw
      house_turn

  end


  def show_em
    mcfly_final_value = mcfly_hand.reduce(:+)

    house_final_value = house_hand.reduce(:+)
      puts "Your cards total #{mcfly_final_value} and the House has #{house_final_value}."

    if mcfly_final_value > house_final_value
      puts "Good for you, McFly! How about a tip for your friendly neighborhood dealer?"

        puts "McFly?"
      puts "Hello, McFly?"
    else
      puts "You're a loser McFly!"
    end
  end

  def winner
    mcfly_final_value = mcfly_hand.reduce(:+)
    house_final_value = house_hand.reduce(:+)
      win = mcfly_final_value > house_final_value
    if win
      self.pot += 10
      puts "Your take is $#{pot}."
    else
      self.pot -= 10
      puts "You now have $#{pot}."
    end
  end

  def rematch
    puts "Like your chances at another hand? Y/N"
    answer = gets.chomp.downcase
    if answer == "y"
      self.mcfly_hand = []
      self.house_hand = []
    else
      puts "I've said it once, I'll say it again: you're a loser McFly!"
      puts "Now hit the buffet!"
    end
  end

end


game = Blackjack.new
binding.pry
