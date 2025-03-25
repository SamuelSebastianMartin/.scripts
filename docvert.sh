#!/bin/bash

######################
#      docvert       #
######################

# A wrapper for pandoc that selects a particular
# template, which essentially changes the
# header to match the course that I am preparing
# work for.

# USE: docvert -[a,b,u] outFileName.extension
# eg docvert -a lesson.docx
#    would convert lesson.md into a docx
#    with the acEng template.

# Wrong number of arguments or -h flag usage message
if [[ $1 == "-h" ]] || [[ $# != 2 ]]; then
    echo "USAGE: docvert -[a, b, u] outFileName.outExtension"
    echo "-a: academic English headers"
    echo "-b: IBE headers"
    echo "-u: UMW headers"
    echo "-h: Print this message and exit"
    echo "The output file will have the same basename as the markdown, so there must be a corresponding .md or .markdown file in the directory"
    exit
fi

# Determine the course template to use.
TEMPLATE_DIRECTORY="$HOME/Templates"
COURSE_CODE="${1}"

case $COURSE_CODE in
a | -a)
 COURSE="aceng";;
b | -b | ibe)
 COURSE="IBE";;
u | -u | umw)
 COURSE="umw";;
*)
  echo -e "\e[0;33m Usage error"
  echo "Chose flag from -a, -b, and -u"
  exit 1
esac

# Get filetype / extension.
EXTENSION="${2##*.}"

case $EXTENSION in
docx)
 FILETYPE=".docx";;
odt)
 FILETYPE=".odt";;
*)
  echo -e "\e[0;33m Usage error"
  echo "file must be .docx or .odt"
  exit 1
esac

# get file basename
BASENAME="${2%.*}"

# check for markdown file with correct name
if [[ -f "$BASENAME.md" ]]; then
    INDOC="$BASENAME.md"
elif [[ -f "$BASENAME.markdown" ]]; then
    INDOC="$BASENAME.markdown"
else echo -e "\e[0;33mThere must be a file named $BASENAME.md"
    exit 1
fi

# Perform Pandoc convertion
OUTDOC="$BASENAME$FILETYPE"
pandoc --reference-doc="$TEMPLATE_DIRECTORY/$COURSE$FILETYPE" -o "$OUTDOC" "$INDOC"
