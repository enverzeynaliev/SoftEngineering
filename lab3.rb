def task_1
  file = File.open('input.txt')
  #students= file.readlines.map { :chomp }
  students = file.read.split("\n")
  file.close
  result = []

  loop do
    puts 'Введите возраст'
    input = gets.to_i
    break if input == -1 #для выхода ввести -1

    students.each { |student|
      result.append(student) if student.split(' ')[2].to_i == input
    }
    break if students.length == result.length
  end

  file = File.open('result.txt', 'w')
  result.each { |s|
    puts s
    file.write(s + "\n")
  }
  file.close
end


def task_2
  balance = 100.0
  if File.exist?("balance.txt") #проверка существования файла
    f = File.open("balance.txt")
    balance = f.read.to_f
    f.close
  end
  loop do

    puts "
  (B) Баланс
  (D) Депозит
  (W) Вывод
  (Q) Quit"

    choose = gets.chomp

    case choose.downcase
    when 'd'
      puts 'Введите сумму для депозита'
      sum = gets.to_f
      if sum <= 0
        puts 'Сумма должна быть больше нуля'
      else
        balance += sum
        puts "Ваш новый баланс: #{balance}"
        f = File.open('balance.txt', 'w')
        f.write(balance)
      end
    when 'w'
      puts 'Введите сумму для списания'
      sum = gets.to_f
      if sum <= 0
        puts 'Сумма должна быть больше нуля'
      elsif sum > balance
        puts 'Недостаточно средств'
      else
        balance -= sum
        puts "Ваш новый баланс: #{balance}"
      end
      f = File.open('balance.txt', 'w')
      f.write(balance)
    when 'b'
      puts "Ваш баланс: #{balance}"
    when 'q'
      f = File.open('balance.txt', 'w')
      f.write(balance)
      f.close
      break
    else
      puts 'Некоректно выбран пункт меню'
    end
  end
end

def menu
  loop do
    puts '1. Задание 1'
    puts '2. Задание 2'
    puts '0. Выход'

    choose = gets.to_i
    case choose
    when 1
      task_1
    when 2
      task_2

    when 0
      break
    else
      puts 'Нет такого варианта'
    end
  end
end

menu

