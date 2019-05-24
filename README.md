# ghub-pull-request-create
GitHub Action to run [ghub](https://github.com/smehboub/ghub)   

### Usage   
For example, here is a workflow to run `ghub pull-request create --token=<token> --repo=<repo> --title=<title> [--body=<body>] --into=<into> --from=<from>`.   

### Example   
Create a pull request to develop branch after merge to master branch (for hotfix per example)   
```
workflow "Auto report to develop" {
  on = "pull_request"
  resolves = ["ghub-pull-request-create"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "merged true"
}

action "Filters for GitHub Actions-1" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  needs = ["Filters for GitHub Actions"]
  args = "branch hotfix/*"
}

action "on master branch only" {
  uses = "dschep/filter-event-action@master"
  needs = ["Filters for GitHub Actions-1"]
  args = "event.pull_request.base.ref = master"
}

action "ghub-pull-request-create" {
  uses = "smehboub/ghub-pull-request-create@master"
  needs = ["on master branch only"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    GHUB_PR_TITLE = "Pull request from ghub action"
    GHUB_PR_BODY = "Custom body"
    GHUB_PR_INTO = "develop"
  }
}
```

### Required    
#### `GITHUB_TOKEN`   
Add [GITHUB_TOKEN secret](https://developer.github.com/actions/creating-workflows/storing-secrets/#github-token-secret) to make authenticated calls to the GitHub API.   
#### `GITHUB_PR_VARS`   
Add GHUB_PR_INTO for pull request base branch   
### Optional    
#### `GITHUB_PR_VARS`   
Add GHUB_PR_TITLE for pull request title   
Add GHUB_PR_BODY for pull request body   
Add GHUB_PR_FROM for pull request compare branch   
