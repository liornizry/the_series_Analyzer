#!/bin/bash

# input is a positive number ?
validate_positive_number() {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        return 1
    fi
    return 0
}

input_series() {
}


# menu ui for the user
menu() {
    echo ""
    echo "choose from the manu:"
    echo "a. Input a Series - replace the current series"
    echo "b. Display the series in the order it was entered"
    echo "c. Display the series in sorted order (from low to high)"
    echo "d. Display the Max value of the series"
    echo "e. Display the Min value of the series"
    echo "f. Display the Average of the series"
    echo "g. Display the Number of elements in the series"
    echo "h. Display the Sum of the series"
    echo "i. Exit"
    read -p "Enter your choice: " choice
}

# the average of the series
average() {
}

# Main hendel the input  
main() {
    if [[ $# -ge 3 ]]; then
        series=("$@")
    else
        input_series #hendel the series
    fi

    while true; do
        	menu

        case "$choice" in







            i)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid choice. Please choose a valid option."
                ;;
        esac
    done
}

main "$@"

