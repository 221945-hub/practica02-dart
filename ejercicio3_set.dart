// Ejercicio 3 - Set: Tipos de fruta sin colocar en cestas
// Para probar: pegar en https://dartpad.dev/ y presionar "Run"

int frutasSinColocar(List<int> frutas, List<int> cestas) {
  // Set con los índices de las cestas que ya fueron ocupadas
  final Set<int> cestasUsadas = {};
  int sinColocar = 0;

  // De izquierda a derecha, para cada tipo de fruta
  for (final int cantidad in frutas) {
    bool colocada = false;

    // Se busca la cesta disponible más a la izquierda con capacidad suficiente
    for (int j = 0; j < cestas.length; j++) {
      if (!cestasUsadas.contains(j) && cestas[j] >= cantidad) {
        cestasUsadas.add(j); // cada cesta solo admite un tipo de fruta
        colocada = true;
        break;
      }
    }

    if (!colocada) {
      sinColocar++;
    }
  }

  return sinColocar;
}

void main() {
  // Ejemplo 1
  print('Ejemplo 1: ${frutasSinColocar([4, 2, 5], [3, 5, 4])}'); // 1

  // Ejemplo 2
  print('Ejemplo 2: ${frutasSinColocar([3, 6, 1], [6, 4, 7])}'); // 0
}
