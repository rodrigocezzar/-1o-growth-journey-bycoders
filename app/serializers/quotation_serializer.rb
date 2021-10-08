# frozen_string_literal: true

class QuotationSerializer < ApplicationSerializer
  attributes :user, :id, :name, :suggested_price_manufactures, :status, :value, :form_payment,
             :minimal_sale_value, :credit_card_fee, :installments, :finder_commission, :minimal_percent
end

# t.integer "user_id"
#     t.string "name"
#     t.string "status"
#     t.decimal "value", default: "0.0"
#     t.decimal "factory_cost", default: "0.0"
#     t.string "form_payment"
#     t.decimal "minimal_sale_value", default: "0.0"
#     t.decimal "reserve_cost", default: "0.0"
#     t.decimal "credit_card_fee", default: "0.0"
#     t.integer "installments"
#     t.decimal "net_value", default: "0.0"
#     t.decimal "discount", default: "0.0"
#     t.decimal "tax", default: "0.0"
#     t.decimal "manager_commission", default: "0.0"
#     t.decimal "assembler_commission", default: "0.0"
#     t.decimal "seller_commission", default: "0.0"
#     t.decimal "shipping_cost", default: "0.0"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
