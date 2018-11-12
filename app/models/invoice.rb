class Invoice < ApplicationRecord
  belongs_to :registration
  belongs_to :payment_way

  def as_json(options={})
    super(
        except: [ :payment_way_id, :created_at, :updated_at ],
        include: { payment_way: { except: [ :created_at, :updated_at ]} }
    )
  end
end
