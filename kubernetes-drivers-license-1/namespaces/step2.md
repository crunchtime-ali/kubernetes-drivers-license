Du kannst bei vielen `kubectl` Befehlen wie `get`, `describe`, `create` und `delete` mit der `-n <namespace-name>` Option diese in einem spezifischen Namespace ausführen.

Beispiel: `kubectl get all -n default`{{execute}}

Der `get` Befehl besitzt auch eine `--all-namespaces` Option mit der du die jeweilige
Ressource in allen Namespaces anzeigen lassen kannst.

Beispiel: `kubectl get pods -A`{{execute}}