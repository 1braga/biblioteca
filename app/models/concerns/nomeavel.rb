module Nomeavel
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
  end

  def display_name
    name.titleize
  end
end
