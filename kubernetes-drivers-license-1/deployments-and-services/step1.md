Das Deployment Objekt ist eines der gebräuchlichsten Kubernetes Objekte. Es definiert die Container Spezifikation, sowie den Namen und die Labels die in anderen Teilen von Kubernetes genutzt werden um sich mit einer Applikation zu verbinden.

Wir erstellen ein Deployment das wiederrum einen Pod erzeugt mit:
`kubectl create deployment mein-deployment --image=katacoda/docker-http-server`{{execute}}

Den Status des Deployments kannst du mit `kubectl get pods`{{execute}} abrufen.

Inspiziere auch das Deployment selbst näher mit `kubectl describe deployment mein-deployment`{{execute}}. 

Sobald der Container läuft, kann er mit verschiedenen Netzwerk Optionen zugänglich gemacht werden. Eine Möglichkeit ist es einen Port-Forward zu erstellen. Dabei wird ein lokaler Port auf einen Port im Deployment gemapped.

`kubectl port-forward deployment/mein-deployment 8080:80`{{execute}}

Da kubectl den Port-Forward im Vordergrund ausführt, musst du ein neues Terminal öffnen mit `+` neben dem Tab-Namen und dann `Open New Terminal`.

In diesem Terminal kannst du dann mit `curl host01:8080`{{execute}} einen Request gegen das Deployment starten.
Der Container den wir über das Deployment gestartet haben, verarbeitet diese Anfrage und antwortet darauf.