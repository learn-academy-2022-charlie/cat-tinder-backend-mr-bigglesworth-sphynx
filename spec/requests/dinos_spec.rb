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

    it 'does not create a dino without a name' do

      # I need something to send to my application to have it loaded into the database
      dino_params = {
        dino: {
          age: 6,
          enjoys: 'showing up randomly where she is not expected',
          image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
        }
      }

      # I need to make a request to my appilcation to create the object we made
      post '/dinos', params: dino_params
      # I need to assert that the response is correct
        # status code
      expect(response).to have_http_status(422)

      # define a variable that is in the database
      dino = JSON.parse(response.body)
      # assert that the item in the DB is the same we sent over
     expect(dino['name']).to include "can't be blank"

  end

  it 'does not create a dino without an age' do

    # I need something to send to my application to have it loaded into the database
    dino_params = {
      dino: {
        name: 'Juan',

        enjoys: 'eating everything in its path',
        image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
      }
    }

    # I need to make a request to my application to create the object we made
    post '/dinos', params: dino_params
    # I need to assert that the response is correct
      # status code
    expect(response).to have_http_status(422)

    # define a variable that is in the database
    dino = JSON.parse(response.body)
    # assert that the item in the DB is the same we sent over
   expect(dino['age']).to include "can't be blank"
  end
  
  it 'does not create a dino without an enjoys' do

    # I need something to send to my application to have it loaded into the database
    dino_params = {
      dino: {
        name: 'Juan',

        age: 6,
        image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
      }
    }

    # I need to make a request to my appilcation to create the object we made
    post '/dinos', params: dino_params
    # I need to assert that the response is correct
      # status code
    expect(response).to have_http_status(422)

    # define a variable that is in the database
    dino = JSON.parse(response.body)
    # assert that the item in the DB is the same we sent over
   expect(dino['enjoys']).to include "can't be blank"
  end

  it 'check minimum length of enjoys is 10' do

    # I need something to send to my application to have it loaded into the database
    dino_params = {
      dino: {
        name: 'Juan',
        age: 6,
        enjoys: 'eating everything in its path eating everything in its path eating everything in its path eating everything in its path eating everything in its path',
        image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
      }
    }

    # I need to make a request to my appilcation to create the object we made
    post '/dinos', params: dino_params
    # I need to assert that the response is correct
      # status code
    expect(response).to have_http_status(200)

    # define a variable that is in the database
    dino = JSON.parse(response.body)
    # assert that the item in the DB is the same we sent over
   expect(dino['enjoys'].length).to (be > 9)
  end

  it 'does not create a dino without an image' do

    # I need something to send to my application to have it loaded into the database
    dino_params = {
      dino: {
        name: 'Juan',
        age: 6,
        enjoys: 'eating everything in its path'
        
      }
    }

    # I need to make a request to my appilcation to create the object we made
    post '/dinos', params: dino_params
    # I need to assert that the response is correct
      # status code
    expect(response).to have_http_status(422)

    # define a variable that is in the database
    dino = JSON.parse(response.body)
    # assert that the item in the DB is the same we sent over
   expect(dino['image']).to include "can't be blank"
  end

end

  describe "PATCH /update" do
    it 'updates a dino that exists in the database' do

      Dino.create(
        name: 'John',
        age: 4,
        enjoys: 'Walks in the park',
        image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
      )

      dino = Dino.first

      # I need something to send to my application to have it loaded into the database
      updated_dino_params = {
        dino: {
          name: 'John',
          age: 5,
          enjoys: 'Walks in the park',
          image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
        }
      }

      # I need to make a request to my appilcation to create the object we made
      patch "/dinos/#{dino.id}", params: updated_dino_params
      
      # I need to assert that the response is correct
      # status code
      expect(response).to have_http_status(200)
      # define a variable that is in the database
      updated_dino = Dino.find(dino.id)
      expect(dino.age).to eq 4
      expect(updated_dino.age).to eq 5
      # assert that the item in the BD is the same we sent over
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested dino" do
      Dino.create(
        name: 'John',
        age: 4,
        enjoys: 'Walks in the park',
        image: 'https://www.shutterstock.com/image-photo/funny-laughing-dinosaur-head-on-human-2163097095'
      )
      p Dino.all
      #--> <ActiveRecord::Relation [#<Dino id: 99, name: "John", age: 4, enjoys: "Walks in the park", image: "https://www.shutterstock.com/image-photo/funny-lau...", created_at: "2022-07-01 04:53:40.381919000 +0000", updated_at: "2022-07-01 04:53:40.381919000 +0000">]>
      dino = Dino.first

      delete "/dinos/#{dino.id}"

      expect(response).to have_http_status(200)

      p Dino.all 
      #--> <ActiveRecord::Relation []>
      
    end
  end 
  
  


end

# Finished in 0.15523 seconds (files took 1.12 seconds to load)
# 4 examples, 0 failures
