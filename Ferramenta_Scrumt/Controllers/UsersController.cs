﻿using Ferramenta_Scrumt.MODEL;
using Ferramenta_Scrumt.REPOSITORIO;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Ferramenta_Scrumt.Controllers
{
    [Authorize]
    public class UsersController : Controller
    {
        // GET: Equipe
        List<Users> EquipeList;
        List<Funcao> FuncaoList;
        UsersRepositorio _EquipeRep = new UsersRepositorio();
        FuncaoRepositorio _FuncaoRep = new FuncaoRepositorio();

        private void CarregaLista()
        {

            EquipeList = _EquipeRep.Lista(new UsersMapper());
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
            Session["Lista"] = EquipeList;
            return RedirectToAction("Index");
        }
        
        public ActionResult Create()
        {
            CarregaLista();
            FuncaoList = _FuncaoRep.Lista(new FuncaoMapper());
            ViewBag.Nome_Funcao = new SelectList(FuncaoList, "ID_Funcao", "Nome_Funcao");
            return View();
        }
        public ActionResult Delete(int id)
        {
            CarregaLista();
            return View(EquipeList.Where(X => X.ID_Equipe == id).First());
        }
        [HttpPost]
        public ActionResult Delete(Users E)
        {
            CarregaLista();
            _EquipeRep.Delete(EquipeList.Where(X => X.ID_Equipe == E.ID_Equipe).First());
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Edit(Users E)
        {
            //carrega lista e traz um objeto da lista para ser editado
            CarregaLista();
            _EquipeRep.Update(E);
            Session["Lista"] = EquipeList;
            return RedirectToAction("Index");

        }
        public ActionResult Edit(int id)
        {
            CarregaLista();
            //passando uma model E
            Users E = EquipeList.Where(X => X.ID_Equipe == id).First();
            FuncaoList = _FuncaoRep.Lista(new FuncaoMapper());
            ViewBag.Nome_Funcao = new SelectList(FuncaoList, "ID_Funcao", "Nome_Funcao");
            return View(E);
        }
        
        public ActionResult Details(int id)
        {  
            CarregaLista();
            return View(EquipeList.Where(X => X.ID_Equipe == id).First());
        }
       
    }
}