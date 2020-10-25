### Lösung

Die Fehler bei der Pod-Definition sind die Ports der Liveness- und Readiness Probe. Als `containerPort` wird 80 verwendet wohingegen die beiden Proben versuchen diesen gegen Port 8080 auszuführen.

Editiere die Pod-Definition direkt mit `kubectl edit pod test-pod-3`. Nach dem Speichern (erst `Escape` drücken, dann `:wq` und abschließend `Enter`) werden die Änderungen der auf den bestehenden Pod durchgeführt.

Überprüfe dann den Pod-Status mit `watch kubectl get pods `{{execute}}. Wenn `test-pod-3` den Status `Running` hast du die Aufgabe erfolgreich erledigt.

