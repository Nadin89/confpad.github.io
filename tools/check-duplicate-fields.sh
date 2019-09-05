#!/bin/sh

if [[ "$#" -ne 1 ]]; then
    echo "Example usage: check-duplicate-fields.sh data/conferences/2018-04-25-react-finland-2018.yaml"
    exit
fi

FILE=$1

FIELDS=("title:" "lang:" "type:" "level:" "time:" "name:" "twitter:" "github:" "website:")

for field in "${FIELDS[@]}"
do
  echo Inspecting field: \"${field}\"
  grep ${field} ${FILE} | sort -n | uniq -c | sort -nr
  echo
done

FIELDS_A1=("slides:" "videos:" "description:")

for field in "${FIELDS_A1[@]}"
do
  echo Inspecting field "(-A1)": \"${field}\"
  grep -A1 ${field} ${FILE} | grep -v -e "^--$" | sort -n | uniq -c | sort -nr
  echo
done
