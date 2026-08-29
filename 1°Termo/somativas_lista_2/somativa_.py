
#1. Registro de Operador: Peça o nome do operador e o turno (A, B ou C). Exiba:
#"Operador [Nome] registrado no Turno [Turno]. Boa jornada!"


# import tkinter as tk
# from tkinter import messagebox


# def registrar():
#     nome = campo_nome.get()
#     turno = campo_turno.get()
    
    
#     messagebox.showinfo("Sucesso", f"Operador {nome} registrado no Turno {turno}. Boa jornada!")


# janela = tk.Tk()
# janela.title("Registro do trabalhador")
# janela.geometry("300x200") 
# janela.configure(bg="lightblue")


# lbl_nome = tk.Label(janela, text="Nome do Operador:")
# lbl_nome.pack()
# campo_nome = tk.Entry(janela)
# campo_nome.pack()


# lbl_turno = tk.Label(janela, text="Turno (A, B ou C):")
# lbl_turno.pack()
# campo_turno = tk.Entry(janela)
# campo_turno.pack()


# botao = tk.Button(janela, text="Registrar", command=registrar)
# botao.pack(pady=14)


# janela.mainloop()


#2.álculo de Produção: Peça a quantidade de peças produzidas em 1 hora. Calcule e
# exiba quantas peças serão produzidas em um turno de 8 horas.

# Pede a quantidade de peças ao usuário

# import tkinter as tk
# from tkinter import messagebox

# def calcular():
    
        
#         pecas = int(entrada.get())
#         total = pecas * 8
#         messagebox.showinfo("Resultado", f"Em 8 horas serão produzidas: {total} peças")
    

# janela = tk.Tk()
# janela.title("Produção")
# janela.geometry("300x150")


# tk.Label(janela, text="Peças por hora:").pack(pady=10)
# entrada = tk.Entry(janela)
# entrada.pack()

# tk.Button(janela, text="Calcular 8h", command=calcular).pack(pady=15)


# janela.mainloop()

# 
# #3
# import tkinter as tk

# def converter():
    
        
#         bar = float(entrada_bar.get())
        
#         psi = bar * 14.5 
#         lbl_resultado.config(text=f"{psi:.2f} PSI", fg="blue")
    


# janela = tk.Tk()
# janela.title("Conversor do bar")
# janela.geometry("300x180")
# janela.eval('tk::PlaceWindow . center') # Centraliza a janela na tela


# tk.Label(janela, text="Pressão em Bar:", font=("Arial", 11)).pack(pady=10)

# entrada_bar = tk.Entry(janela, font=("Arial", 12), justify="center")
# entrada_bar.pack(pady=5)

# tk.Button(janela, text="Converter para PSI", command=converter, bg="black", fg="white", font=("Arial", 10, "bold")).pack(pady=10)

# lbl_resultado = tk.Label(janela, text="", font=("Arial", 13, "bold"))
# lbl_resultado.pack(pady=5)


# janela.mainloop()

# 4. Média de Qualidade: Peça 3 notas de inspeção de uma peça (0 a 10). Exiba a média
#aritmética simples delas.
# import tkinter as tk
# from tkinter import messagebox

# def calcular():
    
        
#     nota1= int(entrada1.get())
#     nota2 = int(entrada2.get())
#     nota3 = int(entrada3.get())
#     total=  (nota1 + nota2 + nota3) /3
  
#     messagebox.showinfo("Resultado", f"A média de qualidade é: {total:.2f}")

# janela = tk.Tk()
# janela.title("Média da Inspeção")
# janela.geometry("300x150")


# tk.Label(janela, text="Nota 1:").pack(pady=5)
# entrada1 = tk.Entry(janela)
# entrada1.pack()

# tk.Label(janela, text="Nota 2:").pack(pady=5)
# entrada2 = tk.Entry(janela)
# entrada2.pack()

# tk.Label(janela, text="Nota 3:").pack(pady=5)
# entrada3 = tk.Entry(janela)
# entrada3.pack()

# tk.Button(janela, text="Calcular a media", command=calcular).pack(pady=15)


# janela.mainloop()


#5Termostato Inteligente: Peça a temperatura de um motor.
# ● Abaixo de 40°C: "Baixa carga".
# ● Entre 40°C e 70°C: "Normal".
# ● Acima de 70°C: "ALERTA: Resfriamento Ativado!".
# import tkinter as tk

# def verificar():
#     temp = float(entry.get())
#     if temp < 40:
#         label_res.config(text="Baixa carga", fg="blue")
#     elif temp <= 70:
#         label_res.config(text="Normal", fg="green")
#     else:
#         label_res.config(text="ALERTA: resfriamento ativado", fg="red")


# janela = tk.Tk()
# janela.title("Temperatura do motor")
# janela.geometry("250x150")


# tk.Label(janela, text="Temperatura (°C):").pack(pady=5)
# entry = tk.Entry(janela)
# entry.pack()

# tk.Button(janela, text="Verificar", command=verificar).pack(pady=5)
# label_res = tk.Label(janela, text="", font=("Arial", 10, "bold"))
# label_res.pack(pady=5)


# janela.mainloop()

#assificador de Lotes: O usuário insere o código do produto. Se começar com "A",
#exiba "Alimentos". Se "E", "Eletrônicos". Para qualquer outro, "Desconhecido".

# import tkinter as tk

# def classificar():
#     codigo = entry.get().upper()
#     if codigo.startswith("A"):
#         label_res.config(text="Alimentos", fg="green")
#     elif codigo.startswith("E"):
#         label_res.config(text="Eletrônicos", fg="blue")
#     else:
#         label_res.config(text="Desconecido", fg="red")

