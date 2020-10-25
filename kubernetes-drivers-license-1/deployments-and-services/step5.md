Bestehende Definitionen können mit `kubectl apply` aktualisiert werden. Dies folgt dem Infrastructure As Code Prinzip. Die Definitionen kann man somit in einer Versionsverwaltung hinterlegen um Änderungen der Konfiguration nachvollziehen zu können.
Deploye the aktualisierte YAML Datei mit `kubectl apply -f deployment.yaml`{{execute}}.

Der Zustand des Clusters wird sofort aktualisiert. Das siehst du mit `kubectl get deployment`{{execute}}.

Weitere Pods werden eingeplant um den gewünschten Zustand herzustellen `kubectl get pods`{{execute}}

Da alle Pods den gleichen Label Selektor haben werden sie load balanced hinter dem Service NodePort deployt.

