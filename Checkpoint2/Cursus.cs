using System;
using System.Collections.Generic;
using System.Text;

namespace Checkpoint2
{
    public class Cursus
    {
        public string Name {get; set;}
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public Agenda Agenda { get; set; }
        public List<Quest> Quests { get; set; } 


        public Cursus (string name, DateTime startDate, DateTime endDate, Agenda agenda, List<Quest> quests)
        {
            Name = name;
            StartDate = startDate;
            EndDate = endDate;
            Agenda = agenda;
            Quests = quests;
        }
    }
}
