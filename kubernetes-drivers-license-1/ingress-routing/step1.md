## Schritt 1 - Deployments erstellen

Um zu beginnen, musst du wieder einen HTTP Server deployen der das Ziel unserer Requests wird.  `deployment.yaml`{{open}} beinhält die drei Deployments `webapp1`, `webapp2` und `webapp3` mit jeweils einem Service.

Du kannst den Inhalt der `deployment.yaml`{{open}} im Editor-Bereich sehen oder dir im Shell Bereich anzeigen lassen mit `cat deployment.yaml`{{execute}}

Deploye die Definitionen mit `kubectl apply -f deployment.yaml`{{execute}}

Beobachte den Status mit `kubectl get deployment`{{execute}} und fahre mit dem nächsten Schritt vor wenn alle Deployments bereit sind.

*Tipp:* Wie du siehst kannst du in eine YAML Datei auch mehrere Kubernetes Ressourcen beschreiben. Diese trennst du jeweils mit `---`