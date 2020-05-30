**** Settings ****

Library   talebearer_infra.keywords.subdomainFinder  /home/kali/results  /home/kali/github_tools

Suite Setup    Create temp dir
Suite Teardown    Gather all subdomains and delete temporary directory

**** Variables ****
${domain}=    lyft.com
${sublister}=    Sublist3r
${subbrute}=    subbrute
${knockpy}=    knock

**** Test Cases ****
Find subdomains from sublister
    [tags]    sublister    subdomain
    Sublister    ${domain}    ${sublister}

Find subdomains from amass
    [tags]     amass    subdomain
    Amass    ${domain}

Find subdomains from subbrute
    [tags]    subbrute    subdomain
    Subbrute    ${domain}    ${subbrute}

Find subdomains from knockpy
    [tags]    knockpy    subdomain
    Knockpy    ${domain}    ${knockpy}

**** Keywords ****
Gather all subdomains and delete temporary directory
    gather all subdomains
    Delete temp dir    delete=true 
