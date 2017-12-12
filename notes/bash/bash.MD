# bash

Ok, so I'm a windows guy.  That is, I've always worked primarily in a windows environment.  Lately however, I've
been doing most of my local project management and other tasks with the mintty terminal installed with Git for Windows.

Here are some bash scripts I've built for that environment.


## simple sh script to run through folders and pull if it is a git repository
```
#!/bin/sh

for d in */ ; do
    # echo "$d"
    cd "$d"
    if [ -d ".git" ]; then
    	git pull origin master
    	# echo "Git folder"
    	# ls -la
	fi
    cd ..
done
```

[home](/jason-notes)<br>