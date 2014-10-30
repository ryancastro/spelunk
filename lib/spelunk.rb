#require 'spelunk/version'
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

private
  def self.get_methods_for object, type = :""
    base_object = object.class.eql?(Kernel.const_get(object.class.to_s)) ? Object : Object.new
    default_methods = base_object.send(:"#{type}methods")
    all_methods = object.send(:"#{type}methods")
    left_overs = all_methods - default_methods
    left_overs
  end

end
puts Spelunk.methods_for(Spelunk).inspect
