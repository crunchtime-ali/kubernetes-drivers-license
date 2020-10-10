In diesem Szenario lernst du wie du `Secrets` verwaltest. Mit K8s kannst du `Secrets` erstellen die in einem Pod via Umgebungsvariable oder als `Volume` gemounted werden.

Das ermöglicht es `Secrets` wie Zertifikate oder Passwörter nur von einem bestimmten Personenkreis verwalten zu lassen und verhindert, dass sich diese sensiblen Daten im Klartext in den Deployment Artefakten wiederfinden.