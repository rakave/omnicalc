class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(/\s+/,"").length

    @word_count = @text.split.length

    @occurrences = @text.downcase.split.count(@special_word.downcase)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
end

def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @monthly_payment = ((@apr/100/12)*@principal)/(1-((1+(@apr/100/12))**(-@years*12)))

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
end

def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = (@ending-@starting)
    @minutes = @seconds/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @days/365.25

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
end

def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.length

    @minimum = @numbers.sort[0]

    @maximum = @numbers.sort[@numbers.length-1]

    @range = @maximum-@minimum

    if @numbers.length.odd?
        median_calc = @numbers.sort[(@count)/2]
    else
        median_calc = (@numbers.sort[((@count)/2)] + @numbers.sort[((@count)/2)-1])/2
    end

    @median = median_calc

    @sum = @numbers.reduce(&:+)

    @mean = @sum/@count

    sum_of_squares = @numbers.map{|x| x*x}.reduce(&:+)

    @variance = ((sum_of_squares - @count*@mean*@mean)/(@count))

    @standard_deviation = (@variance)**0.5

    @mode = @numbers.max_by{|x| @numbers.count(x)}


    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
end
end

# note to self : to convert an array of integers to floats use this "array.map!(&:to_f)"

#      ██╗   ██╗███████╗██╗     ██╗   ██╗
#      ██║   ██║██╔════╝██║     ██║   ██║
#      ██║   ██║█████╗  ██║     ██║   ██║
#      ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║
#       ╚████╔╝ ███████╗███████╗╚██████╔╝
#        ╚═══╝  ╚══════╝╚══════╝ ╚═════╝
