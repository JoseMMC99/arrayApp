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
    # Getting the parameter ["nums"] in order to get the lenght of the array
    parameters = number_array_params

    numberArray = []

    if parameters["nums"] < 10
      render json: "The lenght of the array cannot be less than 10"
    else
      parameters["nums"].times do |i|
        loop do
          num = rand(0..30)
          if !numberArray.include?(num)
            numberArray.push(num)
            break
          end
        end
      end
      puts numberArray
      newArray = NumberArray.new({"nums":numberArray})

      if newArray.save
        render json: newArray
      else
        render json: newArray.errors, status: :unprocessable_entity
      end
    end    
  end

  def listRange
    if (NumberArray.find(params[:id])).nil?
      render json: "There's no Array with that id", status: :not_found
    end

    arrayDb = NumberArray.find(params[:id])["nums"]
    auxArray = []

    maxim = 0    

    arrayDb.length.times do |i|      
      
      aument = arrayDb[i]

      while arrayDb.include?(aument)        
        aument += 1
        if(maxim < [maxim, aument - arrayDb[i]].max)
          auxArray[0] = arrayDb[i]
          auxArray[1] = aument - 1
        end
        maxim = [maxim, aument - arrayDb[i]].max
        
      end
      
    end

    puts "Array secuencia: "
    puts auxArray
    puts "Secuencia maxima: " + maxim.to_s

    render json: auxArray

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
