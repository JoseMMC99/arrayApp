require 'set'

class NumberArraysController < ApplicationController
  before_action :set_number_array, only: [:show, :update, :destroy]

  # GET /number_arrays
  def index
    @number_arrays = NumberArray.all

    render json: @number_arrays
  end

  # GET /number_arrays/1
  def show
    render json: @number_array
  end

  # POST /number_arrays
  def create
    @number_array = NumberArray.new(number_array_params)

    if @number_array.save
      render json: @number_array, status: :created, location: @number_array
    else
      render json: @number_array.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /number_arrays/1
  def update
    if @number_array.update(number_array_params)
      render json: @number_array
    else
      render json: @number_array.errors, status: :unprocessable_entity
    end
  end

  # DELETE /number_arrays/1
  def destroy
    @number_array.destroy
  end

  def createArray
    #Checking if there's a @nums key
    if params.has_key?(:nums)
      #Checking if the value of the key @nums is an Integer or at least a number
      if params["nums"].is_a?(Integer) || params["nums"].to_i != 0

        arrayLength = params["nums"].to_i
        numberArray = []

        #Checking if the value of the key @nums is less than 10
        if arrayLength < 10
          render json: { Error: "The lenght of the array cannot be less than 10" }, status: :unprocessable_entity
        else
          arrayLength.times do |i|
            loop do
              num = rand(0..30)
              if !numberArray.include?(num)
                numberArray.push(num)
                break
              end
            end
          end
          newArray = NumberArray.new({"nums":numberArray})

          if newArray.save
            render json: newArray
          else
            render json: { Error: "Something went wrong while saving the Array" }, status: :unprocessable_entity
          end
        end
      else
        render json: { Error: "'nums' must be a number"}, status: :unprocessable_entity
      end
    else
      render json: { Error: "There is not key 'nums' in the body"}, status: :unprocessable_entity
    end
  end

  def listRange
    #Checking if the NumberArray with that id exist in the database
    if (NumberArray.find(params[:id])).nil?
      render json: { Error: "There's no Array with that id"}, status: :not_found
    else    
      arrayDb = NumberArray.find(params[:id])["nums"]
      auxArray = []

      i = 0
      count = 1
      max = 0

      iterations = 0
      aument = arrayDb[i] + 1
      lastNumber = 0

      while( iterations < arrayDb.length )
        iterations += 1

        if arrayDb.include?(aument)
          count += 1
          aument += 1
          lastNumber = aument
          iterations -= 1
        else
          count = 1
          aument = arrayDb[i] + 1
          i += 1
        end

        if(max < count)
          max = count
          auxArray[0] = aument - count
          auxArray[1] = aument - 1
        end


      end

      render json: { LargestSequence: auxArray }, status: :ok

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number_array
      @number_array = NumberArray.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def number_array_params
      params.require(:number_array).permit(:nums)
    end
end
