using System;
using System.Collections.Generic;
using System.Threading;
using System.Linq;

public class Pessoa {
    public int Id { get; set; }
    public string Nome { get; set; }
    public string SobreNome { get; set; }
    public string Endereco { get; set; }
    public string Cep { get; set; }
    public static List<Pessoa> lp;

    public static List<Pessoa> Get(int id) {
        if (lp == null) {
            lp = new List<Pessoa>();
            
            for (int i = 0; i < 5000; i++) {
                lp.Add(new Pessoa {
                    Id = i + 1,
                    Nome = "Pessoa" + i,
                    SobreNome = "Fulano" + i,
                    Endereco = "Rua do sobre e desce n " + i,
                    Cep = new Random(i).Next().ToString()
                });
            }
        }

        return lp;
    }

    public static void Add(Pessoa pessoa) {
        try {
            // Sleep na thread so pra ter graça pq eh muito rápida a operação e não da tempo de aparecer a firula do botão rsrsr =P
            Thread.Sleep(3000);

            lp.Add(new Pessoa {
                Id = 546421,
                Nome = pessoa.Nome,
                SobreNome = pessoa.SobreNome,
                Endereco = pessoa.Endereco,
                Cep = pessoa.Cep
            });
        } catch (Exception) { throw; }
    }

    public static void Delete(int Id) {
        lp.Remove(lp.Where(p => p.Id == Id).First());
    }
}
