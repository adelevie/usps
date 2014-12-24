require 'spec_helper'
require 'pry'

describe USPS::Request::ExpressMailLabel do


  it "should be able to build a proper request" do
    from = {
      first_name: 'Adam',
      last_name: 'Smith',
      firm: nil,
      address1: 'RM 2100',
      address2: "475 L'Enfant Plaza SW",
      city: 'Washington',
      state: 'DC',
      zip5: '20260',
      zip4: nil,
      phone: '2125551234'
    }
    
    to = {
      first_name: 'Janice',
      last_name: 'Dickens',
      firm: 'XYZ Corporation',
      address1: 'Ste 100',
      address2: '2 Massachusetts Ave NE',
      city: 'Washington',
      state: 'DC',
      zip5: '20212',
      zip4: nil,
      phone: '21255512345'
    }
    
    sender = {
      name: 'Adam Smith',
      email: 'asmith@email.com'
    }
    
    recipient = {
      name: 'Janice Dickens',
      email: 'jdickens@email.com'
    }
    
    data = {
      option: nil,
      revision: 2,
      ecma_account: nil,
      ecma_password: nil,
      image_parameters: nil,
      from: from,
      to: to,
      weight_in_ounces: 105,
      flat_rate: nil,
      sunday_holiday_delivery: nil,
      standardize_address: nil,
      no_holiday: nil,
      no_weekend: nil,
      separate_receipt_page: nil,
      po_zip_code: 20212,
      facility_type: 'DDU',
      image_type: 'PDF',
      label_date: '10/19/2010',
      customer_ref_no: nil,
      sender: sender,
      recipient: recipient,
      hold_for_manifest: nil,
      commercial_price: false,
      insured_amount: '425.00',
      container: 'NONRECTANGULAR',
      size: 'Large',
      width: '7',
      length: '20.5',
      height: '15',
      girth: '60'
    }
    
    request = USPS::Request::ExpressMailLabel.new(data)

    xml = Nokogiri::XML.parse(request.build)
    
    binding.pry
  end
end
