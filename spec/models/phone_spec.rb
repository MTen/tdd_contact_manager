require 'spec_helper'

describe Phone do
  it 'does not allow duplicate phone numbers per contact' do
    contact = Contact.create(first_name: 'Joe', last_name: 'Tester', email: 'joetester@example.com')
    contact.phones.create(phone_type: 'home', phone: '914-555-5555')
    mobile_phone = contact.phones.build(phone_type: 'mobile', phone: '914-555-5555')

    expect(mobile_phone).to have(1).errors_on(:phone)
  end

  it 'allows two contacts to share a phone number' do
    contact = Contact.create(first_name: 'Joe', last_name: 'Tester', email: 'joetester@example.com')
    contact.phones.create(phone_type: 'home', phone: '914-555-5555')
    other_contact = Contact.new
    other_entry = other_contact.phones.build(phone_type: 'home', phone: '914-555-5555')
    expect(other_entry).to be_valid
  end

end