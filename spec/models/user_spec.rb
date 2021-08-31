require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures email present'do 
      user = User.new(fname: 'a', lname: 'b', username:'ab', mnum: '9098765456', password: '123456').save
      expect(user).to eq(false)
    end
    it 'ensures first name present'do
      user = User.new(email: 'ab@gmail.com', lname: 'b', username:'ab', mnum: '9098765456', password: '123456').save
      expect(user).to eq(false) 
    end
    it 'ensures last name present'do
      user = User.new(fname: 'a', email: 'ab@gmail.com', username:'ab', mnum: '9098765456', password: '123456').save
      expect(user).to eq(false) 
    end
    it 'ensures username present'do
      user = User.new(fname: 'a', lname: 'b', email: 'ab@gmail.com', mnum: '9098765456', password: '123456').save
      expect(user).to eq(false) 
    end
    it 'ensures mobile number present'do
      user = User.new(fname: 'a', lname: 'b', username:'ab', email: 'ab@gmail.com', password: '123456').save
      expect(user).to eq(false) 
    end
    it 'ensures password present'do
      user = User.new(fname: 'a', lname: 'b', username:'ab', mnum: '9098765456', email: 'ab@gmail.com').save
      expect(user).to eq(false) 
    end
    it 'should saved successfully'do
      user = User.new(email: 'ab@gmail.com',fname: 'a', lname: 'b', username:'abc', mnum: '909876', password: '123456').save!
      expect(user).to eq(true) 
    end
  end
end
