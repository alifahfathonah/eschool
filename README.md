IMPORTANT NOTE

So, I've been able to figure out "the way" around git and it's super awesomely cool. Effective from now, this is our workflow and it's pretty easy:

1. You must comment your commits correctly so everyone else knows what changed. DO NOT USE "qwqewyuwe" or "adbskjdnd" as commit comments please. Thank you.

2. I have limited commit and push access to the master branch for obvious reasons. Git was not designed such that more than 1 person can push changes to the main/final code. This is why there are branches. In fact, you can even create a branch on a branch, and also create another branch on the branch of a branch that is not the master.

For that raeson, I have created a branch called "dev" to be managed by Vanessa; a branch called "lead" to be managed by Edwin, and another one called "test" to be managed by ChuQ. Yelocode will manage the "master" branch which (essentially) is the final source code for scool to be deployed to webserver.

3. To get started. We will follow this really easy steps:

a. I will grant the person with the most up-to-date code access to the master branch so s/he can push it by doing this:
---> $ git commit -am "updating the master branch with the lastest code"
---> $ git push origin master

b. After that is completed:
Vanessa do this
---> $ git checkout dev   //this will switch to the "dev" branch

write anything you want in your version of the code from henceforth. If there's any change you want to get from Edwin, do this:
---> $ git pull origin lead //you can also pull from master; but it may result in merge conflict.

If you want to push the changes you've made to remote repo, do this:
---> $ git commit -am "type your commit message"
---> $ git push origin dev


Edwin do this
---> $ git checkout lead   //this will switch to the "lead" branch

write anything you want in your version of the code from henceforth. If there's any update you want to get from Vanessa, do this:
---> $ git pull origin dev

If you want to push the changes you've made to remote repo, do this:
---> $ git commit -am "type your commit message"
---> $ git push origin lead


ChuQ do this
---> $ git checkout test   //this will switch to the "test" branch
---> $ git pull origin lead //this will pull the latest source code from Edwin.

ChuQ will test the code from Edwin to ensure that everything works fine. Since ChuQ will NOT be writing any code, neither Edwin nor Vanessa is required to pull from the test branch. After testing is successful and there are no bugs, ChuQ will do this:
---> $ git push origin master //this will send the most up-to-date code to master, from where it will be deployed to live server.

If ChuQ ever needs to make changes to the source code, he can. But everyone else downstream must first pull from him before they can push any staged changes.


4. FINALLY, remember to all get the latest update from the person above you in branch before you do "git add" or "git commit -am". The order of branching is:
//when pulling: MASTER ---> TEST ---> LEAD ---> DEV
// when pushing: DEV ---> LEAD ---> TEST ---> MASTER


This is a change made on the dev branch

this is a change on the lead branch