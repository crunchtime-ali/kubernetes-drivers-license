Man kann in Kubernetes sämtliche Ressourcen im YAML Format beschreiben. In dieser Übung wollen wir einen Pod mit YAML beschreiben und ausführen. Mit einem Klick auf `pod.yaml`{{open}} öffnest du die leere Datei in dem Editor-Bereich oben.

Die folgende Definition der `pod.yaml` kannst du ebenfalls mit einem Klick in die Datei einfügen. Der Katacoda Editor speichert jede Änderung automatisch.

<pre class="file" data-filename="pod.yaml">
apiVersion: v1
kind: Pod
metadata:
  name: test-pod-2
spec:
  containers:
   - name: test-pod-nginx
     image: nginx:alpine
     ports:
     - containerPort: 8080
     imagePullPolicy: Always
     resources:
       limits:
         cpu: 20
         memory: 200Mi
       requests:
         cpu: 10
         memory: 50Mi
</pre>

Zur Sicherheit kannst du dir den Inhalt der `pod.yaml`{{open}} anzeigen lassen mit `cat pod.yaml`{{execute}}.

Mit `kubectl apply -f pod.yaml`{{execute}} kannst du die YAML Datei zur Verarbeitung an Kubernetes übergeben.

Führe nun wiederholt `kubectl get pods`{{execute}} aus um den Status zu überprüfen. Dieser bleibt bei `Pending`.

### Aufgabe
Versuche mit Hilfe der bereits vorgestellten Befehle die Ursache zu ermitteln. Ändere dann die `pod.yaml`{{open}} entsprechend. **Achtung:** Du musst den Pod löschen (`kubectl delete pod test-pod-2`{{execute}} bevor die YAML-Datei nochmal via `kubectl apply -f pod.yaml`{{execute}} verarbeiten lässt.

*Hinweis:* Die Lösung findest du im nächsten Step.