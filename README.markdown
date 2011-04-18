### COMMON NUMBERS RAILS

This gem is wrapper on [common_numbers](http://github.com/marioosh/common_numbers) library that validates such numbers as:

- NIP (Polish Tax Identification Number)
- PESEL (Polish ID Number)
- REGON (Polish Company Identification Number)

in the future:
- VIN
- EAN
- IBAN

###Instalation

In your Gemfile add:
    
    gem 'common_numbers_rails'

###Example:

For standalone model use [common_numbers](http://github.com/marioosh/common_numbers) library

For ActiveRecord Models:

    class Item < ActiveRecord::Base
      validates :nip, :presence => true, :nip => true
    end
    
###TODO:

- I18n messages
- validators for other numbers


Copyright (c) 2011 Mariusz Nosiński, released under the MIT license

