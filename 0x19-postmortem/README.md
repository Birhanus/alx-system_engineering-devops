#Postmortem

![App Screenshot](https://previews.123rf.com/images/get4net/get4net1902/get4net190203516/116219791-bug-fix-or-repair.jpg?fj=1)


## Issue Summary
On 26 april 2022 - 27 April 2022 a misspelled file name caused a 500 internal service error on our Wordpress site. 100% of users were affected by this error and were unable to access the service.

## Timeline
- 14:15 PST 26 april 2022 - a customer complained that they received a 500 internal service error when attempting to view the Wordpress site
- 14:20 PST 26 april 2022 - engineers logged onto a server and used strace on Apache2 process and curl in an attempt to identify cause of error
- 14:25 PST 26 april 2022 - engineers follow multiple tutorials for debugging Apache2 web server
- 14:30 PST 26 april 2022 - engineers still trying to identify cause of error
- 15.25 PST 26 april 2022 - engineers still trying to identify cause of error, suspect that it is incorrect permissions on a certain directory
- 16:25 PST 26 april 2022 - engineers crawl through StackOverflow for clues
- 17:25 PST 26 april 2022 - engineers read Apache documentation for clues on how to debug server
- 18:25 PST 26 april 2022 - mandated nap time for engineers as they have been stuck for several hours on this issue
- 19:25 PST 26 april 2022 - mandated snack time for engineers as their bodies need fuel for them to be smart
- 20:25 PST 26 april 2022 - someone mentions reading a postmortem where a typo of a file extension caused a 500 error
- 20:30 PST 26 april 2022 - engineers find typo that is causing error
- 20:30 PST 26 april 2022 - file containing typo is located
- 21:00 PST 26 april 2022 - engineers run Puppet manifest to rename file and fix error on all servers
## Root Cause
In a settings file, a file path with the extension .php was mistyped as .phpp, causing a File Not Found Error which resulted in a status code 500 error when users tried to access the service.

## Resolution
Engineers used a Puppet manifest to effectively and efficiently fix the error across all servers. Rather than correct the misspelled file path in the settings file, engineers decided to rename the file to match the misspelled path, as a misspelled file extension in this case would not affect execution.

## Corrective and Preventative Measures
All code must be tested by at least 2 other engineers before being merged into development branch
All code must be code reviewed by at least 2 other engineers before being merged into master branch for 
