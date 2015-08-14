require('rspec')
require('phonebook')

describe(Phonebook) do
  before() do
    Phonebook.clear()
  end

  describe('#number') do
    it("return contact phone number") do
      test_phonebook = Phonebook.new({:number => "1111111111", :type => "home", :id => "1"})
      expect(test_phonebook.number()).to(eq(1111111111))
    end
  end



  describe("#type") do
    it("returns the type of phone") do
      test_phonebook = Phonebook.new({:number => "1111111111", :type => "home", :id => "1"})
      expect(test_phonebook.type()).to(eq("home"))
    end
  end

  describe("#id") do
    it("returns a contacts number with a id number")do
      test_phonebook = Phonebook.new({:number => "1111111111", :type => "home", :id => "1"})
      expect(test_phonebook.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a contact to the array of saved contacts") do
      test_phonebook = Phonebook.new({:number => "1111111111", :type => "home", :id => "1"})
      test_phonebook.save()
      expect(Phonebook.all()).to(eq([test_phonebook]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Phonebook.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved phone numbers") do
      Phonebook.new({:number => "1111111111", :type => "home", :id => "1"}).save()
      Phonebook.clear()
      expect(Phonebook.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("return Phone numbers by its id number") do
      test_phonebook = Phonebook.new({:number => "1111111111", :type => "home", :id => "1"})
      test_phonebook.save()
      test_phonebook2 = Phonebook.new({:number => "1111111111", :type => "home", :id => "2"})
      test_phonebook2.save()
      expect(Phonebook.find(test_phonebook.id())).to(eq(test_phonebook))
    end
  end
end
