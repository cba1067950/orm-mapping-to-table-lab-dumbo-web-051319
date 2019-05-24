class Student
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  
  @@all = []
  
  attr_reader :name, :grade, :id
  def initialize(name, grade, id=nil)
    @name = name 
    @grade = grade
    @id = id
  end 
  
  def self.all 
    @@all
  end 
  
  def self.create_table 
    sql = <<-SQL    
    CREATE TABLE students (id INTEGER PRIMAY KEY, name TEXT, grade TEXT);
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table 
    sql = <<-SQL    
    DROP TABLE students;
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def save
    sql = <<-SQL    
    INSERT INTO students (name, grade) VALUES ("#{self.name}", "#{self.grade}");
    SQL

    DB[:conn].execute(sql)
  end 
end
