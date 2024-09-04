#!/bin/bash
# Program to display service status graphically in the terminal

# Declare and array of services and associated human readable names
declare -a services=(
    "rsyncd"
    "sshd"
)

declare -a serviceNames=(
    "RSync"
    "SSH"
)

declare -a serviceStatus=(

)

# Get status of all services
for service in "${services[@]}"
do
    serviceStatus+=($(systemctl is-active "$service.service"))
done

# Set max column width
width=$((64-2))

# Current line and line length
line=" "
lineLen=0

echo ""
echo "Services Running"

for i in ${!serviceStatus[@]}
do
    # Next line and its length
    next=" $serviceNames[$i]}: \e[5m${serviceStatus[$i]}"
    nextLen=$((1+${#next}))

    # If the current line will exceed the max column width then echo the current line and start a new line
    if [[ $((lineLen+nextLen)) -gt width ]]; then
        echo -e "$line"
        lineLen=0
        line=" "
    fi

    lineLen=$((lineLen+nextLen))

    # Colour the next line green if it's active, else red
    if [[ "${serviceStatus[$i]}" == "active" ]]; then
        line+="\e[32m\e[0m${serviceName[$i]}: \e32m"
    
