Kopiere die folgende YAML Definition in den Editor. Sie beschreibt wie die Applikation namens `webapp1` ausgeführt werden soll die das Docker Image `katacoda/docker-http-server` ausführt das auf Port 80 horcht.

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp1
  template:
    metadata:
      labels:
        app: webapp1
    spec:
      containers:
      - name: webapp1
        image: katacoda/docker-http-server:latest
        ports:
        - containerPort: 80
```{{open data-filename="deployment.yaml"}}

Das wird in das Cluster deployed mit dem Befehlt `kubectl create-f deployment.yaml`{{execute}}.

Eine Liste der deployten Objekte kann abgerufen werden mit `kubectl get deploy`{{execute}}

Details können abgerufen werden mit `kubectl describe deployment webapp1`{{execute}}