# frozen_string_literal: true

class Account < ApplicationRecord
  encrypts :reference, deterministic: true
  validates :reference, :entity, presence: true
  validates :reference, uniqueness: true

  def deactivated?
    deactivated_at?
  end
end
