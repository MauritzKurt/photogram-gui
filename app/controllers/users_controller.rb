class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "/user_templates/index" })
  end

  def show
    # Parameters: {"path_username"=>"catherina"}

    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "/user_templates/show" })
    end
  end

  def create
    input_username = params.fetch("input_username")
    # user_list = User.order({ :id => :desc })
    # highest_id_user = user_list.first

    a_new_user = User.new
    a_new_user.username = input_username
    # a_new_user.id = highest_id_user.id + 1

    a_new_user.save

    redirect_to("/users/" + input_username.to_s)
  end

  def update
    # Parameters: {"path_username"=>"aaaron"}
    the_username = params.fetch("path_username")
    matching_users = User.where({ :id => the_username })

    the_user = matching_users.first

    input_username = params.fetch("query_username")

    the_user.username = input_username

    the_user.save

    redirect_to("/users/" + the_user.username.to_s)
  end
end
