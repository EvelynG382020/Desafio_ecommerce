# DESAFIO ECOMMERCE Y USO DE UN CONTROLADOR 
Hacer un diagrama de modelos para cubrir las necesidades del cliente. RESP: Archivo adjunto en proyecto.

Crear la o las relaciones y modelos para manejar los productos y sus variaciones. RESP: Del proyecto inicial removí los atributos del Modelo Product dejando solo name y description para el resto pasarlo a Model Variation con los atributos stock sku precio y referencia a los Modelos Color y Size, para así manejar desde aquí las variaciones del producto.

Crear la o las relaciones y modelos para manejar las tallas y colores de las variaciones. RESP: Se crean modelos Color y Size con sus atributos name, y asociando al Modelo Variation.

Implementar la solución para manejar distintos niveles de categorías y asegurarse que no tenga dos padres. También deberás implementar un test unitario para verificar este comportamiento. RESP: En el Modelo Category se crea la columna category_id de ésta manera se hace referencia a la misma para asegurar que no tenga dos padres y así cada categoría creada puede a su vez tener o no tener hijos.

Generar un método o scope en las categorías, de tal forma que entregue una lista de cada categoría padre y otro de sus hijos, y los hijos de sus hijos, en todos los niveles. RESP: En el modelo Category se van a manejar estos dos modelos:
Todos las categorías hijos, se itera para recorrer, se obtenie el nombre de ésta y se guarda en el arreglo. El otro metodo muestra las categorías padre (que no tienen hijos o mas bien categorías asignadas)
def all_the_child_categories
  children_categories = []
  self.children_categories.each do |child_category|
      children_categories << child_category.name
  end
  children_categories
end

def self.parent_category
  where(category_id: nil)
end

Según su diseño, explicar al cliente cómo implementar la lista de productos del catálogo. (de un ejemplo en código). Si un modelo necesita código, debes entregarlo al cliente como parte de la implementación. RESP: Ver archivo app/views/home/index el uso de variation.first.precio y así para color y size al producto para listar solo los productos y sus variaciones.

Implementar o explicar las modificaciones (si las hay) al modelo OrderItem para que siga funcionando sin que afecte el resto del sistema. RESP: Hice referencia en este modelo a Variation.

El cliente, a último minuto nos solicita que nuestro sistema soporte cupones de dos tipos:
a) Uno para distribuir en redes sociales (1 cupón lo pueden ocupar muchas personas).
b) Otro para clientes específicos (1 cupón solo lo puede ocupar un cliente específico). RESP: Se crean 3 métodos para verificar si el cupon es usable aun y el computo total según si es en porcentaje o monto espécifico.
def usable? #ese cupon es usable?
  valid_on_count?
end

def valid_on_count? 
  if kind.eq?('target')
    return(count>0)
  end
end

def compute_total(total)
  if discount.eq?('percent')
    percent_value = amount.to_f /100
    total - (total * percent_value)
  else
    total = total - amount
    (total < 0) ? 0 : total
  end
end

LOS TEST EN APP/SPEC/MODELS/CATEGORY_SPEC.RB SE INSTALÓ RSPEC Y LA GEM ACTIVEMERCHANT, ADEMÁS DE TODO EL PROCESO DE PAYPAL.
