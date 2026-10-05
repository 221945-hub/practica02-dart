// Ejercicio 2 - Map: Intersección de dos arreglos (con repeticiones)
// Para probar: pegar en https://dartpad.dev/ y presionar "Run"

List<int> interseccion(List<int> nums1, List<int> nums2) {
  // Map que guarda cuántas veces aparece cada número en nums1
  final Map<int, int> conteo = {};
  for (final n in nums1) {
    conteo[n] = (conteo[n] ?? 0) + 1;
  }

  // Se recorre nums2: si el número aún tiene "disponibilidad" en el Map,
  // se agrega al resultado y se descuenta una aparición
  final List<int> resultado = [];
  for (final n in nums2) {
    final int disponibles = conteo[n] ?? 0;
    if (disponibles > 0) {
      resultado.add(n);
      conteo[n] = disponibles - 1;
    }
  }

  // Se ordena solo para que la salida coincida con la de la guía
  // (el enunciado permite devolver el resultado en cualquier orden)
  resultado.sort();
  return resultado;
}

void main() {
  // Ejemplo 1
  print('Ejemplo 1: ${interseccion([1, 2, 2, 1], [2, 2])}');

  // Ejemplo 2
  print('Ejemplo 2: ${interseccion([4, 9, 5], [9, 4, 9, 8, 4])}');
}
