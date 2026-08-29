

while True:
    try:
       quantidade_de_pessoas=int(input("quantas pessoas tem no elevador?"))
       andar_atual=int(input("qual seu andar atual"))
       andar_destino = int(input("qual o andar que voce deseja ir?>"))
       if andar_destino > andar_atual:
           print("subindo...")
           print(f"chegou ao andar {andar_destino}° andar")
       elif andar_destino < andar_atual:
           print("descendo..")
           print(f"chegou ao  {andar_destino}° andar")
       else:
           print("voce ja esta nesse andar.")
       break 

    except ValueError :
     print("numero invalido")
     