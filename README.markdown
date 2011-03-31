### MAGICK NUMBERS RAILS

This gem is wrapper on [magic_numbers](http://github.com/marioosh/magick_numbers) library that validates such numbers as:

- NIP (Polish Tax Identification Number)
- PESEL (Polish ID Number)
- REGON (Polish Company Identification Number)

in the future:
- VIN
- EAN
- IBAN

###Instalation

In your Gemfile add:
    
    gem 'magick_numbers_rails'

###Example:

For standalone model use [magick_numbers](http://github.com/marioosh/magick_numbers) library

For ActiveRecord Models:

    class Item < ActiveRecord::Base
      validates :nip, :presence => true, :nip => true
    end
    
###TODO:

- I18n messages
- validators for other numbers
