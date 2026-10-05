// Ejercicio 1 - List: Fusionar dos listas enlazadas ordenadas
// Para probar: pegar en https://dartpad.dev/ y presionar "Run"

class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

/// Combina dos listas enlazadas ordenadas reutilizando sus nodos.
/// Devuelve el nodo inicial de la lista resultante.
ListNode? fusionarListas(ListNode? lista1, ListNode? lista2) {
  // Nodo ficticio que simplifica el manejo de la cabeza de la lista
  final ListNode ficticio = ListNode(0);
  ListNode cola = ficticio;

  // Mientras ambas listas tengan nodos, se enlaza el menor
  while (lista1 != null && lista2 != null) {
    if (lista1.val <= lista2.val) {
      cola.next = lista1;
      lista1 = lista1.next;
    } else {
      cola.next = lista2;
      lista2 = lista2.next;
    }
    cola = cola.next!;
  }

  // Se enlaza lo que quede de la lista que no se terminó
  cola.next = lista1 ?? lista2;

  return ficticio.next;
}

// ---------- Funciones auxiliares para probar ----------

/// Construye una lista enlazada a partir de una List<int>
ListNode? construirLista(List<int> valores) {
  final ListNode ficticio = ListNode(0);
  ListNode cola = ficticio;
  for (final v in valores) {
    cola.next = ListNode(v);
    cola = cola.next!;
  }
  return ficticio.next;
}

/// Convierte una lista enlazada en una List<int> para imprimirla
List<int> listaAArreglo(ListNode? cabeza) {
  final List<int> resultado = [];
  ListNode? actual = cabeza;
  while (actual != null) {
    resultado.add(actual.val);
    actual = actual.next;
  }
  return resultado;
}

void main() {
  // Ejemplo 1
  var l1 = construirLista([1, 2, 4]);
  var l2 = construirLista([1, 3, 4]);
  print('Ejemplo 1: ${listaAArreglo(fusionarListas(l1, l2))}');

  // Ejemplo 2
  l1 = construirLista([]);
  l2 = construirLista([]);
  print('Ejemplo 2: ${listaAArreglo(fusionarListas(l1, l2))}');

  // Ejemplo 3
  l1 = construirLista([]);
  l2 = construirLista([0]);
  print('Ejemplo 3: ${listaAArreglo(fusionarListas(l1, l2))}');
}
