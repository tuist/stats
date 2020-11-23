class CommandEvent < ApplicationRecord
    validates :name, :params, :duration, :client_id, :tuist_version, :swift_version, :macos_version, presence: true
end
