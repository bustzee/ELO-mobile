#!/bin/bash

# Check if the correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <path> <basename>"
    exit 1
fi

# Extract the arguments
path="$1"
basename="$2"

# Print the input values
echo "Input path: $path"
echo "Input basename: $basename"

# Call the API using cURL and store the response in a variable
api_response=$(curl -X POST -H "Content-Type: application/json" -d "{\"name\": \"$basename\"}" https://elo-esports.com/api/stream-api/)

# Check if the cURL request was successful
if [ $? -ne 0 ]; then
    echo "Error: cURL request failed."
    exit 1
fi

# Parse the JSON response to get the new_name
new_name=$(echo "$api_response" | jq -r '.new_name')

# Check if new_name is not empty
if [ -n "$new_name" ]; then

    # Replace $basename with the new_name in the output file path
    output_path="/var/www/streams/$new_name.mp4"
    mv "$path" "/var/www/streams/$new_name.flv"
    flv_path="/var/www/streams/$new_name.flv"

    # Run FFmpeg with the updated output file path
    /bin/ffmpeg -i "$flv_path" -f mp4 "$output_path"

    # Check if FFmpeg was successful
    if [ $? -eq 0 ]; then
        # Output success message
        echo "Conversion completed. Output file path: $output_path"
    else
        echo "Error: FFmpeg conversion failed."
        exit 1
    fi
else
    # Output error message if new_name is empty
    echo "Error: Failed to retrieve new_name from API response."
    exit 1
fi
