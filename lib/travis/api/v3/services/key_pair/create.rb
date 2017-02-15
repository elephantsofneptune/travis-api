module Travis::API::V3
  class Services::KeyPair::Create < Service
    params :description, :value, prefix: :key_pair
    result_type :key_pair

    def run!
      repository = check_login_and_find(:repository)
      access_control.permissions(repository).change_key!
      key_pair = query.create(repository)
      result(key_pair, status: 201)
    end
  end
end
