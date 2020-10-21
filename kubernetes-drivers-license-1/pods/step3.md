### Troubleshooting des `Pending` Pods

Die Troubleshooting Tipps vom Anfang dieses Szenarios helfen weiter um das Problem des `pending` Pods zu lösen. Sieh dir dafür die mit `kubectl describe pod test-pod-2`{{execute}} die Pod-Events an. Dabei fällt das folgende Event auf:

```
Events:
  Type     Reason            Age                 From               Message
  ----     ------            ----                ----               -------
  Warning  FailedScheduling  34s (x4 over 3m8s)  default-scheduler  0/2 nodes are available: 2 Insufficient cpu.
```

Die Meldung legt nahe, dass nicht genügend CPU Ressourcen zur Verfügung stehen um den `Pod` zu starten. Dafür kontrollieren wir die Pod-Definition in `pod.yaml`{{open}}.
Die `Ressource Quotas` zeigen, dass 20 CPUs angefragt werden. Mit `kubectl get node controlplane -o jsonpath="{.status.allocatable}"`{{execute}} kann man sich anzeigen lassen wie viele Ressourcen pro Cluster-Node allokiert werden können. Pro Node stehen in der Testumgebung nur 2 CPUs zur Verfügung. Da also wesentlich mehr Ressourcen benötigt werden als zur Verfügung stellen, kann der `kube-scheduler` den Pod keiner Cluster-Node zuweisen und somit auch nicht starten.

### Lösung

Reduziere die Anzahl der requested CPU in der `pod.yaml`{{open}} auf `1`, lösche den Pod mit `kubectl delete pod test-pod-2`{{execute}} und erstelle den Pod neu mit `kubectl apply -f pod.yaml`{{execute}}. Der Pod sollte nun gestartet werden. Kontrolliere dies durch wiederholtes ausführen von `kubectl get pods`{{execute}}.