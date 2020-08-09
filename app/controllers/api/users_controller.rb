class Api::UsersController < Api::BaseController
    def index
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        #byebug
        begin
            @decoded = decode_tokken(header)
            @current_user = User.find(@decoded[:userid])
        end
        # user = User.find(1)
        # @jsonwebtokken = encode_tokken({userid: user.id,name: user.username})
        # # render json: {
        # #     jwt: encode_tokken()
        # # }
    end
    def create
        user = User.new(params.permit(:username,:password))
        if user.save
            render json: {
                jwt: encode_tokken({userid: user.id,name: user.username})
            }
        else
            :bad_request
        end
    end
end