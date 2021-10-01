# README

## App
### Rest Api on Ruby
* Create an array, this endpoint must receive only a parameter that will be the number of elements that will have the array
  * The array elements must be integers between 0 and 30
  * The minimun amount of elements must be 10
  * Elements can't repeat
* Write a function that takes in an array of integers and returns an array of length 2 representing
the largest range of numbers contained in that array. The first number in the output array should
be the first number in the range while the second number should be the last number in the range.
A range of numbers is defined as a set of numbers that come right after each other in the set of
real integers. For instance, the output array [2, 6] represents the range {2, 3, 4, 5, 6}, which is a
range of length 5. Note that numbers do not need to be ordered or adjacent in the array in order
to form a range. Assume that there will only be one largest range.

  * Sample input: <code>[0, 7, 3, 13, 15, 5, 2, 4, 10, 1, 12, 6]</code>
    * Sample output: <code>[0, 7]</code>
  
  * Sample input: <code>[1, 11, 3, 30, 12, 8, 2, 14, 10, 13]</code>
    * Sample output: <code>[10, 14]</code>

## Versions and configurations

#### Creating the app:
##### <code>rails new arrayApp --api --skip-active-record</code> *(Without this mongoDB gave me problems)*


#### Creating the files: 
##### <code>rails g scaffold NumberArray nums:array</code> *(autogenerated)*

* Ruby version
   * ruby 3.0.2p107

* Ruby on rails version
  * Rails 6.1.4.1

* System dependencies
  * 'MongoDB'
    * <code>gem install mongoid</code> or <code>bundle install</code> *inside the app folder* 

### DataBase configuration
#### <code>./app/config/locales/mongoid.yml::line:7</code>
#### In that line goes the Uri of your database in order to connect database MongoDb

## Endpoints

### Post
##### Creating the array with a determined length by the user
##### Url used: <code>http://127.0.0.1:3000/create/number_arrays/</code>

#### Body 
##### <code>{ "nums": number }</code> 
* HTTP Responses
  * 202 OK
    * <code>nums</code> Integer bigger than 10
    * <code>nums</code> Number in a string bigger than 10
  * 422 unprocessable_entity
    * <code>!=nums</code> The body doesn't contains the key "nums"
    * <code>nums</code> String that is not a number
    * <code>nums</code> Integer lesser than 10
    * <code>nums</code> Number in a string lesser than 10    
    * Problem creating the new array
    
* JSON Responses *in order*
  * 202 OK
    * <code>{ NumberArray Object }</code> Integer bigger than 10
    * <code>{ NumberArray Object }</code> Number in a string bigger than 10
  * 422 unprocessable_entity
    * <code>{ "Error": "There is not key 'nums' in the body" }</code> The body doesn't contains the key "nums"
    * <code>{ "Error": "'nums' must be a number" }</code> String that is not a number   
    * <code>{ "Error": "The lenght of the array cannot be less than 10" }</code> Integer lesser than 10
    * <code>{ "Error": "The lenght of the array cannot be less than 10" }</code> Number in a string lesser than 10


### Get
##### Getting the longest sequence, first and last number in an array
##### Url used: <code>http://127.0.0.1:3000/get/number_arrays/:id</code>

#### Params
##### <code>:id</code>
* HTTP Responses
  * 202 Ok
    * <code>:id</code>  Was a valid id
  * 404 not_found
    * <code>:id</code>  Wasn't found on the database
    * 
* JSON Responses
  * 202 Ok
    * <code>{ "LargestSquence": [initialNumber, finalNumber] }</code>
  * 404 not_found
    * <code>{ "Error": "There was not array with that id" }</code>  
