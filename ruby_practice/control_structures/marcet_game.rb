def main
    if ARGV.size == 2
        args = ARGV.map do |argument|
            to_integer(argument)
        end
    else
        args = [nil, nil]
    end
    calc(args)
end

def to_integer(str)
    if str =~ /^[-\d]\d*$/
        str.to_i
    end
end

def calc(args)
    if args.include?(nil)
        puts format("%s\n\n%s\n", "Приложение эмитирует игру на рынке. Передайте стартовый капитал и количество дней в качестве аргументов приложения.",

        "market_game.rb CAPITAL DAYS"

        )
    else
        (0...args[1]).each do |i|
            case rand(15)+1
            when 15
                args[0]*=1.1
            when 13..14
                args[0]*=1.2
            when 10..12
                args[0]
            when 8..9
                args[0]*=0.98
            when 6..7
                args[0]*=0.9
            else
                args[0]*=0.5
            end
        end
        puts args[0]
    end

end

if __FILE__ == $0
    main
end
