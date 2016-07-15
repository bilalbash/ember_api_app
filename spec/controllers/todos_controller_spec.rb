require 'rails_helper'

RSpec.describe TodosController, type: :controller do

  it {expect(get: 'todos').to route_to(action: 'index', controller: 'todos')}
  it {expect(post: 'todos').to route_to(action: 'create', controller: 'todos')}
  it {expect(get: 'todos/1').to route_to(action: 'show', controller: 'todos', id: '1')}
  it {expect(put: 'todos/1').to route_to(action: 'update', controller: 'todos', id: '1')}
  it {expect(delete: 'todos/1').to route_to(action: 'destroy', controller: 'todos', id: '1')}

  describe 'GET #index' do
    subject { get :index }
    let(:todo) { FactoryGirl.create :todo_1 }

    it 'should render the show template' do
      subject
      expect(response.status).to eq(200)
      # expect(response).to render_template :show

      # set some variable on success like :success => true in your controller
      # controller.rb
      # render :json => {:success => true, :data => data} # on success
      #
      # spec_controller.rb
      # parse_json = JSON(response.body)
      # parse_json["success"].should == true
    end

    it 'should return 1 todo item' do
      todo
      subject
      puts
      puts
      puts
      puts JSON(response.body)['todos'].size.inspect
      puts
      puts
      expect(response.content_type).to eq 'application/json'
      expect(JSON(response.body)['todos'].size).to eq 1
    end
  end
end
