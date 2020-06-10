require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
  describe 'ログイン前' do
    describe 'ページ遷移確認' do
      context 'タスクの新規登録ページにアクセス' do
        it '新規登録ページへのアクセスが失敗する' 
      end
      context 'タスクの編集ページにアクセス' do
        it '編集ページへのアクセスが失敗する'
      end
      context 'タスクの詳細ページにアクセス' do
        it 'タスクの詳細情報が表示される'
      end
      context 'タスクの一覧ページにアクセス' do
        it 'すべてのユーザーのタスク情報が表示される' 
      end
    end
  end

  describe 'ログイン後' do
    describe 'タスク新規登録' do
      context 'フォームの入力値が正常' do
        it 'タスクの新規作成が成功する'
      end
      context 'タイトルが未入力' do
        it 'タスクの新規作成が失敗する'
      end
      context '登録済のタイトルを入力' do
        it 'タスクの新規作成が失敗する'
      end
    end

    describe 'タスク編集' do
      context 'フォームの入力値が正常' do
        it 'タスクの編集が成功する' do
       end
      context 'タイトルが未入力' do
        it 'タスクの編集が失敗する'
      end
      context '登録済のタイトルを入力' do
        it 'タスクの編集が失敗する' 
      end
    end

    describe 'タスク削除' do
      it 'タスクの削除が成功する'
    end
  end
end
