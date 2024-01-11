require_relative 'show'

class List
  attr_accessor :shows

  def initialize
    @shows = []
    puts 'Please select the following options:'
  end

  def run 
    loop do
      puts '⬇️⬇️⬇️⬇️'
      puts '1) Example List'
      puts '2) Add a show'
      puts '3) Display list'
      puts '4) Add to favorite'
      puts '5) End'

      choice = gets.chomp.to_i

      case choice
      when 1
        example_list
      when 2
        viewer_add_show
      when 3
        display_list
      when 4
        add_to_favorite
      when 5 
        puts 'See you again soon!'
        break
      else
        puts 'Not a option. Please try again.'
      end
    end
  end

  def add_show(title, network)
    show = Show.new(title, network)
    @shows << show
    puts "You have #{title} on your list."
  end

  def add_to_favorite
    puts 'Enter the title of the show you like to favorite:'
    show_title = gets.chomp

    show = find_show_by_title(show_title)

    if show
      show.viewers_favorite = true
      puts "#{show.title} has been favorite by the viewer!"
    else
      puts "Show '#{show_title}' is not listed."
    end
  end 

  def display_list
    puts 'List:'
    @shows.each do |show|
      favorite = show.viewers_favorite ? '(Viewer Favorite)' : ''
      puts "#{show.title} - #{show.network} #{favorite}"
    end
  end

  def viewer_add_show
    puts 'Input the title of the show (type "end" to finish):'
    show_title = gets.chomp

    return if show_title.downcase == 'end'

    puts 'Input the network of the show:'
    show_network = gets.chomp

    add_show(show_title, show_network)
  end

  def example_list
    puts 'Example List:'
    puts 'Game of Throne - HBO'
    puts 'Squid Game - Netflix'
    puts 'Spy Family - Crunchyroll'
  end

  private 

  def find_show_by_title(title)
    @shows.find { |show| show.title == title }
  end
end
