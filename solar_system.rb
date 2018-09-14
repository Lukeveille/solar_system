require "pry-nav"

class System
  def initialize
    @bodies = []
  end

  def add(planet)
    double = false
    @bodies.each do |body|
      if body == planet
        double = true
        break
      end
    end

    if double == false
      @bodies << planet
    end
  end

  def total_mass
    total = 0
    @bodies.each do |body|
      total += body.mass
    end
    return total
  end

  attr_reader :bodies
end

# Body class
class Body
  def initialize(name, mass)
    @name = name
    @mass = mass
  end

  attr_reader :name, :mass
end

# All body sub-classes
class Planet < Body
  def initialize(name, mass, day, year)
    super(name, mass)
    @day = day
    @year = year
  end
end

class Star < Body
  def initialize(name, mass, type)
    super(name, mass)
    @type = type
  end
end

class Moon < Body
  def initialize(name, mass, month, planet)
    super(name, mass)
    @month = month
    @planet = planet
  end
end

# Object for the entire solar system
solar_system = System.new

# Sun object
sun = Star.new("The Sun", (1.989 * (10 ** 30)), "G-type")

# Objects for each planet
mercury = Planet.new("Mercury", (3.3011 * (10 ** 23)), 1408, 88)
venus = Planet.new("Venus", (4.8675 * (10 ** 24)), 2802, 225)
earth = Planet.new("Earth", (5.97237 * (10 ** 24)), 24, 365)
mars = Planet.new("Mars", (6.4171 * (10 ** 23)), 24, 687)
jupiter = Planet.new("Jupiter", (1.8982 * (10 ** 27)), 10, 4300)
saturn = Planet.new("Saturn", (5.6834 * (10 ** 26)), 11, 10759)
uranus = Planet.new("Uranus", (8.6810 * (10 ** 25)), 17, 30688)
neptune = Planet.new("Neptune", (1.0243 * (10 ** 26)), 16, 60182)

# Moon objects
earth_moon = Moon.new("The Moon", (7.342 * (10 ** 22)), 27.32, earth)

solar_system.add(sun)

solar_system.add(mercury)
solar_system.add(venus)
solar_system.add(earth)
solar_system.add(mars)
solar_system.add(jupiter)
solar_system.add(saturn)
solar_system.add(uranus)
solar_system.add(neptune)

solar_system.add(earth_moon)

puts "Total mass is #{solar_system.total_mass} kg"

solar_system.add(earth)
solar_system.add(earth)
solar_system.add(earth)

solar_system.bodies.each do |body|
  puts "#{body.name}"
end

binding.pry
