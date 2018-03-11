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
```
1. Create Central repository in repository folder (local version of origin)
- `$ git init --bare <repositoryName>`

2. Create Local repository
- `$ git init <repositoryname>`
- `$ git clone <centralrepositorypath>` _(Clone from central repo)_
```

### Branch management:
```
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
```
#### While working:
```
9.	Add Files to Local Repository (This also needs to be done after modifying a script)
	Use git add to track file
- `git add <filename> | git add .`
```

#### When done:

10. Commit Changes (after adding files)
```
git commit (Will be presented with text editor for comments)
git commit -m "Enter comments here" (Add comments manually)
```

#### Examples

11.	Adding a central repo as origin for the local project
```
git init
git add README.md
git commit -m "first commit"
git remote add origin <Central Repo Path>
git push -u origin master
```

12.	Pulling changes from central repository
```git pull origin <branchname>
```

### Master/Development model commands:

* Creating a feature branch:
```git checkout -b feature-<Feature Name> developmen
```

* Merging feature to develop:
```git checkout development
git merge --no-ff Feature-<Feature Name>
git branch -d Feature-<Feature Name>
git push origin develop (If there is a central repo)
```

I dunno what

```
echo "# test" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/JasonBuss/test.git
git push -u origin master
```

#### Bitbucket

* Starting from scratch:
- Setup local and add origin:
-
```
mkdir /path/to/your/project
cd /path/to/your/project
git init
git remote add origin https://jtbuss@bitbucket.org/jtbuss/testrepo.git
```

* Create first file, commit and push:
```
echo "Jason Buss" >> contributors.txt
git add contributors.txt
git commit -m 'Initial commit with contributors'
git push -u origin master
```

* Existing project:
```
cd /path/to/my/repo
git remote add origin https://jtbuss@bitbucket.org/jtbuss/testrepo.git
git push -u origin --all # pushes up the repo and its refs for the first time
git push -u origin --tags # pushes up any tags

git remote add origin https://github.com/CustomerFX/SomeProject.git
git push -u origin master
```

* Delete remote branch:
```git push origin --delete <branchName>
```

* Add remote tracking:
```git branch --set-upstream local-branch-name origin/remote-branch-name
```

* Remove all unstaged files
```git checkout -- .
```

* Enable longfile support
```git config --global core.longpaths true
```

* Turn off yes/no prompts
```set GIT_ASK_YESNO=false
```

* Force push
```git push origin master --force
```

* Discard untracked files and unstaged changes
```
git clean -df
git checkout -- .
```

* start the ssh-agent in the background
```
eval $(ssh-agent -s)

ssh-add ~/.ssh/id_rsa
```

* Generating a new SSH key
```
Open Git Bash.

Paste the text below, substituting in your GitHub email address.

ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
This creates a new ssh key, using the provided email as a label.

Generating public/private rsa key pair.
When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.

 Enter a file in which to save the key (/c/Users/you/.ssh/id_rsa):[Press enter]
At the prompt, type a secure passphrase. For more information, see "Working with SSH key passphrases".
Enter passphrase (empty for no passphrase): [Type a passphrase]
Enter same passphrase again: [Type passphrase again]

Adding or changing a passphrase
You can change the passphrase for an existing private key without regenerating the keypair by typing the following command:

ssh-keygen -p
# Start the SSH key creation process
Enter file in which the key is (/Users/you/.ssh/id_rsa): [Hit enter]
Key has comment '/Users/you/.ssh/id_rsa'
Enter new passphrase (empty for no passphrase): [Type new passphrase]
Enter same passphrase again: [One more time for luck]
Your identification has been saved with the new passphrase.
```


* Auto-launching ssh-agent on Git for Windows
```
If you're using Git Shell that's installed with GitHub Desktop, you don't need to follow these steps. GitHub Desktop automatically launches ssh-agent for you.

Otherwise, follow these steps to run ssh-agent automatically when you open bash or Git shell. Copy the following lines and paste them into your ~/.profile or ~/.bashrc file in Git shell:

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env
```
[home](/jason-notes)<br>
