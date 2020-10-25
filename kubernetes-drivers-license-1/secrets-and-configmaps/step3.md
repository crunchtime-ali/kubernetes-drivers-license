Eine weitere Art `Secrets` einzusetzen ist es diese als `Volume` zu mounten.

Schaue dir die folgende Definition an und übernehme sie in die Datei `webapp-vol.yaml`{{open}}!

<pre class="file" data-filename="webapp-vol.yaml">
apiVersion: v1
kind: Pod
metadata:
  name: webapp-vol
spec:
  volumes:
  - name: secret-volume
    secret:
      secretName: test-secret
  containers:
    - name: test-container
      image: nginx:alpine
      volumeMounts:
          - name: secret-volume
            mountPath: /etc/secret-volume
</pre>

Um ein `Secret` zu mounten definieren wir zuerst ein `Volume` mit einem eigenen Namen, hier `secret-volume` und übergeben den Namen des `Secrets` via `secretName`.

```
volumes:
 - name: secret-volume
   secret:
     secretName: test-secret
```

Bei der Definition des Containers mounten wir das eben erstelle `Volume` in ein bestimmtes Verzeichnis. Die Applikation wird die Key/Value-Paare des `Secret` als Dateien von diesem Pfad lesen. Aus dem Key wird der Dateiname und aus dem Value der Inhalt der Datei.

```
volumeMounts:
 - name: secret-volume
   mountPath: /etc/secret-volume
```

Erstelle den neuen Pod mit `kubectl apply -f secret-vol-pod.yaml`{{execute}}!
Sobald dieser mit dem gemounteten `Secret`  gestartet ist, kannst du dir bspw. die verfügbaren `Secrets` auflisten lassen mit `kubectl exec -it secret-vol-pod -- ls /etc/secret-volume`{{execute}}

Der Inhalt der Datei ist die dekodierte Zeichenkette des `Secrets`. 
Um auf die beiden hier verwendeten Secretes zuzugreifen würde man die folgenden Befehle nutzen 

```
kubectl exec -it webapp-vol -- cat /etc/secret-volume/username; echo
kubectl exec -it webapp-vol -- cat /etc/secret-volume/password; echo
```{{execute}}