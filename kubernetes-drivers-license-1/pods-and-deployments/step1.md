Wir erstellen ein Deployment das wiederrum einen Pod erzeugt mit:
`kubectl create deployment mein-deployment --image=katacoda/docker-http-server`{{execute}}

Den Status des Deployments kannst du mit `kubectl get pods`{{execute}} abrufen.

Inspiziere auch das Deployment selbst näher mit `kubectl describe deployment mein-deployment`{{execute}}. 

Sobald der Container läuft, kann er mit verschiedenen Netzwerk Optionen zugänglich gemacht werden. Eine Möglichkeit ist `NodePort`. Dabei wird dem Container dynamisch ein Port zugewiesen.

`kubectl expose deployment mein-deployment --port=80 --type=NodePort`

Die Kommandos unten finden den zugewiesenen Port und führen einen HTTP Request mit `curl` durch

```
export PORT=$(kubectl get svc mein-deployment -o go-template='{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')
echo "Accessing host01:$PORT"
curl host01:$PORT
```{{execute}}

Der Container den wir über das Deployment gestartet haben, verarbeitet diese Anfrage und antwortet darauf.