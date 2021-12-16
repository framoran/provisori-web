require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  test 'create article' do

    article_1 = Article.new title: 'Title 1'
    article_1.save!
    article_2 = Article.new title: 'Title 2'
    article_2.save!

    assert_equal(article_1, Article.last(2).first)
    assert_equal(article_2, Article.all.last)

  end

  test 'create comment' do

    article_1 = Article.new title: 'Title 1'
    article_1.save!

    user = User.new email:'david.framorando@gmail.com', password: 'test'

    comment1 = Comment.new body: 'Interesting ...'
    comment1.user = user
    comment1.article = article_1
    comment1.save!

    assert_equal('Interesting ...', Comment.all.last.body)

  end

  test 'create two comments' do

    article_1 = Article.new title: 'Title 1'
    article_1.save!

    user = User.new email:'david.framorando@gmail.com', password: 'test'

    comment1 = Comment.new body: 'Interesting ...'
    comment1.user = user
    comment1.article = article_1
    comment1.save!

    comment2 = Comment.new body: 'This topic is very relevant !'
    comment2.user = user
    comment2.article = article_1
    comment2.save!

    assert_equal('This topic is very relevant !', Comment.all.last.body)

  end

  test 'test relationship between comments and articles' do

    article_1 = Article.new title: 'Title 1'
    article_1.save!

    article_2 = Article.new title: 'Title 2'
    article_2.save!

    user = User.new email:'david.framorando@gmail.com', password: 'test'

    comment1 = Comment.new body: 'Interesting ...'
    comment1.user = user
    comment1.article = article_1
    comment1.save!

    comment2 = Comment.new body: 'This topic is very relevant !'
    comment2.user = user
    comment2.article = article_1
    comment2.save!

    comment2 = Comment.new body: 'Yes !'
    comment2.user = user
    comment2.article = article_2
    comment2.save!

    assert_equal(article_1.id, Comment.all.first.article_id)

    assert_equal(article_2.id, Comment.all.last.article_id)

  end

end
