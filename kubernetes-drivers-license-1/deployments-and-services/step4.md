Mit Deployments kann  u.a. die Anzahl der Replica-Pods gesteuert werden.

Aktualisiere die `deployment.yaml`{{open}} Datei um die Anzahl der Replicas auf 4 anzupassen!
Das sieht dann so aus `replicas: 4`.

Bestehende Definitionen können mit `kubectl apply` aktualisiert werden. Dies folgt dem Infrastructure As Code Prinzip. Die Definitionen kann man somit in einer Versionsverwaltung hinterlegen um Änderungen der Konfiguration nachvollziehen zu können.
Deploye the aktualisierte YAML Datei mit `kubectl apply -f deployment.yaml`{{execute}}.

Der Zustand des Clusters wird sofort aktualisiert. Das siehst du mit `kubectl get deployment`{{execute}}.

Weitere Pods werden eingeplant um den gewünschten Zustand herzustellen `kubectl get pods`{{execute}}

Da alle Pods den gleichen Label Selektor haben werden sie load balanced hinter dem Service deployed.
HTTP Requests an den weitergeleiteten Port 8080 werden in unserem Beispiel jedoch stets von dem selben Container beantwortet weil Port-Forwards direkt die IP eines Containers des Service auflösen.
Probiere mehrfach `curl host01:8080`{{execute}} aus.

*Tipp:* Du kannst die Kubernetes Ressource direkt mit `kubectl edit deployment webapp-1` editieren. Nach dem Speichern (erst `Escape` drücken, dann `:wq` und abschließend `Enter`) werden die Änderungen auf die bestehende Ressourcen angewandt.

*Tipp:* Du kannst Deployments auch über das `kubectl` CLI skalieren mit dem Befehl `kubectl scale deploy webapp1 --replicas=2`{{execute}}.


