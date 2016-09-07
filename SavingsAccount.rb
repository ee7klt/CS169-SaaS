class SavingsAccount

  include Comparable
  def <=> (other)
    self.balance <=> other.balance
  end

  def initialize(balance=0)
    @balance = balance
  end

  # attr_accessor : balance
  def balance
    @balance
  end
  def balance=(new_amount)
    @balance=new_amount
  end
  def deposit(amount)
    @balance += amount
  end

@@bank_name = "MyBank.com"
def self.bank_name
  @@bank_name
end

end


class Numeric
  def euros
    self * 1.292
  end
end


class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292}
  def method_missing(method_id, *args, &block)
    singular_currency = method_id.to_s.gsub(/s$/,'')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
end


["apple", "banana", "cherry"].each do |string|
  puts string
end

for i in (1..10) do
  puts i
end

1.upto 10 do |num|
  puts num
end


3.times { print "Rah, "}


x = ["apple","cherry","apple","banana"]
print x.sort
x.uniq.reverse

x.map do |fruit|
  fruit.reverse
end.sort


x.collect {|f| f.include?("e")}

x.any? {|f| f.length > 5}


regexp = /"([^"]+)",\s*"([^"]+)"/
movies = [%q{"Aladdin",   "G"},
             %q{"I, Robot", "PG-13"},
             %q{"Star Wars","PG"}]

movies.each do |movie|
     movie.match(regexp)
     title,rating = $1,$2
     print title + '  ' + rating
     print "\n"
   end






   class Book
      attr_accessor :author
      attr_reader :title
      attr_writer :comments
      def initialize(author, title)
        @author = author
        @title = title
        @comments = []
      end
    end

    book = Book.new("Chuck Palahniuk", "Fight Club")



s = "Hello: I`m a l33t programmer!!"

  print  s.split(/[^a-zA-Z]/).reject{|e| e == "I" || e.empty?}
  print s.split(/[^a-zA-Z]/).reject{|e| e == "I"}
    print s.scan(/[a-zA-Z]/).reject{|e| e == "I" || e.empty?}
    print  s.split(/[^a-z^A-Z]/).reject{|e| e == "I"}




    def mystery_sequence(start1, start2, limit=4)
  yield start1
  yield start2
  nextval = start1 + start2
  1.upto(limit) do
    yield nextval
    nextval, start2 = nextval + start2, nextval
  end
end




class RandomSequence
  def initialize(limit,num)
    @limit,@num = limit,num
  end
  def each
    @num.times{yield (rand * @limit).floor}
  end
end


i = -1
RandomSequence.new(10,4).each do |num|
  puts num,i
  i=num if i < num
end


# So basically when the execution of my_method reaches the
# line with the call to yield, the code inside the block
# gets executed. Then, when the code inside the block finishes,
# the execution of my_method continues.

def my_method
  puts "reached the top"
  yield
  puts "reached the bottom"
end

my_method do
  puts "reached yield"
end


puts '________________'

# A method doesn’t need to specify the block
# in it’s signature in order to receive a block parameter.
# You can just pass a block to any function but unless
# that function calls yield, the block won’t get executed.

def my_method
  puts "reached the top"
  puts "reached the bottom"
end

my_method do
  puts "reached yield"
end



def my_method
  yield("John",2)
end
my_method do |name,age|
  puts "#{name} is #{age} years old"
end



mystery_sequence(2,3) do |elt| ; s<<elt; end
