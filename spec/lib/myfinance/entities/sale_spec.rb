require "spec_helper"

describe Myfinance::Entities::Sale do
  it_behaves_like "entity_attributes", %i[
    amount_difference
    attachments
    attachments_count
    category_id
    classification_center_id
    classification_center_classifications
    competency_month
    confirmed_at
    created_at
    custom_classifications
    days_to_liquidation
    description
    discount_amount
    document
    document_emission_date
    estimated_liquidated_at
    fee_percentage
    fee_percentage_amount
    financial_account_id
    fixed_fee_amount
    id
    installment_count
    installment_number
    installments
    interest_amount
    issuer
    links
    liquidated_at
    liquidation_weekday
    net_amount
    nominal_amount
    observation
    occurred_at
    original_sale_id
    payment_method
    person_id
    provider_code
    receivable_amount
    sale_account_id
    status
    summary
    tax_charges
    ticket_amount
    total_amount
    updated_at
  ]
end
