#!/bin/bash

#########################################################
# Converts image caption into a markdown image links    #
# eg.  img my image -> ![my image](00;.png)             #
#                                                       #
# If the caption ends with a number, that will become   #
# the image number                                      #
# eg.  img my image 3 -> ![my image](003.png)           #
# USE in vim command with   :.!bash                     #
#########################################################


# Declare the default substitution.
substitution="![${*}](00;.png)"

# Prepare alternative substitution if input ends with number
if [[ "${!#}" =~ ^[0-9]*$ ]]; then
    imageNo="${!#}"    # last argument - or ${@:$#}
    caption=${*%"${!#}"} # all except last argument
    imageNo=$(printf %03d "$imageNo") # zero-pad the number
    substitution="![${caption}](lec-${imageNo}.png)"
fi

echo "$substitution"
