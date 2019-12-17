class PartySerializer < ActiveModel::Serializer
    attributes :id, :name, :address, :details, :date, :host_id
  end
  