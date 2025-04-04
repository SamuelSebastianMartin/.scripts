#!/bin/sh

##############################################
#                                            #
#   Removes log, aux and out files created   #
#   as a by-product of pdflatex  and LaTeX   #
#                                            #
##############################################

# Temporary file to hold files to be deleted
temp_file=$(mktemp)

# Function to list files
list_files() {
    for ext in log aux out nav snm toc
    do
        for f in *."$ext"
        do
            [ -e "$f" ] && echo "$f" >> "$temp_file"
        done
    done
}

# Function to display files
display_files() {
    echo "The following files will be deleted:"
    cat "$temp_file"
}

# Function to confirm deletion
confirm_deletion() {
    echo "Do you want to delete these files? (y/n): "
    read -r choice  # Using -r to prevent backslash interpretation
    case "$choice" in
        y|Y )
            echo "Deleting files..."
            xargs rm < "$temp_file"
            echo "Files deleted."
            ;;
        n|N )
            echo "No files were deleted."
            ;;
        * )
            echo "Invalid choice. No files were deleted."
            ;;
    esac
}

# Main script execution
list_files

if [ ! -s "$temp_file" ]; then
    echo "No files to delete."
else
    display_files
    confirm_deletion
fi

# Clean up temporary file
rm "$temp_file"

