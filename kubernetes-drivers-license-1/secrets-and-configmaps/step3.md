Umgebungsvariablen haben den Nachteil, dass sie im Hauptspeicher abgelegt werden und sie dadurch versehentlich geleaked werden können. Es wird stattdessen empfohlen `Secrets` als `Volume` zu mounten.

Schaue dir die Definition an und übernehme sie in die Datei `secret-vol-pod.yaml`{{open}}!

<pre class="file" data-filename="secret-vol-pod.yaml">
apiVersion: v1
kind: Pod
metadata:
  name: secret-vol-pod
spec:
  volumes:
  - name: secret-volume
    secret:
      secretName: test-secret
  containers:
    - name: test-container
      image: alpine:latest
      command: ["sleep", "9999"]
      volumeMounts:
          - name: secret-volume
            mountPath: /etc/secret-volume
</pre>

Um ein `Secret` zu mounten definieren wir zuerst ein `Volume` mit einem eigenen Namen, hier `secret-volume` und übergeben den `secretName`.

```
volumes:
 - name: secret-volume
   secret:
     secretName: test-secret
```

Bei der Definition des Containers mounten wir das eben erstelle `Volume` in ein bestimmtes Verzeichnis. Die Applikation wird die `Secret` Collection als Dateien von diesem Pfad lesen.

```
volumeMounts:
 - name: secret-volume
   mountPath: /etc/secret-volume
```

Erstelle den neuen Pod mit `kubectl apply -f secret-vol-pod.yaml`{{execute}}!
Sobald dieser mit der gemounteten `Secret` Collection gestartet ist, kannst du dir bspw. die verfügbaren `Secrets` auflisten lassen mit `kubectl exec -it secret-vol-pod -- ls /etc/secret-volume`{{execute}}

Der Inhalt der Datei ist die dekodierte Zeichenkette des `Secrets`. 
Um auf die beiden hier verwendeten Secretes zuzugreifen würde man die folgenden Befehle nutzen 

```
kubectl exec -it secret-vol-pod -- cat /etc/secret-volume/username; echo
kubectl exec -it secret-vol-pod -- cat /etc/secret-volume/password; echo
```{{execute}}