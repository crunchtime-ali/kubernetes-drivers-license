Das `kubelet` benutzt Liveness-Proben um kontinuierlich zu überprüfen ob ein `Pod` neu gestartet werden muss. Darüber hinaus wird mit Readiness-Proben überprüft ob ein `Pod` bereit ist Traffic zu empfangen.

Diese Proben können bspw. HTTP Requests sein die einen HTTP Status Code `200` liefern müssen:

```
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
```

Es kann aber auch ein Befehl im `Pod` ausgeführt werden der einen Return-Code von 0 zurückliefern muss:

```
livenessProbe:
  exec:
    command:
    - cat
    - /tmp/healthy
```

Mit den folgenden Properties kann man das Verhalten genauer konfigurieren:
- `periodSeconds` Anzahl der Sekunden die zwischen jeder Probe gewartet wird (Default: 10 Sekunden)
- `initialDelaySecond` Anzahl der Sekunden die gewartet wird bis die Probe zum ersten Mal ausgeführt wird (Default: 1 Sekunde)
- `timeoutSeconds` Anzahl der Sekunden nachdem die Probe einen Timeout meldet (Default: 1 Sekunde)
- `failureTreshold` Anzahl der weiteren Proben (Default: 3) die nach einer fehlgeschlagenen Probe ausgeführt werden bis bei ...
  - a) ... Liveness-Proben der Pod neugestartet wird
  - b) ... Readiness-Proben der Status als `Unready` markiert wird

Speichere und deploye die folgende `Pod` Definition als `pod-readiness.yaml{{open}}`.

<pre class="file" data-filename="pod-readiness.yaml">
# Hier kommt die YAML Beschreibung eines Pods rein
apiVersion: v1
kind: Pod
metadata:
  name: test-pod-3
spec:
  containers:
  - name: test-pod-nginx
    image: nginx:alpine
    ports:
      - containerPort: 80
    livenessProbe:
      httpGet:
        path: /
        port: 8080
      initialDelaySeconds: 5
      periodSeconds: 3
      failureThreshold: 2
    readinessProbe:
      httpGet:
        path: /
        port: 8080
      initialDelaySeconds: 3
      periodSeconds: 3
</pre>

Überprüfe nach dem deployen den Status des `Pods`. Hilfreich ist hierbei der `watch` Befehl mit dem du kontinuierlich einen Bash-Befehl wiederholen kannst. `watch kubectl get pods `{{execute}}.
Nach zwei fehlgeschlagenenen Neustarts und Liveness-Proben hat der Pod den Status `CrashLoopBackOff`.
Beende den `watch` Befehl mit `STRG + C`.

### Aufgaben

Korrigiere die beiden Fehler die sich bei dieser Pod-Definition eingeschlichen haben und stelle sicher, dass der Pod `Ready` und `Running` ist.

*Tipp:* Schaue dir mal die Ports der Liveness- und Readiness-Probe an.

Du kannst die Kubernetes Ressource direkt mit `kubectl edit pod test-pod-3` editieren. Nach dem Speichern (erst `Escape` drücken, dann `:wq` und abschließend `Enter`) werden die Änderungen der auf den bestehenden Pod durchgeführt.

