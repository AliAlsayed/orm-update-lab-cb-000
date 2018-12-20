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

  def save
    DB[:conn].execute("""
      insert into students (name, grade) values (?, ?)
    """, @name, @grade)
    @id = DB[:conn].execute("select last insert row_id() from students")[0][0]
  end

end
