=begin
  Feature: AlgaeCal add bundles 1, 3, & 6 months via add to cart button

  Scenario 1: Add bundle 1 Month Supply to cart
    Given the user is on the landing page
      And the user clicks on the Products dropdown
      And the user selects the AlgaeCal Plus option
      And the user is taken to the product page
      When the user clicks the Add to cart button for 1 Month Supply
      Then verify the Cart displays 1 item in cart
      And the user is redirected to the cart page
      And the product is displayed in the cart page table

  Scenario 2: Add bundle 3 Month Supply to cart
    Given the user is on the landing page
      And the user clicks on the Products dropdown
      And the user selects the AlgaeCal Plus option again
      And the user is taken to the product page
      When the user clicks the Add to cart button for 3 Month Supply
      Then verify the Cart displays 2 items in cart
      And the user is redirected to the cart page
      And the product is displayed in the cart page table

  Scenario 3: Add bundle 6 Month Supply to cart
    Given the user is on the landing page
      And the user clicks on the Products dropdown
      And the user selects the AlgaeCal Plus option again
      And the user is taken to the product page
      When the user clicks the Add to cart button for 3 Month Supply
      Then verify the Cart displays 3 items in cart
      And the user is redirected to the cart page
      And the product is displayed in the cart page table
=end

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'
require_relative '../algaecal_browser_helpers'
require_relative '../algaecal_product_algaecal_plus_pg_helpers'
require_relative '../algaecal_landing_pg_helpers'
require_relative '../algaecal_cart_pg_helpers'

RSpec.configure do |c|
  c.include AlgaeCalBrowsers
  c.include AlgaeCalPlusPage
  c.include AlgaeCalLandingPage
  c.include AlgaeCalCartPage
end

RSpec.describe "001: Add bundles 1, 3, and 6 months to cart", ac_test_001: true do

  begin
  before(:all) do
    puts "001_alagecal_add_bundles_to_cart_test"
    launch_algaecal_browser
  end

  it "Verifies AlageCal site logo" do
    algaecal_landing_pg_logo.wait_until(&:present?)
    algaecal_landing_pg_logo.flash(color: ["green"])
  end

  it "Hovers over the Products link" do
    algaecal_landing_pg_products_link.flash(color: ["blue"])
    algaecal_landing_pg_products_link.hover
    algaecal_landing_pg_product("AlgaeCal Plus").flash.click
  end

  it "Verifies the AlgaeCal Plus page URL" do
    verify_algaecal_plus_page_url
  end
#### Scenario 1: Add bundle 1 Month Supply to cart ####
  it "Clicks on the 1 Month Supply add to cart button" do
    one_month_supply_add_to_cart_button.scroll.to :center
    one_month_supply_add_to_cart_button.flash.click
  end

  it "Verifies the AlgaeCal cart page URL" do
    verify_algaecal_cart_page_url
  end

  it "Verifies the cart count is 1" do
    verify_algaecal_cart_page_cart_count(1)
  end

  it "Verifies the 1 Month Supply in table" do
    verify_table_1_month_supply_displayed
  end

  it "Navigates to the AlgaeCal Plus page" do
    browser_goto("product/algaecal-plus/")
  end

  it "Verifies the AlgaeCal Plus page URL" do
    verify_algaecal_plus_page_url
  end
#### Scenario 2: Add bundle 3 Month Supply to cart ####
  it "Clicks on the 3 Month Supply add to cart button" do
    three_month_supply_add_to_cart_button.scroll.to :center
    three_month_supply_add_to_cart_button.flash.click
  end

  it "Verifies the AlgaeCal cart page URL" do
    verify_algaecal_cart_page_url
  end

  it "Verifies the cart count is 2" do
    verify_algaecal_cart_page_cart_count(2)
  end

  it "Verifies the 3 Month Supply in table" do
    verify_table_3_month_supply_displayed
  end

  it "Navigates to the AlgaeCal Plus page" do
    browser_goto("product/algaecal-plus/")
  end

  it "Verifies the AlgaeCal Plus page URL" do
    verify_algaecal_plus_page_url
  end
#### Scenario 3: Add bundle 6 Month Supply to cart ####
  it "Clicks on the 6 Month Supply add to cart button" do
    six_month_supply_add_to_cart_button.scroll.to :center
    six_month_supply_add_to_cart_button.flash.click
  end

  it "Verifies the AlgaeCal cart page URL" do
    verify_algaecal_cart_page_url
  end

  it "Verifies the cart count is 3" do
    verify_algaecal_cart_page_cart_count(3)
  end

  it "Verifies the 6 Month Supply in table" do
    verify_table_6_month_supply_displayed
  end
  ensure
  after(:all) do
    close_browser
    puts "Browser Closed"
  end
  end
end
