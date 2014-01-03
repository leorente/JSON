using System;
using System.Collections.Generic;
using System.Threading;
using System.Linq;

public class Person {
    public int Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }

    public static List<Person> lp;
    public static List<Person> GetPerson(int id) {
        if (lp == null) {
            lp = new List<Person>();

            for (int i = 0; i < 5000; i++) {
                string cidade = (i % 2) == 0 ? "Rio de Janeiro" : "São Paulo";
                int zip = new Random(i).Next();

                lp.Add(new Person {
                    Id = i + 1,
                    FirstName = "Pessoa" + i,
                    LastName = "Fulano" + i,
                    Address = "Rua do sobre e desce " + i,
                    City = cidade,
                    State = cidade,
                    Zip = zip.ToString()
                });
            }
        }

        return lp;
    }

    public static void Add(Person person) {
        try {
            int NovoId = new Random(0).Next(5000, 999999);
            lp.Add(new Person {
                Id = NovoId,
                Address = person.Address,
                City = person.City,
                FirstName = person.FirstName,
                LastName = person.LastName,
                State = person.LastName,
                Zip = person.Zip
            });
        } catch (Exception) { throw; }
    }

    public static void Delete(int Id) {
        lp.Remove(lp.Where(person => person.Id == Id).First());
    }

}
