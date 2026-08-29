#Exercícios de Programação Python: "O Caça-Erros"
 #1. O Problema da Idade
# Erro
# idade = input("Digite sua idade:")
# if idade >= 18:
#     print("Você é maior de idade")

# #Corrigido
# idade = int(input("Digite sua idade"))
# if idade >= 18:
#     print("Você é maior de idade")

# #Melhorado
# idade = int(input("Digite sua idade:"))
# if idade >= 18:
#     print("Você é maior de idade")
# else:
#     print("Você é menor de idade")

#2. A Escrita Fiel
#nome = "Mariana"
#print("Seja bem-vinda, nome!")
 
#nome = "mariana"
#print(f"seja bem vinda",nome)

#nome=input("digite seu nome")
#print(f"bem vinda/o {nome}")

#3. Falta de Espaço
#numero = 10
#if numero > 5:
#print("O número é maior que cinco.")
#else:
#print("O número é menor ou igual a cinco.")

#numero = 10
#if numero >= 5:
   #print("numero maior que cinco.")
#else:
   # print("numero menor ou igual a cinco.")

#numero=10
#if numero >= 5 :
   #print("numero maior que cinco")


#4. Esquecimento Fata
#usuario = "aluno123"
#if usuario == "aluno123"
#print("Login realizado com sucesso.")
#corrigido
#usuario = "aluno123"
#i#f usuario: 
    #print("Login realizado com sucesso.")
#melhorado
#melhorado
#usuario=input("digite seu usuario")
#if usuario == "aluno123":
   #print("login realizado com sucesso")
#else:
   # print("erro ao fazer login")

#5. Atribuição vs. Comparação
#clima = "ensolarado"
#if clima = "chuvoso":
#print("Leve um guarda-chuva!")
#corrigido
#clima ="ensolarado"
#if clima =="chuvoso":
    #print("leva um guarda-chuva")
#melhorado
# clima=input("qual o clima?")
# if clima =="chuvoso":
#     print("leve um guarda chuva")
# elif clima == "ensolarado":
#     print("aproveite o dia")

#6 print("Parabéns! Você fez " + pontos + " pontos.")

#corrigido
#pontos=50+50
#print("voce fez "+ pontos "pontos.")

#melhorado

#pontos=50+50
#print(f"voce fez {pontos}pontos")



#7. A Ordem dos Fatores
#O sistema deve dar "Excelente" para notas 9 ou 10.
#nota = 9.5
#if nota >= 7:
#print("Aprovado")
#elif nota >= 9:
#print("Excelente!")
#corrigido
 
#nota=float(input("digite sua nota"))
#if nota >=9:
  #  print("exelente")
#elif nota >=7:
  #  print("aprovado")
#melhorado

#nota=int(input("digite sua nota"))

#if nota >= 5:
    #print ("boa")

#elif nota >=9:
   #print("excelente")

#else:
 #   print("reprovado")

#8. O Contador de 1 a 5
#Objetivo: Mostrar na tela os números 1, 2, 3, 4 e 5.

#for i in range(5):
#print(i)

#coigidorr
#for i in range(5):
    #print(i)
#melhorado
#numero=int(input("digite o numero"))
#for i in range(numero):
   # print(i)

#9. O Loop Eterno
#tentativas = 1
#while tentativas <= 3:
#print("Tentando conectar...")
#O código deveria parar após 3 tentativas

#corrigido
#tentaviva=1
#while tentativas <=3:
    #print("tentando conectar..")
    #tentativas= tentativas +1
    #print("fim da tentativas.")

   # melhorada
#for i in range('1,4'):
      #  print(f"tentativa {i}: conectando.....")
#print("print fim da partida")
        
