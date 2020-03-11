using System;
using System.Collections.Generic;
using System.Text;

namespace Checkpoint2
{
    public static class Factory
    {
        public static Person CreatePerson(List<Person> PersonsList)
        {
            if (PersonsList.GetType() == typeof(List<Teacher>))
            {
                Person person = new LeadTeacher();
                return person;
            }
            else if (PersonsList.GetType() == typeof(List<Student>))
            {
                Person person = new Teacher();
                return person;
            }
            else
            {
                Person person = new Student();
                return person;
            }
        }

    }
}
