require 'sqlite3'
require 'active_record'
require 'byebug'


ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'customers.sqlite3')
# Show queries in the console.
# Comment this line to turn off seeing the raw SQL queries.
ActiveRecord::Base.logger = Logger.new(STDOUT)

class Customer < ActiveRecord::Base
  def to_s
    "  [#{id}] #{first} #{last}, <#{email}>, #{birthdate.strftime('%Y-%m-%d')}"
  end
  #  NOTE: Every one of these can be solved entirely by ActiveRecord calls.
  #  You should NOT need to call Ruby library functions for sorting, filtering, etc.

  def self.any_candice
    # YOUR CODE HERE to return all customer(s) whose first name is Candice
    # probably something like:  Customer.where(....)
    Customer.where(first:'Candice') # restituisce l'ultima operazione fatta
  end

  def self.with_valid_email
    # YOUR CODE HERE to return only customers with valid email addresses (containing '@')
    Customer.where('email LIKE ?', '%@%')
  end
  # etc. - see README.md for more details

  def self.with_dot_org_email
    Customer.where('email LIKE ?', '%.org')
  end

  def self.with_invalid_email
    Customer.where('email NOT LIKE ?', '%@%')
  end

  def self.with_blank_email
    Customer.where(email: nil)
  end

  def self.born_before_1980
    Customer.where('birthdate < ?', Date.parse('1980 Jan 1'))
  end

  def self.with_valid_email_and_born_before_1980
    with_valid_email.merge(born_before_1980)
  end

  def self.last_names_starting_with_b
    Customer.where('last LIKE ?', 'B%').order(:birthdate)
  end

  def self.twenty_youngest
    Customer.order(birthdate: :desc).limit(20)
  end

  def self.update_gussie_murray_birthdate
    customer = Customer.where(first: 'Gussie', last: 'Murray')
    nuova_data = DateTime.parse('February 8 2004')
    customer.update(birthdate: nuova_data)
  end

  def self.change_all_invalid_emails_to_blank
    nuova_mail = ''
    Customer.with_invalid_email.update_all(email: nuova_mail)
  end

  def self.delete_meggie_herman
    Customer.where(first: 'Meggie', last: 'Herman').delete_all
  end

  def self.delete_everyone_born_before_1978
    Customer.where('birthdate < ?', Date.parse('1 Jan 1978')).delete_all
  end
end
