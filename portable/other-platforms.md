# Autres plateformes — Guide d'adaptation

> Ce guide couvre : **Poe**, **Microsoft Copilot / Copilot Studio**, **Character.ai**, **Perplexity**, **Mistral Le Chat**, **Hugging Face Chat**, et toute interface avec un champ "system prompt" ou "instructions".

---

## Méthode universelle : le one-shot

Si la plateforme ne propose pas de configuration permanente (ou si tu veux l'utiliser ponctuellement), **utilise le one-shot universel** :

1. Ouvre `one-shot-universal.md`
2. Copie le bloc de code complet (tout ce qui est entre les triple backticks)
3. Colle-le au **début** d'une nouvelle conversation
4. Décris ensuite ton problème

Le conseil s'active pour toute la durée de la conversation.

---

## Plateformes avec system prompt permanent

### Poe (poe.com)
- Crée un bot → champ **"System prompt"**
- Colle le contenu de `chatgpt-gpt-instructions.md` (version anglaise recommandée pour Poe)
- Modèle suggéré : Claude 3.5 Sonnet ou GPT-4o

### Microsoft Copilot Studio
- Dans "Topics" → "System" → **"Conversation Start"**
- Colle le contenu de `chatgpt-gpt-instructions.md`
- Ou utilise le nœud "Generative answers" avec le prompt condensé

### Mistral Le Chat (le.chat)
- Pas de system prompt persistant en mode gratuit
- Utilise le **one-shot universel** au début de chaque conversation

### Perplexity
- Pas de configuration système accessible
- Utilise le **one-shot universel**

### Character.ai
- Création de personnage → champ **"Description"** et **"Personality"**
- Character.ai interprète mieux les instructions en langage naturel
- Utilise le contenu de `gemini-gem-instructions.md` (ton conversationnel)

### Open WebUI / Ollama (local)
- Interface → **"System Prompt"** dans les paramètres du modèle
- Colle le contenu de `chatgpt-gpt-instructions.md`
- Compatible avec tous les modèles locaux (Llama, Mistral, Qwen, etc.)

---

## Checklist d'adaptation pour toute nouvelle plateforme

Si tu rencontres une plateforme non listée ici :

- [ ] La plateforme a-t-elle un champ "system prompt" ou "instructions" ? → utilise `chatgpt-gpt-instructions.md`
- [ ] Les instructions doivent être en langage naturel conversationnel ? → utilise `gemini-gem-instructions.md`
- [ ] Pas de configuration persistante ? → utilise `one-shot-universal.md`
- [ ] La plateforme est en anglais uniquement ? → toutes les versions ont la règle de langue adaptative intégrée
- [ ] Limite de caractères très basse (<500 mots) ? → garde uniquement les sections "LES 5 CONSEILLERS", "FORMAT 3 PHASES" et "RÈGLES" du one-shot

---

## Notes sur la fidélité au format

Les modèles plus petits (GPT-3.5, Mistral 7B, Llama 8B) peuvent avoir du mal à maintenir les séparateurs `──` et `══` et à vraiment différencier les voix des conseillers. Pour de meilleurs résultats, utilise GPT-4o, Claude 3.5+, Gemini 1.5 Pro, ou Mistral Large.
