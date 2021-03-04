def put_data
  puts 'Введите строку'
  words = gets.chomp
  words = words.split(" ")
  word = words[1]

  if word[word.length - 2, word.length - 1].upcase == "CS"
    puts 2 ** word.length
  else
    puts word.reverse
  end

end

def pokemon_processor
  pokemons =[]
  puts 'Введите количество покемонов'
  number = gets.to_i
  number.times do
    puts 'Pokemon name'
    name1 = gets.chomp
    puts 'Color'
    color1 = gets.chomp
    pokemons << {'name' => name1, 'color' => color1}
  end
  puts 'Массив'
  puts pokemons
end

put_data