# janela = tk.Tk()
# janela.title("Classificador de Lotes")
# janela.geometry("300x150")
# tk.Label(janela, text="Código do Produto:").pack(pady=5)
# entry = tk.Entry(janela)
# entry.pack()
# tk.Button(janela, text="Classificar", command=classificar).pack(pady=5)
# label_res = tk.Label(janela, text="", font=("Arial", 10, "bold"))
# label_res.pack(pady=5)
# janela.mainloop()

# 7. Segurança de Operação: A máquina só liga se o sensor_porta == "fechada" E o
# botao_emergencia == "desligado". Peça esses dois inputs e diga se a máquina pode
# iniciar.
# import tkinter as tk

# def verificar():
#     sensor_porta = entry_porta.get().lower()
#     botao_emergencia = entry_emergencia.get().lower()
    
#     if sensor_porta == "fechada" and botao_emergencia == "desligado":
#         label_res.config(text="Máquina pode iniciar", fg="green")
#     elif sensor_porta != "fechada" and botao_emergencia != "desligado":
#         label_res.config(text="Máquina não pode iniciar", fg="red")
#     else:
#         label_res.config(text="Máquina não pode iniciar", fg="red")
     
# janela = tk.Tk()
# janela.title("Segurança de Operação")
# janela.geometry("300x200")
# tk.Label(janela, text="Sensor da Porta (fechada/aberta):").pack(pady=5)
# entry_porta = tk.Entry(janela)
# entry_porta.pack()
# tk.Label(janela, text="Botão de Emergência (ligado/desligado):").pack(pady=5)
# entry_emergencia = tk.Entry(janela)
# entry_emergencia.pack()
# tk.Button(janela, text="Verificar", command=verificar).pack(pady=10)
# label_res = tk.Label(janela, text="", font=("Arial", 10, "bold"))
# label_res.pack(pady=5)
# janela.mainloop()

# 8. Cálculo de Descarte: Peça o total de peças produzidas e o total de defeituosas. Se
# o descarte for maior que 5% do total, exiba "Revisar Processo", caso contrário,
# "Processo Otimizado".
# import tkinter as tk

# from tkinter import messagebox 

# def calcular_descarte():
#     try:
#         total_pecas = int(entry_total.get())
#         pecas_defeituosas = int(entry_defeituosas.get())
        
#         if total_pecas <= 0:
#             messagebox.showerror("Erro", "O total de peças deve ser maior que zero.")
#             return
#         taxa_descarte = (pecas_defeituosas / total_pecas) * 100
#         if taxa_descarte > 5:
#             messagebox.showwarning("Resultado", f"Revisar Processo Taxa de descarte: {taxa_descarte:.2f}%")
#         else:
#             messagebox.showinfo("Resultado", f"Processo Otimizado Taxa de descarte: {taxa_descarte:.2f}%")
#     except ValueError:
#         messagebox.showerror("Erro", "Por favor, insira números válidos.")

# janela = tk.Tk()
# janela.title("Cálculo de Descarte")
# janela.geometry("300x200")

# tk.Label(janela, text="Total de Peças Produzidas:").pack(pady=5)
# entry_total = tk.Entry(janela)
# entry_total.pack()

# tk.Label(janela, text="Peças Defeituosas:").pack(pady=5)
# entry_defeituosas = tk.Entry(janela)
# entry_defeituosas.pack()

# tk.Button(janela, text="Calcular", command=calcular_descarte).pack(pady=10)

# janela.mainloop()

# 9. Validação de Medida: Uma peça deve ter entre 9.8mm e 10.2mm. Peça a medida e
#diga se está dentro da tolerância, acima ou abaixo.
# import tkinter as tk
# from tkinter import messagebox
# def validar_medida():
#     try:
#         medida = float(entry_medida.get())
#         if 9.8 <= medida <= 10.2:
#             messagebox.showinfo("Resultado", "Peça dentro da tolerância.")
#         elif medida < 9.8:
#             messagebox.showwarning("Resultado", "Peça abaixo da tolerância.")
#         else:
#             messagebox.showwarning("Resultado", "Peça acima da tolerância.")
#     except ValueError:
#         messagebox.showerror("Erro", "Por favor, insira um número válido.")

# janela = tk.Tk()
# janela.title("Validação de Medida")
# janela.geometry("300x200")

# tk.Label(janela, text="Medida da Peça (mm):").pack(pady=5)
# entry_medida = tk.Entry(janela)
# entry_medida.pack()

# tk.Button(janela, text="Validar", command=validar_medida).pack(pady=10)

# janela.mainloop()


# 10.Contagem Regressiva de Setup: Use um for para fazer uma contagem regressiva
# de 10 até 1 para o início de uma prensa, e finalize com "Prensa Ativada!".
# import tkinter as tk
# import time

# def contagem_regressiva():
#     for i in range(10, 0, -1):
#         label_contagem.config(text=f"Tempo restante: {i}")
#         janela.update()
#         time.sleep(1)
#     label_contagem.config(text="Prensa Ativada!")

# janela = tk.Tk()
# janela.title("Contagem Regressiva")
# janela.geometry("300x200")

# label_contagem = tk.Label(janela, text="Tempo restante: 10")
# label_contagem.pack(pady=20)

# tk.Button(janela, text="Iniciar Contagem", command=contagem_regressiva).pack()

# janela.mainloop()
