require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module AlgaeCalCartPage
	include RSpec::Matchers
  include Selenium

  #### METHODS / LOCATORS ####
	def algaecal_cart_pg_row_three_result
		@browser.tr(class: 'cart-items', index: 2).text
	end

	def algaecal_cart_pg_row_three
		@browser.tr(class: 'cart-items', index: 2)
	end

	def algaecal_cart_pg_row_two_result
		@browser.tr(class: 'cart-items', index: 1).text
	end

	def algaecal_cart_pg_row_two
		@browser.tr(class: 'cart-items', index: 1)
	end

	def algaecal_cart_pg_row_one_result
		@browser.tr(class: 'cart-items', index: 0).text
	end

	def algaecal_cart_pg_row_one
		@browser.tr(class: 'cart-items', index: 0)
	end

  def algaecal_cart_pg_cart_count
    @browser.span(class: 'brand-blue menu-cart-count')
  end

  #### VERIFIERS ####
	def verify_table_6_month_supply_displayed
		expected_6_month_bundle = "AlgaeCal Plus 6 Month Supply"
		if (expect(algaecal_cart_pg_row_three_result[0...28]).to eq(expected_6_month_bundle)) == true
		algaecal_cart_pg_row_three.flash(color: ["pink"])
		puts "#{true}: Row 3 Displays 6 Month bundle"
		else
		expect { raise StandardError, "Row 3 Does NOT Displays 6 Month bundle: Step FAILED"}.to raise_error('PLEASE VERIFY: Row 3 Does NOT Displays 6 Month bundle')
		end
	end

	def verify_table_3_month_supply_displayed
		expected_3_month_bundle = "AlgaeCal Plus 3 Month Supply"
		if (expect(algaecal_cart_pg_row_two_result[0...28]).to eq(expected_3_month_bundle)) == true
		algaecal_cart_pg_row_two.flash(color: ["pink"])
		puts "#{true}: Row 2 Displays 3 Month bundle"
		else
		expect { raise StandardError, "Row 2 Does NOT Displays 3 Month bundle: Step FAILED"}.to raise_error('PLEASE VERIFY: Row 2 Does NOT Displays 3 Month bundle')
		end
	end

	def verify_table_1_month_supply_displayed
		expected_1_month_bundle = "AlgaeCal Plus 1 Month Supply"
		if (expect(algaecal_cart_pg_row_one_result[0...28]).to eq(expected_1_month_bundle)) == true
		algaecal_cart_pg_row_one.flash(color: ["pink"])
		puts "#{true}: Row 1 Displays 1 Month bundle"
		else
		expect { raise StandardError, "Row 1 Does NOT Displays 1 Month bundle: Step FAILED"}.to raise_error('PLEASE VERIFY: Row 1 Does NOT Displays 1 Month bundle')
		end
	end

  def verify_algaecal_cart_page_cart_count(count)
    expected_count = "( " + count.to_s + " )"
    algaecal_cart_pg_cart_count.flash(color: ["orange"])
    if (expect(algaecal_cart_pg_cart_count.text).to eq(expected_count)) == true
		puts "#{true}: Cart Count IS A Match"
		else
		expect { raise StandardError, "Cart Count NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Cart Count NOT A Match')
		end
  end

  def verify_algaecal_cart_page_url
    expected_url = "https://www.algaecal.com/cart/"
		Watir::Wait.until {@browser.url == expected_url}
    if @browser.url == expected_url
		puts "#{true}: Cart Page URL IS A Match"
		else
		 expect { raise StandardError, "Cart Page URL NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Cart Page URL NOT A Match')
		end
  end
end
