class Registration < ApplicationRecord
  include ActiveModel::Validations
  validate :ensure_invoice_amount_in_range

  belongs_to :student
  belongs_to :payment_way
  has_many :invoices

  def as_json(options={})
    super(
        except: [ :payment_way_id, :created_at, :updated_at ],
        include: { invoices: {
            include: { payment_way: {
                except: [:created_at, :updated_at]
            }},
            except: [ :registration_id, :payment_way_id, :created_at, :updated_at ]}
        }
    )
  end

  private

  def ensure_invoice_amount_in_range
    if invoice_amount > 12
      errors.add(:base, 'Invoice amount does not match the required range 1 .. 12')
    end
  end

end
