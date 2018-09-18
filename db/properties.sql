DROP TABLE IF EXISTS properties;

CREATE TABLE properties(
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value VARCHAR(255),
  bedrooms INT2,
  year_built INT2
);



-- 1. Set up your directory structure
-- 2. Create `console.rb` which will be used to create some new objects and practice your methods as required (use this as you are writing the class & methods to test them)
-- 3. Create a Ruby file for your Property class
-- 4. Write your class definition in the file - `initialize`, `attr_reader`s, instance variables
-- 5. Make the database - `createdb` in command line
-- 6. Make a .sql file and write some SQL to create your database table
-- 7. Run the .sql file to set up the table (`psql -d data_base_name -f file_name.sql`
-- 8. Implement `save`, `update` and `delete` methods on your class

-- 9. Implement a `find` method that returns one instance of your class when an id is passed in.
-- 10. Implement a `find_by_address` method that returns one instance of your class when a name is passed in, or nil if no instance is found.
