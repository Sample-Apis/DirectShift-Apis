# frozen_string_literal: true

# User response serialize
class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
end