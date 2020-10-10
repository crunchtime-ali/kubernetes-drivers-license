Wir testen ob die die Ingress Regeln den Traffic zu den entsprechenden Service routen indem wir jeweils einen Request hinschicken mit `curl`

Der erste Request wird verarbeitet von dem `webapp1` Deployment.

`curl -H "Host: my.kubernetes.example" 172.17.0.8/webapp1`{{execute}}

Der zweite Request wird verarbeitet von dem `webapp2` Deployment.

`curl -H "Host: my.kubernetes.example" 172.17.0.8/webapp2`{{execute}}

Alle weiteren Request werden verarbeitet von dem `webapp3` Deployment.

`curl -H "Host: my.kubernetes.example" 172.17.0.8`{{execute}}