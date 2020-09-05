def main
    puts 'I am working!'
    puts "My arguments are: #{ARGV}"
    p ARGV # See them like Ruby sees them.

    arguments = ARGV.each do |arg|
        arg
    end
    p arguments
  end
  
  # Keep it in the bottom of the file
  if __FILE__ == $0
      main
  end