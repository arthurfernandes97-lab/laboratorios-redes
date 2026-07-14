#!/bin/bash
# Criando ferramenta de administração de sistemas

opcao="x"

# Loop de repetição
while [ "$opcao" != "0" ]; do

    echo "=============================================="
    echo "                 Menu Admin                   "
    echo "=============================================="
    echo
    echo "[1] - Informações do Sistema"
    echo "[2] - Uso de disco"
    echo "[3] - Memória"
    echo "[4] - Backup"
    echo "[5] - Logs"
    echo "[0] - Sair"
    echo

    # Escolha do usuário
    read -p "Escolha uma opção: " opcao

    echo
    echo "----------------------------------------------"

    # Informações do sistema
    if [ "$opcao" = "1" ]; then
        echo "Informações do sistema:"
        echo
        echo "Hostname:"
        hostname

        echo
        echo "Usuário:"
        whoami

        echo
        echo "Kernel:"
        uname -r
        echo

    # Uso de disco
    elif [ "$opcao" = "2" ]; then
        echo "Espaço livre e ocupado dos discos:"
        echo
        df -h
        echo

    # Memória
    elif [ "$opcao" = "3" ]; then
        echo "Uso da memória RAM e memória swap:"
        echo
        free -h
        echo

    # Backup
    elif [ "$opcao" = "4" ]; then
        echo "Backup do diretório home:"
        echo

        mkdir -p ~/backups

        tar -czf ~/backups/backup-$(date +%Y%m%d-%H%M%S).tar.gz -C /home arthur

        echo "Backup criado em ~/backups/"
        ls -lh ~/backups
        echo

    # Logs
    elif [ "$opcao" = "5" ]; then
        echo "Últimas 20 linhas de logs do sistema:"
        echo
        journalctl -n 20
        echo

    # Sair
    elif [ "$opcao" = "0" ]; then
        exit

    # Opção inválida
    else
        echo
        echo "Opção inválida!"
        echo
    fi

done
