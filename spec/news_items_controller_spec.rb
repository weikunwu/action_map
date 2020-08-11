require 'rails_helper'

# news item has the following attributes
# t.string :title, null: false
# t.string :link, null: false
# t.text :description
# t.belongs_to :representative, null: false, index: true
# t.timestamps null: false


RSpec.describe NewsItemsController, type: :controller do
    before (:each) do
        @r_params0 = {:ocdid => '123', :name => 'name0', :title => 'title0'} #,:created_at => '1/7/2020', :updated_at => '1/7/2020'}
        @representative0 = Representative.create(@r_params0)
        @news_item_params00 = {:title => 'news0-0', :link => 'link0-0', representative_id: @representative0.id}
        @news_item00 = @representative0.news_items.create(@news_item_params00)
    end
  
    describe "GET #index" do
        it "shows news items of a representative" do
            get :index, params: { representative_id: @representative0.id }
            
            puts "DEBUG actual news_items: #{@representative0.news_items[0]}"
            puts "DEBUG returned news_items: #{assigns(:news_items)[0]}"
            expect(1).to eq(1)
            expect(assigns(:news_items)).to include(@news_item00)
            expect(response).to render_template(:index)
        end

#         it "sorts all movies by title" do
#           get :index, :sort => 'title'
#           response.status.should be(302)
#         end

#         it "sorts all movies by date" do
#           get :index, :sort => 'release_date'
#           response.status.should be(302)
#         end

#         it "finds similar movies by director" do
#           get :index, :movie_id_with_director => @movie2.id
#           expect(assigns(:movies).all).to include(@movie2)
#         end

#         it "finds similar movies without director" do
#           get :index, :movie_id_with_director => @movie3.id
#           assigns(:movies).all.should include(@movie3)
#           assigns(:movies).all.should include(@movie)
#         end
    end
  
  
#   describe "POST #create" do
#     it "adds new movie to database" do
#         expect {
#         post :create, movie: @movie_attributes
#         }.to change(Movie,:count).by(1)
#     end
#     it "@movie has right attributes" do
#         post :create, movie: @movie_attributes
#         expect(assigns(:movie).title).to include("test1-1")
#     end
#   end
  
#   describe "GET #show" do
#     it "shows the correct movie" do
#       get :show, :id => @movie.id
#       expect(assigns(:movie).title).to include("test1-1")
#     end
#     it "renders the :show haml" do
#       get :show, :id => @movie.id
#       expect(response).to render_template(:show)
#     end
#   end
  
#   describe "DELETE #destroy" do
#     it "deletes movie" do
#       expect{
#         delete :destroy, id: @movie.id
#       }.to change(Movie,:count).by(-1)
#     end
#   end
  
#   describe "PUT #update" do
#     it "changes the requested movie attributes" do
#       put :update, id: @movie.id, movie: @movie_attributes2
#       @movie.reload
#       expect(@movie.title).to eq('test0-2')
#       expect(@movie.rating).to eq('G')
#     end
#   end

end