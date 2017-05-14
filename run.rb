require './factory'

Customer = Factory.new(:name, :address, :zip) do
  def greeting
    "Hello #{name}!"
  end
end
p Customer.new('Smith', '123 Maple, Anytown NC', 123).greeting
joe = Customer.new('Smith', '123 Maple, Anytown NC', 123)

p joe.name
p joe['name']
p joe[0]

