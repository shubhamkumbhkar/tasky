require 'rails_helper'

RSpec.describe '/projects', type: :request do
  let(:valid_attributes) do
    {
      'name' => 'new',
      'user_id' => '5'
    }
  end

  let(:invalid_attributes) do
    {
      'name' => " "
    }
  end
  
  describe 'POST /create' do
    context 'with valid parameters' do
      it "creates a new post" do
        expect do
          project = Project.new(valid_attributes)
          project.user= current_user
          project.save
          project projects_url, params: {project: valid_attributes}
        end.to be_successful
      end
    end
    context 'with invalid parameters' do
      it "does not creates a new post" do
        expect do
          project = Project.new(invalid_attributes)
          project.user= current_user
          project.save
          project projects_url, params: {project: invalid_attributes}
        end.to eq(false)
      end
    end
  end
end
