# Linux and Bash Challenges  

## Status  

Certification Completed. [Professional Certificate][url_final_certificate].  
Repository: under construction.  

## Welcome!  
  
The aim of this repository is to document my journey on improving my Linux and Bash skills. It contains the files for the challenges in the form of script and text files. In the README.md you can find a file structure and a description of each challenge.  

These exercises were done during my studies for the [Ubuntu Linux Professional Certificate by Canonical][url_cert_link]  

## List of Challenges  

See below a list of challenges, separated by courses, with a brief description.  

### Linux Command Line  
Course: [Learning Linux Command Line][url_cli] by Scott Simpson  

| Challenge | File | Description | Brief summary of skills and commands learned |  
|-|-|-|-|  
| 1 | command-line-basics.txt | Find commands infomation | apropos, find, man, ls, df |  
| 2 | fix-broken-syntax.txt | Fix commands syntax | cd, mv, chmod |  
| 3 | n/a |Practicing folder copying, creation and links  | cp, mkdir, rmdir, rm, touch, ln |  
| 4 | create-share-file.txt | Creating, editing the permissions and compressing a file | tar, zip |  
| 5 | extract-information-file.txt | Extracting compressed files, creating pipes and transfering data to a file  | cat, grep, awk, sort, \| , \> |  

### Bash Scripting  
Course: [Learning Bash Scripting][url_bash] by Scott Simpson (extra course, does not belong to the Ubuntu Linux Professional Certificate)  

|Challenge | File | Description | Brief summary of skills and commands learned |  
|-|-|-|-|  
|6 |system-report.sh | Create a simple system report script | variables, command expansion, echo, printf, color formatting, bc|  
|7 |other-examples.sh | Script created to show some examples of what was learned in the chapter | braces, parameter and arithmetic expansions, extended tests and arrays |  

## Folder Structure

```plaintext
linux-bash-challenges/
└── learning-linux-command-line
    ├── command-line-basics.txt             #Challenge 1
    ├── fix-broken-syntax.txt               #Challenge 2
    ├── create-share-file.txt               #Challenge 4
    ├── create-share-file.tar.gz            #Challenge 4
    ├── extract-information-file.txt        #Challenge 5
    ├── invalid-users.txt                   #Output from Challenge 5
    ├── unpack                              #Directory used in Challenge 5
        └── auth.log                        #File used in Challenge 5
└── learning-bash-scripting
    ├── system-report.sh                    #Challenge 6
    ├── other-examples.sh                   #Challenge 7
    └── solutions
        └── sysreport                       #Solution from the instructor for Challenge 6 
```
Author: Ricardo Gastl

[url_cert_link]:https://www.linkedin.com/learning/paths/ubuntu-linux-professional-certificate-by-canonical
[url_cli]:https://www.linkedin.com/learning/learning-linux-command-line-14447912
[url_final_certificate]:https://www.linkedin.com/learning/certificates/2dbdffeef22b53cdb2dad04393b86435c347baff33ca0280358b604a084508c4?trk=share_certificate
[url_bash]:https://www.linkedin.com/learning/learning-bash-scripting-26210777
