class User < ActiveRecord::Base

    has_secure_password

    def positions
        ["Manager", "Waiter"]
    end
end
