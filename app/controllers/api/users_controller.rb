class Api::UsersController < Api::BaseController
    def index
        user = User.find(1)
        render json: {
            jwt: encode_tokken({userid: user.id,name: user.username})
        }
    end
    def create
        user = User.new(params.permit(:username,:password))
        byebug
        if user.save
            render json: {
                jwt: encode_tokken({userid: user.id,name: user.username})
            }
        else
            :bad_request
        end
    end
end