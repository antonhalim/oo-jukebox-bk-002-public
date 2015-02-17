class Jukebox
  require 'pry'
  require 'pry-nav'
  attr_accessor :songs

  def initialize(songs)
    @songs = songs
  end

  def call
  end

  def help
    puts 'help'
    puts 'lists'
    puts 'play'
    puts 'exit'
  end


  def list
    songs.each do |song|
      puts song
    end
  end

  def play(num=1)
    if num.to_s =~ /^\d/
      puts "Now Playing: #{songs[num.to_i-1]}"
    elsif num.class == String
      @songs.each do |song|
        if song.include?(num)
          puts "Now Playing: #{song}"
        end
      end
    end
  end

  def call
    puts "What Would You Like Me To Do"
    puts "type help if do not know what to do!"
    command = gets.chomp
    case command
    when "help"
      help
    when "list"
      list
    when "exit"
      exit
    end

    if command == "play"
      play
    elsif command =~ /play\s\d/
      num = command[command =~ /\d/]
      puts play(num)
    else
      @songs.each do |song|
        if command.include?(song)
          play(song)
        end
      end
    end

  end

  def exit
    exit
  end




end
