Mit Services kontrolliert man wie Anwendungen miteinander kommunizieren. Damit kann man einen oder mehrere Pods über das Netzwerk bereitstellen.

Kopiere die folgende Service Definition in den Editor. Der Service wählt alle Applicationen aus mit dem Label `webapp1`. Beim deployen von mehreren Replicas werden diese automatisch load balanced basierend auf dem gemeinsamen Label. Der Service macht die Applikation über einen `NodePort` verfügbar.

<pre class="file" data-filename="service.yaml">
apiVersion: v1
kind: Service
metadata:
  name: webapp1-svc
  labels:
    app: webapp1
spec:
  type: ClusterIP
  ports:
  - port: 80
  selector:
    app: webapp1
</pre>

Deploye den Service mit `kubectl create -f service.yaml`{{execute}}

Rufe wie zuvor Details zu allen Service Objekten im aktuellen Namespace auf mit `kubectl get svc -o wide`{{execute}}. Mit der `-o wide` Option bekommst du bei `get` Befehlen zusätzliche Informationen zu den Objekten.

Genaue Informationen zu einem einzelnen Service-Objekt kannst du mit `kubectl describe svc webapp1-svc`{{execute}} bekommen.

Beende den Port-Forward im ersten Tab indem du `STRG + C` gleichzeitig drückst und erstelle einen neuen Port-Forward gegen den soeben erstellten Service mit `kubectl port-forward service/webapp1-svc 8080:80`{{execute}}.

Führe in dem anderen Tab einen HTTP Request gegen den Service aus mit `curl host01:8080`{{execute}}.