# Contexto: Você foi contratado para desenvolver o módulo de validação de
# empréstimos de livros de uma biblioteca comunitária. O sistema precisa coletar os dados
# do usuário, do livro e decidir se o empréstimo será aprovado, negado ou se haverá
# cobrança de taxa de segurança.
# Regras de Negócio (O que o sistema deve fazer):
# 1. Classificação do Usuário: A biblioteca atende [1] Alunos e [2] Comunidade
# Geral.
# 2. Limite de Dias: * Alunos podem ficar com o livro por até 14 dias de graça.
# ○ A Comunidade Geral pode ficar por até 7 dias de graça.
# 3. Taxa de Renovação: Se o usuário quiser ficar mais tempo do que o limite do seu
# perfil, será cobrada uma taxa fixa de R$ 5,00 por dia adicional.
# 4. Restrição de Categoria: Livros da categoria "Raros" não podem ser emprestados
# para a Comunidade Geral, apenas para Alunos.

import tkinter as tk
from tkinter import messagebox, ttk
class BibliotecaApp:
    def __init__(self, master):
        self.master = master
        master.title("Empréstimo de Livros - Biblioteca Comunitária")
        master.geometry("400x300")
        master.configure(bg="#f0f4f8")

        self.create_widgets()

    def create_widgets(self):
        main_frame = ttk.Frame(self.master, padding="20")
        main_frame.pack(expand=True, fill="both")
        main_frame.configure(style='TFrame')

        style = ttk.Style()
        style.configure('TLabel', background='#f0f4f8', font=('Arial', 10))
        style.configure('TButton', font=('Arial', 10, 'bold'), padding=5)
        style.configure('TFrame', background='#f0f4f8')

        lbl_usuario = ttk.Label(main_frame, text="Classificação do Usuário:")
        lbl_usuario.pack(pady=(10, 2))
        self.campo_usuario = ttk.Combobox(main_frame, values=["Aluno", "Comunidade Geral"], state="readonly", width=30)
        self.campo_usuario.pack(pady=(0, 10))
        self.campo_usuario.set("Aluno")

       
        lbl_categoria = ttk.Label(main_frame, text="Categoria do Livro:")
        lbl_categoria.pack(pady=(10, 2))
        self.campo_categoria = ttk.Combobox(main_frame, values=["Comum", "Raro"], state="readonly", width=30)
        self.campo_categoria.pack(pady=(0, 10))
        self.campo_categoria.set("Comum")

        
        lbl_dias = ttk.Label(main_frame, text="Dias de Empréstimo:")
        lbl_dias.pack(pady=(10, 2))
        self.campo_dias = ttk.Entry(main_frame, width=30)
        self.campo_dias.pack(pady=(0, 10))

        btn_verificar = ttk.Button(main_frame, text="Verificar Empréstimo", command=self.verificar_emprestimo)
        btn_verificar.pack(pady=15)

    def verificar_emprestimo(self):
        usuario = self.campo_usuario.get()
        categoria = self.campo_categoria.get()
        try:
            dias = int(self.campo_dias.get())
            if dias < 0:
                raise ValueError("Dias de empréstimo não podem ser negativos.")
        except ValueError:
            messagebox.showerror("Erro de Validação", "Por favor, insira um número válido para os dias de empréstimo.")
            return
        if categoria == "Raro" and usuario == "Comunidade Geral":
            messagebox.showwarning("Empréstimo Negado", "Livros raros não podem ser emprestados para a Comunidade Geral.")
            return
        limite_dias = 14 if usuario == "Aluno" else 7
        if dias <= limite_dias:
            messagebox.showinfo("Empréstimo Aprovado", "Empréstimo aprovado sem taxa.")
        else:
            taxa = (dias - limite_dias) * 5
            messagebox.showinfo("Empréstimo Aprovado com Taxa", f"Empréstimo aprovado. Taxa de R$ {taxa:.2f} por {dias - limite_dias} dias adicionais.")
if __name__ == "__main__":
    root = tk.Tk()
    app = BibliotecaApp(root)
    root.mainloop()      
