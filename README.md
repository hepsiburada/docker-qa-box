This box includes an automatically running gocd-agent which you can connect it to running gocd-server by providing environment variable

You can run it by ;

$docker run -ti -d -e GO_SERVER=ci.hepsiburada.com hepsi-qa-box

and it will register itself in pending state to the ci server you have provided. Than you can enable and assign to an environment manually.
