require "./Person.rb"

class Student < Person
  def initialize (clasroom)
    super()
    @clasroom = clasroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end