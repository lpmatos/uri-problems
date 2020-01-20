"""Documentation file 1257.py."""

# =============================================================================
# FUNCTIONS
# =============================================================================

def read():
  try:
    # read for Python 2.x
    return str(raw_input())
  except NameError:
    # read for Python 3.x
    return str(input())

# =============================================================================

def show(lista):
    if isinstance(lista, list):
        for elemento in lista:
            print(elemento)

# =============================================================================
# MAIN
# =============================================================================

if __name__ == "__main__":
    casos, atual, outros, ALFABETO = int(read()), 0, list(), "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    outros = []
    for caso in range(0, casos):
        lista_casos, quantidades = list(), int(read())
        if quantidades >= 1 and quantidades <= 100:
            for quantidade in range(0, quantidades):
                valor, conteudo = read(), 0
                if len(valor) <= 50:
                    for index, value in enumerate(valor):
                        conteudo += ALFABETO.index(value) + quantidade + index
                lista_casos.append(conteudo)
        outros.append(lista_casos)
                    
    for elemento in outros:
        print(sum(elemento))
