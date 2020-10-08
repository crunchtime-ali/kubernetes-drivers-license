`kind` ist bereits installiert.
Das kannst du überprüfen indem du `kind --version`{{execute}} aufrufst.

Das eigentliche Kubernetes Cluster erzeugst du mit `kind create cluster`{{execute}}

Lasst uns `kubectl` konfigurieren damit es mit dem eben erstellten Cluster interagieren kann!

`kubectl cluster-info --context kind-kind`{{execute}}
 
Jetzt überprüfen wir den Status der Cluster Nodes:
`kubectl get nodes`{execute}

Super! In ca. 1 Minute sollte der Node Status von `NotReady` auf `Ready` springen.

Wie sieht das in Docker aus?

`docker ps`{execute}

Super! Wir haben ein lauffähiges Kubernetes Cluster.