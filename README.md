Spelunk unfamiliar objects to see what unique methods are in that object, without
all the default Ruby garbage you already know! It's like calling `.methods` on an object,
but it returns information you actually care about.

# Without Spelunk:
  `puts Spelunk.methods.inspect
   [... :===, :==, :<=>, :<, :<=, :>, :>=, :to_s, :inspect, :included_modules, :include?, :name, :ancestors, :instance_methods, :public_instance_methods, :protected_instance_methods, :private_instance_methods, :constants,...]`

# With Spelunk
  `puts Spelunk.methods_for Spelunk`
  `[:methods_for, :private_methods_for, :public_methods_for]`


# Installation

    gem install spelunk

# TODO
* Write a mechanism for puts with .inspect quickly and easily, since this is how I like to use it the most
* Find all the funky ways I've under-thought this issue, and fix them one by one.
* Learn along the way.
