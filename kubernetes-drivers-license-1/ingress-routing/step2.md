Die YAML Datei `ingress.yaml`{{open}} definiert einen Nginx-basierten Ingress Controller zusammen mit einem Service der den Ingress Controller auf Port 80 für externe Verbindungen verfügbar macht.

Den Inhalt der Datei `ingress.yaml`{{open}} im Editor-Bereich sehen oder dir im Shell-Bereich anzeigen lassen mit `cat ingress.yaml`{{execute}}

Deploye den Ingress Controller wie andere Kubernetes Objekte mit `kubectl apply -f ingress.yaml`{{execute}}

Warte bis das Deployment bereit ist bspw. mit  `watch kubectl get deployment `{{execute}}.
Sobald der `ingress-nginx` und `nginx-default-backend` `Ready` sind, kannst du den `watch` Befehl mit `STRG + C` beenden.