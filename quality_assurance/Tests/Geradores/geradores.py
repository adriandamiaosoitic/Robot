import random
from datetime import date
from datetime import datetime

def generate_CPF():                                                        
    cpf = [random.randint(0, 9) for x in range(9)]                              
                                                                                
    for _ in range(2):                                                          
        val = sum([(len(cpf) + 1 - i) * v for i, v in enumerate(cpf)]) % 11      
                                                                                
        cpf.append(11 - val if val > 1 else 0)                                  
                                                                                
    return '%s%s%s%s%s%s%s%s%s%s%s' % tuple(cpf)


def generate_CNPJ():                                                       
    def calculate_special_digit(l):                                             
        digit = 0                                                               
                                                                                
        for i, v in enumerate(l):                                               
            digit += v * (i % 8 + 2)                                            
                                                                                
        digit = 11 - digit % 11                                                 
                                                                                
        return digit if digit < 10 else 0                                       
                                                                                
    cnpj =  [1, 0, 0, 0] + [random.randint(0, 9) for x in range(8)]             
                                                                                
    for _ in range(2):                                                          
        cnpj = [calculate_special_digit(cnpj)] + cnpj                           
                                                                                
    return '%s%s%s%s%s%s%s%s%s%s%s%s%s%s' % tuple(cnpj[::-1])

def generate_Time():
	dia = random.randint(1, 30)
	mes = random.randint(1, 12)
	ano = random.randint(1990, 2001)
	
	if dia < 10 and mes < 10:
		return f'0{dia}0{mes}{ano}'
	
	elif dia < 10:
		return f'0{dia}{mes}{ano}'
	
	elif mes < 10:
		return f'{dia}0{mes}{ano}'
	
	else:
		return f'{dia}{mes}{ano}'

	
def dataAtual():
	return date.today().strftime("%d/%m/%Y")

def generate_State():
	estados = ['Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará', 'Espírito Santo', 
	'Goiás', 'Maranhão', 'Mato Grosso', 'Mato Grosso do Sul', 'Minas Gerais', 'Pará', 'Paraíba',
	'Paraná', 'Pernambuco', 'Piauí', 'Rio de Janeiro', 'Rio Grande do Norte', 'Rio Grande do Sul',
	'Rondônia', 'Roraima', 'Roraima', 'São Paulo', 'Sergipe', 'Tocantins', 'Distrito Federal']

	return estados[random.randint(0, 26)]

def generate_City():
	cidades = ['Poços de Caldas', 'Caldas', 'São Paulo', 'Uberlândia', 'Belo Horizonte', 'Fortaleza', 'Campinas', 
	'Goiânia', 'Manaus', 'Montes Claros', 'Blumenau', 'Rio de Janeiro', 'Ubatuba', 'Parati',
	'São João da Boa Vista', 'Recife', 'Salvador', 'Niterói', 'Natal', 'Porto Alegre',
	'Rio Branco', 'Florianópolis', 'São josé dos Campos', 'Ribeirão Preto', 'Piranguinho', 'Guaxupé', 'Brasília', 
	'Bandeira do Sul', 'Campestre', 'Caconde', 'Pouso Alegre']

	return cidades[random.randint(0, 29)]

def generate_Logradouro():
	tplogradouro = ['Área', 'Acesso', 'Avenida', 'Anel Viário', 'Atalho', 'Bloco', 'Bosque', 'Calçada',
	 'Chácara', 'Conjunto', 'Comunidade', 'Condomínio', 'Distrito', 'Estrada Intermunicipal',
	 'Estrada Estadual', 'Estrada', 'Estação', 'Estádio', 'Estância', 'Estacionamento',	'Jardim',
	 'Loteamento', 'Morro', 'Outros', 'Praça', 'Praia', 'Parque Municipal', 'Rua', 'Rodovia', 
	 'Ruela', 'Trevo', 'Setor', 'Via', 'Travessa', 'Vila', 'Vale']

	return tplogradouro[random.randint(0, 35)]

def generate_ParteCorpoAtingida():
	PartAtingida = ['Crânio ', 'Ouvido ', 'Olho ', 'Nariz ', 'Boca ', 'Mandíbula ', 'Face', 'Cabeça',
	 'Braço ', 'punho ', 'Pescoço', 'Cotovelo', 'Antebraço ', 'Dedo', 'Mão ', 'Membros superiores', 
	 'Tórax ', 'Abdome ', 'Tronco', 'Perna ',	'Coxa', 'Pé', 'Articulação do tornozelo', 'Artelho', 
	 'Membros inferiores', 'Sistema nervoso', 'Aparelho circulatório', 'Aparelho gênito-urinário']

	return PartAtingida[random.randint(0, 27)]

def generate_AgenteCausador():
	AgntCausa = ['Energia', 'Embalagem', 'Mobiliário', 'Ser vivo', 'Animal vivo', 'Produto biológico', 'Cerâmica', 
	'Vidraria',	 'Hidrocarboneto', 'Parafina', 'Metal', 'Impacto de pessoa contra objeto parado', 
	'Impacto sofrido por pessoa', 	 'Queda de pessoa em mesmo nível', 'Atrito', 'Aprisionamento em', 
	'Esforço', 'Contato com objeto', 'Absorção', 'Imersão', 'Exposição ao ruído', 'Tipo inexistente', 'Chão', 'Telhado', 
	'Piso', 'Escavação', 'Faca', 'Alavanca']

	return AgntCausa[random.randint(0, 27)]

def generate_SituacaoGeradora():
	sitGeradora = ['Impacto de pessoa', 'Impacto sofrido por pessoa', 'Aprisionamento em', 
	'Queda de pessoa com diferença de nível', 'em mesmo nível', 'Atrito', 'Impacto de pessoa contra objeto parado',
	'Impacto sofrido por pessoa', 'Queda de pessoa em mesmo nível', 'Atrito', 'Esforço', 'Contato com objeto', 
	'Absorção', 'Imersão', 'Exposição ao ruído', 'Tipo inexistente', 'Chão', 'Escavação', 'Faca',]

	return sitGeradora[random.randint(0, 18)]

def generate_DescricaoLesao():
	DescLesao = ['Lesão imediata', 'Escoriação', 'laceração', 
	'Contusão', 'Distensão', 'Inflamação', 'Luxação',
	'Fratura', 'Queimadura', 'Efeito de radiação', 'Congelamento', 'Asfixia', 
	'Intermação', 'Choque', 'Hérnia', 'Amputação', 'Concussão', 'Pneumoconiose', 'Envenenamento',]

	return DescLesao[random.randint(0, 18)]

def generate_CID():
	CIDcat = ['Febres tifoide', 'Febres recorrentes', 'Febre maculosa', 
	'Colera', 'salmonela', 'Enterite', 'Botulismo',
	'Amebiase', 'Disenteria', 'Abscesso', 'Balantidiase', 'Giardiase', 
	'intestinal', 'Gastroenteropatia ', 'pulmonar', 'Meningite', 'ouvido', 'olho', 'Dependencia',]

	return CIDcat[random.randint(0, 18)]

def generate_hour():
	hora_atual =  datetime.now().strftime("%H:%M")
	return hora_atual
