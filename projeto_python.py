import psycopg2
import PySimpleGUI as sg
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from PIL import Image
import qrcode
import random
import string
import io
import os
import datetime

sg.theme('DarkBrown5') 

con = psycopg2.connect(host = 'localhost', database = 'projeto_integrador_g2', 
                       user = 'postgres', password = 'thor1234')



lista1=[]
indice1 = 0

lista2=[]
indice2 = 0

lista3=[]
indice3 = 0

dicTipoIngresso= {'GESTANTE': 1, 'IDOSO': 2, 'COMUM': 3}

dicPagamentos={'PIX':1, 'CRÉDITO':2, 'DÉBITO': 3, 'DINHEIRO': 4, 'GRATUIDADE':5 }

def limpar1():
    
    window['-cod_cliente-'].update('')
    window['-cod_tipo_ingresso-'].update('')
    window['-cod_pagamento-'].update('')
    window['-valor_ingresso-'].update('')
    window['-cod_dependente-'].update('')
    window['-cal_data-'].update('')


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


def limpar3():
    
    window['-nome_dependente-'].update('')
    window['-cpf_dependente-'].update('')
    window['-data_nasci_dependente-'].update('')
    window['-sexo_dependente-'].update('')
    window['-cod_cliente-'].update('')
     

def atualiza1():
    if len(lista1) == 0:
        limpar1()
    else:
        window['-cod_cliente-'].update( lista1[indice1][0])

    
def atualiza2():
    if len(lista2) == 0:
        limpar2()
    else:
        window['-nome_cliente-'].update( lista2[indice2][0] )
        window['-cpf_cliente-'].update( lista2[indice2][1] )
        window['-data_nasci_cliente-'].update( lista2[indice2][2] )
        window['-email_cliente-'].update( lista2[indice2][3] )
        window['-telefone_cliente-'].update( lista2[indice2][4] )
        if lista2[indice2][5]: 
            window['-sexo_cliente-M-'].update(True)
        else: 
            window['-sexo_cliente-F-'].update(True)
        window['-cep-'].update( lista2[indice2][6] )
        window['-rua_num_cliente-'].update( lista2[indice2][7] )
        window['-uf-'].update( lista2[indice2][8] )
        window['-cidade-'].update( lista2[indice2][9] )
        window['-bairro-'].update( lista2[indice2][10] )
        

def atualiza3():
    if len(lista3) == 0:
        limpar3()
    else:
        window['-cod_dependente-'].update( lista3[indice3][0])
        window['-cod_cliente-'].update( lista3[indice3][5])

def todos():
    global indice2
    global lista2
    resposta = []
    with con:
        with con.cursor() as cursor:
            cursor.execute("SELECT nome_cliente, cpf_cliente, data_nasci_cliente, email_cliente, telefone_cliente, sexo_cliente, cep,rua_num_cliente, uf, cidade, bairro FROM cliente;")
            resposta = cursor.fetchall()
    lista2.clear()
    listaString = ''
    for i in range(len(resposta)):
        lista2.append( list(resposta[i]) )
        lista2[i][5] = True if lista2[i][5] == 'M' else False
        
    sg.popup('Quantidade de registros: ' + str(len(resposta)))
    indice2 = 0
    atualiza2()


def uf():
    return['AC ', 'AL', 'AP', 'AM', 'BA', 'CE' , 'DF', 'ES', 'GO', 'MA', 'MT' , 
             'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO']
     

def preco():
    return [130.50, 65.25, 0]




def pagamentos():
    return ['PIX', 'CRÉDITO', 'DÉBITO', 'DINHEIRO', 'GRATUIDADE']

def tipoingresso():
    return ['GESTANTE', 'IDOSO', 'COMUM']


def gerar_qr_code_aleatorio():
    conteudo_qr = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(conteudo_qr)
    qr.make(fit=True)

    img = qr.make_image(fill_color="black", back_color="white")
    qr_buffer = io.BytesIO()
    img.save(qr_buffer, format="PNG")
    return qr_buffer.getvalue()

