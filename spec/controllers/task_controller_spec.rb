require 'rails_helper'
require 'ostruct'

describe TaskController do
  describe 'listing tasks' do
    it 'undone todo page is ok' do
      get :index

      expect(response).to be_ok
    end

    it 'listing undone todos' do
      some_task = OpenStruct.new(description: 'Hello')
      expect(Task).to receive(:where).with(status: 'undone').and_return([some_task])

      get :index

      expect(response).to be_ok
      expect(assigns(:todos)).to eq([some_task])
    end

    it 'marks a task to done' do
      double = instance_double('Task', id: 1)
      expect(Task).to receive(:find_by_id).with(double.id.to_s).and_return(double)
      expect(double).to receive(:status=).with('done')
      expect(double).to receive(:save!)

      post :complete_task, {id: double.id}

      expect(response).to redirect_to(undone_list_path)
    end
  end

  describe 'working with tasks' do
    it 'creates a task' do
      description = 'some description'
      expect(Task).to receive(:create!).with(description: description)

      post :create_task, {description: description}

      expect(response).to redirect_to(undone_list_path)
    end
  end
end
