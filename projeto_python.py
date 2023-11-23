import psycopg2
import PySimpleGUI as sg

sg.theme('DarkAmber') 

con = psycopg2.connect(host = 'localhost', database = 'projeto_integrador_g2', 
                       user = 'postgres', password = 'thor1234')


def limpar2():
    
    window['-nome_cliente-'].update('')
    window['-cpf_cliente-'].update('')
    window['-rua_num_cliente-'].update('')
    window['-data_nasci_cliente-'].update('')
    window['-email_cliente-'].update('')
    window['-telefone_cliente-'].update('')
    window['-sexo_cliente-F-'].update(True)
    window['-cep-'].update('')
    window['-uf-'].update('')
    window['-cidade-'].update('')
    window['-bairro-'].update('')


def limpar1():
    
    window['-cod_cliente-'].update('')
    window['-cod_tipo_ingresso-'].update('')
    window['-cod_pagamento-'].update('')
    
    window['-valor_ingresso-'].update('')
    window['-cod_dependente-'].update('')
    window['-cal_data-'].update('')
    

    
def atualiza2():
    if len(lista2) == 0:
        limpar2()
    else:
        
        window['-nome_cliente-'].update( lista2[indice2][0] )
        window['-cpf_cliente-'].update( lista2[indice2][1] )
        window['-rua_num_cliente-'].update( lista2[indice2][2] )
        window['-data_nasci_cliente-'].update( lista2[indice2][3] )
        window['-email_cliente-'].update( lista2[indice2][4] )
        window['-telefone_cliente-'].update( lista2[indice2][5] )
        if lista2[indice2][6]: 
            window['-sexo_cliente-M-'].update(True)
        else: 
            window['-sexo_cliente-F-'].update(True)
        window['-cep-'].update( lista2[indice2][7] )
        window['-uf-'].update( lista2[indice2][8] )
        window['-cidade-'].update( lista2[indice2][9] )
        window['-bairro-'].update( lista2[indice2][10] )

def atualiza1():
    if len(lista1) == 0:
        limpar1()
    else:
        window['-cod_cliente-'].update( lista1[indice1][0])
             

def todos():
    global indice2
    global lista2
    resposta = []
    with con:
        with con.cursor() as cursor:
            cursor.execute("SELECT * FROM cliente;")
            resposta = cursor.fetchall()
    lista2.clear()
    listaString = ''
    for i in range(len(resposta)):
        lista2.append( list(resposta[i]) )
        lista2[i][7] = True if lista2[i][7] == 'M' else False
        listaString += str(i+1) +') ' + resposta[i][1] + '\n'
        
    sg.popup('Quantidade de registros: ' + str(len(resposta)))
    indice2 = 0
    atualiza2()


