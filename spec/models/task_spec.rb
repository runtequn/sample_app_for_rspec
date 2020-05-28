require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      user = User.create(email: "user@example.com", password: "password")
      task = user.tasks.new(title: "aaa", content: "aaa", status: :todo)
      expect(task.valid?).to be(true)
      expect(task.errors).to be_empty
    end

    it 'is invalid without title' do
      user = User.create(email: "user@example.com", password: "password")
      task = user.tasks.new(title: "", content: "aaa", status: :todo)
      expect(task.valid?).to be(false)
      expect(task.errors[:title]).to eq ["can't be blank"]
    end

    it 'is invalid without status' do
      user = User.create(email: "user@example.com", password: "password")
      task = user.tasks.new(title: "aaa", content: "aaa", status: nil)
      expect(task.valid?).to be(false)
      expect(task.errors[:status]).to eq ["can't be blank"]
    end

    it 'is invalid with a duplicate title' do
      user = User.create(email: "user@example.com", password: "password")
      user.tasks.new(title: "aaa", content: "aaa", status: :todo).save
      task_with_duplicated_title = user.tasks.new(title: "aaa", content: "aaa", status: :todo)
      expect(task_with_duplicated_title.valid?).to be(false)
      expect(task_with_duplicated_title.errors[:title]).to eq ["has already been taken"]
    end

    it 'is valid with another title' do
      user = User.create(email: "user@example.com", password: "password")
      user.tasks.new(title: "aaa", content: "aaa", status: :todo).save
      task_with_another_title = user.tasks.new(title: "bbb", content: "aaa", status: :todo)
      expect(task_with_another_title.valid?).to be(true)
      expect(task_with_another_title.errors).to be_empty
    end
  end
end

