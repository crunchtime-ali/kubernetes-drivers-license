`Ingress` Regeln sind eine eigene Ressource in Kubernetes. Die Regeln können auf einem Hostnamen (Domainnamen), dem Pfad an den der Request geschickt wird oder eine Kombination aus beiden bestehen.

Kopieren Sie die folgenden Regeln in die Datei `ingress-rules.yaml`{{open}}!

<pre class="file" data-filename="ingress-rules.yaml">
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: webapp-ingress
spec:
  rules:
  - host: my.kubernetes.example
    http:
      paths:
      - path: /webapp1
        backend:
          serviceName: webapp1-svc
          servicePort: 80
      - path: /webapp2
        backend:
          serviceName: webapp2-svc
          servicePort: 80
      - backend:
          serviceName: webapp3-svc
          servicePort: 80
</pre>

Die Regeln werden auf Requests für den Host `my.kubernetes.example` angewandet.
Requests zum Pfad `/webapp1` werden an den Service `webapp1-svc` weitergeleitet. Analog dazu werden Requests zu `/webapp2` zu `webapp2-svc`weitergeleitet.
Die dritte Regel ist eine `Catch-All` Route die Requests auf die keine der bisherigen Regeln angewandt werden konnte nach `webapp3-svc` weiterleitet.

Damit wird veranschaulicht wie die URL Struktur einer Applikation unabhängig von den unterliegenden Services konfiguriert werden kann.

Deployen Sie die gespeicherte Datei mit `kubectl apply -f ingress-rules.yaml`{{execute}}
Den Status der Ingress Regeln wird abgerufen mit `kubectl get ing`{{execute}}.