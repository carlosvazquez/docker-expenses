# frozen_string_literal: true

require "test_helper"

class AccountTest < ActiveSupport::TestCase
  test "it is valid" do
    subject = Account.new(account_attributes)
    assert subject.valid?
  end

  test "it is invalid" do
    subject = Account.new(account_attributes(reference: nil, entity: nil))
    refute subject.valid?
    assert_equal 2, subject.errors.size
  end

  test "it is unique" do
    existing_subject = accounts(:account)
    subject = Account.new(account_attributes(reference: existing_subject.reference))
    refute subject.valid?
    assert_equal 1, subject.errors.size
  end

  test "it is deactivated" do
    subject = Account.new(account_attributes)
    subject.deactivated_at = Time.zone.now
    assert subject.deactivated?
  end

  test "it is not deactivated" do
    subject = Account.new(account_attributes)
    refute subject.deactivated?
  end

  def account_attributes(attrs = {})
    {
      reference: SecureRandom.random_number.to_s[2..50],
      alias: "Ahorros",
      entity: "Mi Banco",
      description: "Cuenta de ahorros personal"
    }.merge(attrs)
  end
end
