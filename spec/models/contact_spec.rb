require 'spec_helper'

describe Contact do

  it 'is valid with a first name, last name, and email' do
    expect(build(:contact)).to be_valid
  end

  it 'is invalid without a first name' do
    contact = build(:contact, first_name: nil)
    expect(contact).to have(1).errors_on(:first_name)
  end

  it 'is invalid without a last name' do
    contact = build(:contact, last_name: nil)
    expect(contact).to have(1).errors_on(:last_name)
  end

  it 'is invalid without an email address' do
    contact = build(:contact, email: nil)
    expect(contact).to have(1).errors_on(:email)
  end

  it 'is invalid with a duplicate email address' do
    create(:contact, email: "MikeTener@example.com")
    contact = build(:contact, email: "MikeTener@example.com")
    expect(contact).to have(1).errors_on(:email)
  end

  it 'returns a contact\'s full name as a string' do
    contact = build(:contact)
    expect(contact.name).to eq 'Mike Tener'
  end

  describe "filter last name by letter" do
    before :each do
      @smith = Contact.create(first_name: 'John', last_name: 'Smith', email: 'jsmith@example.com')
      @jones = Contact.create(first_name: 'Tim', last_name: 'Jones', email: 'tjones@example.com')
      @johnson = Contact.create(first_name: 'John', last_name: 'Johnson', email: 'jjohnson@example.com')
    end

    context 'matching letters' do
      it "returns a sorted array of results that match" do
        expect(Contact.by_letter("J")).to eq [@johnson, @jones]
      end
    end

    context 'non-matching letters' do
      it "returns a sorted array of results that match" do
        expect(Contact.by_letter("J")).to_not include @smith
      end
    end
  end

end
