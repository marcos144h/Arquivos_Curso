import tkinter as tk
from tkinter import messagebox, ttk

class RegistroOperadorApp:
    def __init__(self, master):
        self.master = master
        master.title("Registro do Trabalhador")
        master.geometry("350x250")
        master.configure(bg="#e0f2f7") # Um azul claro mais suave

        self.create_widgets()

    def create_widgets(self):
        # Frame principal para organizar os widgets
        main_frame = ttk.Frame(self.master, padding="15")
        main_frame.pack(expand=True, fill="both")
        main_frame.configure(style='TFrame')

        # Estilo para os labels e botões
        style = ttk.Style()
        style.configure('TLabel', background='#e0f2f7', font=('Arial', 10))
        style.configure('TButton', font=('Arial', 10, 'bold'), padding=5)
        style.configure('TFrame', background='#e0f2f7')

        # Nome do Operador
        lbl_nome = ttk.Label(main_frame, text="Nome do Operador:")
        lbl_nome.pack(pady=(10, 2))
        self.campo_nome = ttk.Entry(main_frame, width=30)
        self.campo_nome.pack(pady=(0, 10))

        # Turno (usando Combobox para validação)
        lbl_turno = ttk.Label(main_frame, text="Turno (A, B ou C):")
        lbl_turno.pack(pady=(10, 2))
        self.campo_turno = ttk.Combobox(main_frame, values=["A", "B", "C"], state="readonly", width=27)
        self.campo_turno.pack(pady=(0, 10))
        self.campo_turno.set("A") # Valor padrão

        # Botão de Registro
        botao = ttk.Button(main_frame, text="Registrar", command=self.registrar)
        botao.pack(pady=15)

    def registrar(self):
        nome = self.campo_nome.get().strip()
        turno = self.campo_turno.get()

        if not nome:
            messagebox.showerror("Erro de Validação", "O nome do operador não pode estar vazio.")
            return

        if turno not in ["A", "B", "C"]:
            messagebox.showerror("Erro de Validação", "Por favor, selecione um turno válido (A, B ou C).")
            return

        messagebox.showinfo("Sucesso", f"Operador {nome} registrado no Turno {turno}. Boa jornada!")

if __name__ == "__main__":
    root = tk.Tk()
    app = RegistroOperadorApp(root)
    root.mainloop()
