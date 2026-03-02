#!/bin/bash

#loan-calc: script to calculate monthly loan payments

PROGNAME=$(basename $0)

usage () {
		cat <<- _EOF_
		usage : $PROGNAME  PRINCIPAL INTEREST MONTHS

		where:

		PRINCIPAL is the total amount borrowed
		INTEREST is the APR as a number(7% = 0.07)
		MONTHS is the length of the loan's term

		_EOF_
}

if (($# != 3)); then
		usage
		exit 1
fi

principal=
interest=
months=

# process command line operations	
interactive=

while [[ -n $1 ]]; do
		case $1 in
				-i | --interactive) 		
											interactive=1
											;;
				-h | --help)				usage
											exit
											;;
				*)							break
											;;
		esac
		shift
done

if [[ -z $interactive ]]; then
		principal=$1
		interest=$2
		months=$3
fi

if [[ -z $principal || -z $interest || -z $months ]]; then
		echo "Read the usage below" >&2
		usage
		exit 1
fi

# interactive mode

if [[ -n $interactive ]]; then
		while true; do
				read -p "Enter the principal amount > " principal
				read -p "Enter the interest APR as in (7% = 0.07) > " interest
				read -p "Enter the duration of in total number of months > " months

				if [[ -z $principal || -z $interest || -z $months ]]; then
						echo "fields cannot be empty" >&2
						continue
				else
						break
				fi
		done
fi

bc -l <<- _EOF_
		scale = 10
		i = $interest / 12
		p = $principal
		n = $months
		factor = (1 + i) ^ n
		a = p * ((i * factor)/(factor - 1))
		print a, "\n"
_EOF_

