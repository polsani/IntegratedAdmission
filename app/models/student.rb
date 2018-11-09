class Student < ApplicationRecord
  has_many :emails, autosave: true
  accepts_nested_attributes_for :emails, :allow_destroy => true

  def as_json(options={})
    super(
      except: [ :created_at, :updated_at ],
      include: { emails: { only: :email}}
    )
  end
end
