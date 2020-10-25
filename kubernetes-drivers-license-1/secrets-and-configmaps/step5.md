### Lösung

Als erstes musst du die Datei `webapp-env.yaml`{{open}} wie folgt ändern um die Referenzen zu der ConfigMap hinzuzufügen:

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
        - name: DATABASE_NAME
          valueFrom:
            configMapKeyRef:
              name: app-config
              key: databaseName
        - name: DATABASE_TYPE
          valueFrom:
            configMapKeyRef:
              name: app-config
              key: databaseType
  restartPolicy: Never
</pre>

Um die Änderungen an der Pod-Beschreibung für `webapp-env` anzuwernden musst du den Pod erst löschen mit `kubectl delete pod webapp-env`{{execute}}. Dann kannst du ihn mit `kubectl apply -f webapp-env.yaml`{{execute}} erneut deployen.

Sobald der Pod bereit ist (`kubectl get pods`{{execute}}) kannst du mit folgendem Befehl überprüfen ob das mounten als Umgebungsvariable erfolgreich war `kubectl exec -it webapp-env -- env | grep DATABASE_; echo`{{execute}}.