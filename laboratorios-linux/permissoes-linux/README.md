## Laboratório de Permissões Especiais no Linux (SGID e Sticky Bit)

Laboratório sobre permissões especiais em diretórios compartilhados: SGID para herança automática de grupo e Sticky Bit para controle de exclusão de arquivos entre usuários do mesmo grupo.

---

## Cenário

Um diretório é compartilhado entre usuários que pertencem ao mesmo grupo (`equipe`). O objetivo é garantir que todo arquivo criado dentro dele herde automaticamente o grupo do diretório, sem depender de `chgrp` manual após cada criação, e impedir que um usuário apague arquivos de outro mesmo tendo permissão de escrita compartilhada.

---

## Ambiente

- Distribuição: Debian (VM local, VirtualBox)
- Usuários de teste: `joao`, `jose`
- Grupo de teste: `equipe`

---

## Preparação

Criação do grupo e dos usuários de teste, com adição de ambos ao grupo `equipe`:

```bash
sudo groupadd equipe
sudo useradd joao
sudo useradd jose
sudo usermod -aG equipe joao
sudo usermod -aG equipe jose
```

Confirmação de que os usuários pertencem ao grupo:

```bash
groups joao
# joao : joao equipe

groups jose
# jose : jose equipe
```

Criação do diretório compartilhado, ajuste do grupo dono e aplicação da permissão base:

```bash
mkdir /home/compartilhado
chown root:equipe /home/compartilhado
chmod 770 /home/compartilhado
```
