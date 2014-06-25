require 'spec_helper'

describe ContactsController do

  describe 'GET #index' do
    context 'with params[:letter]' do
      it 'populates an array of contacts starting with the letter' do
        smith = create(:contact, last_name: 'Smith')
        jones = create(:contact, last_name: 'Jones')
        get :index, letter: 'S'
        expect(assigns(:contacts)).to match_array([smith])
      end

      it 'renders the :index template' do
        get :index, letter: 'S'
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it 'populates an array of all contacts' do
        smith = create(:contact, last_name: 'Smith')
        jones = create(:contact, last_name: 'Jones')
        get :index
        expect(assigns(:contacts)).to match_array([smith, jones])
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested contact to @contact' do
      contact = create(:contact)
      get :show, id: contact
      expect(assigns(:contact)).to eq contact
    end

    it 'renders the :show template' do
      contact = create(:contact)
      get :show, id: contact
      expect(response).to render_template :show
    end

    #testing nested routes.
    xit 'renders the :show template for the phone' do
      contact = create(:contact)
      phone = create(:phone, contact: contact)
      get :show, id: phone, contact_id: contact.id
      expect(response).to render_tempalte :show
    end

  end

  describe 'Get #new' do
    it 'assigns a new Contact to @contact' do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested contact to @contact' do
      contact = create(:contact)
      get :edit, id: contact
      expect(assigns(:contact)).to eq contact
    end

    it 'renders the :edit template' do
      contact = create(:contact)
      get :edit, id: contact
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    before :each do
      @phones = [
        attributes_for(:phone),
        attributes_for(:phone),
        attributes_for(:phone)
      ]end

    context 'with valid attributes' do
      it 'saves the new contact in the database'
        expect {
          post :create, contact: attributes_for(:contact, phone_attributes: @phones)
        }.to change(Contact, :count).by(1)
      end
      it 'redirects to contacts#show' do
        post :create, contact: attributes_for(:contact, phones_attributes: @phones)
        expect (response).to redirect_to contact_path(assigns[:contact])
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new contact in the database' do
        expect{
          post :create, contact: attributes_for(:invalid_contact)
        }.to_not change(Contact, :count)
      end

      it 're-renders the :new template' do
        post: create, contact: attributes_for(:invalid_contact)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @contact = create(:contact,
        first_name: 'not', last_name: 'mike')
    end

    context 'with valid attributes' do
      it 'locates the requested @contact'
        patch :update, id: @contact, contact: attributes_for(:contact)
        expect(assigns(:contact)).to eq(@contact)
      end

      it 'updates the contact in the database' do
        patch :update, id: @contact, contact: attributes_for(:contact, first_name: "Larry", last_name: "Smith")
        @contact.reload
        expect(@contact.first_name).to eq('Larry')
        expect(@contact.last_name).to eq('Smith')
      end

      it 'redirects to the contact' do
        patch :update, id: @contact, contact: attributes_for(:contact)
        expect(response).to redirect_to @contact
      end
    end

    context 'with invalid attributes' do
      it 'does not update the contact' do
        patch :update, id: @contact, contact: attribute_for(:contact, first_name: "not", last_name: nil)
        @contact.reload
        expect(@contact.first_name).to_not eq("not")
        expect(@contact.last_name).to eq("Name")
      end

      it 'redirects to users#index' do
        patch :update, id: @contact, contact: attributes_for(:invalid_contact)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @contact = create(:contact)
    end

    it 'deletes the contact' do
      expect{
        delete :destroy, id: @contact
      }.to change(Contact, :count).by(-1)
    end

    it 'redirects to contacts#index' do
      delete :destroy, id: @contact
      expect(response).to redirect_to contacts_url
    end
  end

  describe 'PATCH hide_contact' do
    before :each do
      @contact = create(:contact)
    end

    it 'marks the contact as hidden' do
      patch :hide_contact, id: @contact
      expect(@contact.reload.hidden?).to be_true
    end

    it 'redirects to contacts#index' do
      patch :hide_contact, id: @contact
      expect(response).to redirect_to contacts_url
    end
  end

  describe 'CSV output' do
    it 'returns a CSV file' do
      get :index, format: :csv
      expect(response.headers['Content-Type']).to have_content 'text/csv'
    end

    it 'returns comma separated values' do
      create(:contact, first_name: 'invader', last_name: 'zim', email: 'iZim@URK.com')
      expect(Contact.to_csv).to match /invader zim,izim@URK.com/
    end
  end
  
  describe 'JSON output' do
    it 'returns JSON-formatted content' do
      contact = create(:contact)
      get :index, format: :json
      expect(response.body).to have_content contact.to_json
    end
  end

end
