require 'httpclient'
require 'json'

class FashionPost < ApplicationRecord
    has_one_attached :image
    def self.predict(params)
        image = params[:image]
        point = predict_point(image)
        fashion_post = new
        fashion_post.point = point
        fashion_post.image = image
        fashion_post.save
        return fashion_post.id
    end

    private
        class << self
            def predict_point(image)
                client = HTTPClient.new()
                response = nil
                File.open(image.tempfile) do |file|
                    body = {'image' => file}
                    response = client.post('http://api:8888', body: body)
                end
                data = JSON.parse(response.body)
                return data['point'].to_i
            end
        end
end
