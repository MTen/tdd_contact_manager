require 'spec_helper'

describe Contact do

  it 'is valid with a first name, last name, and email' do
    contact = Contact.new(
      first_name: 'Aaron',
      last_name: 'Summer',
      email: 'text@testies.com'
    )
    expect(contact).to be_valid
  end

  it 'is invalid without a first name' do
    expect(Contact.new(first_name: nil)).to have(1).errors_on(:first_name)
  end

  it 'is invalid without a last name' do
    expect(Contact.new(last_name: nil)).to have(1).errors_on(:last_name)
  end

  it 'is invalid without an email address'
  it 'is invalid with a duplicate email address'
  it 'returns a contact\'s full name as a string'
end