def criar_ingresso(data, valor_ingresso, nome_cliente, num_ingresso, nome_dependente=None):
    script_dir = os.path.dirname(os.path.abspath(__file__))
    diretorio_ingressos = os.path.join(script_dir, "ingressos")
    if not os.path.exists(diretorio_ingressos):
        os.makedirs(diretorio_ingressos)
    
    pdfname = f"{num_ingresso}_{nome_dependente or ''}_{nome_cliente}.pdf"
    pdf_path = os.path.join(diretorio_ingressos, pdfname)
    c = canvas.Canvas(pdf_path, pagesize=letter)
    
    imagem_logo = Image.open(f'imagens/turma-da-monica.png')
    c.drawInlineImage(imagem_logo, 60, 700, width=500, height=90)
    
    c.setFont("Helvetica-Bold", 16)
    c.drawString(215, 650, "Parque da Turma da Mônica")
    c.drawString(50, 610, f"Data: {data}")
    c.drawString(50, 590, "Local: Avenida Nações Unidas, 22540 - Jurubatuba - SP")
    c.drawString(50, 570, "Shopping SP MARKET")
    c.drawString(50, 550, f"Preço: R${valor_ingresso}")
    c.drawString(50, 530, f"Nome do cliente: {nome_cliente}")

    if nome_dependente is not None:
        c.drawString(50, 510, f"Nome do dependente: {nome_dependente}")
    
    c.drawString(50, 490, "QRcode: ")
    qr_content = gerar_qr_code_aleatorio()
    qr_image = Image.open(io.BytesIO(qr_content))
    c.drawInlineImage(qr_image, 50, 300, width=150, height=150)
    c.line(50, 290, 200, 290)
    c.save()



def make_win1():
    
    col1 = [
            [
            sg.Text("Código do Cliente:", size=(20, 1)),
            sg.InputText(size=(6, 1), key="-cod_cliente-", focus=False)
        ],
        [
            sg.Text("Codigo do Dependete:", size=(20, 1)),
            sg.InputText(size=(6, 1), key="-cod_dependente-")
        ],
        [
            sg.Text("Tipo do Ingresso:", size=(20, 1)),
            sg.Combo(tipoingresso(), size=(13, 1), key="-cod_tipo_ingresso-") 
        ],
        [
            sg.Text("Tipo de Pagamento:", size=(20, 1)),
            sg.Combo(pagamentos(), size=(13, 1), key="-cod_pagamento-") 
        ],
        [
            sg.Text("Valor do Ingresso:", size=(20, 1)),
            sg.Combo(preco(), size=(10, 1), key="-valor_ingresso-")
        ],
        [
            sg.Text("Data do Ingresso:", size=(20, 1)),
            sg.InputText(size=(15, 1), key="-cal_data-")
        ],
        ]
        
    col2 =  [ 
            [sg.Button('Cadastrar Cliente', size=(8, 2), key="-CADASTRAR-")],
            [sg.Button('Gerar Ingresso', size=(8, 2), key="-GERAR INGRESSO-",button_color = 'red')],
            [sg.Button('Cadastrar Depedente', size=(8, 2), key="-DEPENDENTE-")],
            ]
    
    layout = [    
        [
             sg.Image(f'imagens/logo_marca.png')
        ],
       
        [sg.HorizontalSeparator()],
        [
            sg.Push(), sg.Text("Pesquisa Se o Cliente e o Dependente Já Estão Cadastrados:"), sg.Push()
            
        ],
        
        [
            sg.Text("CPF do Cliente:", size=(20, 1)),
            sg.InputText(size=(20, 1), key="-cpf_cliente-"), sg.Button('Pesquisar', size=(8, 1), key="-PESQUISAR-")
        ],
        [
            sg.Text("CPF do Dependente:", size=(20, 1)),
            sg.InputText(size=(20, 1), key="-cpf_dependente-"), sg.Button('Pesquisar', size=(8, 1), key="-PESQUISAR3-")
        ],
        [
            sg.Text("", size=(20, 1))
        ],
        [sg.HorizontalSeparator()],
        [sg.Column(col1), sg.Push(), sg.Column(col2), sg.Push()]
    ]
        
        

    return sg.Window('Exemplo de Imagem', layout, size=(750, 480), finalize=True)




