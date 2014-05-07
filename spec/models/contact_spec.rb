require 'spec_helper'

describe Contact do
  it 'is valid with a firstname, lastname, and email' do
    contact = Contact.new(
      first_name: 'Aaron',
      last_name: 'Summer',
      email: 'text@testies.com'
    )
    expect(contact).to be_valid
  end

  it 'is invalid without a firstname'
  it 'is invalid without a lastname'
  it 'is invalid without an email address'
  it 'is invalid with a duplicate email address'
  it 'returns a contact\'s full name as a string'
end