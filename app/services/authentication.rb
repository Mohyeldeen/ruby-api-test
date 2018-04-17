class Authentication
    def self.create_random_token
        # token => "8efb5d40-32d8-43c8-a92d-d5f048c8729c"
        token = SecureRandom.uuid
        return token 
    end
    
    def self.login token
        return false if token.nil?
        admin = Admin.where(:token => token)
        if admin.blank?
            return false
        else 
            return true
        end
    end

    def self.is_login? token
        if login token
            return true
        else 
            return false
        end
    end
end