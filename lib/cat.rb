require'pry'
class Cat
  attr_reader :name
  attr_accessor :owner, :mood
  @@all = []
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    owner.cats << self
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
end