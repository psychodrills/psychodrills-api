class User < ApplicationRecord
    has_secure_password

    # associations
    belongs_to :user_record, :polymorphic => true

    # validations
    validates_presence_of :first_name, :middle_name, :email, :password_digest

    # callbacks
    after_create :create_confirmation_token

    # creating confirmation token for the newly created user
    def create_confirmation_token
        token = SecureRandom.hex(25)
        self.confirmation_token = token
        self.save
    end

    # account confirmation status
    def user_account_confirmation
        if self.confirmation_token.present? && self.confirmed_at.nil?
            @current_user.errors.add_to_base(:users, :account_confirmation_error)
        elsif self.locked
            @current_user.errors.add_to_base(:users, :account_loked_error)
        elsif self.is_deleted
            @current_user.errors.add_to_base(:users,:account_deleted_error)
        end
    end
end
