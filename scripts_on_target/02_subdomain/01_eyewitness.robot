**** Settings ****
Library   talebearer_infra.keywords.eyewitness  /home/kali/results  /home/kali/github_tools

**** Test Cases ****
Gather screenshots of landing page for all the subdomains
    [tags]    eyewitness    screenshots
    Generate Screenshots Of Subdomains    EyeWitness
