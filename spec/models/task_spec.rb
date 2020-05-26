require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      user = User.create(email: "user@sample.com", password: "password")
      task = user.tasks.new(title: "aaa", content: "aaa", status: :todo)
      expect(task.valid?).to be(true)
      expect(task.errors).to be_empty
    end

    it 'is invalid without title' do
      user = User.create(email: "user@sample.com", password: "password")
      task = user.tasks.new(title: "", content: "aaa", status: :todo)
      expect(task.valid?).to be(false)
      expect(task.errors).not_to be_empty
    end

    it 'is invalid without status' do
      user = User.create(email: "user@sample.com", password: "password")
      task = user.tasks.new(title: "aaa", content: "aaa", status: nil)
      expect(task.valid?).to be(false)
      expect(task.errors).not_to be_empty
    end

    it 'is invalid with a duplicate title' do
      user = User.create(email: "user@sample.com", password: "password")
      task1 = user.tasks.new(title: "aaa", content: "aaa", status: :todo).save
      task2 = user.tasks.new(title: "aaa", content: "aaa", status: :todo)
      expect(task2.valid?).to be(false)
      expect(task2.errors).not_to be_empty
    end

    it 'is valid with another title' do
      user = User.create(email: "user@sample.com", password: "password")
      task1 = user.tasks.new(title: "aaa", content: "aaa", status: :todo).save
      task2 = user.tasks.new(title: "bbb", content: "aaa", status: :todo)
      expect(task2.valid?).to be(true)
      expect(task2.errors).to be_empty
    end
  end
end