def uf():
    return['AC ', 'AL', 'AP', 'AM', 'BA', 'CE' , 'DF', 'ES', 'GO', 'MA', 'MT' , 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO']

# Inicialização BD
con = psycopg2.connect(host = 'localhost', database = 'projeto_integrador_g2', 
                       user = 'postgres', password = 'thor1234')


## aqui é o modo de: escrevo uma coisa e ele lê outra
dicPagamentos={'PIX':1, 'Crédito':2}
print(dicPagamentos['PIX'])


lista2=[]
indice2 = 0

lista1=[]
indice1 = 0


def make_win1():
    layout = [    
        [
            sg.Push(), sg.Text("SISTEMA DE EMISSÃO DE INGRESSO"), sg.Push()
            
        ],
        [
            sg.Text("Código do cliente:", size=(20, 1)),
            sg.InputText(size=(6, 1), key="-cod_cliente-", focus=False)
        ],
        [
            sg.Text("Tipo do ingresso:", size=(20, 1)),
            sg.InputText(size=(6, 1), key="-cod_tipo_ingresso-", focus=False)
        ],
        [
            sg.Text("Tipo de pagamento:", size=(20, 1)),
            sg.InputText(size=(40, 1), key="-cod_pagamento-", focus=True)
        ],
        [
            sg.Text("valor do ingresso:", size=(20, 1)),
            sg.InputText(size=(40, 1), key="-valor_ingresso-")
        ],
        [
            sg.Text("codigo do dependete:", size=(20, 1)),
            sg.InputText(size=(40, 1), key="-cod_dependente-")
        ],
        [
            sg.Text("Data:", size=(20, 1)),
            sg.InputText(size=(40, 1), key="-cal_data-")
        ],
        [
            sg.Push(), sg.Text("Pequise se o cliente já está cadatrado:"), sg.Push()
            
        ],
        [
            sg.Text("Nome do cliente:", size=(20, 1)),
            sg.InputText(size=(40, 1), key="-nome_cliente-")
        ],
        [
            sg.Button('Cadastrar', size=(8, 1), key="-CADASTRAR-"),
            sg.Button('Pesquisar', size=(8, 1), key="-PESQUISAR-"),
            sg.Button('Gerar', size=(8, 1), key="-GERAR INGRESSO-")
        ]
    ]
    return sg.Window('Cadastrinho...', layout, finalize=True, location=(100, 100))

def make_win2():
    layout = [    
        [
            sg.Text("Nome:", size=(17, 1)),
            sg.InputText(size=(40, 1), key="-nome_cliente-", focus=True)
        ],
        [
            sg.Text("CPF:", size=(17, 1)),
            sg.InputText(size=(40, 1), key="-cpf_cliente-")
        ],
        [
            sg.Text("Data de Nascimento:", size=(17, 1)),
            sg.InputText(size=(40, 1), key="-data_nasci_cliente-")
        ],
        [
            sg.Text("E-mail:", size=(17, 1)),
            sg.InputText(size=(40, 1), key="-email_cliente-")
        ],
        [
            sg.Text("Telefone:", size=(17, 1)),
            sg.InputText(size=(40, 1), key="-telefone_cliente-")
        ], 
        [
            sg.Text("Sexo:", size=(17, 1)),
            sg.Radio('Masculino', 'GRUPO1', default=False, key="-sexo_cliente-M-"),
            sg.Radio('Feminino', 'GRUPO1', default=True, key="-sexo_cliente-F-")
        ],
        [
            sg.Text("CEP:", size=(17, 1)),
            sg.InputText(size=(40, 1), key="-cep-")
        ],
        [
            sg.Text("Endereço:", size=(17, 1)),
            sg.InputText(size=(40, 1), key="-rua_num_cliente-")
        ],
        [
            sg.Text("Estado:", size=(17, 1)),
            sg.Combo(uf(), size=(8, 1), key="-uf-")
        ],
        [
            sg.Text("Cidade:", size=(17, 1)),
            sg.InputText(size=(40, 1), key="-cidade-")
        ],
        [
            sg.Text("Bairro:", size=(17, 1)),
            sg.InputText(size=(40, 1), key="-bairro-")
        ],
        [
            sg.Button('Limpar', size=(8, 1), key="-LIMPAR-"),
            sg.Button('Inserir', size=(8, 1), key="-INSERIR-"),
            sg.Button('Atualizar', size=(8, 1), key="-ATUALIZAR-"),
            sg.Button('Emitir', size=(8, 1), key="-EMITIR-"),
            sg.Button('Remover', size=(8, 1), key="-REMOVER-")
            
        ],
        [
            sg.Button('<<', size=(8, 1), key="-<<-"),
            sg.Button('Procurar', size=(8, 1), key="-PROCURAR-"),
            sg.Button('Todos', size=(8, 1), key="-TODOS-"),
            sg.Button('>>', size=(8, 1), key="->>-")
        ]
    ]
    return sg.Window("Cadastlo do cebola", layout, finalize=True, location=(100, 100))

window1, window2 = make_win1(), None 

while True:
    window, event, values = sg.read_all_windows()

    if event == sg.WIN_CLOSED:
        break
    elif event == "-CADASTRAR-":
        print('Cadastrar....')
        window2 = make_win2()
        window1.close()
    elif event == "-PESQUISAR-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("SELECT * FROM cliente WHERE nome_cliente LIKE %s;",
                    ('%'+values['-nome_cliente-']+'%',))
                resposta1 = cursor.fetchall()
                lista1.clear()
                for i in range(len(resposta1)):
                    lista1.append( list(resposta1[i]) )
                if len(resposta1) == 0:
                    sg.popup('Cliente não cadastrado')   ####Está dando um erro aqui - olhar 
                elif len(resposta1) > 0:
                    sg.popup('Cliente já cadatrado')
                indice1 = 0
                atualiza1()
    elif event == "-EMITIR-":
        print('Emitir....')
        window1 = make_win1()
        window2.close()
               
    elif event == "-INSERIR-":
         with con:
            with con.cursor() as cursor:
                cursor.execute("INSERT INTO cliente (nome_cliente, cpf_cliente, data_nasci_cliente, rua_num_cliente, email_cliente, telefone_cliente, sexo_cliente, cep, uf, cidade, bairro) VALUES (  %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);",
                            ( values['-nome_cliente-'], values['-cpf_cliente-'], values['-data_nasci_cliente-'], 
                            values['-rua_num_cliente-'], values['-email_cliente-'], values['-telefone_cliente-'], ('M' if values['-sexo_cliente-M-'] else 'F'), 
                            values['-cep-'], values['-uf-'], values['-cidade-'], values['-bairro-']))
            limpar2()
    elif event == "-LIMPAR-":
        limpar2()
    elif event == "-GERAR INGRESSO-":    ### retirar  (cod_cliente, nome_cliente, cpf_cliente, data_nasci_cliente, end_cliente, email_cliente, telefone_cliente, sexo_cliente)
        with con:
            with con.cursor() as cursor:
                cursor.execute("INSERT INTO ingresso (cod_cliente, cod_tipo_ingresso, cod_pagamento,  valor_ingresso, cod_dependente, cal_data) VALUES (%s, %s, %s, %s, %s, %s);",
                    (values['-cod_cliente-'], values['-cod_tipo_ingresso-'], values['-cod_pagamento-'], 
                     values['-valor_ingresso-'], values['-cod_dependente-'], 
                     values['-cal_data-']))
                ### VAI PRECISAR DE UM BIBLIOTECA QUE GERE UM PDF
        limpar1()
    elif event == "-ATUALIZAR-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("UPDATE cliente SET nome_cliente = %s, cpf_cliente = %s, cpf_cliente = %s, cpf_cliente = %s, cpf_cliente = %s, cpf_cliente = %s, cep = %s, uf = %s, cidade = %s, bairro = %s WHERE cod_cliente = %s",
                    (values['-nome_cliente-'], values['-cpf_cliente-'], values['-data_nasci_cliente-'], values['-end_cliente-'], 
                     values['-email_cliente-'], values['-telefone_cliente-'], values['-genero-'], values['-cod_cliente-']))
        lista2[indice2] = [values['-cod_cliente-'], values['-nome_cliente-'], values['-cpf_cliente-'], 
                         values['-data_nasci_cliente-'], values['-end_cliente-'], values['-email_cliente-'], values['-telefone_cliente-'], 
                         ('M' if values['-sexo_cliente-M-'] else 'F'), values['-cep-'], values['-uf-'], values['-cidade-'], values['-bairro-']]  
       
    elif event == "-REMOVER-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("DELETE FROM cliente WHERE cod_cliente = %s", (values['-cod_cliente-'],))
        lista2.pop(indice2)
        indice2 -= 1
        atualiza2()
    elif event == "-PROCURAR-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("SELECT * FROM cliente WHERE nome_cliente LIKE %s;",
                    ('%'+values['-nome_cliente-']+'%',))
                resposta2 = cursor.fetchall()
                lista2.clear()
                for i in range(len(resposta2)):
                    lista2.append( list(resposta2[i]) )
                sg.popup('Quantidade de registros: ' + str(len(resposta2)))
                indice2 = 0
                atualiza2()
    elif event == "-TODOS-":
        todos()
    elif event == "->>-":
        indice2 += 1
        if indice2 >= len(lista2): indice2 = len(lista2)-1
        atualiza2()
    elif event == "-<<-":
        indice2 -= 1
        if indice2 <= 0: indice2 = 0
        atualiza2()

window1.close()
window2.close()
# Fazer as mudanças para a base persistente
con.commit()

# Fechar a comunicação com o servidor
cursor.close()
con.close()