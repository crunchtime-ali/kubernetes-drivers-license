# Schritt 2 - Ingress deployen

Die YAML Datei `ingress.yaml`{{open}} definiert einen Nginx-basierten Ingress Controller zusammen mit einem Service der den Ingress Controller auf Port 80 für externe Verbindungen verfügbar macht.

Darüber hinaus werden in der `ingress.yaml`{{open}} definiert:
- der `Namespace` `nginx-ingress`
- ein `ServiceAccount` für den neuen Namespace
- ein selbst signiertes Zertifikat für SSL Verbindungen in Form eines `Secret`

Den Inhalt der Datei `ingress.yaml`{{open}} im Editor-Bereich sehen oder dir im Shell-Bereich anzeigen lassen mit `cat ingress.yaml`{{execute}}

Deploye den Ingress Controller wie andere Kubernetes Objekte mit `kubectl apply -f ingress.yaml`{{execute}}

Warte bis das Deployment bereit ist. Den Status kannst du kontrollieren mit `kubectl get deployment -n nginx-ingress`{{execute}}