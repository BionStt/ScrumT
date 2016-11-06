﻿using Ferramenta_Scrumt.MODEL;
using Ferramenta_Scrumt.REPOSITORIO;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Ferramenta_Scrumt.Controllers
{
    public class RegistrationController : Controller
    {
        // GET: Equipe
        List<Users> EquipeList;
        List<Funcao> FuncaoList;
        RegistrationRepositorio _EquipeRep = new RegistrationRepositorio();
        FuncaoRepositorio _FuncaoRep = new FuncaoRepositorio();

        private void CarregaLista()
        {
            EquipeList = _EquipeRep.Lista(new RegistrationMapper());
            Session["Lista"] = EquipeList;
        }
        public ActionResult Index()
        {
            CarregaLista();
            return View(EquipeList);
        }
        [HttpPost]
        public ActionResult Create(Users E)
        {
            _EquipeRep.ADD(E);
            return Redirect("/Login/Login");
        }

        public ActionResult Create()
        {

            FuncaoList = _FuncaoRep.Lista(new FuncaoMapper());
            ViewBag.Nome_Funcao = new SelectList(FuncaoList, "ID_Funcao", "Nome_Funcao");

            return View();
        }
 
    }
}