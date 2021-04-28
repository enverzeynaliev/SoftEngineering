require 'socket'

server = TCPServer.new(8080)

class ATM
  def initialize
    @balance = 10000.0
  end

  def withdraw(sum)
    if sum <= 0
      'Sum should not be negative'
    elsif sum > @balance
      'Not enough money'
    else
      @balance -= sum
      "New balance: #{@balance}"
    end
  end

  def deposit(sum)
    if sum <= 0
      'Sum should not be negative'
    else
      @balance += sum
      "New balance: #{@balance}"
    end
  end

  def balance
    "Your balance: #{@balance} \n"
  end

end

while (connection = server.accept)

  atm = CashMachine.new

  request = connection.gets
  nothing, full_path = request.split(' ')
  path = full_path.split('/')[1]
  next unless nothing == 'GET'
  if full_path.split('/')[1].include?('?')
    method = path.split('?')[0]
    value = path.split('?')[1].split('=')[1].to_i
  end

  connection.print "HTTP/1.1 200\r\n"
  connection.print "Content-Type: text/html\r\n"
  connection.print "\r\n"
  connection.print atm.balance if path == 'balance'

  next if value.nil?
  connection.print case method
                   when 'deposit'
                     atm.deposit(value)
                   when 'withdraw'
                     atm.withdraw(value)
                   else
                     'error'
                   end

end
