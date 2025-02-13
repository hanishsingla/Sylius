@admin_dashboard
Feature: Statistics dashboard in a single channel
    In order to have an overview of my sales
    As an Administrator
    I want to see overall statistics on my admin dashboard

    Background:
        Given the store operates on a single channel in "United States"
        And the store ships everywhere for Free
        And the store allows paying Offline
        And the store has a product "Sylius T-Shirt"
        And this product has "Red XL" variant priced at "$40.00"
        And I am logged in as an administrator

    @ui
    Scenario: Seeing basic statistics for entire store
        Given 3 customers have fulfilled 4 orders placed for total of "$8,566.00"
        And 2 more customers have paid 2 orders placed for total of "$459.00"
        When I open administration dashboard
        Then I should see 6 new orders
        And I should see 5 new customers
        And there should be total sales of "$9,025.00"
        And the average order value should be "$1,504.17"

    @ui
    Scenario: Statistics include only fulfilled orders that were not cancelled
        Given 4 customers have fulfilled 4 orders placed for total of "$5,241.00"
        And 2 more customers have placed 2 orders for total of "$459.00"
        And 2 customers have added products to the cart for total of "$3,450.00"
        And a single customer has placed an order for total of "$1,000.00"
        But the customer cancelled this order
        When I open administration dashboard
        Then I should see 4 new orders
        And I should see 9 new customers
        And there should be total sales of "$5,241.00"
        And the average order value should be "$1,310.25"

    @ui
    Scenario: Seeing recent orders and customers
        Given 2 customers have placed 3 orders for total of "$340.00"
        And 2 customers have added products to the cart for total of "$424.00"
        When I open administration dashboard
        Then I should see 4 new customers in the list
        And I should see 3 new orders in the list
