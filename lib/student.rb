require_relative "../config/environment.rb"

class Student
  attr_accessor :name, :grade
  attr_reader :id
  def initialize(name, grade, id=nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
      DB[:conn].execute("""
            create table if not exists students (id integer primary key,
                                                 name text,
                                                 grade integer);
            """)
  end

  def self.drop_table
    DB[:conn].execute("drop table students;")
  end
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
