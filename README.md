- Class Factory is similar to struct


Customer = Factory.new(:name, :address, :zip)
# => Customer

joe = Customer.new('Joe Smith', '123 Maple, Anytown NC', 12345)

joe.name    # => "Joe Smith"
joe['name'] # => "Joe Smith"
joe[:name]  # => "Joe Smith"
joe[0]      # => "Joe Smith"
Ruby
Customer = Factory.new(:name, :address) do
  def greeting
    "Hello #{name}!"
  end
end

Customer.new('Dave', '123 Main').greeting # => "Hello Dave!"