Die erstelle `Secret` Collection soll nun in einem Pod genutzt werden.

Die folgenden Pod-Definition enthält zwei Umgebungsvariablen die mit dem Inhalt des eben erstellten `Secrets` befüllt werden. Schaue dir die Definition an und übernehme sie in die Datei `secret-env-pod.yaml`{{open}}

<pre class="file" data-filename="secret-env-pod.yaml">
apiVersion: v1
kind: Pod
metadata:
  name: secret-env-pod
spec:
  containers:
    - name: mycontainer
      image: alpine:latest
      command: ["sleep", "9999"]
      env:
        - name: SECRET_USERNAME
          valueFrom:
            secretKeyRef:
              name: test-secret
              key: username
        - name: SECRET_PASSWORD
          valueFrom:
            secretKeyRef:
              name: test-secret
              key: password
  restartPolicy: Never
</pre>

Innerhalb des Pods werden die Secrets als `SECRET_USERNAME` und `SECRET_PASSWORD` verfügbar sein. Hier nochmal die Strukur eines solchen Eintrags:

```
- name: SECRET_USERNAME
valueFrom:
 secretKeyRef:
   name: test-secret
   key: username
```

Starte den Pod mit `kubectl apply -f secret-env-pod.yaml`{{execute}}!
Sobald der Pod gestartet ist, kannst du dir die beiden Umgebungsvariablen ansehen mit `kubectl exec -it secret-env-pod -- env | grep SECRET_; echo`{{execute}}

Hier dekodiert Kubernetes die base64 Zeichenketten automatisch wenn sie in die Umgebungsvariablen übertragen werden. Es sollte die ursprüngliche Benutzername/Passwort Kombination angeueogt werden. Diese Variablen können jetzt für API-Zugriffe, Datenbanken o.Ä. genutzt werden.