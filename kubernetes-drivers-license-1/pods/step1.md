Am einfachsten kannst du einen Pod erstellen mit dem `kubectl run` Befehl.
Führe `kubectl run test-pod --image=nginx:alpine`{{execute}} aus!

Wiederhole `kubectl get pods`{{execute}} bis der Container den Status `Running` hat.

*Hinweis:* In diesem Szenario haben die Begriffe `Pod` und `Container` der Einfachheit halber die gleiche Bedeutung. In der Praxis kann ein `Pod` aus mehreren `Containern` bestehen die sich eine IP-Adresse teilen. Dies ist jedoch außerhalb des Scopes dieser Veranstaltung.

### Troubleshooting

`kubectl describe pod test-pod`{{execute}} liefert dir die wichtigsten Informationen zu einem `Pod`. Besonders die Event-Tabelle am Ende der Ausgabe ist oft der erste Anlaufpunkt um herauszufinden warum ein `Pod` nicht wie erwartet funktioniert.
In diesem Fall sollte diese Tabelle in etwa so aussehen:

```
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  12m   default-scheduler  Successfully assigned default/test-pod to node01
  Normal  Pulling    12m   kubelet, node01    Pulling image "nginx:alpine"
  Normal  Pulled     12m   kubelet, node01    Successfully pulled image "nginx:alpine"
  Normal  Created    12m   kubelet, node01    Created container test-pod
  Normal  Started    12m   kubelet, node01    Started container test-pod
```

### Pod Logs

Die Logs des Pods kannst du mit `kubectl logs test-pod`{{execute}} ausgeben lassen. Mit der `-f` Option kannst du dem Log kontinuierlich folgen.

### Befehle in einem Pod ausführen

Du kannst Befehle in einem Pod ausführen mit `kubectl exec test-pod -- cat /etc/nginx/nginx.conf`{{execute}}. Hier lassen wir uns eine Konfigurationsdatei ausgeben.

Zur Fehlersuche ist es oft hilfreich sich interaktiv mit einem Container zu verbinden. Dies kannst du mit den `-it` Optionen machen und unter Angabe einer Shell als Kommando (z.B. `bash`). Bei dem gestarteten `Pod` handelt es sich um ein `Alpine` Image. Hier steht nicht `bash` zur Verfügung sondern lediglich `sh` und `ash`.
Führe `kubectl exec -it test-pod -- ash`{{execute}} aus und führe einige Befehle in dem `Pod` aus. Wenn du bereit bist weiter zu machen, drücke bitte `STRG + d` um die interaktive Session zu trennen.

### Einen Pod beenden

Du kannst den `Pod` beenden indem du ihn mit `kubectl delete pod test-pod`{{execute}} einfach löschst.


