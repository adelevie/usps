module USPS::Request
  # All the address information APIs are essentially identical
  class ExpressMailLabel < Base
    config(
      :api => 'ExpressMailLabel',
      :tag => 'ExpressMailLabelRequest',
      :secure => true,
      :response => USPS::Response::ExpressMailLabel
    )

    def initialize(data)
      @data = data
    end

    def build      
      super do |builder|    
        # misc    
        builder.tag!('Option', nil)
        builder.tag!('Revision', 2)
        builder.tag!('EMCAAccount', nil)
        builder.tag!('EMCAPassword', nil)
        builder.tag!('ImageParameters', nil)
        
        # from
        builder.tag!('FromFirstName', @data[:from][:first_name])
        builder.tag!('FromLastName', @data[:from][:last_name])
        builder.tag!('FromFirm', @data[:from][:firm])
        builder.tag!('FromAddress1', @data[:from][:address1])
        builder.tag!('FromAddress2', @data[:from][:address2])
        builder.tag!('FromCity', @data[:from][:city])
        builder.tag!('FromState', @data[:from][:state])
        builder.tag!('FromZip5', @data[:from][:zip5])
        builder.tag!('FromZip4', @data[:from][:zip4])
        builder.tag!('FromPhone', @data[:from][:phone])
        
        # to
        builder.tag!('ToFirstName', @data[:to][:first_name])
        builder.tag!('ToLasteName', @data[:to][:last_name])
        builder.tag!('ToFirm', @data[:to][:firm])
        builder.tag!('ToAddress1', @data[:to][:address1])
        builder.tag!('ToAddress2', @data[:to][:address2])
        builder.tag!('ToCity', @data[:to][:city])
        
        # options
        builder.tag!('WeightInOunces', @data[:weight_in_ounces])
        builder.tag!('FlatRate', @data[:flat_rate])
        builder.tag!('SundayHolidayDelivery', @data[:sunday_holiday_delivery])
        builder.tag!('StandardizeAddress', @data[:standardize_address])
        builder.tag!('WaiverOfSignature', @data[:waiver_of_signature])
        builder.tag!('NoHoliday', @data[:no_holiday])
        builder.tag!('NoWeekend', @data[:no_weekend])
        builder.tag!('SeparateReceiptPage', @data[:separate_receipt_page])
        builder.tag!('POZipCode', @data[:po_zip_code])
        builder.tag!('FacilityType', @data[:facility_type]) # TODO: What is this?
        builder.tag!('ImageType', @data[:image_type])
        builder.tag!('LabelDate', @data[:label_date])
        builder.tag!('CustomerRefNo', @data[:customer_ref_no])
        
        # sender
        builder.tag!('SenderName', @data[:sender][:name])
        builder.tag!('SenderEMail', @data[:sender][:email])
        
        # recipient
        builder.tag!('RecipientName', @data[:recipient][:name])
        builder.tag!('RecipientEMail', @data[:recipient][:email])
        
        # more options
        builder.tag!('HoldForManifest', @data[:hold_for_manifest])
        builder.tag!('CommercialPrice', @data[:commercial_price])
        builder.tag!('InsuredAmount', @data[:insured_amount])
        builder.tag!('Container', @data[:container])
        builder.tag!('Size', @data[:size])
        builder.tag!('Width', @data[:width])
        builder.tag!('Length', @data[:length])
        builder.tag!('Height', @data[:height])
        builder.tag!('Girth', @data[:girth])
      end
    end

  end
end
