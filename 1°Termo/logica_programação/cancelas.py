Projeto 1:
# Projeto: Precisamos de um algoritmo para gerenciamento de cancelas para um shopping.
# Toda entrada e saída irá ser sinalizada
# Valores para entrada e permanência do veículo deverá ser pergutado
# As entrada deverão ser registradas por placa.
#
# Passo 1:  
# Perguntar informações sobre o veiculo ou forma acesso
# Pressionar o botao para emitir ticket
# Verificar se possui TAG para acesso liberado
# Se possuir erros informar ao usuário

# Passo 2:
# Verificar tempo de permanência
# Valor a ser cobrado

# Passo 3:
# Saída como será?
# Calcular tempo de permanência
# Se for TAG gerar na fatura da TAG
# Pagar ticket
# Devolver ticket na saída

# Passo 4:
# Gerar relatório de entradas e saídas
# Tratamento de Erros
# Revisão do código

print("Bem-vindo ao sistema de gerenciamento de cancelas do shopping!")
veiculo = input("Digite a placa do veículo: ")
forma_acesso = input("Digite a forma de acesso (ticket/tag): ").lower()
if forma_acesso == "ticket":
    print("Botão para emitir ticket pressionado.")
    # Lógica para emitir ticket aqui
elif forma_acesso == "tag":
    print("Verificando TAG para acesso liberado.")
    # Lógica para verificar TAG aqui
    # Se houver erros, informar ao usuário
    # Lógica para informar erros aqui
    # Lógica para calcular tempo de permanência e valor a ser cobrado aqui
    # Lógica para saída do veículo aqui
    # Lógica para gerar relatório de entradas e saídas aqui
    # Lógica para tratamento de erros aqui
else:
    print("Forma de acesso inválida. Por favor, digite 'ticket' ou 'tag'.")


        
