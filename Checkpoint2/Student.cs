using System;
using System.Collections.Generic;
using System.Text;

namespace Checkpoint2
{
    public class Student : Person
    {
        public string Name { get; set; }
        
        public Student()
        {

        }

        public Student(string name, Agenda agenda, List<Person> personsList, Cursus cursus, string campus)
        {
            Name = name;
            Agenda = agenda;
            PersonsList = personsList;
            Cursus = cursus;
            Campus = campus;

        }

        

    }
}
