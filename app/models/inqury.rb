class Inqury < ApplicationRecord

  validates_presence_of :full_name, :email, :product, :country
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  FIELDS_TO_VALIDATE = [:full_name, :phone, :company, :product, :quantity, :country, :port, :packing]

  FIELDS_TO_VALIDATE.each do |field|
    validates_length_of field, maximum: 150
  end




end
