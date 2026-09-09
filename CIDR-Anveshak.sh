#!/bin/bash

clear
figlet "CIDR-Anveshak"
echo "Version: 1.0"
echo "Author: Vinay Mahendre aka bit0x1er"
echo ""

echo -e "\n[!] NOTE:"
echo -e "[!] Please ensure there are no spelling mistakes in the company name."
echo -e "[!] Incorrect spelling may result in no ASN or CIDR results from the BGP search.\n"

read -p "Enter the target name (e.g., google): " target

target_encoded="${target// /%20}"

target_filename="${target// /_}"
file_prefix="CIDR+_${target_filename}"

echo ""
echo "Finding All ASN Numbers for $target..."
sleep 2 
echo "Visiting... https://bgp.he.net"
sleep 2 

search_html=$(curl -s -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" "https://bgp.he.net/search?search%5Bsearch%5D=$target_encoded&commit=Search")

asn_numbers=$(echo "$search_html" | grep -o 'AS[0-9]\+' | sort -u)
ipv4_search=$(echo "$search_html" | grep -oP '([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+)' | sort -u)
ipv6_search=$(echo "$search_html" | grep -Eo '([a-fA-F0-9]{0,4}:){2,7}[a-fA-F0-9]{0,4}/[0-9]{1,3}' | sort -u)

if [ -z "$asn_numbers" ]; then
  echo ""
  echo -e "[!] WARNING: If no ASN was found but IPv4 or IPv6 results appeared, the target company likely operates under another organization's ASN network."
  echo -e "[!] However, if no ASN, IPv4, or IPv6 results were found at all, the company might be using third-party hosting services, or there is a spelling mistake in the provided name. Please verify the spelling and try again."
else
  echo "Found...! Fetching ASN numbers for $target..."
  sleep 2
  echo "Fetching IPv4 and IPv6 prefixes for each ASN..."
  sleep 1
fi

IPv4_cidr_data="$ipv4_search"
IPv6_cidr_data="$ipv6_search"

asn_counter=1

for asn in $asn_numbers; do

  echo "[$asn_counter] Processing IPv4 and IPv6 for $asn..." >&2
  
  ASN=$(echo "$asn" | grep -oP '(?<=AS)[0-9]+')

  ipv4=$(curl -s -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" "https://bgp.he.net/super-lg/report/api/v1/prefixes/originated/$ASN" | grep -oP '([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]+')
  ipv6=$(curl -s -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64)" "https://bgp.he.net/super-lg/report/api/v1/prefixes/originated/$ASN" | grep -Eo '([a-fA-F0-9]{0,4}:){2,7}[a-fA-F0-9]{0,4}/[0-9]{1,3}')

  if [ -n "$ipv4" ] && [ -n "$ipv6" ]; then
    echo "     -> Both IPv4 and IPv6 found for $asn" >&2
  elif [ -n "$ipv4" ]; then
    echo "     -> Only IPv4 found for $asn" >&2
  elif [ -n "$ipv6" ]; then
    echo "     -> Only IPv6 found for $asn" >&2
  else
    echo "     -> No prefixes found for $asn" >&2
  fi

  IPv4_cidr_data=$(echo -e "$IPv4_cidr_data\n$ipv4" | sort -V -u | sed '/^$/d')
  IPv6_cidr_data=$(echo -e "$IPv6_cidr_data\n$ipv6" | sort -V -u | sed '/^$/d')
  
  ((asn_counter++))
  sleep 1
done

echo ""

if [ -n "$IPv4_cidr_data" ] && [ -n "$IPv6_cidr_data" ]; then
  echo "Total Unique ASNs Processed: $((asn_counter - 1))"
  echo "$IPv4_cidr_data" > "${file_prefix}_ipv4cidr.txt"
  echo "IPv4 prefixes for $target saved to ${file_prefix}_ipv4cidr.txt"
  echo "Total unique IPv4 prefixes fetched: $(wc -l < "${file_prefix}_ipv4cidr.txt")"

  echo "$IPv6_cidr_data" > "${file_prefix}_ipv6cidr.txt"
  echo "IPv6 prefixes for $target saved to ${file_prefix}_ipv6cidr.txt"
  echo "Total unique IPv6 prefixes fetched: $(wc -l < "${file_prefix}_ipv6cidr.txt")"

elif [ -n "$IPv4_cidr_data" ]; then
  echo "Total Unique ASNs Processed: $((asn_counter - 1))"
  echo "$IPv4_cidr_data" > "${file_prefix}_ipv4cidr.txt"
  echo "IPv4 prefixes for $target saved to ${file_prefix}_ipv4cidr.txt"
  echo "Total unique IPv4 prefixes fetched: $(wc -l < "${file_prefix}_ipv4cidr.txt")"
  echo "IPv6 not found for $target"

elif [ -n "$IPv6_cidr_data" ]; then
  echo "Total Unique ASNs Processed: $((asn_counter - 1))"
  echo "$IPv6_cidr_data" > "${file_prefix}_ipv6cidr.txt"
  echo "IPv6 prefixes for $target saved to ${file_prefix}_ipv6cidr.txt"
  echo "Total unique IPv6 prefixes fetched: $(wc -l < "${file_prefix}_ipv6cidr.txt")"
  echo "IPv4 not found for $target"

else
  if [ -n "$asn_numbers" ]; then
    echo "Total Unique ASNs Processed: $((asn_counter - 1))"
  fi
  echo "No CIDR data found for $target"
fi

echo -e "\nDone"
echo "Happy Hacking...!"
