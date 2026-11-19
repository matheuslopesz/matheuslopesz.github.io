---
title: Assinar
icon: fas fa-envelope-open-text
order: 5
---

Quer saber quando sai post novo? Escolha o jeito que preferir.

{% if site.newsletter.buttondown %}
## Por e-mail

Receba cada post novo direto na sua caixa de entrada. Sem spam, e dá pra cancelar quando quiser.

<form
  action="https://buttondown.com/api/emails/embed-subscribe/{{ site.newsletter.buttondown }}"
  method="post"
  target="popupwindow"
  class="subscribe-form d-flex flex-wrap gap-2 my-3"
>
  <label for="bd-email" class="visually-hidden">Seu e-mail</label>
  <input type="email" name="email" id="bd-email" class="form-control" style="max-width: 22rem" placeholder="seu@email.com" required>
  <input type="hidden" value="1" name="embed">
  <button type="submit" class="btn btn-primary">Assinar</button>
</form>
{% endif %}

## Por RSS

Se você usa um leitor de RSS (Feedly, Inoreader, NetNewsWire…), adicione este endereço:

```text
{{ '/feed.xml' | absolute_url }}
```

[Abrir o feed RSS]({{ '/feed.xml' | relative_url }})
