#interface grafica
#componentes principais (widgets)

 #tk: jsnels pricipal
 #lsbel : texto ou rotulo
 #button: uum botão clicavel
 #entry: em um cumpo de entrada de texto


import tkinter as tk
from tkinter import messagebox

# 1. Criar a janela principal
janela = tk.Tk()
janela.title("Minha Primeira Janela GUI")
janela.geometry("400x200") #Largura x Altura

# 2. Criar a função que o botão irá executar
def mostrar_mensagem():
    messagebox.showinfo("Sucesso!", "Você clicou no botão :)")

# 3. Criar os componentes
lbl_titulo_pagina = tk.Label(janela, text="Bem-Vindo ao matrix!", font=("Bodoni", 14, "bold"))
btn_clique_pagina = tk.Button(janela, text="clique aqui para sair da realidade", font=("Bodoni", 14), bg="#010201", fg="white", command=mostrar_mensagem)

# 4. Posicionar os componentes na janela
lbl_titulo_pagina.pack(pady=40) #pady adiciona um espaçamento verticial
btn_clique_pagina.pack(pady=30)

# 5. Rodar o loop da interface
janela.mainloop()


