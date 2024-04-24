class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :file, presence: true
  validates :document_type, inclusion: { in: %w(Aadhaar PAN Identity Passport Health_Check Policy Other), message: "%{value} is not a valid document type" }
  validate :validate_file_size

  private

  def validate_file_size
    if file.attached? && file.blob.byte_size > 10.megabytes
      errors.add(:file, "size exceeds the maximum limit of 10MB")
    end
  end
end
