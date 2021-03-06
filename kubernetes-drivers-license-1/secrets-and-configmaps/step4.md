Mit `ConfigMaps` kannst du deine Applikation innerhalb von Kubernetes konfigurierbar machen. Die Erstellung und der Syntax sind sehr ähnlich zu dem von `Secrets`. Bei `ConfigMaps` müssen Werte nicht Base64-kodiert werden.

Der folgende Auszug aus einer Pod-Definition zeigt, dass beim mounten von Umgebungsvariable der Unterschied zwischen `ConfigMaps` und `Secrets` lediglich beim verwendeten Keyword liegt. Bei `Secrets` heißt dies `secretKeyRef` und bei `ConfigMaps` heißt es `configMapKeyRef` 

```
env:
  - name: DATABASE_NAME
    valueFrom:
      secretKeyRef:
        name: test-secret
        key: databasName
  - name: DATABASE_TYPE
    valueFrom:
      configMapKeyRef:
        name: app-config
        key: databaseType
```

### Aufgabe
Erstelle die `ConfigMap` unten als `app-config.yaml`{{open}} und mounte sie in den bereits bestehenden `Pod` `webapp-env` der in der Datei `webapp-env.yaml`{{open}} beschrieben wird.
Den Pod kannst du aktualisieren indem du `kubectl apply -f webapp-env.yaml`{{execute}} ausführst. 
Mounte die folgende `ConfigMap` als Umgebungsvariable. Starte den `Pod` neu um sicherzustellen, dass die neue Konfiguration verwendet wird.

<pre class="file" data-filename="app-config.yaml">
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  databaseType: "postgres"
  databaseName: "test-db"
</pre>

Kontrolliere anschließend mit folgendem Befehl ob das mounten als Umgebungsvariable erfolgreich war `kubectl exec -it webapp-env -- env | grep DATABASE_`{{execute}}.

Das mounten von `ConfigMaps` als Dateien funktioniert sehr ähnlich, wird hier aber aus Zeitgründen nicht demonstriert.