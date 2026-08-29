import tkinter as tk
from tkinter import messagebox

# .get() serve para buscar informação na caixa de texto
def janela_bemvindo():
    nome = nome_usuario.get()

    if nome == "":
        messagebox.showwarning("Aviso", "Digite seu nome :)")
    else:
        messagebox.showinfo("Bem-Vindo", f"Olá usuário, {nome} - Seja bem-vindo ao nosso sistema")
    
# Configurações da Janela
janela = tk.Tk()
janela.title("Exemplo 2")
janela.geometry("400x400")
import tkinter as tk
from tkinter import messagebox

# Função que faz os cálculos quando o botão é clicado
def verificar_emprestimo():
    # Pega os dados que o usuário digitou/escolheu
    perfil = int(txt_perfil.get())
    categoria = txt_categoria.get().strip().lower()
    dias = int(txt_dias.get())
    
    # 1. Validação do livro Raro
    if categoria == "raros" and perfil == 2:
        messagebox.showerror("Resultado", "Empréstimo NEGADO: Comunidade não pode pegar livros raros.")
        return # Para o código aqui

    # 2. Definição do limite de dias
    if perfil == 1:
        limite = 14
    else:
        limite = 7

    # 3. Cálculo da taxa
    if dias > limite:
        dias_a_mais = dias - limite
        taxa = dias_a_mais * 5
    else:
        taxa = 0

    # Exibe o resultado na tela
    messagebox.showinfo("Resultado", f"Empréstimo APROVADO!\nTaxa a pagar: R$ {taxa:.2f}")


# --- CRIANDO A JANELA ---
janela = tk.Tk()
janela.title("Biblioteca Digital")
janela.geometry("300x250")

# Texto e Campo do Perfil
tk.Label(janela, text="Perfil (1 para Aluno / 2 para Comunidade):").pack(pady=5)
txt_perfil = tk.Entry(janela)
txt_perfil.pack()

# Texto e Campo da Categoria
tk.Label(janela, text="Categoria do Livro (Regular / Raros):").pack(pady=5)
txt_categoria = tk.Entry(janela)
txt_categoria.pack()

# Texto e Campo dos Dias
tk.Label(janela, text="Quantidade de Dias:").pack(pady=5)
txt_dias = tk.Entry(janela)
txt_dias.pack()

# Botão de Calcular
btn_calcular = tk.Button(janela, text="Verificar Empréstimo", command=verificar_emprestimo, bg="green", fg="white")
btn_calcular.pack(pady=15)

# Mantém a janela aberta
janela.mainloop()
# Componentes
lbl_mensagem = tk.Label(janela, text="Digite seu nome :)")
lbl_idade  = tk.Label(janela, text="Digite sua idade :)")

lbl_mensagem.grid(row=0, column=0, pady=10, padx=10)
lbl_idade.grid(row=1, column=0, pady=10, padx=10)

nome_usuario = tk.Entry(janela, font=("Georgia", 12))
nome_usuario.grid(row=0, column=1, pady=10, padx=10)

idade_usuario = tk.Entry(janela, font=("Georgia", 12))
idade_usuario.grid(row=1, column=1, pady=9, padx=10)

btn_mensagem = tk.Button(janela, text="Mensagem", command=janela_bemvindo)
btn_mensagem.grid(row=2, column=0, pady=9, padx=10)

btn_fechar = tk.Button(janela, text="fechar", bg="black", fg="white", command=janela.destroy)
btn_fechar.grid(row=3, column=0, pady=10, padx=10)

btn_clique_e_seja_convocado_para_a_seleção = tk.Button(janela, text="seja convocado para a seleção e leve o hexa para o brasil", bg="green", fg="white", command=janela.destroy)
btn_clique_e_seja_convocado_para_a_seleção.grid(row=5, column=0, pady=10, padx=10)












# Rodar interface
janela.mainloop()

