class Number:
    def __init__(self, signo, entero, fraccion):
        self.signo = signo
        self.entero = entero
        self.fraccion = fraccion

    def get_resolucion(self):
        if not self.signo:
           return 0

        else:
            if not self.fraccion and not self.entero:
                return 0
            elif not self.fraccion:
                return -(2 ** (self.entero - 1))
            else:
                min_entero = - (2 ** (self.entero - 1))

                min_fraccion = (1 - (2 ** (self.fraccion - 1))) / (2 ** (self.fraccion - 1))

                return min_entero + min_fraccion

    def get_rango(self):
        if not self.signo:
            maximo = ((2 ** self.entero) - 1) + ((2 ** self.fraccion - 1) / (2 ** self.fraccion))

            minimo = 0

            return maximo - minimo
        else:
            if not self.entero and not self.fraccion:
                return 0

            maximo_entero = (2 ** (self.entero - 1)) - 1

            maximo_fraccion = ((2 ** (self.fraccion - 1)) - 1) / (2 ** (self.fraccion - 1))

            maximo = maximo_entero + maximo_fraccion

            minimo = self.get_resolucion()

            return maximo - minimo

def main():

    user_interaction()


    return 0

def user_interaction():
    running = True

    while running:
        entrada = input()

        posicion_numero_2 = check_input(entrada)

        if posicion_numero_2:
            signo = int(entrada[0])
            bits_enteros = int(entrada[2:posicion_numero_2])
            bits_fraccionarios = int(entrada[posicion_numero_2 + 1:len(entrada)])

            numero = Number(signo, bits_enteros, bits_fraccionarios)

            print('RES', numero.get_resolucion(), '| RAN:', numero.get_rango())

#ve que este bien lo que ingresa el usuario y retorna 0 en caso contrario. De estar bien el input devuelve en que posicion termina el segundo numero.
def check_input(entrada):
    #chequeo que ingrese algo
    if not entrada :
        print('ERROR')
        return 0

    #chequeo que tenga largo minimo
    if len(entrada) < 5:
        print('ERROR')
        return 0

    #chequeo que haya dos espacios
    if entrada.count(' ') != 2:
        print('ERROR')
        return 0

    #chequeo que haya 3 numero separados por espacios
    lista = entrada.rsplit(' ')
    if len(lista) != 3:
        print('ERROR')
        return 0

    # chequeo que solo ingrese números
    for i in range(0, len(entrada)):
        if entrada[i] != ' ':
            try:
                int(entrada[i])
            except ValueError:
                print('ERROR')
                return 0

    # chequeo que este bien signado y no haya espacio al principio
    if int(entrada[0]) != 0 and int(entrada[0]) != 1:
        print('ERROR')
        return 0

    # chequeo que haya espacio despues de primer numero
    if entrada[1] != ' ':
        print('ERROR')
        return 0

    # chequeo que si el segundo numero es 0 no haya otro despues
    if not entrada[2] and entrada[3] != ' ':
        print('ERROR')
        return 0

    #veo que tan largo es el numero 2, contador - 1 me da la posicion en entrada de su ultima cifra (puedo limitar el input aca aca)
    contador_numero_2 = 2
    while entrada[contador_numero_2] != ' ':
        contador_numero_2 += 1

    #chequeo que el ultimo numero este bien puesto
    try:
        int(entrada[contador_numero_2 + 1])
    except ValueError:
        print('ERROR')
        return 0

    #chequeo que al final no haya espacios
    if entrada.endswith(' '):
        print('ERROR')
        return 0

    return contador_numero_2


if __name__ == "__main__":
    main()