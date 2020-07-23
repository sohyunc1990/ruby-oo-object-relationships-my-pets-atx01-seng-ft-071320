require'pry'
class Owner
  attr_reader :name, :species
  attr_accessor :dog, :cat, :mood
  @@all = []
  
  def initialize (name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    save
  end
  
  def save
    @@all << self
  end
  
  def say_species
    p "I am a #{self.species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end

  def cats
    @cats
  end
  
  def dogs
    @dogs
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    @dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    @cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    @dogs.each {|dog| dog.mood = "nervous"}
    @cats.each {|cat| cat.mood = "nervous"}
    @cats.each {|owner| cats.delete owner}
    @dogs.each {|owner| dogs.delete owner}

  end
  
  def list_pets
    "I have #{@dogs.count} dog(s), and #{@cats.count} cat(s)."
  end
  
end