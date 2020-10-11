`kubectl` erlaubt sowohl den imperativen Umgang mit der KubeAPI als auch den deklarativen. Man kann sämtliche Ressourcen im YAML Format beschreiben. In dieser Übung wollen wir einen Pod mit YAML beschreiben und ausführen. Mit einem Klick auf `pod.yaml`{{open}} öffnest du die leere Datei in dem Editor-Bereich oben.

Die folgende Definition der `pod.yaml` kannst du ebenfalls mit einem Klick in die Datei einfügen. Der Katacoda Editor speichert jede Änderung automatisch.

<pre class="file" data-filename="pod.yaml">
apiVersion: v1
kind: Pod
metadata:
  name: test-pod-2
spec:
  containers:
   - name: test-pod-nginx
     image: nginx:alpine
     ports:
     - containerPort: 8080
     imagePullPolicy: Always
     resources:
       limits:
         cpu: 20
         memory: 200Mi
       requests:
         cpu: 10
         memory: 50Mi
</pre>

Zur Sicherheit kannst du dir den Inhalt der `pod.yaml`{{open}} anzeigen lassen mit `cat pod.yaml`{{execute}}.

Du kannst diesen Pod nun ausführen mit dem Befehl `kubectl apply -f pod.yaml`{{execute}}.

Führe nun wiederholt `kubectl get pods`{{execute}} aus um den Status zu überprüfen. Dieser bleibt bei `Pending`. 

### Troubleshooting des `Pending` Pods

Die Troubleshooting Tipps vom Anfang dieses Szenarios helfen hier weiter. Sieh dir dafür die mit `kubectl describe pod test-pod-2`{{execute}} die Pod-Events an. Dabei fällt das folgende Event auf:

```
Events:
  Type     Reason            Age                 From               Message
  ----     ------            ----                ----               -------
  Warning  FailedScheduling  34s (x4 over 3m8s)  default-scheduler  0/2 nodes are available: 2 Insufficient cpu.
```

Die Meldung legt nahe, dass nicht genügend CPU Ressourcen zur Verfügung stehen um den `Pod` zu starten. Dafür kontrollieren wir die Pod-Definition in `pod.yaml`{{open}}.
Die `Ressource Quotas` zeigen, dass 20 CPUs angefragt werden. Mit `kubectl describe node controlplane | grep "Allocatable:" -C 6 -B 0`{{execute}} kann man sich anzeigen lassen wie viele Ressourcen pro Cluster-Node allokiert werden können. Pro Node stehen in der Testumgebung nur 2 CPUs zur Verfügung. Da also wesentlich mehr Ressourcen benötigt werden als zur Verfügung stellen, kann der `kube-scheduler` den Pod keiner Cluster-Node zuweisen und somit auch nicht starten.

Reduziere die Anzahl der requested CPU in der `pod.yaml`{{open}} auf `1` und wende die Änderungen mit `kubectl apply -f pod.yaml` an. Die Änderungen an der `pod.yaml`{{open}} werden mit der Definition der bestehenden `Pods` gemerged. Der Pod sollte nun gestartet werden. Kontrollieren sie dies durch wiederholtes ausführen von `kubectl get pods`{{execute}}.