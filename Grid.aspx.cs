using System;
using System.Collections.Generic;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Grid : System.Web.UI.Page {
    public static List<Person> lista = new List<Person>();

    protected void Page_Load(object sender, EventArgs e) {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Person> GetPerson(int obj) {
        return Person.GetPerson(obj); ;
    }

    [WebMethod]
    public static void Delete(int obj) {
        Person.Delete(obj);
    }
}