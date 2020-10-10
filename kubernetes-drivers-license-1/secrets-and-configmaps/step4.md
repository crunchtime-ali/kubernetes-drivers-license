Mit `ConfigMaps` kannst du deine Applikation innerhalb von Kubernetes konfigurierbar machen. Die Erstellung und der Syntax sind sehr ähnlich zu dem von `Secrets`. Bei `ConfigMaps` müssen Werte nicht Base64-kodiert werden.

Der folgende Auszug aus einer Pod-Definition zeigt, dass beim mounten von Umgebungsvariable der Unterschied zwischen `ConfigMaps` und `Secrets` lediglich beim verwendeten Keyword liegt. Bei `Secrets` heißt dies `secretKeyRef` und bei `ConfigMaps` heißt es `configMapKeyRef` 

```
- name: SECRET_USERNAME
  valueFrom:
    secretKeyRef:
      name: test-secret
      key: username
- name: CONFIG_DATABASE_TYPE
  valueFrom:
    configMapKeyRef:
      name: configmap-pod
      key: databaseType
```

## Aufgabe:
Erstelle die `ConfigMap` unten als `configmap-pod.yaml`{{open}} und mounte sie in den bereits bestehenden `Pod` `secret-env-pod` der in der Datei `secret-env-pod.yaml`{{open}} beschrieben wird.
Den Pod kannst du aktualisieren indem du `kubectl apply -f secret-env-pod.yaml`{{execute}} ausführst. Kubernetes terminiert den aktuellen `Pod` und erstellt einen Neuen bei Änderungen der Konfiguration.
Mounte die folgende `ConfigMap` als Umgebungsvariable.

<pre class="file" data-filename="configmap-pod.yaml">
apiVersion: v1
kind: ConfigMap
metadata:
  name: configmap-pod
data:
  databaseType: "postgres"
  databaseName: "test-db"
</pre>

Kontrolliere anschließend mit folgendem Befehl ob das mounten als Umgebungsvariable erfolgreich war `kubectl exec -it secret-env-pod -- env | grep CONFIG_; echo`{{execute}}.

Das mounten von `ConfigMaps` als Dateien funktioniert sehr ähnlich, wird hier aber aus Zeitgründen nicht demonstriert.