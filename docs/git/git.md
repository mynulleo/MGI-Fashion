# Follow these step for git work-flow

Before you Push to the gitla, always format it with laravel pint.

```bash
./vendor/bin/pint
```

### Cloning

* git clone [csfd-url]
* git checkout -b [your-branch]
* git pull origin dev

### Push

* git add .
* git commit -m "[your-commit-message]"
* git push origin [your-branch]
* then go to the gitlab/[your-repo] then create pull request and merge it to the dev-branch
