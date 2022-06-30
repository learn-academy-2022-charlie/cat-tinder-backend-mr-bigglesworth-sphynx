require 'rails_helper'

RSpec.describe "Dinos", type: :request do
  describe "GET /index" do
    it "gets a list of dinos" do
      Dino.create(
        name: 'John',
        age: 4,
        enjoys: 'Walks in the park',
        image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
      )

      # Make a request
      get '/dinos'

      john = JSON.parse(response.body)
        p "here is john"
        p john
       

      expect(response).to have_http_status(200)
      expect(john.length).to eq 1
    end
  end

  describe "POST /create" do
    it 'creates a dino' do
          
      # I need something to send to my application to have it loaded into the database
      dino_params = {
        dino: {
          name: 'John',
          age: 4,
          enjoys: 'Walks in the park',
          image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
        }
      }
          
      # I need to make a request to my appilcation to create the object we made
      post '/dinos', params: dino_params
      # I need to assert that the response is correct
        # status code
      expect(response).to have_http_status(200)
      
      # define a variable that is in the database
      dino = Dino.first
      # assert that the item in the BD is the same we sent over
      expect(dino.name).to eq 'John'
      expect(dino.age).to eq 4
      expect(dino.enjoys).to eq 'Walks in the park'
      expect(dino.image).to eq 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
    
    end
  end

  describe "PUT /update" do
    it 'updates a dino' do
          
      # I need something to send to my application to have it loaded into the database
      dino_params = {
        dino: {
          name: 'John',
          age: 5,
          enjoys: 'Eating pizza',
          image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
        }
      }
          
      # I need to make a request to my appilcation to create the object we made
      put '/dinos', params[:id]
      # I need to assert that the response is correct
        # status code
      expect(response).to have_http_status(200)
      
      # define a variable that is in the database
      dino = Dino.first
      # assert that the item in the DB is the same we sent over
      expect(dino.name).to eq 'John'
      expect(dino.age).to eq 5
      expect(dino.enjoys).to eq 'Eating pizza'
      expect(dino.image).to eq 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
    
    end
  end
end