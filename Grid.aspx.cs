using System;
using System.Collections.Generic;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Grid : System.Web.UI.Page {
    public static List<Pessoa> lista = new List<Pessoa>();

    protected void Page_Load(object sender, EventArgs e) {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Pessoa> Get(int obj) {
        return Pessoa.Get(obj); ;
    }

    [WebMethod]
    public static void Delete(int obj) {
        Pessoa.Delete(obj);
    }
}