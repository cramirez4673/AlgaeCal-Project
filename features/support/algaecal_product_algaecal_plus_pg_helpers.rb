require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module AlgaeCalPlusPage
	include RSpec::Matchers
  include Selenium

	#### METHODS / LOCATORS ####
  def one_month_supply_add_to_cart_button
    @browser.button(data_bc_product_id: '113')
  end

  def three_month_supply_add_to_cart_button
    @browser.button(data_bc_product_id: '114')
  end

  def six_month_supply_add_to_cart_button
    @browser.button(data_bc_product_id: '115')
  end

	#### VERIFIERS ####
	def verify_algaecal_plus_page_url
		expected_url = "https://www.algaecal.com/product/algaecal-plus/"
		Watir::Wait.until {@browser.url == expected_url}
		if @browser.url == expected_url
		puts "#{true}: Plus Page URL IS A Match"
		else
		expect { raise StandardError, "Plus Page URL NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Plus Page URL NOT A Match')
		end
	end
end