def make_win2():
    col1 = [[sg.Image(f'imagens/cascao_vertical.png') ]]
    col2 = [
            [
            sg.Text("Nome:", size=(17, 1)),
            sg.InputText(size=(30, 1), key="-nome_cliente-", focus=True)
            ],
            [
                sg.Text("CPF:", size=(17, 1)),
                sg.InputText(size=(20, 1), key="-cpf_cliente-"), sg.Button('Procurar', size=(7, 1), key="-PROCURAR-")
            ],
            [
                sg.Text("Data de Nascimento:", size=(17, 1)),
                sg.InputText(size=(30, 1), key="-data_nasci_cliente-")
            ],
            [
                sg.Text("E-mail:", size=(17, 1)),
                sg.InputText(size=(30, 1), key="-email_cliente-")
            ],
            [
                sg.Text("Telefone:", size=(17, 1)),
                sg.InputText(size=(30, 1), key="-telefone_cliente-")
            ], 
            [
                sg.Text("Sexo:", size=(17, 1)),
                sg.Radio('Masculino', 'GRUPO1', default=False, key="-sexo_cliente-M-"),
                sg.Radio('Feminino', 'GRUPO1', default=True, key="-sexo_cliente-F-")
            ],
            [
                sg.Text("CEP:", size=(17, 1)),
                sg.InputText(size=(20, 1), key="-cep-")
            ],
            [
                sg.Text("Endereço:", size=(17, 1)),
                sg.InputText(size=(30, 1), key="-rua_num_cliente-")
            ],
            [
                sg.Text("Estado:", size=(17, 1)),
                sg.Combo(uf(), size=(8, 1), key="-uf-")
            ],
            [
                sg.Text("Cidade:", size=(17, 1)),
                sg.InputText(size=(30, 1), key="-cidade-")
            ],
            [
                sg.Text("Bairro:", size=(17, 1)),
                sg.InputText(size=(30, 1), key="-bairro-")
            ],
            [sg.HorizontalSeparator()],
            [sg.Text("", size=(17, 1))],
            [ sg.Push(),
            
            sg.Button('Cadastrar', size=(13, 2), key="-INSERIR-"),
            
            sg.Button('Emitir', size=(13, 2), key="-EMITIR-"),
            
             sg.Push()
            ],
            [   sg.Push(),
                sg.Button('Limpar', size=(8, 1), key="-LIMPAR-"),
                sg.Button('Atualizar', size=(8, 1), key="-ATUALIZAR-"),
                sg.Button('Remover', size=(8, 1), key="-REMOVER-"),  sg.Push()
                
            ],
            [    sg.Push(),
                sg.Button('<<', size=(8, 1), key="-<<-"),
                sg.Button('Todos', size=(8, 1), key="-TODOS-"),
                sg.Button('>>', size=(8, 1), key="->>-"),  sg.Push()
               
            ]
            ]
    
    layout = [[sg.Column(col1), sg.Column(col2, vertical_alignment='top')]
                ]
    return sg.Window("Cadastlo do cebola",  layout, size = (630, 500), finalize=True)


