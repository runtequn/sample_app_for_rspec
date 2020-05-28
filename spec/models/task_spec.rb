require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      user = FactoryBot.create(:user)
      task = FactoryBot.build(:task, user: user)
      expect(task).to be_valid
      expect(task.errors).to be_empty
    end

    it 'is invalid without title' do
      user = FactoryBot.create(:user)
      task = FactoryBot.build(:task, title: "",  user: user)
      expect(task).to be_invalid
      expect(task.errors[:title]).to eq ["can't be blank"]
    end

    it 'is invalid without status' do
      user = FactoryBot.create(:user)
      task = FactoryBot.build(:task, status: nil, user: user)
      expect(task).to be_invalid
      expect(task.errors[:status]).to eq ["can't be blank"]
    end

    it 'is invalid with a duplicate title' do
      user = FactoryBot.create(:user)
      task = FactoryBot.create(:task, user: user)
      task_with_duplicated_title = FactoryBot.build(:task, title: task.title, user: user)
      expect(task_with_duplicated_title).to be_invalid
      expect(task_with_duplicated_title.errors[:title]).to eq ["has already been taken"]
    end

    it 'is valid with another title' do
      user = FactoryBot.create(:user)
      task_with_another_title = FactoryBot.build(:task, title: 'another_title', user: user)
      expect(task_with_another_title).to be_valid
      expect(task_with_another_title.errors).to be_empty
    end
  end
end

