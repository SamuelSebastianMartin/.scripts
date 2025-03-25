#! /bin/bash
#
# USE: pdfnotes example.pdf
# USE: for n in $( ls *pdf ); do pdfnotes $n; done
#
# Help turning a PDF of lecture slides into
# a markdown file, ready to use for note-taking.
# Aimed at bullet-point presentations
#
# For every .PDF file, it:
#  -makes a new directory with the same name,
#   and moves all similarly
#   named files into that directory.
#  -The text of the pdf is saved as `.markdown`,
#   and loosely formatted.
#  -Images are extracted as png files in the
#   same directory, numberer 001.png, 002png etc.
#
# It is just a series of steps I use to prep a
# PowerPoint ready for note-taking in lectures.
# The PowerPoint must be exported as a pdf, first
#
# If you are looking to convert a PDF to a
# markdown file, this is not what you want.

FILENAME=${1}
EXTENSION=${FILENAME: -3}
BASENAME=$(basename -s .pdf "${FILENAME}")
# remove possible '.' from name of directory
echo "${DIRECTORY}"
DIRECTORY="${BASENAME//./_}"
OUTNAME=${BASENAME}.markdown

# Check for just one argument
if [[ ${#} != 1 ]]; then
    echo
    echo "Enter pdf filename"
    echo "EXAMPLE: pdfnotes test.pdf"
    echo
    exit
fi;

# Check file extension
if [[ ${EXTENSION} != "pdf" ]]; then
    echo
    echo "File must be a pdf"
    echo "EXAMPLE: filename.pdf"
    echo
    exit
fi;

# Set up directory for files
mkdir "${DIRECTORY}"
mv "${BASENAME}".* ./"${DIRECTORY}"
cd "${DIRECTORY}" || exit

# Convert to text
pdftotext "${1}" "${OUTNAME}"

# Extract images (as lec-001.png, lec-002.png)
pdfimages -png "${FILENAME}" lec

# Replace strage bullet points at start of line
sed -i "s/^[^a-zA-Z0-9]/  + /" "${OUTNAME}"

# Add indent to lines starting with lower case
sed -i '/^[a-z]/ s/^/    /' "${OUTNAME}"

cd ..

#  basename -s .pdf "${FILENAME}"
