require 'spec_helper'

describe ScribbleStore::ScribblesController, type: :controller do
  routes { ScribbleStore::Engine.routes }

  let(:params) { { use_route: 'scribble_store' } }
  
  describe '#index' do
    it 'succeeds' do
      get :index, params: { use_route: 'scribble_store' }
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do
    let(:creation_params) { params.merge(scribble: scribble_params, multipart: true) }
   
    context 'given valid params' do
      let(:scribble_params) { 
        {
          artist_email: 'fake@fake.com',
          image: uploaded_image
        }
      }

      it 'creates a new scribble' do
        expect { post :create, params: creation_params }
          .to change { ScribbleStore::Scribble.count }.by(1)
      end

      it 'redirects to the show page' do
        post :create, params: creation_params
        expect(response).to redirect_to(scribble_url(ScribbleStore::Scribble.last))
      end
    end

    context 'given invalid params' do
      let(:scribble_params) { { artist_email: 'noImage@badscribble.com' } }
      
      it 'does not create a new scribble' do
        expect { post :create, params: creation_params }
          .to_not change { ScribbleStore::Scribble.count }
      end

      it 'does not succeed' do
        post :create, params: creation_params
        expect(response.status).to eq(400)
      end
    end
  end
end  
