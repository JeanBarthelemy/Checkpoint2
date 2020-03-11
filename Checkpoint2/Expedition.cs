using System;
using System.Collections.Generic;
using System.Text;

namespace Checkpoint2
{
    public class Expedition
    {
        public string Name { get; set; }
        public List<Quest> Quests { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime EndDate { get; set; }

        public Expedition(string name, List<Quest> quests, DateTime startDate, DateTime endDate)
        {
            Name = name;
            Quests = quests;
            StartDate = startDate;
            EndDate = endDate;
        }

    }
}
