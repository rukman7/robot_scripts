**** Settings ****
Library   talebearer_infra.keywords.subdomainTakeover  /home/kali/results

**** Test Cases ****
Find possible subdomain takeover using subover
    [Documentation]    Example: subover    v[verbose] https[uses https] a[checks all hosts regardless of cname]
    ...    l=/pathtosubdomainfile timeout=20  t 5[threads]  output_file result.txt[output file name]
    [tags]    subdomain_takeover    subover
    subover  t=5  l=/home/kali/results/subdomains.txt  output_file=subdomain_takeover_subover.txt

Find possible subdomain takeover using subover - https only
    [tags]    subdomain_takeover    subover    subdomain_takeover_https
    subover  https  t=5  l=/home/kali/results/subdomains.txt  output_file=subdomain_takeover_subover_https.txt

Find possible subdomain takeover using subjack
    [Documentation]    Example subject    w[list of subdomains] example.txt t 10 [number of threads-default-10]
    ...    timeout 20[default-10s] o result.txt[result file results.json also possible] ssl[enforses https] a[skips cname check and sends requests to every URL]
    ...    m[flags the presence of dead record] c[path to configuration file.don't know its usage]
    [tags]    subdomain_takeover    subjack
    subjack    m  w=/home/kali/results/subdomains.txt  o=/home/kali/results/subdomain_takeover_subjack.txt  t=5

Find possible subdomain takeover using subjack - https only
    [tags]    subdomain_takeover    subjack    subdomain_takeover_https
    subjack    ssl  w=/home/kali/results/subdomains.txt  o=/home/kali/results/subdomain_takeover_subjack_https.txt  t=5
