# email:string
# password_digest:string
#
# password:string virtual
# password_confimation:string virtual

class User < ApplicationRecord
  has_secure_password
end
