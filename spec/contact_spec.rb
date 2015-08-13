require('rspec')
require('contacts')
require('phonebook')


  describe(Contacts) do
    before() do
      Contacts.clear()
    end

    describe('#name') do
      it('returns the name of the person in the phonebook') do
        test_contacts = Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        expect(test_contacts.name()).to(eq("Mary"))
      end
    end

    describe('#street') do
      it("returns street address in the phonebook") do
        test_contacts = Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        expect(test_contacts.street()).to(eq("1st street"))
      end
    end

    describe('#id') do
      it("returns the id of the contacts") do
        test_contacts = Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        expect(test_contacts.id()).to(eq(1))
      end
    end

    describe('#city') do
      it("returns the city in the phonebook") do
        test_contacts = Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        expect(test_contacts.city()).to(eq("Portland"))
      end
    end

    describe('#state') do
      it("returns the state where the contact lives") do
        test_contacts = Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        expect(test_contacts.state()).to(eq("Oregon"))
      end
    end

    describe("#zip") do
      it("returns the zip code where the contact lives") do
        test_contacts = Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        expect(test_contacts.zip()).to(eq("11111"))
      end
    end

    describe("#save") do
      it("adds a contact to the array of saved contacts") do
        test_contacts = Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        test_contacts.save()
        expect(Contacts.all()).to(eq([test_contacts]))
      end
    end

    describe(".all") do
      it("is empty at first") do
        expect(Contacts.all()).to(eq([]))
      end
    end

    describe(".clear") do
      it("empties out all of the saved contacts") do
        Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"}).save()
        Contacts.clear()
        expect(Contacts.all()).to(eq([]))
      end
    end

    describe(".find") do
      it("return contacts by its id number") do
        test_contacts = Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        test_contacts.save()
        test_contacts2 = Contacts.new({:name => "Bob", :street => "3rd street", :id => "2", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        test_contacts2.save()
        expect(Contacts.find(test_contacts.id())).to(eq(test_contacts))
      end
    end

    describe('#phonebook') do
      it("adds a person's number to the contactbook") do
        test_contact = Contacts.new({:name => "Mary", :street => "1st street", :id => "1", :city => 'Portland', :state => 'Oregon', :zip => "11111"})
        test_phonebook = Phonebook.new({:number => "1111111111", :type => "home", :id => "1"})
        test_contact.add_phonebook(test_phonebook)
        expect(test_contact.phones()).to(eq([test_phonebook]))
      end
    end
 end
