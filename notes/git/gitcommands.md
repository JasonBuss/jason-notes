# GitCommands

## Git configuration items:

These commands are used to set global user settings.  User.name and user.email are required. Setting the editor path allows 
you to define which text editor is used to write commmit messages.

* List configuration:			`$ git config --list`
* set username:					`$ git config --global user.name "John Doe"`
* set email:					`$ git config --global user.email johndoe@example.com`
* set editorpath (notepad++):	`$ git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -nosession"`

You can also set local username and email values for individual projects, by running this statment in your working directory.

* `$ git config user.email "johndoe@example.com"`


### Add Reference to global .gitignore 

Set up a global .gitignore file by creating the file in your %USERPROFILE% folder and running this command:

* `$ git config --global core.excludesfile %USERPROFILE%\.gitignore`

This will result in an entry in your .gitconfig that looks like this:
`excludesfile = {path-to-home-dir}/.gitignore`


### Get commit history

- `$ git log --pretty=format:"%h - %an, %ar : %s"`

```
	_%h Abbreviated commit hash_
	_%an author name_
	_%ar author date relative_
	_%s subject_
```

## Git commands

### Set up local repository

1. Create Central repository in repository folder (local version of origin)
- `$ git init --bare <repositoryName>`
	
2. Create Local repository
- `$ git init <repositoryname>`
- `$ git clone <centralrepositorypath>` _(Clone from central repo)_
	

### Branch management:

3. See list of branches from repository _(shows active as well)_
- `$ git branch`

4. Create new branch
- `git branch <newbranchname>`

5. Checkout Branch
-  `git checkout <branchname>`

6. Delete branch
- `git branch -d <branchname>` _(will not delete branches with unmerged commits)_
or
- `git branch -D <branchname>` _(Force delete of branch)_

7.	Delete remote branch
- `git push origin --delete <branchname>`
	
8.	Rename current branch
- `git branch -m <new branch name>`
	

#### While working:	

9.	Add Files to Local Repository (This also needs to be done after modifying a script)
	Use git add to track file
- `git add <filename> | git add .`
	

#### When done:	

10. Commit Changes (after adding files)
- `git commit` (Will be presented with text editor for comments)
- `git commit -m "Enter comments here"` (Add comments manually)


#### Examples

11.	Adding a central repo as origin for the local project
- `git init`
- `git add README.md`
- `git commit -m "first commit"`
- `git remote add origin <Central Repo Path>`
- `git push -u origin master`
	
12.	Pulling changes from central repository
- `git pull origin <branchname>`

### Master/Development model commands:

* Creating a feature branch:
- `git checkout -b feature-<Feature Name> developmen`

* Merging feature to develop:
- `git checkout development`
- `git merge --no-ff Feature-<Feature Name>`
- `git branch -d Feature-<Feature Name>`
- `git push origin develop (If there is a central repo)`
	
- `echo "# test" >> README.md`
- `git init`
- `git add README.md`
- `git commit -m "first commit"`
- `git remote add origin https://github.com/JasonBuss/test.git`
- `git push -u origin master	`


#### Bitbucket
	
* Starting from scratch:
- Setup local and add origin: 
- `mkdir /path/to/your/project`
- `cd /path/to/your/project`
- `git init`
- `git remote add origin https://jtbuss@bitbucket.org/jtbuss/testrepo.git`

* Create first file, commit and push:
- `echo "Jason Buss" >> contributors.txt`
- `git add contributors.txt`
- `git commit -m 'Initial commit with contributors'`
- `git push -u origin master`

* Existing project:
- `cd /path/to/my/repo`
- `git remote add origin https://jtbuss@bitbucket.org/jtbuss/testrepo.git`
- `git push -u origin --all # pushes up the repo and its refs for the first time`
- `git push -u origin --tags # pushes up any tags`
	
- `git remote add origin https://github.com/CustomerFX/SomeProject.git`
- `git push -u origin master`

* Delete remote branch:
- `git push origin --delete <branchName>`

* Add remote tracking:
- `git branch --set-upstream local-branch-name origin/remote-branch-name`

* Remove all unstaged files
- `git checkout -- .`

* Enable longfile support
- `git config --global core.longpaths true`

* Turn off yes/no prompts
- `set GIT_ASK_YESNO=false`

* Force push
- `git push origin master --force`

* Discard untracked files and unstaged changes
- `git clean -df`
- `git checkout -- .`


[home](/jason-notes)<br>
[customerfx](http://www.customerfx.com)<br>