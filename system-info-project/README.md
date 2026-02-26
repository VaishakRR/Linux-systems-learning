PROJECT TITLE: System Information Page.

1. WHAT IT DOES:  
			1)	Reports System's Uptime(since the last boot),  
			2)	Reports Disk Space Utilization,  
			3)	Reports User(s) home Space Utilization; if user is a superuser then it reports utilization for all users; if the user is not a superuser then it reports the utlization for the current logged in user, and also reports the number of files and directories by finding all the directory trees with respect to logged in user,  
			4)	Writes the value/information of  Report into a new file in html format for viewing it in the web browser for more concise result.  

2. WHAT I LEARNED:   
			Learned how bash executes the script, line by line just like entering the single command into prompt. How the control flows through the script. Redirection of the standard output into a regular file. Changing the file permissions for executing, reading and writing the file. Created a bin directory in home directory and adding that directory to $PATH variable for executing this script from anywhere in the system.

3. KEY COMMANDS USED:  
			date, cat, uptime, df, du, file, shift, built in positional parameters...
