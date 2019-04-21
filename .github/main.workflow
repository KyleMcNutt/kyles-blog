workflow "New workflow" {
  on = "push"
  resolves = ["Build And Deploy"]
}

action "Install deps" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "Build And Deploy" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "run deploy"
  needs = ["Install deps"]
}
