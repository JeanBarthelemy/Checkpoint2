using System;
using System.Collections.Generic;
using System.Text;

namespace Checkpoint2
{
    class Campus
    {
        public string Name { get; set; }

        public List<Student> Students { get; set; }

        public List<Teacher> Teachers { get; set; }

        public LeadTeacher Principal { get; set; }

        public List<Cursus> Cursus { get; set; }

        public Campus(string name, List<Student> students, List<Teacher> teachers, LeadTeacher principal, List<Cursus> cursus)
        {
            Name = name;
            Students = students;
            Teachers = teachers;
            Principal = principal;
            Cursus = cursus;

        }


    }
}
