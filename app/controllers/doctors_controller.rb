class DoctorsController < ApplicationController
    before_action:set_doc, only:[:update,:destroy,:show]
   def index
    # @doctors  = Doctor.all
    @doctors = Doctor.paginate(page: params[:page], per_page: 3)

    render json: @doctors, status: :ok 
   end
   def show
    # @doctor = Doctor.find(params[:id])
    render json: @doctor, status: :ok
   end
   def create
    @doctor =Doctor.new(doctor_params)
    if @doctor.save
        render json: @doctor,status: :ok
    else 
        render json:{error:@doctor.errors.full_messages},status: :unprocessable_entity
   end
   end
   
    def update
        # @doctor =Doctor.find(params[:id])
        if @doctor.update(doctor_params)
            render json: @doctor, status: :ok
        else
            render json:{error:@doctor.errors.full_messages},status: :unprocessable_entity
        end
      end
    def destroy
        # @doctor =Doctor.find_by(params[:id])
        if @doctor.destroy
            render json: {message:"sucessfully deleted"}, status: :ok
        else 
            render json:{error:@doctor.errors.full_messages},status: :unprocessable_entity
        end
    end
    private
    def doctor_params
        params.require(:doctor).permit(:name,:email,:mobile,:image)
    end 
   def set_doc
    @doctor = Doctor.find_by(id:params[:id])
    unless @doctor.present?
      render json: {error: "not found"}, status: :not_found
    end
  end
end
