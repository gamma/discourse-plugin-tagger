Tagger::Engine.routes.draw do
  resource :admin_tag, path: "/admin", constraints: AdminConstraint.new do
    member do 
      post 'filter' => 'admin_tags#filter'
    end

    collection do
      post "merge" => "admin_tags#merge"
    end
  end

  get "/tags" => "tags#index"
  get "/tag/:tag" => "tags#get_topics_per_tag"
  get "/tags/cloud" => "tags#cloud"
  get "/tags/cloud/topic/:topic_id" => "tags#cloud_for_topic"
  get "/tags/cloud/category/:slug" => "tags#cloud_for_category"
  get "/tags/cloud/tag/:tag" => "tags#cloud_for_tag"
  get "/tags/info/:tag" => "tags#topic_info"
  get "/set_tags" => "tags#set_tags"
end

Rails.application.routes.draw do
  scope module: 'tagger' do
    get "/tag/:tag" => "tags#get_topics_per_tag"
    get "/tag/" => "tags#cloud"
  end
end
