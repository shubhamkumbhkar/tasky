require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validation tests' do
    it 'ensures status present'do
      project = Project.new(name: 'neww', user_id: 5)
      # project.user = current_user
      project.save!
      expect(project).to eq(false) 
    end

  end
end
