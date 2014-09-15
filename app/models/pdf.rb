class Pdf < ActiveRecord::Base

  attr_accessor :name, :attachment
  ## Tells rails to use this uploader for this model.

  # Make sure the owner's name is present.
  validates :name, presence: true
  

  mount_uploader :attachment, AttachmentUploader
end
