class User < ApplicationRecord
    serialize :address, JSON
    serialize :company, JSON
end
