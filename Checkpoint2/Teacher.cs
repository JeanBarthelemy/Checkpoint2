using System;
using System.Collections.Generic;
using System.Text;

namespace Checkpoint2
{
    public class Teacher : Person
    {   
        public string Name { get; set; }

        public List<Student> Students { get; set; }

        public Teacher()
        {

        }

        public Teacher(string name, List<Student> students, Agenda agenda, List<Person> personsList, Cursus cursus, string campus)
        {
            Name = name;
            Students = students;
            Agenda = agenda;
            PersonsList = personsList;
            Cursus = cursus;
            Campus = campus;
        }

    }
}
