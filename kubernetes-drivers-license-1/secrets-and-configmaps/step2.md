Das erstelle `Secret` soll nun in einem Pod genutzt werden.

Die folgenden Pod-Definition enthält zwei Umgebungsvariablen die mit dem Inhalt des eben erstellten `Secrets` befüllt werden. Schaue dir die Definition an und übernehme sie in die Datei `webapp-env.yaml`{{open}}

<pre class="file" data-filename="webapp-env.yaml">
apiVersion: v1
kind: Pod
metadata:
  name: webapp-env
spec:
  containers:
    - name: mycontainer
      image: nginx:alpine
      env:
        - name: DATABASE_USERNAME
          valueFrom:
            secretKeyRef:
              name: test-secret
              key: username
        - name: DATABASE_PASSWORD
          valueFrom:
            secretKeyRef:
              name: test-secret
              key: password
  restartPolicy: Never
</pre>

Innerhalb des Pods werden die Secrets als Umgebungsvariablen `DATABASE_USERNAME` und `DATABASE_PASSWORD` verfügbar sein.

Starte den Pod mit `kubectl apply -f webapp-env.yaml`{{execute}}!
Sobald der Pod gestartet ist, kannst du dir die beiden Umgebungsvariablen ansehen mit `kubectl exec -it webapp-env -- env | grep DATABASE_; echo`{{execute}}

Hier dekodiert Kubernetes die base64 Zeichenketten automatisch wenn sie in die Umgebungsvariablen übertragen werden. Es sollte die ursprüngliche Benutzername/Passwort Kombination angezeigt werden. Diese Variablen können jetzt für Datenbank-Zugriffe o.Ä. genutzt werden.