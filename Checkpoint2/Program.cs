using System;
using System.Collections.Generic;
using System.Text;
using CommandLine;

namespace Checkpoint2
{
    class Program
    {
        public static void Main(string [] args)
        {
            Console.InputEncoding = Encoding.UTF8;

            Parser.Default.ParseArguments<EventsOptions, CursusOptions>(args)
                .WithParsed<EventsOptions>(RunEventsCommand)
                .WithParsed<CursusOptions>(RunCursusCommand);

            static void RunEventsCommand(EventsOptions opts)
            {
                

            }

            static void RunCursusCommand(CursusOptions opts)
            {
                

            }


            Event newEvent = new Event("Important meeting");
            newEvent.StartTime = DateTime.Now;
            newEvent.EndTime = DateTime.Now + TimeSpan.FromHours(1);
            newEvent.Postpone(TimeSpan.FromHours(1));
            Console.WriteLine("Another meeting is postponed");
 
        }
        
    }
}
