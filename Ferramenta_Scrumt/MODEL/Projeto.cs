﻿using System;
using System.ComponentModel.DataAnnotations;

namespace Ferramenta_Scrumt.MODEL
{
    public class Projeto
    {
        public int ID_Projeto { get; set; }
        public string Descricao { get; set; }
        [DataType(DataType.Date)]
        public DateTime Data_Inicio { get; set; }
        [DataType(DataType.Date)]
        public DateTime Data_Fim { get; set; }
    }
}