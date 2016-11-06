﻿using Ferramenta_Scrumt.MODEL;
using System;
using System.Data;

namespace Ferramenta_Scrumt.REPOSITORIO
{
    public class ProductBacklogMapper : SqlMapperBase<ProductBacklog>
    {
        public override ProductBacklog MapFromSource(DataRow Record)
        {
            ProductBacklog pback = new ProductBacklog();

            pback.ID_PBacklog = (int)Record["ID_PBacklog"];
            pback.Projeto = (int)Record["ID_Projeto"];
            pback.Historia = (string)Record["Historia"];
            pback.Estimativa_Inicio = (DateTime)Record["Estimativa_Inicio"];
            pback.Aceito = (string)Record["Aceito"];
            pback.Importancia = (string)Record["Importancia"];
            return pback;
        }
    }
}