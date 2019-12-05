

def parse_input(input,noun = 12, verb = 2)
  inputs = input.split(",").map { |s| s.to_i }

  # replace inputs with value
  inputs[1] = noun
  inputs[2] = verb

  position = 0

  while (position < inputs.count)
    case inputs[position]
    when 1..2
      # Add together the two positions specified after this position
      first   = inputs[inputs[position+1]].to_i
      second  = inputs[inputs[position+2]].to_i
      # and put this value into the position specified after those
      if inputs[position] == 1
        # puts "Adding #{first} + #{second} to #{inputs[inputs[position+3]]}"
        inputs[inputs[position+3]] = first + second
      elsif inputs[position] == 2
        inputs[inputs[position+3]] = first * second
      end
    when 99
      break
    else
      puts "#{inputs[position]} (#{inputs[position].class}) unknown"
    end
    position += 4
  end

  return inputs.join(",")

end

code = "1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,5,19,23,1,23,5,27,1,27,13,31,1,31,5,35,1,9,35,39,2,13,39,43,1,43,10,47,1,47,13,51,2,10,51,55,1,55,5,59,1,59,5,63,1,63,13,67,1,13,67,71,1,71,10,75,1,6,75,79,1,6,79,83,2,10,83,87,1,87,5,91,1,5,91,95,2,95,10,99,1,9,99,103,1,103,13,107,2,10,107,111,2,13,111,115,1,6,115,119,1,119,10,123,2,9,123,127,2,127,9,131,1,131,10,135,1,135,2,139,1,10,139,0,99,2,0,14,0"

# We need to try all combinations of noun and verb from 0 to 99
99.times do |noun|
  99.times do |verb|

    result = parse_input(code,noun,verb)
    puts "n: #{noun}, v: #{verb} - #{result.split(",")[0]}"
  end
end