# works like Struct
class Factory
  def self.new(*user_methods, &block)
    Class.new do
      user_methods.each do |method_name|
        attr_accessor method_name
      end

      define_method :initialize do |*values|
        user_methods.each_with_index do |method_name, index|
          instance_variable_set("@#{method_name}", values[index])
        end
      end

      define_method :[] do |key|
        key = "@#{key.to_sym}" if key.instance_of? String
        key = instance_variables[key] if key.instance_of? Fixnum #Rubocop complains to Fixnum
        instance_variable_get(key)
      end
      class_eval(&block) if block_given?
    end # end of class new
  end # end of new
end # end of Factory
