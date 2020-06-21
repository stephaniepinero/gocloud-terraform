# gocloud-terraform

## Pre requisitos

- Para la creación de los recursos en AWS es necesario tener instalado [terraform](https://learn.hashicorp.com/terraform/getting-started/install)

## Creación de recursos

- Inicializar terraform

    ``` $ terraform init ```

- Para visualizar que recursos se van a crear

    ``` $ terraform plan ```

- Para aplicar la creación de recursos

    ``` $ terraform apply ```

---
**NOTE**

Luego de aplicar la creación de recursos se debe obtener la IP pública de la Instancia creada para poder acceder al API por el puerto 3000 (por ejemplo: 54.68.91.164:3000) 

La IP tambien se puede obtener desde el dashboard de AWS en EC2

---

## Recursos creados

Los recursos son creados en la región us-west-2 (Oregon)

- Role para la instancia EC2
- Politica asociada al role
- Profile para asociar el role a la instancia
- Instancia EC2, tipo t2.micro
- Tabla DynamoDB, subscriptions

Luego de que los recursos son creados verificar que el SG de la instancia EC2 tenga permisos para acceder por el puerto 80 y 3000.






