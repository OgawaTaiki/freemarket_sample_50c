require 'rails_helper'

describe ProductsController do
  describe 'GET #new' do
    it "newアクションが動いた後、new.html.hamlに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end
  

  describe 'GET #index' do
    it "populates an array of products ordered by created_at DESC" do
      products = create_list(:product, 3) 
      get :index
      expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at })
    end

    it "indexアクションをリクエストした後、index.html.hamlに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end


  describe 'GET #edit' do
    it "editアクション内で定義されている、productの値が期待したものになっているか" do
      product = create(:product)
      get :edit, params: {id: product}
      expect(assigns(:product)).to eq product
    end
    
    it "editアクションをリクエストした後、edit.html.hamlに遷移するか" do
      product = create(:product)
      get :edit, params: {id: product}
      expect(response).to render_template :edit
    end
  end


end 

