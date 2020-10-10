`kubectl` erlaubt sowohl den imperativen Umgang mit der KubeAPI als auch den deklarativen. Man kann sämtliche Ressourcen im YAML Format beschreiben. In dieser Übung wollen wir einen Pod mit YAML beschreiben und ausführen. Mit einem Klick auf `pod.yaml`{{open}} öffnest du die leere Datei in dem Editor-Bereich oben.

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
       containerPort: 8080
     imagePullPolicy: Always
     resources:
       limits:
         cpu: 100m
         memory: 200Mi
       requests:
         cpu: 20
         memory: 50Mi
</pre>

Zur Sicherheit kannst du dir den Inhalt der `pod.yaml`{{open}} anzeigen lassen mit `cat pod.yaml`{{execute}}.

Du kannst diesen Pod nun ausführen mit dem Befehl `kubectl apply -f pod.yaml`{{execute}}.

Führe nun wiederholt `kubectl get pods` aus!
