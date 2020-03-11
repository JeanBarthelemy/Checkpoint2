using System;
using System.Collections.Generic;
using System.Text;
using CommandLine;
using CommandLine.Text;

namespace Checkpoint2
{

    [Verb("events", HelpText = "Show events of a person")]
    class EventsOptions 
    {
        [Option("person", Required = true, HelpText = "Start date of the event")]
        public string name { get; set; }

        [Option("begins", Required = true, HelpText = "Start date of the event")]
        public DateTime startDate { get; set; }

        [Option("ends", Required = true, HelpText = "End date of the event")]
        public DateTime endDate { get; set; }
    }

    [Verb("cursus", HelpText = "Show cursus")]
    class CursusOptions
    {
        [Option("students", Required = false, HelpText = "Students")]
        public Student student { get; set; }

        [Option("quests", Required = false, HelpText = "Quests")]
        public Quest quest { get; set; }

        [Option("name", Required = true, HelpText = "Enter the cursus name")]
        public string name { get; set; }
    }

}
