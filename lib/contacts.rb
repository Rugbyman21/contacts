class Contacts
  attr_reader(:name, :street, :id, :city, :state, :zip, :phones)

  @@contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @street = attributes.fetch(:street)
    @id = attributes.fetch(:id)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @phones = []

  end

  define_method(:name) do
    @name
  end


 define_method(:street) do
   @street
 end

 define_method(:id) do
   @id.to_i
 end

 define_method(:city) do
   @city
 end

  define_method(:state) do
    @state
  end

  define_method(:zip) do
    @zip
  end

  define_singleton_method(:all) do
    @@contacts
  end


  define_method(:save) do
    @@contacts.push(self)
  end

define_method(:add_phonebook) do |phonebook|
  @phones.push(phonebook)
end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |id|
    found_contacts = nil
    @@contacts.each() do |contacts|
      if contacts.id().eql?(id)
        found_contacts = contacts
      end
    end

  found_contacts

  end
end