def make_win3():
 
    col1= [[sg.Image(f'imagens/personagens_vertical2.png') ]]
    col2 = [   
        
         [
            sg.Push(), sg.Text("Pequise o Código do Cliente:"), sg.Push()
            
        ],
        [
            sg.Text("CPF do cliente:", size=(20, 1)),
            sg.InputText(size=(20, 1), key="-cpf_cliente-", focus = True),  sg.Button('Pesquisar', size=(8, 1), key="-PESQUISAR-")
        ], 
        [ sg.Text("", size=(20, 1))],
        [sg.HorizontalSeparator()],
        [
            sg.Push(), sg.Text("Cadastro de Dependente:"), sg.Push()
            
        ],
        [sg.HorizontalSeparator()],
        [ sg.Text("", size=(20, 1))],
        [
            sg.Text("Código do cliente:", size=(20, 1)),
            sg.InputText(size=(6, 1), key="-cod_cliente-")
        ],
        [
            sg.Text("Nome:", size=(20, 1)),
            sg.InputText(size=(25, 1), key="-nome_dependente-", focus=False)      
        ],
        [
            sg.Text("CPF:", size=(20, 1)),
            sg.InputText(size=(20, 1), key="-cpf_dependente-", focus=False)
        ],
        [
            sg.Text("Data de Nascimento:", size=(20, 1)),
            sg.InputText(size=(20, 1), key="-data_nasci_dependente-", focus=False)
        ],
        [
            sg.Text("Sexo:", size=(17, 1)),
            sg.Radio('Masculino', 'GRUPO1', default=False, key="-sexo_dependente-M-"),
            sg.Radio('Feminino', 'GRUPO1', default=True, key="-sexo_dependente-F-")
            
           
        ],
        
        [ sg.Text("", size=(20, 1))],
        [   sg.Push(),
            sg.Button('Cadastrar', size=(8, 2), key="-CADASTRAR2-"),
           
           
            sg.Button('Emitir Ingresso', size=(8, 2), key="-EMITIR3-"),sg.Push()
        ]
    ]
    layout = [[sg.Column(col1), sg.Column(col2, vertical_alignment='top')]]
    return sg.Window('Cadastlo do dependente...', layout, size=(635, 380), finalize=True)

window1, window2, window3 = make_win1(), None, None


