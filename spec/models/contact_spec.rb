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

  it 'is invalid without an email address' do
    expect(Contact.new(email: nil)).to have(1).errors_on(:email)
  end

  it 'is invalid with a duplicate email address' do
    Contact.create(
      first_name: 'Joe', last_name: 'Tester', email: 'tester@example.com'
    )
    contact = Contact.new(
      first_name: 'Jane', last_name: 'Tester', email: 'tester@example.com'
    )
    expect(contact).to have(1).errors_on(:email)
  end

  it 'returns a contact\'s full name as a string' do
    contact = Contact.new(first_name: 'John', last_name: 'Tester', email: 'john@test.com')
    expect(contact.name).to eq 'John Tester'
  end

  describe "filter last name by letter" do
    before :each do
      smith = Contact.create(first_name: 'John', last_name: 'Smith', email: 'jsmith@example.com')
      jones = Contact.create(first_name: 'Tim', last_name: 'Jones', email: 'tjones@example.com')
      johnson = Contact.create(first_name: 'John', last_name: 'Johnson', email: 'jjohnson@example.com')
    end

    context 'matching letters' do
      expect(Contact.by_letter("J")).to eq [johnson, jones]
    end

    context 'non-matching letters' do
      expect(Contact.by_letter("J")).to_not include [smith]
    end
  end

end
