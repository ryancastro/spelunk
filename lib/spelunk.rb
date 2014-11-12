require 'spelunk/version'
module Spelunk
  def self.methods_for object
    get_methods_for object, :""
  end

  def self.private_methods_for object
    get_methods_for object, :"private_"
  end

  def self.public_methods_for object
    get_methods_for object, :"public_"
  end

  def self.args_for object, method
    raise "Method name must be a symbol" unless method.to_sym
    object.method(method).parameters
  end

  def self.dump_methods_for object
    methods = self.methods_for object
    methods.each do |method|
      p "#{object.to_s}.#{method.to_s}: #{self.args_for object, method.to_sym}"
    end
  end

private
  def self.get_methods_for object, type = :""
    base_object = object.class.eql?(Kernel.const_get(object.class.to_s)) ? Object : Object.new
    default_methods = base_object.send(:"#{type}methods")
    all_methods = object.send(:"#{type}methods")
    left_overs = all_methods - default_methods
    left_overs
  end

end
