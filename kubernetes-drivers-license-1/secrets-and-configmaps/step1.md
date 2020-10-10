`Secrets` müssen in K8s Base64 kodiert werden.

Über die Kommandozeile erzeugen wir zwei Base64 Zeichenketten und hinterlegen diese als Variablen.

```
username=$(echo -n "admin" | base64)
password=$(echo -n "mein-test-passwort" | base64)
```{{execute}}

In der YAML Definition des `Secrets` unten verwenden wir die soeben definierten Variablen.
Über die Key/Value Collection können wir auf die einzelnen Werte über den Namen des `Secrets` zugreifen, in diesem Fall `test-secret`

Der folgende Befehl leitet die Secret-Definition mit eingesetzten Variablen in die Datei `secret.yaml`{{open}}` um.

```
echo "apiVersion: v1
kind: Secret
metadata:
  name: test-secret
type: Opaque
data:
  username: $username
  password: $password" >> secret.yaml
```{{execute}}

Mit dieser YAML Datei können wir nun die `Secret` Collection erstellen mit `kubectl apply -f secret.yaml`{{execute}}

Mit `kubectl get secrets`{{execute}} bekommst du eine Liste der erstellen `secret` Collections.

Du kannst die Passwörter dekodieren mit den folgenden beiden Befehlen:

```
kubectl get secrets test-secret --template={{.data.username}} | base64 -d; echo
kubectl get secrets test-secret --template={{.data.password}} | base64 -d; echo
```{{execute}}