while True:
    window, event, values = sg.read_all_windows()

    if event == sg.WIN_CLOSED:
        break
    
    elif event == "-CADASTRAR-":
        
        window2 = make_win2()
        window1.close()
     
    elif event == "-PESQUISAR-":
        with con:
            with con.cursor() as cursor:
                # cursor.execute("SELECT cod_cliente, nome_cliente, cpf_cliente, data_nasci_cliente, rua_num_cliente, email_cliente, telefone_cliente, sexo_cliente, cep, uf, cidade, bairro FROM cliente WHERE cpf_cliente = %s;",
                #     (values['-cpf_cliente-'],))
                # resposta1 = cursor.fetchall()
                # lista1.clear()
                # for i in range(len(resposta1)):
                #     lista1.append( list(resposta1[i]) )
                # if len(resposta1) == 0:
                #     sg.popup('Cliente não cadastrado')   
                # elif len(resposta1) > 0:
                #     sg.popup('Cliente já cadatrado')
                #     atualiza1()
                # indice1 = 0
                try:
                    cpf_cliente = int(values['-cpf_cliente-'])
                    
                    cursor.execute("SELECT cod_cliente, nome_cliente, cpf_cliente, data_nasci_cliente, rua_num_cliente, email_cliente, telefone_cliente, sexo_cliente, cep, uf, cidade, bairro FROM cliente WHERE cpf_cliente = %s;",
                     (values['-cpf_cliente-'],))
                    resposta1 = cursor.fetchall()
                    lista1.clear()
                    for i in range(len(resposta1)):
                        lista1.append( list(resposta1[i]) )
                    if len(resposta1) == 0:
                        sg.popup('Cliente não cadastrado')   
                    elif len(resposta1) > 0:
                        sg.popup('Cliente já cadastrado')
                        atualiza1()
                    indice1 = 0
                
                except ValueError:
                    sg.popup_error('Por favor, insira um CPF válido.')
            
                
                
    elif event == "-EMITIR-":
        
        window1 = make_win1()
        window2.close()
    
    elif event == "-EMITIR3-":
        
        window1 = make_win1()
        window3.close()
               
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
    
    elif event == "-GERAR INGRESSO-":    
        with con:
            with con.cursor() as cursor:
                cod_pagamento = dicPagamentos.get(values.get('-cod_pagamento-', ''), None)
                cod_tipo_ingresso = dicTipoIngresso.get(values.get('-cod_tipo_ingresso-', ''), None)
                data_ingresso = values.get('-cal_data-', None)
                if data_ingresso:
                    data_ingresso = datetime.datetime.strptime(data_ingresso, '%d/%m/%Y').date()
                    limite_diario = 60
                    cursor.execute("SELECT COUNT(*) FROM ingresso WHERE cal_data = %s;", (data_ingresso,))
                    total_ingressos_result = cursor.fetchone()
                    total_ingressos = total_ingressos_result[0] if total_ingressos_result else 0      
                
                    cursor.execute("SELECT cal_data  FROM calendario WHERE situacao_data ILIKE 'INATIVO' AND cal_data = %s AND cal_data IN (SELECT cal_data FROM calendario WHERE situacao_data ILIKE 'INATIVO');", (data_ingresso,))
                    data_inativa_result = cursor.fetchone()
                    data_inativa = data_inativa_result[0] if data_inativa_result else None      
                    
                    
                    if total_ingressos >= limite_diario:
                        sg.popup("Limite diário de ingressos atingido para esta data. Venda não permitida.")
                    
                    elif data_ingresso == data_inativa:
                        sg.popup("O parque não abrirá na data informada")
                    
                    
                    else:
                        cursor.execute("INSERT INTO ingresso (cod_cliente, cod_tipo_ingresso, cod_pagamento,  valor_ingresso, cod_dependente, cal_data) VALUES (%s, %s, %s, %s, %s, %s);",
                            (values.get('-cod_cliente-', None),
                            cod_tipo_ingresso,
                            cod_pagamento,
                            values.get('-valor_ingresso-', None),
                            int(values.get('-cod_dependente-', None)) if values.get('-cod_dependente-', None) else None,
                            values.get('-cal_data-', None),)
                        ),
                        cursor.execute ("SELECT nome_cliente FROM cliente WHERE cod_cliente = %s;",
                            (values.get('-cod_cliente-',''),))
                        valor = cursor.fetchall()[0][0]
                        
                        cursor.execute ("SELECT nome_dependente FROM dependente WHERE cod_dependente = %s;",
                            (values.get('-cod_dependente-', None),) if values.get('-cod_dependente-', None) else (None,))
                        valor_dependente_result = cursor.fetchall()
                        valor_dependente = valor_dependente_result[0][0] if valor_dependente_result else None
                    
                        cursor.execute ("SELECT num_ingresso FROM ingresso WHERE cod_cliente = %s ORDER BY num_ingresso DESC;",
                            (values.get('-cod_cliente-',''),))
                        valor2 = cursor.fetchall()[0][0]

                        nome_dependente = valor_dependente
                        num_ingresso = valor2
                        data = values.get('-cal_data-', '')
                        valor_ingresso = values.get('-valor_ingresso-', '') 
                        nome_cliente = valor
                        print( data, valor_ingresso, nome_cliente, num_ingresso, nome_dependente)
                        criar_ingresso(data, valor_ingresso, nome_cliente, num_ingresso, nome_dependente)
                        sg.popup(f'Ingresso gerado com sucesso. O valor a ser pago é: {valor_ingresso} R$')
        limpar1()
        ##precisa arrumar aqui
    elif event == "-ATUALIZAR-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("UPDATE cliente SET nome_cliente = %s, data_nasci_cliente = %s, email_cliente = %s, telefone_cliente = %s, sexo_cliente = %s, cep = %s, rua_num_cliente = %s, uf = %s, cidade = %s, bairro = %s WHERE cpf_cliente = %s",
                    (values['-nome_cliente-'], values['-data_nasci_cliente-'], 
                     values['-email_cliente-'], values['-telefone_cliente-'], 'M' if values['-sexo_cliente-M-'] else 'F', values['-cep-'], values['-rua_num_cliente-'], values['-uf-'],values['-cidade-'],values['-bairro-'], lista2[indice2][1]))
        lista2[indice2] = [ lista2[indice2][1], values['-nome_cliente-'], values['-data_nasci_cliente-'], 
                     values['-email_cliente-'], values['-telefone_cliente-'], 
                         values['-sexo_cliente-M-'], values['-cep-'], values['-rua_num_cliente-'], values['-uf-'], values['-cidade-'], values['-bairro-']]  
        limpar2()
        
    elif event == "-REMOVER-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("DELETE FROM cliente WHERE cpf_cliente = %s", (values['-cpf_cliente-'],))
        lista2.pop(indice2)
        indice2 -= 1
        atualiza2()
    elif event == "-PROCURAR-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("SELECT nome_cliente, cpf_cliente, data_nasci_cliente, email_cliente, telefone_cliente, sexo_cliente, cep, rua_num_cliente, uf, cidade, bairro FROM cliente WHERE cpf_cliente = %s;", (values['-cpf_cliente-'],))
                resposta2 = cursor.fetchall()
                print(resposta2)
                lista2.clear()
                for i in range(len(resposta2)):
                    lista2.append( list(resposta2[i]) )
                    lista2[i][5] = True if lista2[i][5] == 'M' else False
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
    
    elif event == "-CADASTRAR3-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("INSERT INTO dependente (nome_dependente, cpf_dependente, data_nasci_dependente, sexo_dependente, cod_cliente) VALUES (  %s, %s, %s, %s, %s);",
                            ( values['-nome_dependente-'], values['-cpf_dependente-'], values['-data_nasci_dependente-'], 
                            values['-sexo_dependente-'], values['-cod_cliente-'] ))


    elif event == "-PESQUISAR2-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("SELECT nome_cliente, cpf_cliente, data_nasci_cliente, email_cliente, telefone_cliente, sexo_cliente, cep,rua_num_cliente, uf, cidade, bairro FROM cliente WHERE nome_dependnete LIKE %s;",
                    ('%'+values['-nome_cliente-']+'%',))
                resposta3 = cursor.fetchall()
                lista3.clear()
                
                for i in range(len(resposta3)):
                    lista3.append( list(resposta3[i]) )
                if len(resposta3) == 0:
                    sg.popup('Cliente não cadastrado')  
                elif len(resposta1) > 0:
                    sg.popup('Cliente já cadatrado')
                    atualiza3()
                indice3 = 0
                
    elif event == "-PESQUISAR3-":
        with con:
            with con.cursor() as cursor:
                cursor.execute("SELECT * FROM dependente WHERE cpf_dependente = %s;",
                    (values['-cpf_dependente-'],))
                resposta3 = cursor.fetchall()
                lista3.clear()
                for i in range(len(resposta3)):
                    lista3.append( list(resposta3[i]) )
                if len(resposta3) == 0:
                    sg.popup('Dependente não cadastrado')  
                elif len(resposta3) > 0:
                    sg.popup('Dependente já cadatrado')
                    atualiza3()
                indice3 = 0 
    
    elif event == "-DEPENDENTE-":
        window3 = make_win3()
        window1.close()

if window1 != None: window1.close()
if window2 != None: window2.close()                
if window3 != None: window3.close()

# Fazer as mudanças para a base persistente
con.commit()

# Fechar a comunicação com o servidor
cursor.close()
con.close()