class PurchaseOrder < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :order_items, dependent: :destroy
end
