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

## Recursos creados

Los recursos son creados en la región us-west-2 (Oregon)

- Instancia EC2, tipo t2.micro
- Tabla DynamoDB, subscriptions

Luego de que los recursos son creados verificar que el SG de la instancia tenga permisos para acceder por el puerto 80 y 3000.




