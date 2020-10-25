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
      - path: /admin
        backend:
          serviceName: webapp-admin
          servicePort: 80
      - backend:
          serviceName: webapp-customer
          servicePort: 80
</pre>

Die Regeln werden auf Requests für den Host `my.kubernetes.example` angewandet.
Requests zum Pfad `/admin` werden an den Service `webapp-admin` weitergeleitet. 
Die zweite Regel ist eine `Catch-All` Route die Requests auf die keine der bisherigen Regeln angewandt werden konnte nach `webapp-customer` weiterleitet.

Damit wird veranschaulicht wie die URL Struktur einer Applikation unabhängig von den unterliegenden Services konfiguriert werden kann.

Deploye die gespeicherte Datei mit `kubectl apply -f ingress-rules.yaml`{{execute}}
Informationen zu den Ingress-Regeln bekommst du mit `kubectl get ing`{{execute}}.