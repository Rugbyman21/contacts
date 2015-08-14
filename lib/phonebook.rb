class Phonebook

  attr_reader(:number)

  @@phonebook = []

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
    @id = attributes.fetch(:id)
  end

  define_method(:number) do
    @number.to_i
  end

  define_method(:type) do
    @type
 end

 define_method(:id) do
   @id.to_i
 end

 define_singleton_method(:all) do
   @@phonebook
 end

  define_method(:save) do
    @@phonebook.push(self)
  end

  define_singleton_method(:clear) do
    @@phonebook = []
  end

  define_singleton_method(:find) do |id|
    found_phonebook = nil
    @@phonebook.each() do |phonebook|
      if phonebook.id().eql?(id)
        found_phonebook = phonebook
      end
    end

  found_phonebook

  end
end
