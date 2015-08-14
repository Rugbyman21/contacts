require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')
require('./lib/phonebook')

get('/') do
  erb(:index)
end

get('/contacts/new') do
   erb(:contacts_form)
end

get('/contacts') do
  @contacts = Contacts.all()
  erb(:contacts)
end

post('/contacts') do
  name = params.fetch('name')
  Contacts.new(name).save()
  @contacts = Contacts.all()
   erb(:success)
end

get('/phonebook/:id') do
  @phonebook = Phonebook.find(params.fetch('id').to_i())
  erb(:phonebook)
end

get('/contacts/:id') do
  @contacts = Contacts.find(params.fetch('id').to_i())
  erb(:contact)
end

get('/contacts/:id/phonebooks/new') do
    @contacts = Contacts.find(params.fetch('id').to_i())
    erb(:contacts_phonebook_form)
end

post('/phonebook') do
  number = params.fetch('number')
  type = params.fetch('type')
  id = params.fetch('id')
  @phonebook = Phonebook.new(number, type, id)
  @phonebook.save()
  @contact = Contacts.find(params.fetch('contacts_id').to_i())
  @contact.add_phonebook(@phones)
  erb(:success)
end
