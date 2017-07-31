class Order < ApplicationRecord
	belongs_to :invoice, optional: true
	has_many :order_transactions
  belongs_to :user
  belongs_to :subcat
  
  attr_accessor :card_number, :card_verification
  
  validate :validate_card, :on => :create
  
  def purchase
    response = process_purchase
    order_transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    if response.success?
    	#cart.update_attribute(:purchased_at, Time.now)
    	invoice.update_attribute(:paid, true)
      if express_token.blank?
        #cart.update_attribute(:payment_method, "credit card")
      else
        #cart.update_attribute(:payment_method, "paypal")
      end
      PaymentMailer.admin_notification(self).deliver
      PaymentMailer.customer_notification(self).deliver
    else
    	puts "*************Payment failed: #{response.message}**************"
    end
    response.success?
  end
  
  def price_in_cents
    if invoice.present?
      invoice.amount*100
    end
  end
  def payup
    response = process_payup
    order_transactions.create!(:action => "purchase", :amount => payment_in_cents, :response => response)
    if response.success?
      #cart.update_attribute(:purchased_at, Time.now)
      #invoice.update_attribute(:paid, true)
      if express_token.blank?
        #cart.update_attribute(:payment_method, "credit card")
      else
        #cart.update_attribute(:payment_method, "paypal")
      end
      PaymentMailer.admin_payment_notification(self).deliver
      PaymentMailer.customer_payment_notification(self).deliver
    else
      puts "*************Payment failed: #{response.message}**************"
    end
    response.success?
  end
  
  def payment_in_cents
    self.payment_amount*100
  end
  def amount
    self.order_transactions.where('success = ?', true).last.amount
  end
  private
  def process_purchase
    if express_token.blank?
      STANDARD_GATEWAY.purchase(price_in_cents, credit_card, standard_purchase_options)
    else 
      #EXPRESS_GATEWAY.purchase(price_in_cents, express_purchase_options)
    end
  end
  def process_payup
    if express_token.blank?
      STANDARD_GATEWAY.purchase(payment_in_cents, credit_card, standard_purchase_options)
    else 
      #EXPRESS_GATEWAY.purchase(price_in_cents, express_purchase_options)
    end
  end
  def standard_purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :address1 => billing_address,
        :address2 => billing_address_2,
        :country => country,
        :state => state,
        :city => city,
        :email => email,
        :zip => zipcode,
        :phone => phone
      }
    }
  end
  def express_purchase_options
    {
      :ip => ip_address,
      :token => express_token,
      :payer_id => express_payer_id
    }
  end
  
  def validate_card
    if express_token.blank?
      unless credit_card.validate.empty?
        
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
end
