class Request < ApplicationRecord
  belongs_to :user, dependent: :destroy
  before_destroy :notify_user_expired

  enum status: { unconfirmed: 0, confirmed: 10, accepted: 20, need_refresh: 25,
    expired: 30 }

  scope :unconfirmed, -> { where(status:  0) }
  scope :confirmed,   -> { where(status: 10) }
  scope :accepted,    -> { where(status: 20) }
  scope :need_refresh,-> { where(status: 25) }
  scope :expired,     -> { where(status: 30) }

  def Request.accept!
    request = Request.new
    request.accept_new_user
    request.decrement_next_waiters
  end


end
