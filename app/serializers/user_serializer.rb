class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :email, :image, :position, :phone_number
  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end
end
