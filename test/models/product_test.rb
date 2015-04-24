require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
  	product = Product.new(title: "Antique Thingie",
  						  description: "a really old thing",
  						  image_url: "blahblahblah.jpg")

  	product.price = -1
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"]
  	assert product.errors [:price]

  	product.price = 0
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"]
  	assert product.errors [:price]

  	product.price = 1
  	assert product.invalid?
  end

  def new_product(image_url)
    Product.new(title: "My Junk",
                description: "blah blah blah",
                price: 1,
                image_url: image_url)
  end

  test "image_url" do
    ok = %w{ shoes.gif shoes.png shoes.jpg SHOES.JPG SHOES.jpg
             http://a.b.c/x/y/z/shoes.gif }
    not_ok = %w{ shoes.doc shoes.gif/more shoes.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end

    not_ok.each do |name|
      assert new_product(name).invalid?, "#{name} should not be valid"
    end
  end

end
