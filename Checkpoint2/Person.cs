using System;
using System.Collections.Generic;
using System.Text;

namespace Checkpoint2
{
    public abstract class Person
    {
        public Agenda Agenda { get; set; }
        public List<Person> PersonsList { get; set; }
        public Cursus Cursus { get; set; }
        public string Campus { get; set; }


        
    }
}
