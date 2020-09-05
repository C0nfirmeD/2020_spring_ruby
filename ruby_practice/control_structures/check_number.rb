def main
    p ARGV
    if ARGV.size == 1
        number = to_integer
    elsif
        number = nil
    end
    
    calc(number)
end

def to_integer
    if ARGV.first =~ /^[-\d]\d*$/
        ARGV.first.to_i
    end
end

def calc(number)

    if number == nil
        puts format("%s\n\n%s", "Данное приложение производит проверку числа. Передайте число в качестве первого аргумента приложения.",
        "check_number.rb NUMBER")
    elsif number > 0
        puts "положительное число"
    elsif number < 0
        puts "не положительное, а отрицательное число"
    else
        puts "непонятное число"
    end
end

if __FILE__ == $0
    main
end