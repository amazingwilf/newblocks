#!/usr/bin/env bash
if [[ ! $(acpi -b | grep -i battery) ]]; then
	exit 0
else
	if [[ ! $(acpi -a|grep -i adapter|grep -i on-line) ]]; then
		printf "^C4^  ^d^ "
	else
		printf "^C1^  ^d^ "
	fi
	echo "$(acpi | sed "s/,//g" | awk '{print $4}' | tr -d "\n")"
fi
