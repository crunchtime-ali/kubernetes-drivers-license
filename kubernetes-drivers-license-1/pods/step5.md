### Lösung

Die Fehler bei der Pod-Definition sind die Ports der Liveness- und Readiness Probe. Als `containerPort` wird 80 verwendet wohingegen die beiden Proben versuchen diesen gegen Port 8080 auszuführen.

Lösche den Pod und bearbeite die Datei `pod-readiness.yaml`{{open}}. Anschließend musst du den Pod mit `kubectl apply -f pod-readiness.yaml`{{execute}} erneut ausrollen.

Überprüfe dann den Pod-Status mit `watch kubectl get pods `{{execute}}. Wenn `test-pod-3` den Status `Running` hast du die Aufgabe erfolgreich erledigt.

