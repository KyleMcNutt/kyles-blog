workflow "Master branch workflow" {
  on = "push"
  resolves = ["Deploy to gh-pages"]
}

action "master branch only" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Deploy to gh-pages" {
  uses = "JamesIves/github-pages-deploy-action@master"
  env = {
    BRANCH = "gh-pages"
    BUILD_SCRIPT = "npm install && npm run-script build"
    FOLDER = "dist"
  }
  secrets = ["ACCESS_TOKEN"]
  needs = ["master branch only"]
}
