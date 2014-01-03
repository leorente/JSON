using System;
using System.Collections.Generic;
using System.Threading;
using System.Web.Script.Services;
using System.Web.Services;

public partial class New : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
    }

    [WebMethod]
    public static void Add(Pessoa obj) {
        Pessoa.Add(obj);
    }
}