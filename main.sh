#!/bin/bash 
  
  
 # Define global variable to hold the series 
 declare -a series 
  
 # Function to input a series of numbers 
 input_series() { 
     echo "Input a series of 3 positive numbers separated by spaces:" 
     read -a temp_series 
     # Check that we have at least 3 numbers 
     if [ ${#temp_series[@]} -lt 3 ]; then 
         echo "Please enter at least 3 positive numbers." 
         input_series 
     else 
         series=("${temp_series[@]}") 
     fi 
 } 
  
 # Function to validate if a string is a positive number 
 is_positive_number() { 
     local num=$1 
     # Check if the number is greater than 0 and is an integer 
     [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -gt 0 ] 
 } 
  
 # Function to display the series 
 display_series() { 
     echo "--------------------------"
echo "|                        |"
echo "| Series: ${series[@]}          |"
echo "|                        |"
echo "--------------------------"
 } 
  
 # Function to display the sorted series 
 display_sorted_series() { 
     echo "--------------------------"
echo "|                        |"
echo "| Sorted Series: $(echo ${series[@]} | tr ' ' '\n' | sort -n | tr '\n' ' ')  |"
echo "|                        |"
echo "--------------------------" 
 } 
  
 # Function to display the max value 
 display_max() { 
     echo "-------------------"
echo "|                 |"
echo "| Max: $(echo ${series[@]} | tr ' ' '\n' | sort -nr | head -1)         |"
echo "|                 |"
echo "-------------------" 
 } 
  
 # Function to display the min value 
 display_min() { 
     echo "-------------------"
echo "|                 |"
echo "| Min: $(echo ${series[@]} | tr ' ' '\n' | sort -n | head -1)         |"
echo "|                 |"
echo "-------------------"
 } 
  
 # Function to display the average of the series 
 display_average() { 
     local sum=0 
     local len=${#series[@]} 
     for i in "${series[@]}"; do 
         let sum+=$i 
     done 
     echo "-------------------"
echo "|                 |"
echo "| Average: $((sum / len))      |"
echo "|                 |"
echo "-------------------"
 } 
  
 # Function to display the number of elements 
 display_num_elements() { 
     echo "-------------------"
echo "|                 |"
echo "| Elements: ${#series[@]}     |"
echo "|                 |"
echo "-------------------"

 } 
  
 # Function to display the sum of the series 
 display_sum() { 
     local sum=0 
     for i in "${series[@]}"; do 
         let sum+=$i 
     done 
     echo "-------------------"
echo "|                 |"
echo "| Sum: $sum         |"
echo "|                 |"
echo "-------------------"

 } 
  
 # Main function to display menu and handle user choice 
 main() { 
     # Check if series is provided as an external argument 
     if [ "$#" -ge 3 ]; then 
         series=("$@") 
     else 
         input_series 
     fi 
  
     while true; do 
         echo "----------------------------------------"
echo "|               Menu                   |"
echo "----------------------------------------"
echo "| a. Input a Series                    |"
echo "----------------------------------------"
echo "| b. Display the series in order.      |"
echo "----------------------------------------"
echo "| c. Display the series in sorted order|"
echo "----------------------------------------"
echo "| d. Display the Max value of series   |"
echo "----------------------------------------"
echo "| e. Display the Min value of series   |"
echo "----------------------------------------"
echo "| f. Display the Average of the series |"
echo "----------------------------------------"
echo "| g. Number of elements in the series  |"
echo "----------------------------------------"
echo "| h. Display the Sum of the series     |"
echo "----------------------------------------"
echo "|                i. Exit               |"
echo "----------------------------------------"

  
         echo "                    |       "
echo "                    |       "
echo "                    |       "
echo "                    |       "
echo "                    v       "


         read -p "Choose an option: " choice 
         case $choice in 
             a) input_series ;; 
             b) display_series ;; 
             c) display_sorted_series ;; 
             d) display_max ;; 
             e) display_min ;; 
             f) display_average ;; 
             g) display_num_elements ;; 
             h) display_sum ;; 
             i) exit 0 ;; 
             *) echo "Invalid choice. Please choose again." ;; 
         esac 
     done 
 } 
  
 # Start the main function 
 main "$@"