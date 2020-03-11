using System;
using System.Collections.Generic;
using System.Text;

namespace Checkpoint2
{
    public class LeadTeacher : Person
    {   
        public string Name { get; set; }
        public List<Teacher> Teachers { get; set; }

        public LeadTeacher()
        {

        }

        public LeadTeacher(string name, List<Teacher> teachers, Agenda agenda, List<Person> personsList, Cursus cursus, string campus)
        {
            Name = name;
            Teachers = teachers;
            Agenda = agenda;
            PersonsList = personsList;
            Cursus = cursus;
            Campus = campus;

        }

    }
}
